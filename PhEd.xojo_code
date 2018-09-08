#tag Module
Protected Module PhEd
	#tag Method, Flags = &h0
		Sub DrawException(g As Graphics)
		  // Based on the type of exception, handle it by showing the proper error message
		  if Window1.ExeptionType = 0 then
		    //g.DrawString("Error: Parenthesis Mismatch", 5, g.Height/4) 
		    Window1.ErrorBox.setString("Error: Parenthesis Mismatch")
		  elseif Window1.ExeptionType = 1 then
		    //g.DrawString("Error: Illegal Character", 5, g.Height/4) 
		    Window1.ErrorBox.setString("Error: Illegal Character")
		  elseif Window1.ExeptionType = 2 then
		    //g.DrawString("Error: Can't divide by zero", 5, g.Height/4) 
		    Window1.ErrorBox.setString("Error: Can't divide by zero")
		  elseif Window1.ExeptionType = 3 then
		    //g.DrawString("Error: Can't raise zero to the power of zero", 5, g.Height/4) 
		    Window1.ErrorBox.setString("Error: Can't raise zero to the power of zero")
		  elseif Window1.ExeptionType = 4 then
		    //g.DrawString("Error: Invalid Mathematical Expression", 5, g.Height/4) 
		    Window1.ErrorBox.setString("Error: Invalid Mathematical Expression")
		  elseif Window1.ExeptionType = -1 then
		    //g.DrawString("Error: Invalid Mathematical Expression", 5, g.Height/4) 
		    Window1.ErrorBox.setString("Error: Empty Text Field")
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawTree(g as Graphics, theExpression as PhEd.Expression)
		  // This method draws the tree implied by the supplied expression
		  // This is based on an algorithm discussed at
		  // http://stackoverflow.com/questions/14184655/set-position-for-drawing-binary-tree
		  
		  dim HSpace as integer = 50 // this will be the width of an item
		  dim VSpace as integer = 15 // this will be the line height of a level
		  dim VOffset as integer = 15 // offset from the top
		  dim HOffset as integer = 25 // offset from the left
		  dim theList(-1) as PhEd.Expression // this will be an ordered list of items in the expression
		  dim theLevelList(-1) as integer // this will be a parallel list of levels
		  dim theHIndexList(-1) as integer // this will be a parallel list of indices
		  dim theShape as StringShape // this will be the particular shape in question
		  dim theItem as PhEd.Expression // this will be the particular item we are looking at
		  dim LastLevel as integer // this will be the value of the maximum level we reach
		  theList = theExpression.GetList // get the list of expressions
		  for i as integer = 0 to theList.Ubound // scan through the list and create the parallel lists
		    theItem = theList(i) // this is the item
		    LastLevel = theItem.GetTreeLevel // get the item's level
		    theLevelList.Append LastLevel  // get the item's level
		    theHIndexList.Append theItem.GetTreeHIndex // get the item's index on that level
		  next
		  // LastLevel should contain the  level of the bottom of the tree at this point
		  theShape = new StringShape
		  dim theWidth as integer = 500
		  //dim theWidth as integer = HSpace*(2^LastLevel) // this is the hypothetical maximum size of the bottom level
		  for i as integer = 0 to theLevelList.Ubound  // scan through the list
		    theShape.Text = theList(i).GetText
		    theShape.X = theWidth*theHIndexList(i)/(2^theLevelList(i) + 1) + HOffset
		    theShape.Y = theLevelList(i)*VSpace + VOffset
		    g.DrawObject(theShape)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equation2Postfix(theText as Text, g as Graphics) As Text()
		  //method that returns the postfix form of an equation 
		  dim leftSide() as Text = Text2Postfix(theText.Left(theText.indexOf("=") ),g) // left side of equation
		  dim rightSide() as Text = Text2Postfix(theText.Right(theText.length - theText.indexOf("=") -1),g) // right side of equation
		  dim combined(-1) as Text // result 
		  dim counter as integer 
		  dim i as integer 
		  while counter <= leftSide.Ubound // get the left side
		    combined.append(leftSide(counter))
		    counter = counter + 1
		  wend 
		  while i <= rightSide.Ubound // get the right side
		    combined.append(rightSide(i))
		    i = i + 1
		  wend 
		  combined.append("=")
		  return combined // return the postfix form of the equation 
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FillTop(ExprArray() as PhEd.ScalarExpression, theSubEx as PhEd.ScalarExpression)
		  // This method looks at the top operator in the operator expression stack and looks for
		  // empty slots, filling the appropriate slot with provided theSubEx expression and
		  // popping the top operator from the operator expression stack if it is full.
		  
		  dim theTop as PhEd.ScalarExpression // this will hold the top operator on the expression stack
		  if ExprArray.Ubound < 0 then // if the expression stack is empty
		    // then we have nothing to fill
		  else
		    theTop = ExprArray.Pop // pop the top expression on the expression stack
		    theTop.SetChild(theSubEx) // fill the appropriate child slot or raise the appropriate exception
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetFunctionScript(theName as Text) As XojoScript
		  // One can use this method both to see if the text provides a valid function name
		  // and get a XojoScript to execute a calculation. This method returns nil if the function
		  // is not found, and returns the XojoScript if it is. The point is that we can use this to
		  // provide a single well-defined way to list the valid unary scalar functions.
		  
		  dim xs as new XojoScript
		  Select case theName
		  Case "sqrt"
		    xs.Source = "theResult = sqrt(theArgVal)"
		  Case "abs"
		    xs.Source = "theResult = abs(theArgVal)"
		  Case "neg"
		    xs.Source = "theResult = -theArgVal"
		  Case "sin"
		    xs.Source = "theResult = sin(theArgVal)"
		  Case "cos"
		    xs.Source = "theResult = cos(theArgVal)"
		  Case "tan"
		    xs.Source = "theResult = tan(theArgVal)"
		  Case "exp"
		    xs.Source = "theResult = exp(theArgVal)"
		  Case "ln"
		    xs.Source = "theResult = log(theArgVal)"
		  Case "log"
		    xs.Source = "theResult = log(theArgVal)/log(10)"
		  Case "arcsin"
		    xs.Source = "theResult = asin(theArgVal)"
		  Case "arccos"
		    xs.Source = "theResult = acos(theArgVal)"
		  Case "arctan"
		    xs.Source = "theResult = atan(theArgVal)"
		  Else
		    xs = nil
		  End Select
		  return xs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetNextToken(CharAtIndex() as Text, ByRef indx as integer) As Text
		  // This method scans the expression for the next identifier starting at indx.
		  // It assumes that we are looking for an identifier, and so will accept + or - as a leading sign.
		  // It exits with either indx pointing at the offending operator character or beyond a terminating
		  // open parethesis, or beyond a leading sign.
		  // This method returns with the identifier (an empty identifier means that nothing was found).
		  
		  dim CharsInItem(-1) as text
		  dim ThisChar as text
		  dim OperatorList as text = "+-*/^()={}" // These reserved characters can end an identifier
		  dim ReservedCode as integer
		  
		  // Loop as long as we don't have an operator character or a parenthesis or the end of the expression.
		  while indx <= CharAtIndex.Ubound
		    ThisChar = CharAtIndex(indx)  // Get the current character
		    ReservedCode = OperatorList.IndexOf(ThisChar)  // This checks to see if the current character is on the reserved list
		    if ReservedCode < 0 then // If the character is not on the list
		      CharsInItem.Append ThisChar // add the character to our current list of identifier characters
		      indx = indx + 1 // point to the next character
		    elseif ReservedCode = 0 or ReservedCode = 1 then // the character is a "+" or "-"
		      if CharsInItem.Ubound = -1 then // this is the first character, so is a leading sign
		        if ReservedCode = 1 then // if it is a negative sign
		          CharsInItem.Append ThisChar // append to the list (we simply ignore the positive sign altogether)
		          if indx < CharAtIndex.Ubound and not IsADigit(CharAtIndex(indx+1)) then // but if the next character is not a digit
		            // this is a unary minus operation
		            indx = indx + 1 // point to the next character
		            exit // we are done -- return the minus sign
		          end if
		        end if
		        indx = indx + 1 // otherwise point to the next character beyond the sign
		      elseif (CharsInItem.Ubound > 0) and IsADigit(CharsInItem(CharsInItem.Ubound-1)) and (CharsInItem(CharsInItem.Ubound) = "e") and (indx < CharAtIndex.Ubound) and IsADigit(CharAtIndex(indx + 1)) then
		        // If the sign is part of the pattern "<digit>e±<digit>" then we will interpret it as part of a floating point number.
		        CharsInItem.Append ThisChar // so add the sign to our current list of identifier characters
		        indx = indx + 1 // point to the next character
		      else // the + or - is not part of the identifier: it is a binary operator
		        exit // break out of the loop: we are done (indx points to the operator)
		      end if
		    elseif ReservedCode = 5 or ReservedCode = 8 or ReservedCode = 9 then // the item is an open parenthesis or a brace (for unit trees)
		      CharsInItem.Append ThisChar // we append it to the identifier
		      indx = indx + 1 // point to the next character
		      exit // but we break out of the loop: this finishes the identifier
		    else  // if it is a breaking character that is not a + or - or ( then
		      exit // break out of the loop: we are done
		    end if // End check of possible breaking characters
		  wend
		  return Text.Join(CharsInItem,"")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlePrecedence(theOp as text, OpStack() as Text, ECode() as Text)
		  // This method handles operator precedence.
		  // It assumes that theOp is a valid operator (it delivers
		  // an ExpressionException otherwise).
		  
		  dim PrecOfTop, PrecOfItem as integer
		  PrecOfItem = PrecedenceOf(theOp) // This is the precedence of the new item
		  do
		    if OpStack.Ubound < 0 then  // if the operator stack is empty,
		      OpStack.Append theOp // just push the new operator onto it
		      exit // and exit the loop
		    else
		      PrecOfTop = PrecedenceOf(OpStack(OpStack.Ubound)) // This is the precedence of stack top
		      if PrecOfTop = 99 then // this is a parenthesis or function
		        OpStack.Append theOp // just push the new operator onto it as if it were the beginning
		        exit // and we are done
		      elseif PrecOfItem > PrecOfTop then // if the new item has greater precendence than the stack top
		        OpStack.Append theOp // push the new operator onto the stack
		        exit // and we are done
		      elseif PrecOfItem = PrecOfTop then  // if their precedences are equal
		        ECode.Append OpStack.Pop // pop the last operator to the code
		        OpStack.Append theOp // and push the new one (this is consistent with left-to-right precedence)
		        exit // and we are done
		      else // the new operator has a lower precedence than the stack top
		        ECode.Append OpStack.Pop // pop the last operator to the code
		        // in this case, we loop again to compare theOp with the new top of stack (if we are not empty)
		      end if
		    end if
		  loop
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsADigit(theChar as text) As Boolean
		  return (theChar.Compare("0") >= 0) and (theChar.Compare("9") <= 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsANumber(theItem as Text) As Boolean
		  // This method returns true if the entire item is an integer or a floating-point number
		  // It does it by doing a search using a Regular Expression.
		  dim re as new RegEx
		  dim rm as RegExMatch
		  re.SearchPattern = "^[+-]?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)([eE][+-]?[0-9]+)?$"
		  rm = re.Search(theItem)
		  return rm <> Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsAUnit(theText As Text) As Boolean
		  // This method returns true if the item follows the pattern of [number] { [expression]
		  // It does it by doing a search using a Regular Expression.
		  dim re as new RegEx
		  dim rm as RegExMatch
		  re.SearchPattern = "^[+-]?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)([eE][+-]?[0-9]+)?[{]"
		  rm = re.Search(theText)
		  return rm <> Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsValidFunction(theFName as Text) As Boolean
		  dim xs as XojoScript
		  xs = GetFunctionScript(theFName)
		  return not (xs = nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsValidOperator(theText as Text) As Boolean
		  // This returns true if the text is a valid binary operator token.
		  return (theText = "+") or (theText = "-") or (theText = "*") or (theText = "/") or (theText = "^") or (theText = "=")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PrecedenceOf(theOp as Text) As Integer
		  // This method returns a precedence number for the supplied operator.
		  // Higher numbers have greater precedence.
		  
		  if theOp.Right(1) = "(" then
		    theOp = "(" // all functions are the same as parentheses
		  end if
		  Select Case theOp
		  Case "+", "-"
		    return 1
		  Case "*", "/"
		    return 2
		  Case "^"
		    return 3
		  Case "neg"
		    return 4
		  Case "("
		    return 99
		  Case "="  // included case where we have theOp to be =
		    return 0
		  Else
		    raise new ExpressionException("Operator has no defined precedence.")
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Text2Expression(theExpr as Text, g as Graphics) As PhEd.ScalarExpression
		  // This method converts a calculator-style text expression to a PhEd.Expression.
		  // The basic algorithm is as follows. First we convert theExpr to a postfix expression array.
		  // We then define an expression stack that will store operator expressions that have open slots that need filling.
		  // Then we iterate the following :
		  // (1) Pop the top (last) item from the postix array and create the corresponding type of expression
		  // (2) If it is a variable, constant, or literal, then it needs to go into an unfilled slot in a previously defined expression
		  //      (unless it is the ONLY expression
		  //      The top of the expression stack contains the last defined expression having unfilled slots
		  //      (a) If that top expression is a binary operator then we first fill its right slot, or if that one is full, its left slot
		  //           with the newly-created expression.
		  //      (b) If that top expression is a unary operator, then we fill its only slot with the newly created expression.
		  //      (c) If that top expression is now full, we pop it from the expression stack (which only contains unfilled operators).
		  // (3) If the new expression is a binary or unary operator itself, then we do step (2) but also
		  //      (a) we push the new operator onto the operator stack, because its slots are not yet full.
		  //      (b) we check whether it is the first operator -- the first operator is the root of the whole tree.
		  // (4) When we have no postfix items left, we return the root expression.
		  // At present, this only works for scalar expressions
		  
		  dim isEquation as boolean = theExpr.IndexOf("=") > 0
		  dim isUnit as boolean = theExpr.IndexOf("{") = 0 // is a unit if it begins with {
		  dim Postfix(-1) as text  // define postfix array
		  dim ExprArray(-1) as PhEd.ScalarExpression // this is the expression stack
		  dim theResult as PhEd.ScalarExpression // this will be the final result
		  dim theSubEx as PhEd.ScalarExpression // this will hold a new subexpression
		  dim theItem as text // this will be the current item from the postfix array
		  dim FirstItem as Boolean = true // this is a flag indicating the first item
		  if isEquation then 
		    Postfix = Equation2Postfix(theExpr,g)
		  else
		    if(isUnit) then
		      Postfix = Text2Postfix(theExpr.Right(theExpr.Length-1), g) // convert expression to a postfix array after removing the {, because we have sent a unit list
		    else
		      Postfix = Text2Postfix(theExpr, g) // convert expression to a postfix array
		    end if
		  end if
		  if Postfix = nil or Postfix.Ubound < 0 then 
		    //raise new PhEd.ExpressionException("Bad postfix conversion")
		    Window1.ExeptionType = -1
		    DrawException(g)
		     return new PhEd.ScalarLiteral()
		  end if
		  do
		    theItem = Postfix.Pop // get the top (last) item in the postfix array
		    if IsValidOperator(theItem) then
		      theSubEx = new PhEd.ScalarBinaryOperator(theItem) // create a new binary operator expression
		      if FirstItem then theResult = theSubEx // if this is the first operator, then it is the root operator
		      FillTop(ExprArray, theSubEx) //put the newly created item into the top expression on the expression stack
		      ExprArray.Append theSubEx // push whatever the new expression we have created onto the expression stack
		      ExprArray.Append theSubEx // twice, because we have two slots to fill
		    elseif IsValidFunction(theItem) then // if the item is a function or negation operator
		      theSubEx = new PhEd.ScalarUnaryOperator(theItem) // create a new unary operator expression
		      if FirstItem then theResult = theSubEx // if this is the first operator then it is the root operator
		      FillTop(ExprArray, theSubEx) //put the newly created item into the top expression on the expression stack
		      ExprArray.Append theSubEx // push whatever new operation we have created onto the expression stack
		    elseif IsANumber(theItem) then// if the item is a number
		      theSubEx = new PhEd.ScalarLiteral(theItem) // create a new literal expression 
		      if FirstItem then theResult = theSubEx  // if this is the first operator, then it is the root operator
		      FillTop(ExprArray, theSubEx) // and put it into an appropriate empty subexpression in the top operator in the stack-
		      // But we don't push anything to the expression stack
		    elseif IsAUnit(theItem) then // if the item is a braced unit expression
		      theSubEx = new PhEd.ScalarLiteral(theItem.Left(theItem.IndexOf("{"))) // create a new literal expression
		      dim unitList As Text = theItem.Right(theItem.Length - theItem.IndexOf("{"))
		      theSubEx.UnitTree = Text2Expression(unitList, g)  // parses the inner expression, with the scalar and "{" omitted 
		      if FirstItem then theResult = theSubEx  // if this is the first operator, then it is the root operator
		      FillTop(ExprArray, theSubEx) // and put it into an appropriate empty subexpression in the top operator in the stack-
		      // But we don't push anything to the expression stack
		    elseif theItem.Left(1) = "[" and theItem.Right(1) = "]" then // if the item is a bracketed CSV list
		      theSubEx = new PhEd.Vector(theItem, g)
		      if FirstItem then theResult = theSubEx // if this is the first operator, then it is the root operator
		      FillTop(ExprArray, theSubEx) // and put it into an appropriate empty subexpression in the top operator in the stack
		      // But we don't push anything to the expression stack
		    else // we must have a variable
		      if isUnit then
		        theSubEx = new PhEd.UnitSymbol(theItem)
		      else
		        theSubEx = new PhEd.ScalarVariable(theItem)  // create a new variable item
		      end
		      if FirstItem then theResult = theSubEx  // if this is the first operator, then it is the root operator
		      FillTop(ExprArray, theSubEx) // and put it into an appropriate empty subexpression in the top operator in the stack
		      // But we don't push anything to the expression stack
		    end if
		    FirstItem = false // we no longer are looking at the first item
		  loop until Postfix.Ubound < 0 // repeat until the postfix stack is empty
		  // if theResult is nil, then the the top (final) item in the postfix was not a legal kind of operator
		  if theResult = nil then
		     DrawException(g)
		    return new PhEd.ScalarLiteral()
		    //raise new PhEd.ExpressionException("Postfix had an illegal expression type")
		  end if
		  // we should complete the expression with nothing left in the expression array.
		  if ExprArray.Ubound >=0 then  
		    DrawException(g)
		    return new PhEd.ScalarLiteral()
		    //raise new PhEd.ExpressionException("Not all subexpressions filled during creation.")
		  end if
		  return theResult // if we make it to here, we should have a valid result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Text2Postfix(theText as Text, g as Graphics) As Text()
		  // This method takes text in calculator-style format and
		  // returns an array of text tokens in postfix format.
		  // The basic algorithm goes as follows (it uses a stack that holds operators):
		  // (1) Put any operand in the output array in the order that it arrives.
		  // (2) With an operator, so the following
		  //      (a) If the operator stack is empty, or the the top operator on the stack is "(" or a function
		  //           then push the new operator onto the operator stack
		  //      (b) If the new operator is "(" or a function, push it onto the stack
		  //      (c) If the new operator is ")", pop the stack to the output array until you get to "(". Discard the parentheses.
		  //      (d) If the new operator has higher precedence than that on the stack's top, push it onto the stack.
		  //      (e) If the new operator has equal precenced to that on the stack's top, pop the top of the stack
		  //           to the output array and push the new operator. This honors left-to-right prececence.
		  //      (f)  If the new operator has lower precedence than that on the stack's top, pop the top of the stack
		  //            to the output array. Then test the new operator against the the new top of stack and iterate (d)-(f).
		  // (3) When you reach the end, pop and output all remaining operators. There should be no parentheses.
		  
		  theText = theText.Trim  // Trim Unicode whitespace from expression
		  theText = theText.ReplaceAll(" ","")  // trim any interior spaces
		  dim alphabet() as Text
		  alphabet = Array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
		  dim ExpressionCode(-1) as Text // this will be the list of items
		  dim OpStack(-1) as Text // this will be the operator stack
		  dim indx as integer // This points to the character being analyzed
		  dim ExpectingOperand as Boolean = true  // the first item in the expression should be an operand
		  dim theItem as Text // this will hold tokens (numbers, variables, or operators)
		  theText = theText.Trim  // Trim Unicode whitespace from expression
		  theText = theText.ReplaceAll(" ","")  // trim any interior spaces
		  dim CharAtIndex(-1) as text // this will hold the expression as an array of characters
		  CharAtIndex = theText.Split // Split the expression into characters
		  // This is the main loop that looks at the expression character by character
		  while indx <= UBound(CharAtIndex) // while we are still within the expression
		    if ExpectingOperand then // if we are expecting an operand
		      theItem = GetNextToken(CharAtIndex, indx) // Get the next token
		      // after this indx points to the next item to get: either the operator that ended the token
		      // or *after* an opening parenthesis or a negative
		      if theItem.Empty then // if we have no item at all, this is a syntax problem
		        Window1.ExeptionType = 4
		        dim wrongResult(-1) as Text
		        return wrongResult
		        //raise new ExpressionException("Expected an identifier") // so raise an exception
		      elseif theItem = "(" then
		        OpStack.Append "("  // put this on the operator stack
		        // Note that we are still looking for an operand
		      elseif theItem.Right(1) = "{" then // we have the beginning of a unit
		        dim buffer() As Text
		        do 
		          buffer.Append(theItem) // fill a buffer with tokens
		          theItem = GetNextToken(CharAtIndex, indx) // get the next token
		          if theItem.Length = 0 then // must have been a breaking character
		            theItem = CharAtIndex(indx) // manually collect the character and increment the index
		            indx = indx + 1
		          elseif theItem.Right(1) = "}" then // we have reached the end of the tree
		            buffer.Append(theItem.Left(theItem.Length - 1)) // omit the last "}"
		            ExpressionCode.Append(Text.Join(buffer, "")) // put the extracted chunk into the expressioncode
		            expectingOperand = false // we are now looking for an operator
		            exit
		          end
		          // needs error checking
		        loop
		      elseif theItem.Right(1) = "(" then // perhaps this is a function
		        if IsValidFunction(theItem.Left(theItem.Length-1)) then // if it is a valid function, then
		          OpStack.Append theItem.Left(theItem.Length) // put its identifier on the ExpressionCode list, including the "("
		          // Note that we are still looking for an operand
		        else
		          Window1.ExeptionType = 4
		          dim wrongResult(-1) as Text
		          return wrongResult
		          //raise new ExpressionException("Invalid function")
		        end if
		      elseif IsANumber(theItem) then
		        ExpressionCode.Append theItem // put it on the ExpressionCode list
		        ExpectingOperand = false // and we are now looking for an operator
		      elseif theItem = "-" then // it is a leading minus, which effectively is an operator
		        HandlePrecedence("neg", OpStack, ExpressionCode)
		        // and we are still looking for an operand
		      else // it must be an identifier of some kind
		        // might do some checking of valid variable names here
		        if alphabet.IndexOf(theItem) >= 0 then 
		          ExpressionCode.Append theItem // put it on the ExpressionCode list
		          ExpectingOperand = false // and we are now looking for an operator
		        elseif theItem.Left(1) = "[" then 
		          ExpressionCode.Append theItem // we are dealing with a vector, so we append the whole bracketed CSV
		          ExpectingOperand = false
		        else 
		          Window1.ExeptionType = 1
		          dim wrongResult(-1) as Text
		          return wrongResult
		        end if
		      end if
		    else
		      theItem = CharAtIndex(indx)  // Get the operator
		      if IsValidOperator(theItem) then // if the operator is valid
		        HandlePrecedence(theItem, OpStack, ExpressionCode) // Deal with it according to precedence
		        ExpectingOperand = true // after an operator, we expect an operand
		      elseif theItem = ")" then // if it is a right parenthesis, we pop operators back to the last "("
		        do
		          if OpStack.Ubound < 0 then // if the stack is empty, this is an error
		            Window1.ExeptionType = 0
		            dim wrongResult(-1) as Text
		            return wrongResult
		            //raise new ExpressionException("Unbalanced parentheses")
		          else
		            dim TopOp as text = OpStack.Pop // pop top operator
		            if TopOp = "(" then  // we have found a left parenthesis
		              exit  // so we are done popping
		            elseif TopOp.Right(1) = "(" then // if we have found the end of function
		              ExpressionCode.Append TopOp.Left(TopOp.Length-1)  // output the function name
		              exit // and we are done popping
		            else
		              ExpressionCode.Append TopOp  // pop any other operator
		              // and check the next
		            end if
		          end if
		        loop
		        // now we are still expecting an operator
		      else // Getting here is a syntax error: there are no other operators
		        Window1.ExeptionType = 4
		        dim wrongResult(-1) as Text
		        return wrongResult
		        //raise new ExpressionException("Expected an operator")
		      end if // end check for valid operator
		      indx = indx + 1  // point to the next character and go on
		    end if // end expecting operator
		  wend
		  
		  //At the end of the expression, we should be looking for an operand
		  if ExpectingOperand then
		    Window1.ExeptionType = 4
		    dim wrongResult(-1) as Text
		    return wrongResult
		    //raise new ExpressionException("Unexpected end of expression")
		  end if
		  
		  // Now pop all the remaining operators. (We should have no parentheses left.)
		  while OpStack.Ubound >= 0
		    dim StackItem as Text = OpStack.Pop
		    if StackItem = ")" or StackItem = "(" then
		      Window1.ExeptionType = 0
		      dim wrongResult(-1) as Text
		      return wrongResult
		      //raise new ExpressionException("Unbalanced parentheses")
		    else
		      ExpressionCode.Append StackItem
		    end if
		  wend
		  return ExpressionCode
		End Function
	#tag EndMethod


	#tag Constant, Name = kSuperscriptChar, Type = Text, Dynamic = False, Default = \"@", Scope = Public
	#tag EndConstant


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
End Module
#tag EndModule
