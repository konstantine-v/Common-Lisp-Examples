;;;; Test for ParenScript + CL-FAD + CL-WHO Environment

(mapc #'ql:quickload
      '(:cl-fad :cl-who :hunchentoot :parenscript))
(defpackage "cl-web"
  (:use "COMMON-LISP" "HUNCHENTOOT" "CL-WHO" "PARENSCRIPT" "CL-FAD"))
(in-package "cl-web")

(setq cl-who:*attribute-quote-char* #\")

;;; Site Info
(defparameter *global-site-title* "Site Title - ")
(defparameter *global-domain-name* "example.com")
(defparameter *global-full-domain*
  (concatenate 'string "https://" *global-domain-name*))

;;; Site Params
(defvar global-charset "utf-8")
(defparameter *global-style-local* t) ;;Sets the global stylesheet

;;; SEO Tags
(defparameter *seo-description* "Some long description")
(defparameter *seo-keywords* "website blog person blah")
;; (defparameter *seo-keywords* '('website 'blog 'person 'blah))
;; (defparameter *seo-keyword-string*
;;   (str (format t "~{~a ~}" *seo-keywords*))) ;TODO Fix this to convert list of keywords

;;; Test Macro for html wrapper
;; (defmacro html (&body body)
;;   "Default wrapper that adds doctype and other HTML parts using WITH-HTML-OUTPUT-STRING"
;;   `(with-html-output-to-string (*standard-output*)
;;      ,@body))

(defmacro html-template (&title title
                         &body body)
  "HTML-TEMPLATE is the wrapper for all page content"
  `(with-html-output-to-string (*standard-output*)
     (:html (str (template-global-header ,@title))
            (:body (str (global-nav))
                   ,@body))))

(defun template-global-header (title)
  "<head> content template both for SEO and device scope"
  (with-html-output-to-string (s)
    (:head (:title (str (concatenate 'string *global-site-title* title)))
           (:meta :charset global-charset)
           (:meta :http-equiv "X-UA-Compatible" :content "IE=edge")
           (:meta :name 'viewport :content "width=device-width, initial-scale=1, viewport-fit=cover")
           (:meta :name 'description :content *seo-description*)
           (:meta :name 'keywords :content *seo-keywords*)
           (:link :rel "stylesheet"
                  :type "text/css"
                  :href (str (if (not *global-style-local*)
                                 "https://cdn.jsdelivr.net/npm/water.css@2/out/dark.css"
                                 "/site.css"))))))

(defun global-nav ()
  "Navbar to navigate to each example"
  (with-html-output-to-string (s)
    (:header :id "header"
             (:nav :class "menu"
                   (:ul
                    (:li (:a :href "/" "Home"))
                    (:li (:a :href "/x1" "Example 1"))
                    (:li (:a :href "/x2" "Example 2"))
                    (:li (:a :href "/x3" "Example 3")))))))

;;;; Routes
(define-easy-handler (home :uri "/") ()
  (with-html-output-to-string (s)
    (:html (str (template-global-header "Homepage"))
           (:body (:main (str (global-nav))
                         (:h1 "Testing CL-WHO and hunchentoot")
                         (:p "Testing out these libraries to create sites with lisp"))))))

(define-easy-handler (example1 :uri "/x1") ()
  (with-html-output-to-string (s)
    (:html (str (template-global-header "Example 1"))
           (:body (str (global-nav))
                  (:h2 "Parenscript tutorial: 1st example")
                  (:p "Please click the link below.")
                  :br
                  (:a :href "#"
                      :onclick (ps (alert "Hello World"))
                      "Hello World")))))

(define-easy-handler (example2 :uri "/x2") ()
  (with-html-output-to-string (s)
    (:html (str (template-global-header "Example 2"))
           (:body (str (global-nav))
                  (:h1 "Example 2")
                  (:p "Some Text Here...")))))

(define-easy-handler (example3 :uri "/x3") ()
  (with-html-output-to-string (s)
    (html-template "Example 3 title"
                   '('something 'here))))

(start (make-instance 'easy-acceptor
                      :port 8081
                      :document-root "./"
                      :error-template-directory "./"))

;; With SSL
;; (start (make-instance 'easy-acceptor
;;                       :name 'ssl
;;                       :port 8080
;;                       :ssl-privatekey-file  #P"/tmp/server.key"
;;                       :ssl-certificate-file #P"/tmp/server.crt"))
