#lang scheme

(define
  (square number)
  (* number number)
)

(define
  (sum-squares num1 num2)
  (+ (square num1) (square num2))
)

(define
  (task x y z)
  (cond
    ((<= x y)
     (if (<= x z) (sum-squares y z) (sum-squares x y))
     )
    (else (cond ((<= y z) (sum-squares x z))))) 
  )
(task 10 10 1)