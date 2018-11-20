;; Initialize the emacs packaging system
(package-initialize)

;; Bootstrap quelpa
(if (require 'quelpa nil t)
    (quelpa-self-upgrade)
  (with-temp-buffer
    (url-insert-file-contents
     "https://framagit.org/steckerhalter/quelpa/raw/master/bootstrap.el")
    (eval-buffer)))

;; Make Quelpa prefer MELPA-stable over melpa. This is optional but
;; highly recommended.
;;
;; (setq quelpa-stable-p t)

;; Install quelpa-use-package, which will install use-package as well
(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://framagit.org/steckerhalter/quelpa-use-package.git"
   :stable nil))
(require 'quelpa-use-package)

;;; How to use this config:
;;
;; This will only go over how to use Quelpa and use-package together.
;; I recommend reading the use-package documentation at
;; https://github.com/jwiegley/use-package at a minimum, as it
;; provides an excellent and easy to understand way to structure your
;; config. If you want more control over package installation, you can
;; also check out the Quelpa documentation at
;; https://github.com/quelpa/quelpa
;;
;; To install a package from MELPA, add a use-package form to your
;; config. For example, if you want to install "fsbot-data-browser"
;; from MELPA, you would add this line:
;;
;; (use-package fsbot-data-browser :quelpa)
;;
;; If you used the (setq quelpa-stable-p t) line above, then packages
;; without a stable version will fail to install. (You can check by
;; searching for the package at https://stable.MELPA.org) For example,
;; the "gruvbox-theme" package has no stable version. You can install
;; packages like these with a line like the following:
;;
;; (use-package gruvbox-theme :quelpa (:stable nil))
;;
;; You can actually pass any of the Quelpa options in that form. For
;; example, to install something like ac-php that isn't on MELPA at
;; all, you could add a line like this:
;;
;; (use-package ac-php :quelpa
;;   (:stable nil :fetcher github :repo "xcwen/ac-php"
;;    :files ("ac-php.el" "company-php.el")))

;; That's all! I hope this example was helpful to you.
