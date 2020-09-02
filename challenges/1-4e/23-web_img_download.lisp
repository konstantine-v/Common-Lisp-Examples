;; Web Page Image Downloader
;; Requires (ql:quickload '(:dexador :plump :lquery))

(defun webget (url)
  (let* ((request (dex:get url)))
    (lquery:$
      (lquery:$ (initialize request))
      "img"
      (attr :src))))

;; Use with (webget "https://some.site/")
;; Parses the html, traverses to find img tags, and returns a list with all the :src urls
;; This could be further extended by
