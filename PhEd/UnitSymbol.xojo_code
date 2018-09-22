#tag Class
Protected Class UnitSymbol
Inherits PhEd.ScalarExpression
	#tag Method, Flags = &h1000
		Sub Constructor(theID as Text)
		  myText = theID
		  myType = Expression.EType.Unit
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, X as double, Y as Double)
		  // Overrides the superclass method.
		  
		  Dim scalarVariableTIS As New TextItemShape(g, GetText, myScale*.8)
		  scalarVariableTIS.Draw(g, X, Y)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Height(g As Graphics) As Double
		  // Overrides the superclass method.
		  
		  Dim scalarVariableTIS As New TextItemShape(g, GetText, myScale)
		  
		  Return scalarVariableTIS.GetHeight
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
		  
		  Return expressionLength
		  
		End Function
	#tag EndMethod


	#tag Note, Name = UnitSymbol
		
		This class exists to allow for what are essentially multi-character ScalarVariable trees. All of the drawing methods from PhEd.ScalarVariable have been copied, and all of the other functionality has been removed.
	#tag EndNote


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
