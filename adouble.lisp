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


;;;{{{ Overload operator +
(defmethod + ((x adouble) (y adouble))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) (+ (value x) (value y)))
    (setf (dot r) (+ (dot x) (dot y)))
    r))

(defmethod + ((x adouble) (y integer))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) y)
    (setf (dot r) 0)
    (+ x r)))

(defmethod + ((x adouble) (y float))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) y)
    (setf (dot r) 0)
    (+ x r)))

(defmethod + ((x integer) (y adouble))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) x)
    (setf (dot r) 0)
    (+ r y)))

(defmethod + ((x float) (y adouble))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) x)
    (setf (dot r) 0)
    (+ r y)))
;;;}}}


;;;{{{ Overload operator -
(defmethod - ((x adouble) (y adouble))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) (- (value x) (value y)))
    (setf (dot r) (- (dot x) (dot y)))
    r))

(defmethod - ((x adouble) (y integer))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) y)
    (setf (dot r) 0)
    (- x r)))

(defmethod - ((x adouble) (y float))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) y)
    (setf (dot r) 0)
    (- x r)))

(defmethod - ((x integer) (y adouble))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) x)
    (setf (dot r) 0)
    (- r y)))

(defmethod - ((x float) (y adouble))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) x)
    (setf (dot r) 0)
    (- r y)))
;;;}}}


;;;{{{ Overload operator *
(defmethod * ((x adouble) (y adouble))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) (* (value x) (value y)))
    (setf (dot r) (+ (* (dot x) (value y)) (* (value x) (dot y))))
    r))

(defmethod * ((x adouble) (y integer))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) y)
    (setf (dot r) 0)
    (* x r)))

(defmethod * ((x adouble) (y float))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) y)
    (setf (dot r) 0)
    (* x r)))

(defmethod * ((x integer) (y adouble))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) x)
    (setf (dot r) 0)
    (* r y)))

(defmethod * ((x float) (y adouble))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) x)
    (setf (dot r) 0)
    (* r y)))
;;;}}}


;;;{{{ Overload operator /
(defmethod / ((x adouble) (y adouble))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) (/ (value x) (value y)))
    (setf (dot r) (/ (- (* (dot x) (value y)) (* (value x) (dot y))) (* (value y) (value y))))
    r))

(defmethod / ((x adouble) (y integer))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) y)
    (setf (dot r) 0)
    (/ x r)))

(defmethod / ((x adouble) (y float))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) y)
    (setf (dot r) 0)
    (/ x r)))

(defmethod / ((x integer) (y adouble))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) x)
    (setf (dot r) 0)
    (/ r y)))

(defmethod / ((x float) (y adouble))
  (let* (r)
    
    (setf r (make-instance 'adouble))
    (setf (value r) x)
    (setf (dot r) 0)
    (/ r y)))
;;;}}}
