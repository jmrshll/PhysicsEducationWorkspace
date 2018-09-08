#tag Class
Protected Class ScalarUnaryOperator
Inherits PhEd.ScalarExpression
	#tag Method, Flags = &h1000
		Sub Constructor(theName as Text)
		  dim xs as XojoScript
		  xs = GetFunctionScript(theName)
		  if xs = nil then
		    raise new ExpressionException("Undefined Function")
		  else
		    xs.Context = self // set this so that the Xojoscript can see theArgVal and theResult properties
		    if not xs.Precompile(XojoScript.OptimizationLevels.High) then // precompile the XojoScript
		      raise new ExpressionException("Function Precompile Failed")  // if it fails, raise an exception
		    else // sets the text property.
		      myText = theName
		    end if
		  end if
		  myType = Expression.EType.UnaryOperator
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, X as double, Y as double)
		  //Overrides the superclass method.
		  
		  Dim scalarUnOpTIS As New TextItemShape(g, GetText, myScale) //will hold information about the ScalarUnaryOperator
		  Dim lParen As New TextItemShape(g, "(", myScale)
		  Dim rParen As New TextItemShape(g, ")", myScale)
		  
		  //See the in-line comments below to 
		  //see what each line of code draws
		  //on the canvas, if the input is sin(x).
		  If HasParentheses Then
		    lParen.Draw(g, X, Y)  //   (
		    scalarUnOpTIS.Draw(g, X + lParen.GetWidth, Y)   //   (sin
		    //Parenthesize the scalar literal on which the operator operates.
		    lParen.Draw(g, X + lParen.GetWidth + scalarUnOpTIS.GetWidth, Y)  //   (sin(
		    GetLeftChild.Draw(g, X + lParen.GetWidth*2 + scalarUnOpTIS.GetWidth, Y)  //   (sin(x
		    rParen.Draw(g, X + lParen.GetWidth*2 + scalarUnOpTIS.GetWidth + GetLeftChild.Width(g), Y)   //   (sin(x)
		    rParen.Draw(g, X + lParen.GetWidth*2 + scalarUnOpTIS.GetWidth + GetLeftChild.Width(g) + _
		    rParen.GetWidth, Y)   //   (sin(x))
		  Else
		    scalarUnOpTIS.Draw(g, X, Y)   //   sin
		    //Parenthesize the scalar literal on which the operator operates.
		    lParen.Draw(g, X + scalarUnOpTIS.GetWidth, Y)   //   sin(
		    GetLeftChild.Draw(g, X + scalarUnOpTIS.GetWidth + lParen.GetWidth, Y)   //   sin(x
		    rParen.Draw(g, X + scalarUnOpTIS.GetWidth + lParen.GetWidth + GetLeftChild.Width(g), Y)   //   sin(x)
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Height(g As Graphics) As Double
		  // Overrides the superclass method.
		  
		  Dim scalarUnOpTIS As New TextItemShape(g, GetText, myScale)
		  
		  Return scalarUnOpTIS.GetHeight
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value() As double
		  // This method uses the class's embedded XojoScript to calculate the value.
		  // (We should probably fix this method to catch runtime errors in the script)
		  
		  theArgVal = ScalarUnaryOperator(self.GetLeftChild).Value
		  Script.Run
		  return theResult // this is the result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Width(g As Graphics) As Double
		  // Overrides the superclass method.
		  Dim expressionLength As Double
		  
		  //The items to be drawn
		  Dim scalarUnOpTIS As New TextItemShape(g, GetText, myScale)
		  Dim lParen As New TextItemShape(g, "(", myScale)
		  Dim rParen As New TextItemShape(g, ")", myScale)
		  
		  If HasParentheses Then
		    expressionLength =  lParen.GetWidth*2 + scalarUnOpTIS.GetWidth + _
		     GetLeftChild.Width(g) + rParen.GetWidth*2  // e.g. (sin(x))
		  Else
		    expressionLength = scalarUnOpTIS.GetWidth + lParen.GetWidth + _
		    GetLeftChild.Width(g) + rParen.GetWidth  // e.g. sin(x)
		  End If
		  
		  Return expressionLength 
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Script As XojoScript
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theArgVal As double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theResult As double
	#tag EndProperty


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
