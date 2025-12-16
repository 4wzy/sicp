Why might it be advantageous for an interpreter to treat or as a special form and evaluate its arguments one at a time?

> Short-circuiting is more efficient.  
As soon as we encounter an false argument, we know the answer that we need to return to "or".  
There should be no need to evaluate the rest of the arguments, and this would take extra time and processing power.

Can you think of reasons why it might be advantageous to treat or as an ordinary function?

> Simpler Semantics - the language rules are smaller, making the language easier to implement.