#lang scheme

(define
  (square number)
  (* number number))  

(define
  (power-info number PowerToRaise)
  (define (power-iter-info N base ProductAccumulator iteration)
      (display iteration)
      (display "-th iteration, base: ")
      (display base)
      (display "\nproduct accumulator: ")
      (display ProductAccumulator)
      (display "\n")
      (cond ((= 0 N) ProductAccumulator)
          ((even? N) (power-iter-info (/ N 2) (square base) ProductAccumulator (+ 1 iteration)))
          (else (power-iter-info (- N 1) base (* base ProductAccumulator) (+ 1 iteration)))))
    
  (power-iter-info PowerToRaise number 1 0))


(define
  (power number PowerToRaise)
  (define (power-iter N base ProductAccumulator)
    (cond ((= 0 N) ProductAccumulator)
          ((even? N) (power-iter (/ N 2) (square base) ProductAccumulator))
          (else (power-iter (- N 1) base (* base ProductAccumulator)))))
  (power-iter PowerToRaise number 1))


(power 10 6)
(display "\n")
(power 5 14)
(display "\n")

(display "more visually\n")
(power 10 6)
(display "\n")
(power-info 10 6)
(display "\n")
(power 5 14)
(display "\n")
(display "\n")
(power-info 5 14)

