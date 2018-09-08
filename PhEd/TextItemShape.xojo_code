#tag Class
Protected Class TextItemShape
Inherits StringShape
	#tag Method, Flags = &h1000
		Sub Constructor(g as Graphics, theText as Text, theScale as Double)
		  //Set the properties of the StringShape. X and Y are set in the Draw method.
		  Text = theText
		  myText = theText
		  TextFont = g.TextFont  
		  TextSize = g.TextSize
		  TextUnit = g.TextUnit
		  HorizontalAlignment = StringShape.Alignment.Left
		  VerticalAlignment = StringShape.Alignment.BaseLine
		  Scale = theScale
		  Dim p as new Picture(1, 1, 32)
		  p.Graphics.TextFont = TextFont
		  p.Graphics.TextSize = TextSize
		  p.Graphics.TextUnit = TextUnit
		  myWidth=p.Graphics.StringWidth(Text)*Scale //StringWidth returns a Double, the length of the text in pixels
		  myHeight=p.Graphics.StringHeight(Text, 100000)*Scale //100,000 is the WrapWidth, the width at which text should wrap
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g As Graphics, xParameter as Double, yParameter as Double)
		  Self.X = xParameter
		  Self.Y = yParameter
		  g.DrawObject(Self)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetHeight() As double
		  Return myHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetWidth() As Double
		  Return myWidth
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHeight(h as double)
		  myHeight = h
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetWidth(w as double)
		  myWidth = w 
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private myHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		myText As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myWidth As Double
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Bold"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderColor"
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderWidth"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Fill"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FillColor"
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Rotation"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Scale"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="X"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Y"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HorizontalAlignment"
			Group="Behavior"
			Type="Alignment"
			EditorType="Enum"
			#tag EnumValues
				"0 - Left"
				"1 - Top"
				"2 - Center"
				"3 - BaseLine"
				"4 - Right"
				"5 - Bottom"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="VerticalAlignment"
			Group="Behavior"
			Type="Alignment"
			EditorType="Enum"
			#tag EnumValues
				"0 - Left"
				"1 - Top"
				"2 - Center"
				"3 - BaseLine"
				"4 - Right"
				"5 - Bottom"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="myText"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
