#lang rosette

(require rosette/lib/synthax)

(provide (all-defined-out))

; Takes as input a propositional formula and returns
; * 'TAUTOLOGY if every interpretation I satisfies F;
; * 'CONTRADICTION if no interpretation I satisfies F;
; * 'CONTINGENCY if there are two interpretations I and I′ such that I satisfies F and I' does not.
(define (classify F)
  (error 'classify "not implemented yet!"))

(define-symbolic* p q r boolean?)

; (p → (q → r)) → (¬r → (¬q → ¬p))
(define f0 (=> (=> p (=> q r)) (=> (! r) (=> (! q) (! p)))))
(print (solve f0))

; (p ∧ q) → (p → q)
(define f1 (=> (&& p q) (=> p q)))

; (p ↔ q) ∧ (q → r) ∧ ¬(¬r → ¬p)
(define f2 (&& (<=> p q) (=> q r) (! (=> (! r) (! q)))))

(define f3 (or p (! p)))

(define (tautology F) (verify (assert (or F (! F)))))
(print (tautology f0)) ; F
(print (tautology f1)) ; T
(print (tautology f2)) ; F
(print (tautology f3)) ; T

(define (contradiction F) (solve (assert (and F (! F)))))
(print (contradiction f0)) ; F
(print (contradiction f1)) ; F
(print (contradiction f2)) ; T
(print (contradiction f3)) ; F
