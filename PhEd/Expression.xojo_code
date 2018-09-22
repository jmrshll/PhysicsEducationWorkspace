#tag Class
Protected Class Expression
	#tag Method, Flags = &h0
		Function BaselineOffset(g As Graphics) As Double
		  //A special routine needed for 
		  //formatting fractions on top of fractions.
		  //It is called from ScalarBinaryOperator.Draw
		  //when that draw method receives a / operator.
		  If (Self IsA ScalarBinaryOperator) And (Self.GetText = "/") Then
		    Return GetRightChild.Height(g)
		  Else
		    Return 0
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearParentheses()
		  //ClearParentheses sets the HasParentheses
		  //property of an expression, or of an item in an
		  //expression, to False.
		  
		  HasParentheses = False
		  
		  If Self IsA ScalarBinaryOperator Then
		    GetLeftChild.ClearParentheses
		    GetRightChild.ClearParentheses
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, X as double, Y as double)
		  // This method draws the expression in the Graphics object g with its center
		  // at the coordinates given by X and Y.
		  // This method should be overwritten by each subclass.
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function evaluate() As double
		  // evaluate the value of a tree to determine if it is a mathematically valid expression
		  if self.getText = "+" then // add to children 
		    return self.GetLeftChild.evaluate + self.GetRightChild.evaluate 
		  elseif self.getText = "-" then // subtract right from left
		    return self.GetLeftChild.evaluate - self.GetRightChild.evaluate
		  elseif self.getText = "*" then // multiply to children 
		    return self.GetLeftChild.evaluate * self.GetRightChild.evaluate
		  elseif self.getText = "^" then // raise left to the exponent of right
		    return self.GetLeftChild.evaluate ^ self.GetRightChild.evaluate
		  elseif self.getText = "/" then // perform division and handle case of dividing by zero
		    if self.GetRightChild.evaluate = 0 then 
		      return -1000000000000000000000000000000000000000000000
		    end if
		    return  self.GetLeftChild.evaluate / self.GetRightChild.evaluate
		  else 
		    return Val(self.getText)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLeftChild() As PhEd.Expression
		  return myLeftChild
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getLength() As Integer
		  return getText.Length
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetList() As PhEd.Expression()
		  // This method returns an ordered list of all of the subexpressions
		  // contained in an expression. The order is a breadth-first-traversal,
		  // (which is useful for constructing tree diagrams).
		  
		  dim myQueue(-1) as PhEd.Expression // queue of items
		  dim theItem as PhEd.Expression // this will hold the current item of interest
		  dim theList(-1) as PhEd.Expression // this will be the final list
		  myQueue.Append self // the calling object represents the first item to look at
		  while myQueue.Ubound >= 0 // we have remaining items to look at
		    theItem = myQueue(0) // get the first item in the queue
		    if not theItem.LeftIsEmpty then myQueue.Append theItem.myLeftChild // put the left child (if any) on the queue
		    if not theItem.RightIsEmpty then myQueue.Append theItem.myRightChild //and the right child (if any)
		    theList.Append theItem  // we have now duly examined this item
		    myQueue.Remove(0) // so remove it from the queue
		  wend
		  return theList // return the completed list
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetParent() As PhEd.Expression
		  try
		    return Expression(myParent.value)
		  catch err as NilObjectException
		    return nil
		  end try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRightChild() As PhEd.Expression
		  return myRightChild
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetScale() As double
		  return myScale
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetText() As Text
		  return myText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTreeHIndex() As Integer
		  // this recursive method gets a horizontal index
		  if myParent = nil then // this is the root expression
		    return 1 // which has an index of 1 by definition
		  else
		    dim Parent as PhEd.Expression = PhEd.Expression(myParent.Value)
		    if Parent.GetLeftChild is self then // if I am the left child of my parent, then
		      return Parent.GetTreeHIndex*2 - 1 // return this value calculated from my parent
		    else // I guess that I must be the right child
		      return Parent.GetTreeHIndex*2
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTreeLevel() As integer
		  // This recursive method gets the level of the current expression on the tree diagram.
		  if myParent = nil then
		    return 0
		  else
		    dim Parent as PhEd.Expression = PhEd.Expression(myParent.Value)
		    return Parent.GetTreeLevel + 1
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetUnits()
		  // This method reports the quantity's units.
		  // in the present version, the units are never set by any subclass,
		  // so myUnits will be nil. Interpret this as no units
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Height(g as Graphics) As Double
		  // This method returns the height of the expression in pixels.
		  // Subclasses should override
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isLegal() As boolean
		  // determine if an expression is mathematically legal
		  if self.getText = "/" then // check if denominator is zero
		    if self.GetRightChild.GetText = "0" then 
		      Window1.ExeptionType = 2
		      return false 
		    end if
		    dim sum as double = self.getRightChild.evaluate
		    if sum = 0 or sum < -1000000000 then // check if denominator is an expression that adds up to zero 
		      Window1.ExeptionType = 2
		      return false 
		    end if 
		    return true 
		  elseif  self.getText = "^" then 
		    if self.GetRightChild.GetText = "0" and self.GetLeftChild.GetText = "0" then // check if we raise zero to zero
		      Window1.ExeptionType = 3
		      return false 
		    end if
		    dim left as double = self.getRightChild.evaluate
		    dim right as double = self.GetLeftChild.evaluate
		    if (left = 0 or left < -100000) and (right = 0 or right <-100000)  then 
		      Window1.ExeptionType = 3
		      return false 
		    end if 
		    return true 
		  else 
		    if not self.LeftIsEmpty and not self.RightIsEmpty then 
		      return self.GetRightChild.isLegal and self.GetLeftChild.isLegal // check if the children are legal as well
		    else
		      return true
		    end if
		  end if 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LeftIsEmpty() As Boolean
		  Return myLeftChild = nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RightIsEmpty() As Boolean
		  Return myRightChild = nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetChild(theChild as PhEd.Expression)
		  if myType = Expression.EType.BinaryOperator then
		    if RightIsEmpty then
		      myRightChild = theChild
		      theChild.myParent = new WeakRef(self)
		    elseif LeftIsEmpty then
		      myLeftChild = theChild
		      theChild.myParent = new WeakRef(self)
		    else
		      raise new ExpressionException("Binary operator is already full")
		    end if
		  elseif myType = Expression.EType.UnaryOperator then
		    // note that the argument of a unary operator is the left child (right will remain empty)
		    if LeftIsEmpty then
		      myLeftChild = theChild
		      theChild.myParent = new WeakRef(self)
		    else
		      raise new ExpressionException("Unary operator is already full")
		    end if
		  else
		    raise new ExpressionException("Leaf expression types can't have children")
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetParentheses()
		  //One call to SetParentheses sets the
		  // HasParentheses property of each item in the expression,
		  //working down from the top node of the expression tree.
		  If Self IsA PhEd.ScalarBinaryOperator Then
		    
		    
		    //Some HasParentheses property values depend on the parent.
		    If GetText = "*" Then
		      //do nothing. It is the children that will be parenthesized, not the whole binary expression.
		    ElseIf myParent <> Nil Then
		      If GetParent.GetText = "*" Then
		        HasParentheses = True
		        //The case below is for if the input is something like (a+b)^3.
		        //Then we want the output to be to have a+b parenthesized,
		        //but the 3 not parenthesized.
		      ElseIf GetParent.GetText = "^" And (GetText = "+" Or GetText = "-") And Self = GetParent.GetLeftChild Then
		        HasParentheses = True
		      End If
		    Else
		      ClearParentheses
		    End If
		    
		    GetLeftChild.SetParentheses
		    GetRightChild.SetParentheses
		    
		  ElseIf Self IsA ScalarUnaryOperator Then
		    
		    GetLeftChild.SetParentheses
		    
		  ElseIf Self IsA ScalarLiteral then
		    
		    //For the input 2*2, we want the formatted expression
		    //to be (2)(2).
		    //If the input is 2*x, we want the formatted expression
		    //to be 2x.
		    If myParent <> Nil And GetParent.GetText = "*" And _ 
		      Not (GetParent.GetRightChild IsA ScalarVariable Or GetParent.GetLeftChild IsA ScalarVariable) Then  
		      HasParentheses = True
		    Else
		      ClearParentheses
		    End If
		    
		  End If
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetScale(myScaleFactor As Double)
		  //With one call to SetScale, the myScale property
		  //for each item in the expression is set.
		  //SetScale is called from FormattedExpression.Paint.
		  //As of now, the only time the scale of items in the 
		  //expression is altered is if there is a ^ operator
		  //in the expression.
		  myScale = myScaleFactor
		  
		  If Self IsA ScalarBinaryOperator Then
		    GetLeftChild.SetScale(myScaleFactor)
		    If GetText = "^" Then
		      GetRightChild.SetScale(0.8*myScale)
		      If myParent <> nil and GetParent.GetText = "^" Then
		        GetParent.myScale = myScale*0.8
		      End If
		    Else
		      GetRightChild.SetScale(myScaleFactor)
		    End If
		  ElseIf Self IsA ScalarUnaryOperator then
		    GetLeftChild.SetScale(myScaleFactor)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Width(g as Graphics) As Double
		  // This method returns the width of the expression in pixels.
		  // Subclasses should override
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		#tag Note
			//Overwritten by subclasses
		#tag EndNote
		Protected HasParentheses As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myLeftChild As PhEd.Expression
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myParent As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myRightChild As PhEd.Expression
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected myScale As double = 1.0
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected myText As Text
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected myType As PhEd.Expression.EType
	#tag EndProperty


	#tag Enum, Name = EType, Type = Integer, Flags = &h0
		Literal
		  Constant
		  Variable
		  UnaryOperator
		  BinaryOperator
		Unit
	#tag EndEnum


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
