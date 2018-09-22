#tag Class
Protected Class ScalarExpression
Inherits PhEd.Expression
	#tag Method, Flags = &h0
		Function Value() As double
		  // This method returns the expression's value if all its subexpressions are defined.
		  // Otherwise it raises an UndefinedValue ExpressionError.
		  // The various subclasses should override this method.
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		UnitDegree() As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		UnitTree As PhEd.Expression
	#tag EndProperty

	#tag Property, Flags = &h0
		UnitType() As Text
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
