#lang scheme

(define
  (average x y)
  (/ (+ x y) 2))

(define
  (square number)
  (* number number))

(define
  (abs number)
  (if (< number 0) (- number) number))

(define
  (improveSqrt x y)
  (average  y (/ x y))
)

(define
  (enough x y)
  (< (abs(- (square y) x)) approximation))

(define approximation 0.001)

(define
  (sqrt number)
  (sqrt-iter number 1.0))

(define
  (sqrt-iter x y)
  (if
   (enough x y) y
   (sqrt-iter x (improveSqrt x y))))


(define
  (cbrt number)
  (cbrt-iter number 1.0))

(define
  (cbrt-iter x y)
  (if (cbrt-enough x y) y
      (cbrt-iter x (improve-cbrt x y))))

(define
  (cubic number)
  (* (square number) number))

(define
  (cbrt-enough x y)
  (< (abs(- (cubic y) x)) approximation))

(define
  (improve-cbrt x y)
  (/ (+ (/ x (square y)) (* 2 y)) 3))


(define (round-off z n)
  (let ((power (expt 10 n)))
    (/ (round (* power z)) power)))

(display "Square root is: ")
(sqrt 64)
(display "\nCubic root is: ")
(cbrt 512)

(display "\nWith rounding:")
(display "\nSquare root is: ")
(round-off (sqrt 64) 3)
(display "\nCubic root is: ")
(round-off (cbrt 512) 3)
