#tag Class
Protected Class ScalarBinaryOperator
Inherits PhEd.ScalarExpression
	#tag Method, Flags = &h1000
		Sub Constructor(OpToken as Text)
		  myText = OpToken  // we probably should check for valid type here
		  myType = Expression.EType.BinaryOperator  // we are creating a binary operator here
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, X as Double, Y as Double)
		  //Overrides the superclass method. 
		  
		  //A test to make sure this binary operator is operating on things.
		  If GetLeftChild = Nil Then
		    Raise New PhEd.ExpressionException("Raised in ScalarBinaryOperator.Draw: no left child")
		  ElseIf GetRightChild = Nil Then
		    Raise New PhEd.ExpressionException("Raised in ScalarBinaryOperator.Draw: no right child")
		  End If
		  
		  //xAfterParens stores the value of where to start
		  //drawingthe left child if the scalar binary expression 
		  //is parenthesized.
		  Dim xAfterParens As Double = X
		  Dim lParen As New Parenthesis(g,false,Height(g))
		  Dim rParen As New Parenthesis(g,true,Height(g))
		  //Dim lParen As New TextItemShape(g, "(", myScale)
		  //Dim rParen As New TextItemShape(g, ")", myScale)
		  
		  //Below, the parentheses are drawn if
		  //the ScalarBinaryOperator expression
		  //HasParentheses property is True.  
		  //Remember that the HasParentheses
		  //property is set in the Expression.SetParentheses
		  //method which is called from the Paint event handler
		  //of FormattedExpression.                      
		  If HasParentheses Then
		    lParen.Draw(g, X, Y)  
		    xAfterParens = X + lParen.GetWidth
		    //Below, more space is allotted around fractions
		    //than around other items.
		    If GetText = "/" Then
		      xAfterParens = xAfterParens + lParen.GetWidth
		      rParen.Draw(g, X + Width(g), Y)  
		    Else
		      rParen.Draw(g, X + Width(g), Y)  
		      //Width(g) above would mean, for the input (1+2)*(3+4), a measure of (1+2)(3+4).
		      //That's why I use X and not xAfterParens.
		    End If
		  End If
		  
		  //pointer stores the position where
		  //the next item should be drawn.
		  Dim pointer As Double = xAfterParens
		  
		  //Handle the different kinds of ScalarBinaryOperators
		  //with the Select Case statement. The variants are
		  //+, -, *, /, and ^.
		  Select Case GetText
		    
		  Case "+", "-"
		    
		    GetLeftChild.Draw(g, pointer, Y)  //draw the left child
		    pointer = pointer + GetLeftChild.Width(g) //adjust the pointer
		    Dim addOrSubtract As New TextItemShape(g, " " + GetText + " ", myScale) //instantiate the operator
		    addOrSubtract.Draw(g, pointer, Y) //and draw it here
		    pointer = pointer + addOrSubtract.GetWidth //adjust pointer
		    GetRightChild.Draw(g, pointer, Y) //draw the right child
		    
		  Case "*"
		    
		    //The first special condition switches the order of two specific items
		    If GetRightChild IsA ScalarLiteral And GetLeftChild IsA ScalarVariable Then
		      GetRightChild.Draw(g, pointer, Y)
		      pointer = xAfterParens + GetRightChild.Width(g)
		      GetLeftChild.Draw(g, pointer, Y)
		      //The next special condition leaves a ScalarLiteral-ScalarVariable combo unparenthesized
		    ElseIf GetRightChild IsA ScalarVariable Or GetLeftChild IsA ScalarVariable Then
		      GetLeftChild.Draw(g, pointer, Y) 
		      pointer = pointer + GetLeftChild.Width(g)
		      GetRightChild.Draw(g, pointer, Y)
		    Else
		      GetLeftChild.Draw(g, pointer, Y)
		      //Window1.ExpressionField.setString("LeftChild width = " + Str(GetLeftChild.Width(g)) + "RightChild width = " + Str(GetRightChild.Width(g)))
		      pointer = pointer + GetLeftChild.Width(g)
		      GetRightChild.Draw(g, xAfterParens + GetLeftChild.Width(g) + rParen.GetWidth, Y)
		    End If
		    
		  Case "/"
		    //We need to draw a fraction bar and set its
		    //length based on widerChildWidth. 
		    //widerChildWidth stores the value of the width
		    // of the numerator or the denominator,
		    //whichever is wider.
		    //tallerChild is necessary to position the denominator.
		    Dim fractionBar As New CurveShape
		    Dim widerChildWidth As Double 
		    Dim tallerChildHeight As Double 
		    
		    //Determine which child is wider 
		    //and which is taller.
		    If GetLeftChild.Width(g) >= GetRightChild.Width(g) Then
		      widerChildWidth = GetLeftChild.Width(g)
		    Else
		      widerChildWidth = GetRightChild.Width(g)
		    End If
		    If GetLeftChild.Height(g) >= GetRightChild.Height(g) Then
		      tallerChildHeight = GetLeftChild.Height(g)
		    Else
		      tallerChildHeight = GetRightChild.Height(g)
		    End If
		    
		    //Position the fraction bar
		    //in line with the crossbar of the + symbol.
		    fractionBar.X = pointer
		    fractionBar.X2 = pointer + widerChildWidth
		    
		    If GetParent <> Nil And GetParent.GetText <> "/" Then
		      fractionBar.Y = Y - 14
		      fractionBar.Y2 = Y - 14
		    Else
		      fractionBar.Y = Y - 3
		      fractionBar.Y2 = Y - 3
		    End If
		    
		    //centerOfFractionBar stores the value of the center
		    //of the fraction bar, which is necessary for positioning
		    //the numerator and denominator.
		    Dim centerOfFractionBar As Double = (fractionBar.X + fractionBar.X2)/2
		    
		    //To draw the
		    //numerator and denominator over and under
		    //the center of the fractionBar,
		    //we need the two variables declared below
		    //store the x-values where we should
		    //start drawing the left and right children,
		    //respectively.
		    Dim leftChildStartDraw As Double
		    Dim rightChildStartDraw As Double
		    leftChildStartDraw = centerOfFractionBar - 0.5*GetLeftChild.Width(g)  
		    rightChildStartDraw = centerOfFractionBar - 0.5*GetRightChild.Width(g)
		    
		    //Draw the numerator (left child) over the center of the fraction bar,
		    //with 3 pixels of space between it and fractionBar.
		    //Draw the denominator (right child) under the center of the fraction bar.
		    //The call to BaselineOffset is here to handle the case in which the input
		    //includes a fraction on top of a fraction. In that case, since the
		    //fraction bar is drawn with respect to the baseline
		    //rather than the height of the numerator or denominator,
		    //we use BaselineOffset to position the fraction bar.
		    GetLeftChild.Draw(g, leftChildStartDraw, fractionBar.Y - 3 - GetLeftChild.BaselineOffset(g))
		    g.DrawObject(fractionBar)  
		    GetRightChild.Draw(g, rightChildStartDraw, fractionBar.Y + _
		    GetRightChild.Height(g) - GetRightChild.BaselineOffset(g) - 3)
		    
		  Case "^"
		    //Remember that we've already drawn the most external
		    //parentheses that surround the scalar binary expression.
		    //Remember xAfterParens records
		    //the width of the most external lParen.
		    GetLeftChild.Draw(g, pointer, Y)
		    //GetRightChild.SetScale(0.8*myScale)
		    GetRightChild.Draw(g, xAfterParens + GetLeftChild.Width(g), Y - 0.6*GetLeftChild.Height(g))
		    
		  Case "=" 
		    
		    GetLeftChild.Draw(g, pointer, Y)  //draw the left child
		    pointer = pointer + GetLeftChild.Width(g) //adjust the pointer
		    Dim equalSign As New TextItemShape(g, " " + GetText + " ", myScale) //instantiate the operator
		    equalSign.Draw(g, pointer, Y) //and draw it here
		    pointer = pointer + equalSign.GetWidth //adjust pointer
		    GetRightChild.Draw(g, pointer, Y) //draw the right child
		    
		  Else 
		    
		    Raise New PhEd.ExpressionException("Undefined binary operator. " _
		    + "Encountered in ScalarBinaryOperator")
		    
		  End Select
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Height(g As Graphics) As Double
		  // Overrides the superclass method. 
		  
		  //expressionHeight is the height of 
		  //the expression, and we return
		  //its value at the end of this routine.
		  Dim expressionHeight As Double
		  
		  //If we are dealing with a fraction, add the heights of of the
		  //numerator and the denominator and the spaces in between.
		  If GetText = "/" Then
		    expressionHeight = GetLeftChild.Height(g) + GetRightChild.Height(g) // + 4 //4 pixels separate num. and denom.
		    
		    //If GetText = "^", remember that the right child
		    //is drawn at Y - 0.6*GetLeftChild.Height(g)
		    //(see ScalarBinaryOperator.Draw if you don't remember).
		  ElseIf GetText = "^" Then
		    expressionHeight = .6*GetLeftChild.Height(g) + GetRightChild.Height(g)
		  Else
		    expressionHeight = Max(GetLeftChild.Height(g), GetRightChild.Height(g))  //return the larger of the heights of the two children
		  End If
		  
		  Return expressionHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value() As double
		  // This actually performs the various operations.
		  // If any sub-expressions are undefined, this will raise
		  // an ExpressionException.
		  
		  dim LeftItem as PhEd.ScalarExpression = PhEd.ScalarExpression(self.GetLeftChild)
		  dim RightItem as PhEd.ScalarExpression = PhEd.ScalarExpression(self.GetRightChild)
		  Select Case myText
		  Case "+"
		    return LeftItem.Value + RightItem.Value
		  Case "-"
		    return LeftItem.Value - RightItem.Value
		  Case "*"
		    return LeftItem.Value * RightItem.Value
		  Case "/"
		    return LeftItem.Value / RightItem.Value
		  Case "^"
		    return LeftItem.Value ^ RightItem.Value
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Width(g As Graphics) As Double
		  //expressionLength stores the value of the width of the expression
		  Dim expressionLength As Double
		  
		  //We set the width depending on if the scalar binary expression
		  //has parentheses or not, and depending on which ScalarBinaryOperator
		  //we are dealing with.
		  Dim lParen As New Parenthesis(g,false,Height(g))
		  Dim rParen As New Parenthesis(g,true,Height(g))
		  
		  //binOpTIS stores the binary operator as a TextItemShape.
		  //By default it has no text value, but this is replaced in the 
		  //case that the ScalarBinaryOperator is a + or -.
		  Dim binOpTIS As New TextItemShape(g, "", myScale) 
		  
		  //Handle different scalar binary operators differently.
		  Select Case GetText
		    
		  Case "+"
		    
		    Dim binOpTIS2 As New TextItemShape(g, " " + GetText + " ", myScale)
		    binOpTIS = binOpTIS2 //this gives binOpTIS all the values of binOpTIS2
		    
		  Case "-"
		    
		    Dim binOpTIS2 As New TextItemShape(g, " " + GetText + " ", myScale)
		    binOpTIS = binOpTIS2 //this gives binOpTIS all the values of binOpTIS2
		    
		  Case "/"
		    
		    //In this case we must make sure the width reflects the length of the
		    //numerator OR the denominator, not both, just whichever is larger.
		    //widerChildWidth stores the width of the numerator
		    //or denominator, whichever is wider.
		    Dim widerChildWidth As Double
		    
		    If GetLeftChild.Width(g) >= GetRightChild.Width(g) Then
		      widerChildWidth = GetLeftChild.Width(g)
		    Else
		      widerChildWidth = GetRightChild.Width(g)
		    End If
		    
		    If HasParentheses Then
		      expressionLength = widerChildWidth + lParen.GetWidth + rParen.GetWidth //+ 3 //we want extra space around fractions
		    Else
		      expressionLength = widerChildWidth
		    End If
		    
		  End Select
		  
		  //We don't want any of the following
		  //to apply in the case that GetText = "/".
		  If GetText <> "/" Then
		    If HasParentheses Then
		      expressionLength = lParen.GetWidth + rParen.GetWidth + GetLeftChild.Width(g) + GetRightChild.Width(g) _
		      + binOpTIS.GetWidth
		    Else
		      expressionLength = binOpTIS.GetWidth + GetLeftChild.Width(g) + GetRightChild.Width(g)
		    End If
		  End If
		  
		  Return expressionLength
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
