;; swank-server.lisp
;; Copyright 2016 Mac Radigan
;; All Rights Reserved

  (require 'asdf)
 ;(asdf:operate 'asdf:load-op 'swank-client)
; (ql:quickload :swank-client)
  (asdf:load-system :swank-client)
  (asdf:oos 'asdf:load-op 'unix-options)
  (use-package 'unix-options)
  (use-package :sb-thread)

  (setf swank::*swank-debug-p* nil)

  (defun swank-server (port) 
    (swank-loader:init)
    (swank:create-server :port port :dont-close t)
  )

  (defun repl () 
    (format *error-output* "~a" ">< ")
    (finish-output *error-output*)
    (loop (let ( (result (eval (read))) ) 
      (format *error-output* "~a~%>< " result)
      (finish-output *error-output*)
    ))
  )

  (defun main () 
     (make-thread 'swank-server :arguments '4005)
     (repl)
  )

;; *EOF*
