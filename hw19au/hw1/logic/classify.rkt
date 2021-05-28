#lang rosette

(require rosette/lib/synthax)

(provide (all-defined-out))

; Takes as input a propositional formula and returns
; * 'TAUTOLOGY if every interpretation I satisfies F;
; * 'CONTRADICTION if no interpretation I satisfies F;
; * 'CONTINGENCY if there are two interpretations I and I′ such that I satisfies F and I' does not.

(define (classify F)
  (cond
    [(unsat? (verify (assert F))) 'TAUTOLOGY] ; unsat: tautology
    [(model (verify (assert F))) 'CONTRADICTION] ; empty model: contradiction
    [else 'CONTINGENCY])) ; else contingency

(define-symbolic* p q r boolean?)

; (p → (q → r)) → (¬r → (¬q → ¬p))
(define f0 (=> (=> p (=> q r)) (=> (! r) (=> (! q) (! p)))))

; (p ∧ q) → (p → q)
(define f1 (=> (&& p q) (=> p q)))

; (p ↔ q) ∧ (q → r) ∧ ¬(¬r → ¬p)
(define f2 (&& (<=> p q) (=> q r) (! (=> (! r) (! q)))))

(define f3 (or p (! p)))

(print (classify f0)) ; 'CONTINGENCY
(print (classify f1)) ; 'TAUTOLOGY
(print (classify f2)) ; 'CONTRADICTION
(print (classify f3)) ; 'TAUTOLOGY
