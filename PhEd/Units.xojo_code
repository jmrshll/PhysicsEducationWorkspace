#tag Class
Protected Class Units
	#tag Method, Flags = &h0
		Shared Function Angle(prefix As Text) As boolean
		  Static angle As New Xojo.Core.Dictionary
		  
		  if angle.Count = 0 then
		    angle.Value("deg") = "degree"
		    angle.Value("rad") = "radians"
		    angle.Value("pi") = "radians"
		  end
		  
		  return angle.HasKey(prefix)
		  
		  // for use with delegates
		  'if angle.HasKey(prefix) then
		  'return CurrentMethodName
		  'else
		  'return nil
		  'end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Charge(prefix As Text) As boolean
		  Static charge As New Xojo.Core.Dictionary
		  
		  if charge.Count = 0 then
		    charge.Value("C") = "coulomb"
		    charge.Value("Ah") = "ampere hour"
		    charge.Value("e") = "elementary charge"
		  end
		  
		  return charge.HasKey(prefix)
		  
		  'if charge.HasKey(prefix) then
		  'return CurrentMethodName
		  'else
		  'return nil
		  'end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetType(prefix as Text) As Integer
		  // kind of crude, can be improved using delegates? and the enum
		  
		  if Length(prefix) then
		    return 0
		  elseif Mass(prefix) then
		    return 1
		  elseif Time(prefix) then
		    return 2
		  elseif Temperature(prefix) then
		    return 3
		  elseif Charge(prefix) then
		    return 4
		  elseif Mole(prefix) then
		    return 5
		  elseif Angle(prefix) then
		    return 6
		  else
		    return -1
		  end
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Length(prefix As Text) As boolean
		  //NOTE: liters are special cases of cubic length!
		  
		  Static length As New Xojo.Core.Dictionary
		  
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
		  
		  return length.HasKey(prefix)
		  
		  'if length.HasKey(prefix) then
		  'return CurrentMethodName
		  'else
		  'return nil
		  'end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Mass(prefix As Text) As boolean
		  Static mass As New Xojo.Core.Dictionary
		  
		  if mass.Count = 0 then
		    mass.Value("mg") = "milligram"
		    mass.Value("g") = "gram"
		    mass.Value("kg") = "kilogram"
		    mass.Value("oz") = "ounces"
		    mass.Value("lb") = "pound"
		  end
		  
		  return mass.HasKey(prefix)
		  
		  'if mass.HasKey(prefix) then
		  'return CurrentMethodName
		  'else
		  'return nil
		  'end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Mole(prefix As Text) As boolean
		  Static mole As New Xojo.Core.Dictionary
		  
		  if mole.Count = 0 then
		    mole.Value("mol") = "mole"
		  end
		  
		  return mole.HasKey(prefix)
		  
		  'if mole.HasKey(prefix) then
		  'return CurrentMethodName
		  'else
		  'return nil
		  'end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Temperature(prefix As Text) As boolean
		  Static temperature As New Xojo.Core.Dictionary
		  
		  if temperature.Count = 0 then
		    temperature.Value("K") = "kelvin"
		    temperature.Value("C") = "celsius"
		    temperature.Value("F") = "fahrenheit"
		  end
		  
		  return temperature.HasKey(prefix)
		  
		  'if temperature.HasKey(prefix) then
		  'return CurrentMethodName
		  'else
		  'return nil
		  'end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Time(prefix As Text) As boolean
		  Static time As New Xojo.Core.Dictionary
		  
		  if time.Count = 0 then
		    time.Value("ns") = "nanosecond"
		    time.Value("ms") = "millisecond"
		    time.Value("s") = "second"
		    time.Value("min") = "minute"
		    time.Value("h") = "hour"
		    time.Value("d") = "day"
		  end
		  
		  return time.HasKey(prefix)
		  
		  'if time.HasKey(prefix) then
		  'return CurrentMethodName
		  'else
		  'return nil
		  'end
		End Function
	#tag EndMethod


	#tag Note, Name = Units
		This class serves as a repository for unit categories (such as length and mass), defined names (such as meters, kilometers, and grams, kilograms), and symbols for both parsing and printout (m, km, g, kg).
		
		Each unit category's values are accessed by calling their respective method, which is shared (so no instance of PhEd.Unit needs to be created), and returns a static dictionary of symbol-name associations. The names could be used in the future for more formal selection.
		
		When a prefix is found to be of a certain category, the UnitCategories enum is referenced to fill the scalar's degree array (ScalarExpression.UnitDegree()).
		
		To determine the degree of each unit and fill the array, we can either create (or integrate into text2postfix) a lighter parser with only division and exponentiation to handle special cases (what if we input m/s/s/m^-1: we would want nothing or 1); simply pattern match to "a^x/b^y" which covers most situations; or we could traverse the tree which would be slow but possibly easier to code.
		
		Currently the unit type methods are only used to return the numeric type for input into the UnitDegree array. Using dictionaries, it should be possible to return the key/value associations interchangeably in order to print out the full (non-prefix) unit title. This could be done by returning a pair of values, the name of the method as well as the discovered dictionary entry.
		There are separate methods for each type for ease of updating (adding unit titles/definitions), but they could be condensed into a single method. GetType breaks when it finds the right type (searching linearly), so there would not be a significant performance gain.
		
		The GetType method is "Shared" because there need not be any particular instances of the Unit class generated, it is a static reference.
		
		"Delegates" may be a better option than shared unit type methods.
		
	#tag EndNote


	#tag Property, Flags = &h21
		#tag Note
			// this is the current number of unit types. It should match the number of enumerations.
		#tag EndNote
		Private NumberOfTypes As Integer = 7
	#tag EndProperty


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
