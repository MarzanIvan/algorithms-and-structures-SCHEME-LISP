#lang scheme

(define (make-accumulator amount)
  (lambda (increment)
    (set! amount (+ amount increment))
    amount))
#|
(define A (make-accumulator 5))
(A 10)
(A 65)|#