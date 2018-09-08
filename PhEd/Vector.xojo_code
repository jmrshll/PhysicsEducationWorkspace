#tag Class
Protected Class Vector
Inherits PhEd.ScalarExpression
	#tag Method, Flags = &h0
		Sub Append(e As PhEd.Expression)
		  elements.Append(e)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theText As Text, g As Graphics)
		  theText = theText.ReplaceAll("[","")  // trim the left bracket
		  theText = theText.ReplaceAll("]","")  // trim the right bracket
		  
		  dim theString As String = theText
		  
		  dim CSVList() As String = theString.Split(",")
		  
		  For i As Integer = 0 To CSVList.Ubound()
		    Append(Text2Expression(CSVList(i).ToText,g))
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, X as Double, Y as Double)
		  // Overrides the superclass method.
		  // NOTES: Look into expanding expression.baselineoffset instead of custom spacing
		  
		  Dim newY As Double
		  newY = Y
		  Dim widest As Double
		  
		  For i As Integer = 0 To elements().Ubound
		    elements(i).Draw(g, X + 3, newY) // 3 is a good baseline offset, the parenthesis might grow - needs work
		    newY = newY - elements(i).Height(g) + 2
		    If elements(i).Width(g) > widest Then
		      widest = elements(i).Width(g)
		    End If
		  Next
		  
		  'For i As Integer = 0 To elements().Ubound // determines the widest element in order to center the others
		  'If elements(i).Width(g) > widest Then
		  'widest = elements(i).Width(g)
		  'End If
		  'Next
		  '
		  'For i As Integer = 0 To elements().Ubound
		  'newY = newY - elements(i).Height(g) + 2
		  '//elements(i).Draw(g, X + 3 + (elements(i).Width(g) + widest)/2, newY) // 3 is a good baseline offset, the parenthesis might grow - needs work
		  'Next
		  
		  Dim lParen As New Parenthesis(g,false,Y - newY)
		  lParen.Draw(g, X, Y)
		  
		  Dim rParen As New Parenthesis(g,true,Y - newY)
		  rParen.Draw(g, X + lParen.GetWidth + widest, Y)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Elements() As PhEd.Expression()
		  return elements
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Height(g As Graphics) As Double
		  // Overrides the superclass method.
		  Dim scalarLiteralTIS As New TextItemShape(g, GetText, myScale) 
		  
		  Return scalarLiteralTIS.GetHeight
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
		  
		  Return expressionLength
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private elements() As PhEd.Expression
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
