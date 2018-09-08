#tag Class
Protected Class Equation
	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, X as integer, Y as integer)
		  // This method draws the equation into g, with its center at coordinates X and Y.
		  // This method needs to be implemented.
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLeft() As PhEd.Expression
		  return LeftExpression
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRight() As PhEd.Expression
		  return RightExpression
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Height() As Integer
		  // This method returns the height of the equation in pixels.
		  if theHeight <= 0 then
		    // Calculate the height -- needs to be implemented
		    // when done, set theHeight
		  end if
		  return theHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetExpressions(Left as PhEd.Expression, Right as PhEd.Expression)
		  // This method set the left and right expressions.
		  
		  // Checks for compatible type and units need to be implemented.
		  // Should raise appropriate errors if not correct. Otherwise:
		  LeftExpression = Left
		  RightExpression = Right
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Width() As Integer
		  // This method returns the width of the equation in pixels.
		  if theWidth <= 0 then
		    // Calculate the width -- needs to be implemented
		    // when done, set theWidth
		  end if
		  return theWidth
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private LeftExpression As PhEd.Expression
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RightExpression As PhEd.Expression
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theWidth As Integer
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
