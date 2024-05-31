#lang scheme


(define (equal? left right)
  (cond ((null? left) (null? right))
        ((not (pair? left)) (eq? left right))
        (else (and (pair? right)
                   (equal? (car left) (car right))
                   (equal? (cdr left) (cdr right))))))


#|
(equal? '(this is a list) '(this is a list)) 
(equal? '(this (is a) list) '(this (is a) list))
(equal? '(this is a list) '(this (is a) list))|#