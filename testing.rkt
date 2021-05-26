#lang rosette

(boolean? #t)

(boolean? #f)

(define testval #t)

(boolean? testval)

(define p0 #f)
(define p1 #t)


(define-symbolic p boolean?)
(verify (solve (assert (or p (! p)))))

