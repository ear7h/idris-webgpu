#!/nix/store/6rj0vn4nmlbxz9x91ly6mwvbzipjmhph-chez-scheme-10.3.0/bin/scheme --program

(import (chezscheme))
(load-shared-object "libc.dylib")
(define readlink (foreign-procedure "readlink" (utf-8 string size_t) ssize_t))
(define dirname (foreign-procedure "dirname" (utf-8) utf-8))
(let
	(
		; [path (string-append (list-ref (command-line) 0) "/_tmpchez_app")]
		; TODO: clone this bc dirname will modify it
		[path (list-ref (command-line) 0)]
		[dst (make-string 1024)]
	)
	; (let ( [dstn (readlink path dst 100)])
	;	(display (dirname (substring dst 0 dstn)))
	; )
	(display (dirname path))
)

