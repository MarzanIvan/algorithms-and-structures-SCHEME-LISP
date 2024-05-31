#lang scheme

(define
  (fib n)
  (define
    (fib-iter a b count)
    (define
      (show-iteration a b count)
      (display count)
      (display "-th iteration, fib number is: ")
      (display a)
      (display "\n")
      (fib-iter (+ a b) a (+ count 1)))
    (if (= count n) b
        (show-iteration a b count)))
  (fib-iter 0 1 0))

(define
  (recur-func x)
  (if (< x 3) x
      (+ (recur-func(- x 1)) (* 2 (recur-func(- x 2))) (* 3 (recur-func(- x 3))))))
(display "")
(recur-func 10)

(define
  (func n)
  (define
    (func-iter a b c count)
    (define
      (show-iteration a b c count)
      (display count)
      (display "-th iteration, fib number is: ")
      (display a)
      (display "\n")
      (func-iter (+ a (* 2 b) (* 3 c)) a b (+ count 1)))
    (if (= count (- n 1)) b
        (show-iteration a b c count)))
  (func-iter 2 1 0 0))


(func 10)