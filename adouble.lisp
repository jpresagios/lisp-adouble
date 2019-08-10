(defpackage :simple-adouble
  (:use :cl-user :cl))

(in-package :simple-adouble)

;;;{{{ Shadow the symbols
(shadow '/)
(shadow '*)
(shadow '-)
(shadow '+)
;;;}}}


;;;{{{ Added adouble class
(defclass adouble ()
  ((value :accessor value :initarg :value)
   (dot :accessor dot :initarg :dot)))
;;;}}}
