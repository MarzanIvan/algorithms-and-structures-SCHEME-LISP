#lang scheme

(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))


#|(define myinterval (make-interval 0 10))
(lower-bound myinterval)
(upper-bound myinterval)|#


(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

#|(sub-interval (make-interval 100 175) (make-interval 0 65))|#

(define (mul-interval x y)
  (let ((x1 (lower-bound x))
        (x2 (upper-bound x))
        (y1 (lower-bound y))
        (y2 (upper-bound y)))
    (cond ((> x1 0)
           (cond ((> y1 0) (make-interval (* x1 y1) (* x2 y2)))
                 ((< y2 0) (make-interval (* x2 y1) (* x1 y2)))
                 (else (make-interval (* x2 y1) (* x2 y2)))))
          ((< x2 0)
           (cond ((> y1 0) (make-interval (* x1 y2) (* x2 y1)))
                 ((< y2 0) (make-interval (* x2 y2) (x1 y1)))
                 (else (make-interval (* x1 y2) (* x1 y1)))))
          (else
           (cond ((> y1 0) (make-interval (* x1 y2) (* x2 y2)))
                 ((< y2 0) (make-interval (* x2 y1) (* x1 y1)))
                 (else (make-interval (min (* x1 y2) (x2 y1))
                                      (max (* x1 y1) (x2 y2)))))))))


(define (div-interval x y)
  (let ((y1 (lower-bound y))
        (y2 (upper-bound y)))
    (if (<= y1 0 y2)
        (display  "can't divide by an interval spanning zero")
        (mul-interval x (make-interval (/ y2) (/ y1))))))
 #|
(div-interval (make-interval 1 2) (make-interval 3 4))
(div-interval (make-interval 1 2) (make-interval -1 1)) |#

(define
  (average x y)
  (/ (+ x y) 2))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center x)
  (average (lower-bound x) (upper-bound x)))
(define (width x)
  (/ (- (upper-bound x) (lower-bound x)) 2))
 
(define (make-center-percent c p)
  (make-center-width c (* c (/ p 100))))
(define (percent x)
  (* 100 (/ (width x) (center x))))
 #|
(define x (make-center-percent 100 10))
(width x) => 1
(center x) => 10
(percent x) => 10
|#

