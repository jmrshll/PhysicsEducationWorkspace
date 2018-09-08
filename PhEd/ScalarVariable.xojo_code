#tag Class
Protected Class ScalarVariable
Inherits PhEd.ScalarExpression
	#tag Method, Flags = &h1000
		Sub Constructor(theID as Text)
		  myText = theID
		  myType = Expression.EType.Variable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DefineValue(theValue as double)
		  Defined = true
		  myValue = theValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, X as double, Y as Double)
		  // Overrides the superclass method.
		  
		  Dim scalarVariableTIS As New TextItemShape(g, GetText, myScale)
		  scalarVariableTIS.Draw(g, X, Y)
		  
		  UnitTree.Draw(g, X+5,y+5)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Height(g As Graphics) As Double
		  // Overrides the superclass method.
		  
		  Dim scalarVariableTIS As New TextItemShape(g, GetText, myScale)
		  
		  if UnitTree <> nil then
		    Return Max(scalarVariableTIS.GetHeight,UnitTree.Height(g))
		  else
		    Return scalarVariableTIS.GetHeight
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDefined() As Boolean
		  return Defined
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MarkAsUndefined()
		  Defined = false
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value() As double
		  // This returns the variable's value if it is defined.
		  
		  if Defined then
		    return myValue
		  else
		    raise new PhEd.ExpressionException("Value is Undefined")
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Width(g As Graphics) As Double
		  // Overrides the superclass method.
		  Dim expressionLength As Double
		  
		  If HasParentheses Then
		    //Declare as TextItemShapes all of the items that will be drawn.
		    Dim lParen As New TextItemShape(g, "(", myScale)
		    Dim scalarVariableTIS As New TextItemShape(g, GetText, myScale)
		    Dim rParen As New TextItemShape(g, ")", myScale)
		    expressionLength =  lParen.GetWidth + scalarVariableTIS.GetWidth + rParen.GetWidth
		  Else
		    Dim scalarVariableTIS As New TextItemShape(g, GetText, myScale)
		    expressionLength = scalarVariableTIS.GetWidth
		  End If
		  
		  if UnitTree <> nil then
		    Return expressionLength + 5+ UnitTree.Width(g)
		  else
		    Return expressionLength
		  end
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Defined As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		HasParentheses As Boolean
	#tag EndProperty

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
		#tag ViewProperty
			Name="HasParentheses"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
