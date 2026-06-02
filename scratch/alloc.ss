(define my-alloc
  (lambda (name ty)
    (define-ftype name ty)
    (foreign-alloc (ftype-sizeof name))
  )
)


(display (my-alloc "abc" (struct [a int] [b int])))
