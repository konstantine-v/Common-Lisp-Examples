;;;; Oobjects and Classes
;; CLOS I believe is now in the standard library so no need to get the package

;;; Generic Functions
;;; Example of def generic to define a generic object
(defgeneric draw (shape)
  (:documentation "Draw the shape given."))

;;; Example bank application
;; (defgeneric withdraw (account amount)
;;   (:documentation "Without specified amount"))

;; (defmethod withdraw ((account band-account) amount)
;;   (when (< (balance account) amount)
;;     (error "Overdrawn."))
;;   (decf (balance account) amount))

;;; Classes
;;; Create a class called person and define name and age with default name value
(defclass person ()
  ((name :accessor person-name
         :initform "default-name"
         :initarg :name)
  (age   :accessor person-age
         :initarg :age)))

;; Create that test user
(setq p1 (make-instance 'person :name "test-user" :age 49)) ; Set test-user to pt
;; Now you can access the test user info via the person-name and person-age atrributes
;; (person-name pt) ; => "test-user"
;; (person-age pt)  ; => 49
;; To get info on the object you want to use DESCRIBE
;; (describe p1)

;; Subclasses and Inheritance
;; Creating a subclass of person like worker, teacher, or farmer etc. is simple
(defclass farmer (person)
  ((crops :accessor farmer-crops
          :initarg :crops)
   (id    :accessor farmer-id
          :initarg :id)))
;; Create a subclass of farmer, so Person -> Farmer -> Corn Farmer
(defclass corn-farmer (farmer)
  ((crops :initform "Corn")))

(setq p2 (make-instance 'corn-farmer
                        :name 'John
                        :age 34
                        :id 765950))
;; To access the data for p2 our new corn farmer we can do the deblow
;; (describe p2)
;; (person-name p2)
;; (person-age p2)

;; The best way to think of classes and subclasses used in this way is similar to how
;; in an ORM you create relations between data, this is the same.
;; Classes can also belong to many Superclasses, slasses can have many subclasses.

;; Using something called DEFMETHOD you can perform actions on the classes
;; (defmethod change-crop ((crop farmer) (new-crop-string))
;;   (setf (farmer-crop crop) new-crop))

;;; More examples of how to use methods on classes
(defclass food () ())

(defclass pie (food)
  ((filling :accessor pie-filling :initarg :filling :initform 'apple)))

(defmethod bake ((p pie))
  (print "Baking a pie")
  (setf (pie-filling p) (list 'baked (pie-filling p))))

(defmethod bake :before ((p pie))
  (print "A pie is about to be baked."))

(defmethod bake :after ((p pie))
  (print "A pie has been baked."))

(setq pie-1 (make-instance 'pie :filling 'apple))
;; Bake the pie fairly easy doing the below
;; (bake pie-1)

;; NOTE: SBCL is giving me errors saying that all the setq variables aren't defined,
;; check why that is, it may be that they need to be initialized..
