#lang scheme

(define (accumulate op initial xs)
  (if (null? xs)
      initial
      (op (car xs)
          (accumulate op initial (cdr xs)))))


(define (element-of-set? x set)
  (and (not (null? set))
       (or (equal? x (car set))
           (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (union-set set1 set2)
  (accumulate adjoin-set set2 set1))

#|
(union-set '() '(1 2 3))
(union-set '(1 2 3) '()) 
(union-set '(1 2) '(2 3))|#


(define (ordered-adjoin-set x set)
  (cond ((null? set) (list x))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (ordered-adjoin-set x (cdr set))))))

#|(ordered-adjoin-set 2 '(1)) 
(ordered-adjoin-set 2 '(1 3))|#