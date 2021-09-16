;;; emacs-visual-notifications-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "emacs-visual-notifications" "emacs-visual-notifications.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emacs-visual-notifications.el

(autoload 'emacs-visual-notifications-dismiss-notifications "emacs-visual-notifications" "\
Dismiss notifications" t nil)

(autoload 'emacs-visual-notifications-notify-short "emacs-visual-notifications" "\
Triggers a short notification" nil nil)

(autoload 'emacs-visual-notifications-notify-long "emacs-visual-notifications" "\
Triggers a long notification" nil nil)

(autoload 'emacs-visual-notifications-notify-times "emacs-visual-notifications" "\
Triggers a notification for the specified number of times

\(fn COUNT)" t nil)

(autoload 'emacs-visual-notifications-notify-continuous "emacs-visual-notifications" "\
Triggers a continuous notification until dismissed" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "emacs-visual-notifications" '("emacs-visual-notifications-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; emacs-visual-notifications-autoloads.el ends here
