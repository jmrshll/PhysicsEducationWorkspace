#tag Class
Protected Class Parenthesis
Inherits CurveShape
	#tag Method, Flags = &h0
		Sub Constructor(g as Graphics, direction as Boolean, height as Double)
		  myDirection = direction
		  myHeight = height
		  myWidth = height/10
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g As Graphics, xParameter as Double, yParameter as Double)
		  Dim c1 As New CurveShape
		  
		  //Dim c2 As New CurveShape
		  
		  if(myDirection = false) then
		    c1.ControlX(0) = c1.X - 2 * myHeight/10
		    c1.X = xParameter - 1
		    
		    'c2.X = c1.X
		    'c2.ControlX(0) = c1.ControlX(0) + (1/4)*myHeight/10
		  else
		    c1.X = xParameter + 1
		    c1.ControlX(0) = c1.X + 2 * myHeight/10
		    
		    'c2.X = c1.X
		    'c2.ControlX(0) = c1.ControlX(0) - (1/4)*myHeight/10
		  end
		  
		  c1.Y = yParameter
		  c1.X2 = c1.X
		  c1.Y2 = c1.Y - myHeight
		  c1.ControlY(0) = (c1.Y + c1.Y2) / 2
		  c1.Order = 1
		  
		  'c2.Y = c1.Y
		  'c2.X2 = c1.X2
		  'c2.Y2 = c1.Y2
		  'c2.Order = 1
		  '//c2.BorderWidth = c1.Scale * myHeight/10
		  
		  g.DrawObject(c1)
		  //g.DrawObject(c2)
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


	#tag Property, Flags = &h21
		Private myDirection As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myWidth As Double
	#tag EndProperty


	#tag ViewBehavior
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
			Name="Order"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
			Name="Segments"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="X"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="X2"
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
			Name="Y2"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
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
