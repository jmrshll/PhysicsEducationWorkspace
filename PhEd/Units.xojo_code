#tag Class
Protected Class Units
	#tag Method, Flags = &h0
		Function Angle() As Xojo.Core.Dictionary
		  Static angle As Xojo.Core.Dictionary
		  
		  if angle.Count = 0 then
		    angle.Value("deg") = "degree"
		    angle.Value("rad") = "radians"
		    angle.Value("pi") = "radians"
		  end
		  
		  return angle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Charge() As Xojo.Core.Dictionary
		  Static charge As Xojo.Core.Dictionary
		  
		  if charge.Count = 0 then
		    charge.Value("C") = "coulomb"
		    charge.Value("Ah") = "ampere hour"
		    charge.Value("e") = "elementary charge"
		  end
		  
		  return charge
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Length() As Xojo.Core.Dictionary
		  Static length As Xojo.Core.Dictionary
		  
		  if length.Count = 0 then
		    length.Value("mm") = "millimeter"
		    length.Value("cm") = "centimeter"
		    length.Value("m") = "meter"
		    length.Value("km") = "kilometer"
		    length.Value("in") = "inch"
		    length.Value("ft") = "foot"
		    length.Value("yd") = "yard"
		    length.Value("au") = "astronomical unit"
		    length.Value("ly") = "light year"
		    length.Value("pc") = "parsec"
		  end
		  
		  //NOTE: liters are special cases of cubic length!
		  
		  return length
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Mass() As Xojo.Core.Dictionary
		  Static mass As Xojo.Core.Dictionary
		  
		  if mass.Count = 0 then
		    mass.Value("mg") = "milligram"
		    mass.Value("g") = "gram"
		    mass.Value("kg") = "kilogram"
		    mass.Value("oz") = "ounces"
		    mass.Value("lb") = "pound"
		  end
		  
		  return mass
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Mole() As Xojo.Core.Dictionary
		  Static mole As Xojo.Core.Dictionary
		  
		  if mole.Count = 0 then
		    mole.Value("mol") = "mole"
		  end
		  
		  return mole
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Temperature() As Xojo.Core.Dictionary
		  Static temperature As Xojo.Core.Dictionary
		  
		  if temperature.Count = 0 then
		    temperature.Value("K") = "kelvin"
		    temperature.Value("C") = "celsius"
		    temperature.Value("F") = "fahrenheit"
		  end
		  
		  return temperature
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Time() As Xojo.Core.Dictionary
		  Static time As Xojo.Core.Dictionary
		  
		  if time.Count = 0 then
		    time.Value("ns") = "nanosecond"
		    time.Value("ms") = "millisecond"
		    time.Value("s") = "second"
		    time.Value("min") = "minute"
		    time.Value("h") = "hour"
		    time.Value("d") = "day"
		  end
		  
		  return time
		End Function
	#tag EndMethod


	#tag Note, Name = Units
		
		This class serves as a repository for unit categories (such as length and mass), defined names (such as meters, kilometers, and grams, kilograms), and symbols for both parsing and printout (m, km, g, kg).
		
		Each unit category's values are accessed by calling their respective method, which is shared (so no instance of PhEd.Unit needs to be created), and returns a static dictionary of symbol-name associations. The names could be used in the future for more formal selection.
		
		When a prefix is found to be of a certain category, the UnitCategories enum is referenced to fill the scalar's degree array (ScalarExpression.UnitDegree()).
	#tag EndNote


	#tag Enum, Name = UnitCategories, Flags = &h0
		Length
		  Time
		  Mass
		  Temperature
		  Charge
		  Mole
		Angle
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
