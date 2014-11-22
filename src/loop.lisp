(in-package :eazy-project)

(cl-syntax:use-syntax :annot)


@export
(define-symbol-macro ! (launch-menu))


;; note that ep-menu should be defined before compiling this file



@export
(defun launch-menu ()
  "launch the menu."
  (restart-case
      (invoke-menu 'ep-main)
    (:quit-menu ()
      :report "Quit this eazy-project menu."
      )))


@export
(defun quit-menu ()
  (invoke-restart (find-restart :quit-menu)))

