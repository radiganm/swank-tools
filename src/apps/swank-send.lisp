;; swank-send.lisp
;; Copyright 2016 Mac Radigan
;; All Rights Reserved

  (require 'asdf)
  (asdf:operate 'asdf:load-op 'swank-client)
; (ql:quickload :swank-client)

  (sb-ext:restrict-compiler-policy 'debug)

  (defun swank-client () 
    (defvar *myswank* (swank-client:slime-connect "127.0.0.1" 4005))
    (loop 
      (let ((line (read)))
        (cond 
          ( (not (equalp line "(hup)"))
            (unwind-protect (restart-case (progn
              (let ( (result (swank-client:slime-eval line *myswank*)) )
                (progn
                  (format *error-output* "~a~%" result)
                  (finish-output *error-output*)
                )
              )
            ))) ; protect
          ) ; "hup"
          (t 
            (progn
              (format *error-output* "~a~%" "exiting")
              (finish-output *error-output*)
              (sb-ext:quit)
            ) ; progn
          ) ; t
        ) ; if
      ) ; let
    ) ; loop
  ) ; repl

  (defun main () 
    (swank-client)
  )

;; *EOF*
