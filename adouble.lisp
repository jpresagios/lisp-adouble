(defpackage :simple-adouble
  (:use :cl-user :cl))

(in-package :simple-adouble)

;;;{{{ Shadow the symbols
(shadow '/)
(shadow '*)
(shadow '-)
(shadow '+)
;;;}}}