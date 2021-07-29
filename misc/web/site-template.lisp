;;;; Test for ParenScript + CL-FAD + CL-WHO Environment

(mapc #'ql:quickload
      '(:cl-fad :cl-who :hunchentoot :parenscript))
(defpackage "CL-WEB"
  (:use "COMMON-LISP" "HUNCHENTOOT" "CL-WHO" "PARENSCRIPT" "CL-FAD"))
(in-package "cl-web")

(setq cl-who:*attribute-quote-char* #\")

;; Site Info
(defparameter *global-site-title* "Site Title - ")
(defparameter *global-domain-name* "example.com")
(defparameter *global-full-domain*
  (concatenate 'string "https://" *global-domain-name*))

;; Site Params
(defvar global-charset "utf-8")
(defparameter *global-style-local* nil) ;;Sets the global stylesheet

;; SEO Tags
(defparameter *seo-description* "Some long description")
(defparameter *seo-keywords* '('website 'blog 'person 'blah))
(defparameter *seo-keyword-string*
  (str (format t "~{~a ~}" *seo-keywords*))) ;TODO Fix this to convert keywords

;; Test Macro for html wrapper
;; (defmacro html-default (&body body)
;;   `(with-html-output-to-string (*standard-output* nil :prologue t)
;;      ,@body))

;; Example Head content
;; <head>
;;     <meta charset="utf-8">
;;     <title>Example Site</title>
;;     <link rel="canonical" href="https://example.com">
;;     <meta http-equiv="X-UA-Compatible" content="IE=edge">
;;     <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
;;     <link rel="alternate" href="@MaterialFuture" hreflang="en-US">
;;     <meta name="Description" content="Soemthing">
;;     <meta name="keywords" content="keywords">
;; </head>

(defun template-global-header (title)
  (with-html-output-to-string (s)
    (:head (:title (str (concatenate 'string *global-site-title* title)))
           (:meta :charset global-charset)
           (:meta :http-equiv "X-UA-Compatible" :content "IE=edge")
           (:meta :name 'viewport :content "width=device-width, initial-scale=1, viewport-fit=cover")
           (:meta :name 'description :content *seo-description*)
           ;; (:meta :name 'keywords :content *seo-keywords-string*)
           (:link :rel "stylesheet"
                  :type "text/css"
                  :href (str (if (not *global-style-local*)
                                 "https://cdn.jsdelivr.net/npm/water.css@2/out/dark.css"
                                 "/site.css"))))))

;; Routes
;; (define-easy-handler (home :uri "/") ()
;;   (with-html-output-to-string (s)
;;     (:html (str (template-global-header "Homepage"))
;;            (:body (:h1 "Testing CL-WHO and hunchentoot")
;;                   (:p "Testing out these libraries to create sites with lisp sexp")))))

(define-easy-handler (example1 :uri "/x1") ()
  (with-html-output-to-string (s)
    (:html
     (str (template-global-header "Example 1"))
     (:body (:h2 "Parenscript tutorial: 1st example")
            (:p "Please click the link below.")
            :br
            (:a :href "#"
                :onclick (ps (alert "Hello World"))
                "Hello World")))))

(define-easy-handler (example2 :uri "/x2") ()
  (with-html-output-to-string (s)
    (:html (str (template-global-header "Example 2"))
           (:body (:h1 "Example 2")
                  (:p "Some Text Here...")))))

(start (make-instance 'easy-acceptor :port 8080))
