(define ftype-set-array
  (lambda (dst src n)
    (for-each
      (lambda (srcv)
  )
)

(define f
  (lambda (x y)
    (define-ftype
      Ret
      (struct
        [a int]
        [b int]
        [c (array 2 int)]
      )
    )
    (let
      ([ptr (make-ftype-pointer Ret (foreign-alloc (ftype-sizeof Ret)))])
      (ftype-set! Ret (a) ptr x)
      (ftype-set! Ret (b) ptr y)
      (ftype-set! Ret (c) ptr (array 1 2))
      (ftype-pointer-address ptr)
    )
  )
)

; (define-ftype A (struct [a int] [b int]))
(show (f 10 11))
