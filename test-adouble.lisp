(in-package simple-adouble)

(defun test-adouble (f n)
  (let* ((x (make-instance 'adouble
			   :value n
			   :dot 1))
         (result 0))
         (setf result (apply f (list x)))
	 (list (value result) (dot result))))



;;; f = x + x
(test-adouble (lambda (x) (+ x x)) 5)


;;; f = x * x
(test-adouble (lambda (x) (* x x)) 5)


;;; f = x*x + x*x
(test-adouble (lambda (x) (+ (+ x x) (* x x))) 5)



