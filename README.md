# rosette-123-kylann

I have never used Racket or Rosette before, so I'm just going to try my best to
learn something about those in this assignment. I don't have high experctations
for how far I'll get, but we'll see how it goes!

I spent the first ~30 minutes figuring out how to use racket, and just getting some basics down.

I spent the next ~30 minutes messing with rosette things and trying to read the docs, didn't accomplish much.

I spent the next hour trying to test the code that we did in class for
tautology and making truth tables to check my solutions. Unfortunately, my
tautology code always returns unsat but I am sure the equations are not all
tautologies (based on the truth tables). Tried to debug, didn't get much.

I spent the last hour and a half figuring out how to write the final function.
I figured out the mechanism for checking each case, tried to use a case
statement and other strategies. I eventually found cond worked better, but I
was never able to figure out how to check if something was an empty model which
I needed to tell the difference between the contingency and contradiction
options.

# My Code
My code can be found in [testing.rkt] and [./hw19au/hw1/logic/classify.rkt]
