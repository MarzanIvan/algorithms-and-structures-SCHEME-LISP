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
  (func n)
  (define
    (func-iter a b c count)
    (define
      (show-iteration a b c count)
      (display count)
      (display "-th iteration, fib number is: ")
      (display a)
      (display "\n")
      (func-iter (+ a b c) a b (+ count 1)))
    (if (= count n) c
        (show-iteration a b c count)))
  (func-iter 0 1 2 0))


(func 10)