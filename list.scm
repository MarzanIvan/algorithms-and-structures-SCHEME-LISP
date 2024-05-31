#lang scheme

(define (last-pair lst)
  (if (null? (cdr lst))
      lst
      (last-pair (cdr lst))))

(define (last-pair-ref lst)
(cond ((null? lst) lst)
      ((null? (cdr lst)) (car lst))
      (else
       (last-pair-ref(cdr lst)))))
  


#|(last-pair-ref (list ))|#
#|(last-pair (list 1 2 3 4 5))|#

(define (reverse lst)
  (define (iter-lst ListToReverse ListToStore)
    (if (null? ListToReverse)
        ListToStore
        (iter-lst (cdr ListToReverse)
              (cons (car ListToReverse) ListToStore))))
  (iter-lst lst '()))

#|(reverse (list 1 2 3 4))|#

(define (deep-reverselib x)
  (if (pair? x)
      (map deep-reverselib (reverse x))
      x))


(define (deep-reverse lst)
  (define (iter-reverse ListToReverse ListToStore)
    (if (null? ListToReverse)
        ListToStore
        (let ((item (car ListToReverse)))
          (iter-reverse (cdr ListToReverse)
               (if (list? item)
                   (cons (deep-reverse item) ListToStore)
                   (cons item ListToStore))))))
  (iter-reverse lst '()))

#|map (lambda (x) argument)|#

#|(deep-reverse '((1 2) (3 5)))|#
#|(deep-reverselib '((10 20) (30 40) 50))|#

(define (fringe tree)
  (cond ((null? tree) '())
        ((not (pair? tree))
         (list tree))
         (else (append (fringe (car tree))
                       (fringe (cdr tree))))))

#|(define x '((1 2) (3 4)))
(fringe x)
(fringe (list x x))
(fringe '((((5) 2) ((3 2) 9))))|#
