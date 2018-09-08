#tag Class
Protected Class ScalarLiteral
Inherits PhEd.ScalarExpression
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(theText as Text)
		  // Might should double-check that the text is a valid number before setting.
		  myText = theText
		  myValue = Val(theText)
		  myType = Expression.EType.Literal
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, X as Double, Y as Double)
		  // Overrides the superclass method.
		  Dim scalarLiteralTIS As New TextItemShape(g, myText, myScale)  
		  
		  If HasParentheses Then
		    Dim lParen As New Parenthesis(g,false,10)
		    Dim rParen As New Parenthesis(g,true,10)
		    lParen.Draw(g, X, Y)
		    scalarLiteralTIS.Draw(g, X + lParen.GetWidth, Y)
		    rParen.Draw(g, X + lParen.GetWidth + scalarLiteralTIS.GetWidth, Y)
		  Else
		    ScalarLiteralTIS.Draw(g, X, Y)
		  End If
		  
		  if UnitTree <> nil then
		    UnitTree.Draw(g, X+10,y)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Height(g As Graphics) As Double
		  // Overrides the superclass method.
		  Dim scalarLiteralTIS As New TextItemShape(g, GetText, myScale) 
		  
		  if UnitTree <> nil then
		    Return Max(scalarLiteralTIS.GetHeight,UnitTree.Height(g))
		  else
		    Return scalarLiteralTIS.GetHeight
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value() As double
		  return myValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Width(g As Graphics) As Double
		  // Overrides the superclass method.
		  Dim expressionLength As Double
		  
		  If HasParentheses Then
		    //Declare as TextItemShapes all of the items that will be drawn. 
		    Dim lParen As New TextItemShape(g, "(", myScale)
		    Dim scalarLiteralTIS As New TextItemShape(g, GetText, myScale) 
		    Dim rParen As New TextItemShape(g, ")", myScale)
		    expressionLength =  lParen.GetWidth + scalarLiteralTIS.GetWidth + rParen.GetWidth
		  Else
		    Dim scalarLiteralTIS As New TextItemShape(g, GetText, myScale)
		    expressionLength = scalarLiteralTIS.GetWidth
		  End If
		  
		  if UnitTree <> nil then
		    Return expressionLength + 5 + UnitTree.Width(g)
		  else
		    Return expressionLength
		  end
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private myValue As double
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
