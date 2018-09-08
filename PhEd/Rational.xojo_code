#tag Class
Protected Class Rational
	#tag Method, Flags = &h0
		Sub Constructor(theNum as integer, theDenom as integer)
		  If theDenom = 0 then
		    raise new ExpressionException("Undefined Rational")
		  elseif theDenom < 0 then // make sure that sign gets exposed in the numerator
		    Denominator = Abs(theDenom)
		    Numerator = -theNum
		  else
		    Denominator = theDenom
		    Numerator = theNum
		  end if
		  
		  Simplify  // find and divide by greatest common factor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DivideBy(other as PhEd.Rational)
		  Numerator = Numerator * other.GetDenominator
		  Denominator = Denominator * other.GetNumerator
		  
		  Simplify
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDenominator() As Integer
		  Return Denominator
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNumerator() As Integer
		  Return Numerator
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsEqualTo(LeftRat as PhEd.Rational, RightRat as PhEd.Rational) As Boolean
		  return (LeftRat.GetNumerator = RightRat.GetNumerator And LeftRat.GetDenominator = RightRat.GetDenominator)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsZero() As Boolean
		  Return (Numerator = 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MultiplyBy(other as PhEd.Rational)
		  Numerator = Numerator * other.GetNumerator
		  Denominator = Denominator * other.GetDenominator
		  
		  Simplify
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Simplify()
		  dim a as integer = Numerator
		  dim b as integer = Denominator
		  
		  dim t as integer = b
		  
		  while b <> 0
		    t = b
		    b = a mod b
		    a = t
		  wend
		  
		  Numerator = Numerator / a
		  Denominator = Denominator / a
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Denominator As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Numerator As Integer
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
