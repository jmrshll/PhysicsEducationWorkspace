#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   574
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   545454079
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Test Postfix"
   Visible         =   True
   Width           =   832
   Begin TextField ExpressionField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   25
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "1{ft}"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   42
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   473
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Do Process"
      Default         =   True
      Enabled         =   True
      Height          =   34
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   79
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   171
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Expression:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   21
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "ExpressionTree:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   118
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   216
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Error Message:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   79
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   87
   End
   Begin TextArea ErrorBox
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   35
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   315
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   78
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   510
   End
   Begin Canvas FormattedExpression
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   411
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   132
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   143
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   680
   End
   Begin Label Label4
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   505
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Formatted expression:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   118
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   143
   End
   Begin CheckBox CheckBox1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "center lines"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   704
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   41
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   89
   End
   Begin PopupMenu ViewModeChanger
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   25
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   505
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Consolas"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   42
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   179
   End
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   412
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   132
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   142
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   361
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Circle"
      Default         =   True
      Enabled         =   True
      Height          =   50
      HelpTag         =   ""
      Index           =   7
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Consolas"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   504
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Rectangle"
      Default         =   True
      Enabled         =   True
      Height          =   50
      HelpTag         =   ""
      Index           =   6
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Consolas"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   451
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Ray"
      Default         =   True
      Enabled         =   True
      Height          =   50
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Consolas"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   348
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Line"
      Default         =   True
      Enabled         =   True
      Height          =   50
      HelpTag         =   ""
      Index           =   5
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Consolas"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   400
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Expression"
      Default         =   True
      Enabled         =   True
      Height          =   50
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Consolas"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   293
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Text"
      Default         =   True
      Enabled         =   True
      Height          =   50
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Consolas"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   242
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Erase"
      Default         =   True
      Enabled         =   True
      Height          =   50
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Consolas"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   191
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Move"
      Default         =   True
      Enabled         =   True
      Height          =   50
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Consolas"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   142
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Select Case viewMode
		  Case 0
		    canvas1.Visible = false
		    FormattedExpression.Visible = true
		  Case 1
		    canvas1.Visible = true
		    FormattedExpression.Visible = false
		  End
		End Sub
	#tag EndEvent


	#tag Note, Name = Window1 Controls
		Window1.Open fires as soon as the window loads, so you can govern all interactions within that event handler method.
		
		All drawn shapes (graphical "Objects") on the canvas should be put into an array so that they can be searched for, deleted, undone, redone, and moved by conducting a coordinate search on the canvas and matching it to the pixels of the shape.
		
	#tag EndNote


	#tag Property, Flags = &h0
		drawingMode As Integer = 3
	#tag EndProperty

	#tag Property, Flags = &h0
		ExeptionType As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		GhostShape As Object2D
	#tag EndProperty

	#tag Property, Flags = &h0
		inBounds As boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		MouseDown As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		MouseDownX As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		MouseDownY As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		MouseUpX As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		MouseUpY As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		outOfBounds As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		scaleFactor As double = 1
	#tag EndProperty

	#tag Property, Flags = &h0
		shapes() As Object2D
	#tag EndProperty

	#tag Property, Flags = &h0
		showAxes As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		theExpr As PhEd.Expression
	#tag EndProperty

	#tag Property, Flags = &h0
		viewMode As Integer = 0
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  Canvas1.Invalidate  
		  FormattedExpression.invalidate
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FormattedExpression
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.forecolor=&cFFFFFF
		  g.fillrect(0,0,g.width,g.height)
		  
		  //Frame the canvas
		  g.forecolor=&c000000
		  g.drawrect(0,0,g.width,g.height)
		  
		  
		  //Establish the point in the canvas
		  //from which to start drawing the
		  //formatted expression. The expression
		  //will be drawn left to right.
		  
		  Dim xStartPoint As Double = FormattedExpression.Width/16
		  Dim yStartPoint As Double = FormattedExpression.Height/2
		  
		  if DrawingMode = 3 then
		    if(MouseDownX > 0 and MouseDownY > 0) then
		      xStartPoint = MouseDownX
		      yStartPoint = MouseDownY
		    end
		  end
		  
		  g.DrawObject(ghostShape)
		  
		  For i as Integer = 0 to shapes.Ubound()
		    g.DrawObject(shapes(i))
		  Next
		  
		  //Draw lines through the center of the canvas. These
		  //will be helpful for formatting
		  If showAxes = 1 Then //showAxes is a property of Window1
		    
		    //Draw lines through the center of the canvas to make the center visible.
		    Dim primeMeridian As New CurveShape  //the vertical line
		    Dim equator As New CurveShape  //the horizontal line
		    Dim xCoordinateOfCenter As Integer = FormattedExpression.Width/2
		    Dim yCoordinateOfCenter As Integer = FormattedExpression.Height/2
		    
		    primeMeridian.X = xCoordinateOfCenter
		    primeMeridian.Y = 0
		    primeMeridian.X2= xCoordinateOfCenter
		    primeMeridian.Y2 = FormattedExpression.Height
		    g.DrawObject(primeMeridian)
		    
		    equator.X = 0
		    equator.Y = yCoordinateOfCenter
		    equator.X2 = FormattedExpression.Width
		    equator.Y2 = yCoordinateOfCenter
		    g.DrawObject(equator)
		    
		  End If
		  
		  //This try catch block is in place
		  //to catch errors that arise as
		  //this program reads the user input
		  //in TextField1.
		  Try
		    
		    //This condition avoids a Nil error
		    //if the program opens and nothing
		    //is in TextField1
		    If ExpressionField.Text <> "" Then   
		      'dim v as new PhEd.Vector
		      'v.Append(new PhEd.ScalarLiteral("100"))
		      'dim t as Text = "12+"
		      'v.Append(new PhEd.ScalarBinaryOperator((t)))
		      'v.Append(new PhEd.ScalarLiteral("3000"))
		      'v.Append(new PhEd.ScalarLiteral("30"))
		      
		      
		      Dim topNode As PhEd.Expression //topNode will store the top node of the expression tree
		      Window1.ExeptionType = 5
		      topNode = Text2Expression(ExpressionField.Text.ToText,g)   //parses TextField1.Text into an expression tree
		      if not topNode.isLegal  or Window1.ExeptionType < 5 then //then we have an exception
		        DrawException(g)
		      else 
		        //Set up the parentheses flags.
		        topNode.SetParentheses
		        //SetScale sets the scale of all items
		        //in the expression.
		        topNode.SetScale(scaleFactor)
		        topNode.Draw(g, xStartPoint, yStartPoint)
		        
		        //v.Draw(g, xStartPoint, yStartPoint)
		        
		        ErrorBox.Text = ""
		      end if 
		      
		    else 
		      Window1.ExeptionType = -1 // if the text field is empty then handle exception
		      DrawException(g)
		    end if
		    
		  Catch err As PhEd.ExpressionException
		    
		    MsgBox err.Message
		    
		  End Try
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  // will be used to create temporary "ghost" shapes as the mouse is moved when MouseDown is true, removing them each time the method is called to redraw (using GhostShape as the buffer and invalidating the canvas). The shape will be finalized on MouseUp.
		  
		  if MouseDown then
		    Select Case drawingMode // drawing tool selection and operations
		    Case 0
		      // TO-DO: movement
		    Case 1
		      // TO-DO: deletion
		    Case 2
		      // TO-DO: normal text // positional text (not parsed math, just straight text)
		    Case 3
		      // TO-DO: expressions // positional expressions
		    Case 4
		      // TO-DO: rays (use trigonometry and fill a triangle at the final coordinates)
		    Case 5
		      Dim c As New CurveShape
		      c.Order = 1
		      c.X = MouseDownX
		      c.Y = MouseDownY
		      c.X2 = X
		      c.Y2 = Y
		      
		      GhostShape = c
		      FormattedExpression.Invalidate
		    Case 6
		      Dim r As New RectShape
		      r.X = MouseDownX
		      r.Y = MouseDownY
		      
		      r.Width = Abs(MouseDownX - X)
		      r.Height = Abs(MouseDownY - Y)
		      
		      r.Border = 100
		      r.BorderColor = RGB(0, 0, 0)
		      r.Fill = 0
		      
		      GhostShape = r
		      FormattedExpression.Invalidate
		    Case 7
		      Dim o As New OvalShape
		      o.X = MouseDownX
		      o.Y = MouseDownY
		      
		      Dim diameter As Integer = Max(Abs(MouseDownX - X), Abs(MouseDownY - Y))
		      
		      o.Width = diameter
		      o.Height = diameter
		      
		      o.Border = 100
		      o.BorderColor = RGB(0, 0, 0)
		      o.Fill = 0
		      
		      GhostShape = o
		      FormattedExpression.Invalidate
		    end
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  MouseDownX = X // these are doubles from the integers for easier typing when it comes to future math
		  MouseDownY = Y
		  MouseDown = True
		  return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if(MouseDown) then
		    shapes.append(GhostShape)
		    FormattedExpression.Invalidate
		    MouseDown = false
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox1
	#tag Event
		Sub Action()
		  //If CheckBox1 is checked,
		  //horizontal and vertical lines through the center of 
		  //FormattedExpression should appear.
		  If Me.Value Then
		    showAxes = 1
		    FormattedExpression.Invalidate
		  Else
		    showAxes = 0
		    FormattedExpression.Invalidate
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ViewModeChanger
	#tag Event
		Sub Open()
		  Me.AddRow("Canvas Mode") // default white canvas with drawing tools
		  Me.AddRow("Educational Mode") // displays the old view for manipulating equations and viewing the tree structure
		  Me.ListIndex = 0
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  viewMode = Me.ListIndex // updates the index of the view mode option
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Window1.ExeptionType = 5
		  theExpr = PhEd.Text2Expression(ExpressionField.text.ToText, g)
		  if theExpr <> nil then
		    if not theExpr.isLegal or Window1.ExeptionType < 5 then 
		    else
		      DrawTree(g, theExpr)
		      Dim txt as Text = theExpr.evaluate.ToText
		    end if
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action(index as Integer)
		  drawingMode = index
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="showAxes"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ExeptionType"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="outOfBounds"
		Group="Behavior"
		InitialValue="false"
		Type="boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="scaleFactor"
		Group="Behavior"
		InitialValue="1"
		Type="double"
	#tag EndViewProperty
	#tag ViewProperty
		Name="inBounds"
		Group="Behavior"
		InitialValue="true"
		Type="boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="viewMode"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="drawingMode"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MouseDown"
		Group="Behavior"
		InitialValue="false"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MouseDownX"
		Group="Behavior"
		Type="Double"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MouseDownY"
		Group="Behavior"
		Type="Double"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MouseUpX"
		Group="Behavior"
		Type="Double"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MouseUpY"
		Group="Behavior"
		Type="Double"
	#tag EndViewProperty
#tag EndViewBehavior
