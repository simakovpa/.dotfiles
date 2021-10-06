;; MELPA add repositories
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
  
(package-initialize)
(unless package-archive-contents
    (package-refresh-contents))

;; Initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package)
        (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(message "Репозитории melpa и org включены")

;; Inhibit startup/splash screen
(setq inhibit-splash-screen   't)
(setq ingibit-startup-message 't) ;; экран приветствия можно вызвать комбинацией C-h C-a
(setq redisplay-dont-pause 't)  ;; лучшая отрисовка буфера
(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал
(message "Выключение стартового экрана отработало")

;; ESC клавиша для отмены текущего ввода в минибуфере внизу
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(message "ESC клавиша для отмены ввода - включено")

;; swiper
(use-package swiper)

;; IVY для улучшения интерфейса поиска в минибуфере
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
   :config
         (ivy-mode 1))
(message "Ivy загружен")
;; IVY rich (улучшенный формат вывода ivy)
(use-package ivy-rich
    :after ivy
    :init
    (ivy-rich-mode 1)
    :config
    (message "Ivy-rich загружен"))

;; doom-modeline settings
(use-package doom-modeline
    :ensure t
    :init (doom-modeline-mode 1)
    :custom ((doom-modeline-height 15))
    :hook (window-setup . doom-modeline-mode))
    :config
        (message "Doom modeline загружен")

;; Display file size/time in mode-line
(setq display-time-24hr-format 't) ;; 24-часовой временной формат в mode-line
(display-time-mode             't) ;; показывать часы в mode-line
(size-indication-mode          't) ;; размер файла в %-ах

;; Display the name of the current buffer in the title bar
(setq frame-title-format "GNU Emacs: %b")

;; Delete selection
(delete-selection-mode 't)

;; Coding-system settings
(set-language-environment 'UTF-8)
;;(progn
;;    (prefer-coding-system                   'windows-1251)
;;    (set-terminal-coding-system             'windows-1251)
;;    (set-keyboard-coding-system        'windows-1251-unix)
;;    (set-selection-coding-system            'windows-1251)
;;    (setq file-name-coding-system           'windows-1251)
;;    (setq-default coding-system-for-read    'windows-1251)
;;    (setq default-buffer-file-coding-system 'windows-1251))

(custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
'(custom-enabled-themes '(misterioso))
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-doi ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m))
 '(org-roam-ui-mode t)
 '(package-selected-packages
   '(emacsql-sqlite3 org-roam swiper alert doom-modeline quelpa-use-package flycheck-tip flycheck-pycheckers flycheck evil-nerd-commenter lsp-ivy lsp-treemacs lsp-ui company which-key lsp-mode pdf-tools org-superstar use-package deft jedi simple-httpd websocket pandoc-mode python-mode pomidor org-books reverse-im org-roam-server telega vbasense org emacs-visual-notifications)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
  (message "Кастомные переменные установлены")

(setq backup-directory-alist `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory))))
(message "Бэкапы рядом с рабочими файлами отключены")

;; ===============================================================
;; New agenda setup start
;; ===============================================================
(setq org-agenda-files (quote ("~/Dropbox/emacsOrgFiles")))
(set 'org-habit-show-all-today t)
(message "Путь к файлам для Агенды и привычки - подключены")

;; Custom Key Bindings
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "<f5>") 'bh/org-todo)
(global-set-key (kbd "<S-f5>") 'bh/widen)
(global-set-key (kbd "<f7>") 'bh/set-truncate-lines)
(global-set-key (kbd "<f8>") 'org-cycle-agenda-files)
(global-set-key (kbd "<f9> <f9>") 'bh/show-org-agenda)
(global-set-key (kbd "<f9> b") 'bbdb)
(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> f") 'boxquote-insert-file)
(global-set-key (kbd "<f9> g") 'gnus)
(global-set-key (kbd "<f9> h") 'bh/hide-other)
(global-set-key (kbd "<f9> n") 'bh/toggle-next-task-display)

(global-set-key (kbd "<f9> I") 'bh/punch-in)
(global-set-key (kbd "<f9> O") 'bh/punch-out)

(global-set-key (kbd "<f9> o") 'bh/make-org-scratch)

(global-set-key (kbd "<f9> r") 'boxquote-region)
(global-set-key (kbd "<f9> s") 'bh/switch-to-scratch)

(global-set-key (kbd "<f9> t") 'bh/insert-inactive-timestamp)
(global-set-key (kbd "<f9> T") 'bh/toggle-insert-inactive-timestamp)

(global-set-key (kbd "<f9> v") 'visible-mode)
(global-set-key (kbd "<f9> l") 'org-toggle-link-display)
(global-set-key (kbd "<f9> SPC") 'bh/clock-in-last-task)
(global-set-key (kbd "C-<f9>") 'previous-buffer)
(global-set-key (kbd "M-<f9>") 'org-toggle-inline-images)
(global-set-key (kbd "C-x n r") 'narrow-to-region)
(global-set-key (kbd "C-<f10>") 'next-buffer)
(global-set-key (kbd "<f11>") 'org-clock-goto)
(global-set-key (kbd "C-<f11>") 'org-clock-in)
(global-set-key (kbd "C-s-<f12>") 'bh/save-then-publish)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(message "Agenda keybindings загружены")

;; Markdown config

(use-package markdown-mode
  ;;:straight t
  :mode "\\.md\\'"
  :config
  (setq markdown-command "marked")
  (defun dw/set-markdown-header-font-sizes ()
    (dolist (face '((markdown-header-face-1 . 1.2)
                    (markdown-header-face-2 . 1.1)
                    (markdown-header-face-3 . 1.0)
                    (markdown-header-face-4 . 1.0)
                    (markdown-header-face-5 . 1.0)))
      (set-face-attribute (car face) nil :weight 'normal :height (cdr face))))

  (defun dw/markdown-mode-hook ()
    (dw/set-markdown-header-font-sizes))

  (add-hook 'markdown-mode-hook 'dw/markdown-mode-hook))
  (message "Поддержка markdown - включена")

;; YAML support
(use-package yaml-mode
  :mode "\\.ya?ml\\'")
  :config
  (message "Поддержка YAML - включена")

;; Org-mode косметические настройки
(setq org-ellipsis " ▾"
      org-hide-emphasis-markers t)

;; Nice bullets
(use-package org-superstar
    :after org
    :config
    (setq org-superstar-special-todo-items t)
    (add-hook 'org-mode-hook (lambda ()
                                 (org-superstar-mode 1)))
    :custom
    (org-superstar-remove-leading-stars nil)
    (org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))

;; Line wrapping
(setq word-wrap          t) ;; переносить по словам
(global-visual-line-mode t)

;; Org-mode todo custom
(add-to-list 'load-path (expand-file-name "~/git/org-mode/lisp"))
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
;;(require 'org)

(setq org-log-done 't)
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))
(setq org-directory "~/Dropbox/emacsOrgFiles")
(setq org-default-notes-file "~/Dropbox/emacsOrgFiles/refile.org")
(message "Задачи. Кастомные статусы - настроены")

;; I use C-c c to start capture mode
(global-set-key (kbd "C-c c") 'org-capture)

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Dropbox/emacsOrgFiles/refile.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("r" "respond" entry (file "~/Dropbox/emacsOrgFiles/refile.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/Dropbox/emacsOrgFiles/refile.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "~/Dropbox/emacsOrgFiles/diary.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file "~/Dropbox/emacsOrgFiles/refile.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/Dropbox/emacsOrgFiles/refile.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("p" "Phone call" entry (file "~/Dropbox/emacsOrgFiles/refile.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file "~/Dropbox/emacsOrgFiles/refile.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))
(message "Захват задач С-с с - настроен")

;; Remove empty LOGBOOK drawers on clock out
(defun bh/remove-empty-drawer-on-clock-out ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "LOGBOOK" (point))))

(add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)
(message "Пустые логбуки будут удаляться из задач")

;; Mark archived tasks
  (setq org-archive-mark-done nil)
  (setq org-archive-location "%s_archive::* Archived Tasks")
  
  (defun bh/skip-non-archivable-tasks ()
    "Skip trees that are not available for archiving"
    (save-restriction
      (widen)
      ;; Consider only tasks with done todo headings as archivable candidates
      (let ((next-headline (save-excursion (or (outline-next-heading) (point-max))))
            (subtree-end (save-excursion (org-end-of-subtree t))))
        (if (member (org-get-todo-state) org-todo-keywords-1)
            (if (member (org-get-todo-state) org-done-keywords)
                (let* ((daynr (string-to-number (format-time-string "%d" (current-time))))
                       (a-month-ago (* 60 60 24 (+ daynr 1)))
                       (last-month (format-time-string "%Y-%m-" (time-subtract (current-time) (seconds-to-time a-month-ago))))
                       (this-month (format-time-string "%Y-%m-" (current-time)))
                       (subtree-is-current (save-excursion
                                             (forward-line 1)
                                             (and (< (point) subtree-end)
                                                  (re-search-forward (concat last-month "\\|" this-month) subtree-end t)))))
                  (if subtree-is-current
                      subtree-end ; Has a date in this month or last month, skip it
                    nil))  ; available to archive
              (or subtree-end (point-max)))
            next-headline))))
(message "Пометка задач на архивацию через месяц после завершения включена")

;; agenda calendar/diary integration
(setq org-agenda-include-diary t)

;; ----------------------------------------------------
;; new agenda custom views
;; ----------------------------------------------------

(defun org-agenda-show-agenda-and-todo (&optional arg)
  (interactive "P")
  (org-agenda arg "n"))

;; Не затенять заблокированные задачи
(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block agenda view
(setq org-agenda-compact-blocks t)

;; Custom agenda command definitions
(setq org-agenda-custom-commands
      (quote (("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t)))
              ("h" "Habits" tags-todo "STYLE=\"habit\""
               ((org-agenda-overriding-header "Habits")
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              (" " "Agenda"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "Задачи на рефайлинг")
                       (org-tags-match-list-sublevels nil)))
                (tags-todo "-CANCELLED/!"
                           ((org-agenda-overriding-header "Застрявшие проекты")
                            (org-agenda-skip-function 'bh/skip-non-stuck-projects)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-HOLD-CANCELLED/!"
                           ((org-agenda-overriding-header "Проекты")
                            (org-agenda-skip-function 'bh/skip-non-projects)
                            (org-tags-match-list-sublevels 'indented)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED/!NEXT"
                           ((org-agenda-overriding-header (concat "Проектные Next задачи"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
                            (org-tags-match-list-sublevels t)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(todo-state-down effort-up category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                           ((org-agenda-overriding-header (concat "Проектные подзадачи"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-non-project-tasks)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                           ((org-agenda-overriding-header (concat "Отдельностоящие задачи"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-project-tasks)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED+WAITING|HOLD/!"
                           ((org-agenda-overriding-header (concat "Задачи статус: Waiting and Postponed"
                                                                  (if bh/hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-non-tasks)
                            (org-tags-match-list-sublevels nil)
                            (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)))
                (tags "-REFILE/"
                      ((org-agenda-overriding-header "Задачи, ожидающие архивацию")
                       (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                       (org-tags-match-list-sublevels nil))))
               nil))))

(setq org-agenda-span 'day)
(setq org-stuck-projects (quote ("" nil nil "")))
;; Элементы режима журнала повестки дня для отображения (по умолчанию закрыты и состояние изменяется)
(setq org-agenda-log-mode-items (quote (closed state)))

(defun bh/is-project-p ()
  "Any task with a todo keyword subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task has-subtask))))

(defun bh/is-project-subtree-p ()
  "Any task with a todo keyword that is in a project subtree.
Callers of this function already widen the buffer view."
  (let ((task (save-excursion (org-back-to-heading 'invisible-ok)
                              (point))))
    (save-excursion
      (bh/find-project-task)
      (if (equal (point) task)
          nil
        t))))

(defun bh/is-task-p ()
  "Any task with a todo keyword and no subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task (not has-subtask)))))

(defun bh/is-subproject-p ()
  "Any task which is a subtask of another project"
  (let ((is-subproject)
        (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
    (save-excursion
      (while (and (not is-subproject) (org-up-heading-safe))
        (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
          (setq is-subproject t))))
    (and is-a-task is-subproject)))

(defun bh/list-sublevels-for-projects-indented ()
  "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
  This is normally used by skipping functions where this variable is already local to the agenda."
  (if (marker-buffer org-agenda-restrict-begin)
      (setq org-tags-match-list-sublevels 'indented)
    (setq org-tags-match-list-sublevels nil))
  nil)

(defun bh/list-sublevels-for-projects ()
  "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
  This is normally used by skipping functions where this variable is already local to the agenda."
  (if (marker-buffer org-agenda-restrict-begin)
      (setq org-tags-match-list-sublevels t)
    (setq org-tags-match-list-sublevels nil))
  nil)

(defvar bh/hide-scheduled-and-waiting-next-tasks t)

(defun bh/toggle-next-task-display ()
  (interactive)
  (setq bh/hide-scheduled-and-waiting-next-tasks (not bh/hide-scheduled-and-waiting-next-tasks))
  (when  (equal major-mode 'org-agenda-mode)
    (org-agenda-redo))
  (message "%s WAITING and SCHEDULED NEXT Tasks" (if bh/hide-scheduled-and-waiting-next-tasks "Hide" "Show")))

(defun bh/skip-stuck-projects ()
  "Skip trees that are not stuck projects"
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (if (bh/is-project-p)
          (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                 (has-next ))
            (save-excursion
              (forward-line 1)
              (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
                (unless (member "WAITING" (org-get-tags-at))
                  (setq has-next t))))
            (if has-next
                nil
              next-headline)) ; a stuck project, has subtasks but no next task
        nil))))

(defun bh/skip-non-stuck-projects ()
  "Skip trees that are not stuck projects"
  ;; (bh/list-sublevels-for-projects-indented)
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (if (bh/is-project-p)
          (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                 (has-next ))
            (save-excursion
              (forward-line 1)
              (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
                (unless (member "WAITING" (org-get-tags-at))
                  (setq has-next t))))
            (if has-next
                next-headline
              nil)) ; a stuck project, has subtasks but no next task
        next-headline))))

(defun bh/skip-non-projects ()
  "Skip trees that are not projects"
  ;; (bh/list-sublevels-for-projects-indented)
  (if (save-excursion (bh/skip-non-stuck-projects))
      (save-restriction
        (widen)
        (let ((subtree-end (save-excursion (org-end-of-subtree t))))
          (cond
           ((bh/is-project-p)
            nil)
           ((and (bh/is-project-subtree-p) (not (bh/is-task-p)))
            nil)
           (t
            subtree-end))))
    (save-excursion (org-end-of-subtree t))))

(defun bh/skip-non-tasks ()
  "Show non-project tasks.
Skip project and sub-project tasks, habits, and project related tasks."
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (cond
       ((bh/is-task-p)
        nil)
       (t
        next-headline)))))

(defun bh/skip-project-trees-and-habits ()
  "Skip trees that are projects"
  (save-restriction
    (widen)
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((bh/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       (t
        nil)))))

(defun bh/skip-projects-and-habits-and-single-tasks ()
  "Skip trees that are projects, tasks that are habits, single non-project tasks"
  (save-restriction
    (widen)
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (cond
       ((org-is-habit-p)
        next-headline)
       ((and bh/hide-scheduled-and-waiting-next-tasks
             (member "WAITING" (org-get-tags-at)))
        next-headline)
       ((bh/is-project-p)
        next-headline)
       ((and (bh/is-task-p) (not (bh/is-project-subtree-p)))
        next-headline)
       (t
        nil)))))

(defun bh/skip-project-tasks-maybe ()
  "Show tasks related to the current restriction.
When restricted to a project, skip project and sub project tasks, habits, NEXT tasks, and loose tasks.
When not restricted, skip project and sub-project tasks, habits, and project related tasks."
  (save-restriction
    (widen)
    (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
           (next-headline (save-excursion (or (outline-next-heading) (point-max))))
           (limit-to-project (marker-buffer org-agenda-restrict-begin)))
      (cond
       ((bh/is-project-p)
        next-headline)
       ((org-is-habit-p)
        subtree-end)
       ((and (not limit-to-project)
             (bh/is-project-subtree-p))
        subtree-end)
       ((and limit-to-project
             (bh/is-project-subtree-p)
             (member (org-get-todo-state) (list "NEXT")))
        subtree-end)
       (t
        nil)))))

(defun bh/skip-project-tasks ()
  "Show non-project tasks.
Skip project and sub-project tasks, habits, and project related tasks."
  (save-restriction
    (widen)
    (let* ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((bh/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       ((bh/is-project-subtree-p)
        subtree-end)
       (t
        nil)))))

(defun bh/skip-non-project-tasks ()
  "Show project tasks.
Skip project and sub-project tasks, habits, and loose non-project tasks."
  (save-restriction
    (widen)
    (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
           (next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      (cond
       ((bh/is-project-p)
        next-headline)
       ((org-is-habit-p)
        subtree-end)
       ((and (bh/is-project-subtree-p)
             (member (org-get-todo-state) (list "NEXT")))
        subtree-end)
       ((not (bh/is-project-subtree-p))
        subtree-end)
       (t
        nil)))))

(defun bh/skip-projects-and-habits ()
  "Skip trees that are projects and tasks that are habits"
  (save-restriction
    (widen)
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (cond
       ((bh/is-project-p)
        subtree-end)
       ((org-is-habit-p)
        subtree-end)
       (t
        nil)))))

(defun bh/skip-non-subprojects ()
  "Skip trees that are not projects"
  (let ((next-headline (save-excursion (outline-next-heading))))
    (if (bh/is-subproject-p)
        nil
      next-headline)))

(defun bh/find-project-task ()
  "Move point to the parent (project) task if any"
  (save-restriction
    (widen)
    (let ((parent-task (save-excursion (org-back-to-heading 'invisible-ok) (point))))
      (while (org-up-heading-safe)
        (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
          (setq parent-task (point))))
      (goto-char parent-task)
      parent-task)))

;; =================================================================
;; new agenda setup end
;; =================================================================

;; native syntax coloring
(setq org-src-fontify-natively 't)
(setq python-ident-offset 4)

;; Syntax highlighting
(require 'font-lock)
(global-font-lock-mode             't) ;; включено с версии Emacs-22. На всякий...
(setq font-lock-maximum-decoration 't)

;; Show-paren-mode settings
(show-paren-mode 't) ;; включить выделение выражений между {},[],()
(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()

;; Electric-modes settings
(electric-pair-mode    1) ;; автозакрытие {},[],() с переводом курсора внутрь скобок
(electric-indent-mode -1) ;; отключить индентацию  electric-indent-mod'ом (default in Emacs-24.4)

;; Linum plugin
(require 'linum) ;; вызвать Linum
(line-number-mode   't) ;; показать номер строки в mode-line
;;(global-linum-mode  't) ;; показывать номера строк во всех буферах
(column-number-mode 't) ;; показать номер столбца в mode-line
(setq linum-format " %d") ;; задаем формат нумерации строк

;; Dired
(require 'dired)
(setq dired-recursive-deletes 'top) ;; чтобы можно было непустые директории удалять...

;; Imenu
(require 'imenu)
(setq imenu-auto-rescan      't) ;; автоматически обновлять список функций в буфере
(setq imenu-use-popup-menu nil) ;; диалоги Imenu только в минибуфере
(global-set-key (kbd "<f6>") 'imenu) ;; вызов Imenu на F6

;; IDO plugin
(require 'ido)
(ido-mode                      't)
(icomplete-mode                't)
(ido-everywhere                't)
(setq ido-vitrual-buffers      't)
(setq ido-enable-flex-matching 't)

;; Buffer Selection and ibuffer settings
(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer) ;; отдельный список буферов при нажатии C-x C-b
(global-set-key (kbd "<f2>") 'bs-show) ;; запуск buffer selection кнопкой F2

;; Indent settings
(setq-default indent-tabs-mode nil) ;; отключить возможность ставить отступы TAB'ом
(setq-default tab-width          4) ;; ширина табуляции - 4 пробельных символа
(setq-default c-basic-offset     4)
(setq-default standart-indent    4) ;; стандартная ширина отступа - 4 пробельных символа
(setq-default lisp-body-indent   4) ;; сдвигать Lisp-выражения на 4 пробельных символа
(global-set-key (kbd "RET") 'newline-and-indent) ;; при нажатии Enter перевести каретку и сделать отступ
(setq lisp-indent-function  'common-lisp-indent-function)

;; Scrolling settings
(setq scroll-step               1) ;; вверх-вниз по 1 строке
(setq scroll-margin            5) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы  
(setq scroll-conservatively 1000)

;; Short messages
(defalias 'yes-or-no-p 'y-or-n-p)

;; Clipboard settings
(setq x-select-enable-clipboard 't)

;; Highlight search resaults
(setq search-highlight        't)
(setq query-replace-highlight 't)

;; Easy transition between buffers: M-arrow-keys
(if (equal nil (equal major-mode 'org-mode))
    (windmove-default-keybindings 'meta))


;; Russian language commands support
'(default-input-method "russian-computer")

;; Alt + Arrows to change buffers
(windmove-default-keybindings 'meta)

;; Save session before exit emacs
(desktop-save-mode t)

;; Не будет хранить временные файлы с # в конце названия файла
(setq create-lockfiles nil)


;; -------------------- ;;
;; Org-roam Linux setup ;;
;; -------------------- ;;

(setq org-roam-v2-ack t)
(setq org-roam-directory (file-truename "~/Dropbox/emacsOrgFiles/Org-roam/"))

;; (use-package org-roam
;;       :ensure t
;;       :custom
;;       (org-roam-directory (file-truename "~/Dropbox/emacsOrgFiles/Org-roam/"))
;;       :bind (("C-c n l" . org-roam-buffer-toggle)
;;              ("C-c n f" . org-roam-node-find)
;;              ("C-c n g" . org-roam-graph)
;;              ("C-c n i" . org-roam-node-insert)
;;              ("C-c n c" . org-roam-capture)
;;              ;; Dailies
;;              ("C-c n j" . org-roam-dailies-capture-today))
;;       :config
(org-roam-db-autosync-mode)
;;       ;; If using org-roam-protocol
;;       (require 'org-roam-protocol))

(setq org-roam-directory (file-truename "~/Dropbox/emacsOrgFiles/Org-roam/"))
;; If using org-roam-protocol
(require 'org-roam-protocol)
(global-set-key (kbd "C-c n f") 'org-roam-node-find)
(global-set-key (kbd "C-c n i") 'org-roam-node-insert)
(global-set-key (kbd "C-c n l") 'org-roam-buffer-toggle)
(global-set-key (kbd "C-c n c") 'org-roam-capture)
(global-set-key (kbd "C-c n h i") 'org-id-get-create)
(global-set-key (kbd "C-c j D") 'org-roam-dailies-capture-today)
(global-set-key (kbd "C-c j d") 'org-roam-dailies-goto-today)

;;; for org-roam-buffer-toggle
;;; Recommendation in the official manual
(add-to-list 'display-buffer-alist
               '("\\*org-roam\\*"
                  (display-buffer-in-direction)
                  (direction . right)
                  (window-width . 0.33)
                  (window-height . fit-window-to-buffer)))

;;; Mouse navigation in org-roam-links buffer
(define-key org-roam-mode-map [mouse-1] #'org-roam-visit-thing)

;;; Showing number of backlinks for each node
(cl-defmethod org-roam-node-directories ((node org-roam-node))
  (if-let ((dirs (file-name-directory (file-relative-name (org-roam-node-file node) org-roam-directory))))
      (format "(%s)" (car (f-split dirs)))
    ""))

(cl-defmethod org-roam-node-backlinkscount ((node org-roam-node))
  (let* ((count (caar (org-roam-db-query
                       [:select (funcall count source)
                                :from links
                                :where (= dest $s1)
                                :and (= type "id")]
                       (org-roam-node-id node)))))
    (format "[%d]" count)))

(setq org-roam-node-display-template "${directories:10} ${tags:10} ${title:100} ${backlinkscount:6}")

;;; Showing node hierarchy
(cl-defmethod org-roam-node-filetitle ((node org-roam-node))
  "Return the file TITLE for the node."
  (org-roam-get-keyword "TITLE" (org-roam-node-file node)))

(cl-defmethod org-roam-node-hierarchy ((node org-roam-node))
  "Return the hierarchy for the node."
  (let ((title (org-roam-node-title node))
        (olp (org-roam-node-olp node))
        (level (org-roam-node-level node))
        (filetitle (org-roam-node-filetitle node)))
    (concat
     (if (> level 0) (concat filetitle " > "))
     (if (> level 1) (concat (string-join olp " > ") " > "))
     title))
  )

(setq org-roam-node-display-template "${hierarchy:*}
${tags:20}")

;; Org-roam-protocol захват из браузера
(server-start)
(add-to-list 'load-path "~/Dropbox/emacsOrgFiles/Org-roam/")
(require 'org-protocol)

(add-to-list 'load-path "~/.emacs.d/private/org-roam-ui")
(load-library "org-roam-ui")


;; Python запуск python кода из файла .py
(defun eval-python-buffer ()
  "Execute current buffer as Python code."
  (interactive)
  (shell-command-on-region 1 (point-max) "python3"))

(global-set-key (kbd "C-c e") 'eval-python-buffer)

;; Python запуск кода под тегами Literate programming blocks
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))


;; Deft - autocomplete and fulltext search
(require 'deft)
(setq deft-extensions '("txt" "tex" "org"))
(setq deft-directory "~/Dropbox/emacsOrgFiles/")
(setq deft-recursive t)
(global-set-key [f8] 'deft)

;(use-package deft
;      :bind ("<f8>" . deft)
;      :commands (deft)
;      :config (setq deft-directory "~/Dropbox/emacsOrgFiles/"
;                    deft-extensions '("md" "org" "txt")))

;; Бинды для быстрого открытия вчерашней/завтрашней заметки
(global-set-key (kbd "C-c j T") 'org-roam-dailies-capture-tomorrow)
(global-set-key (kbd "C-c j Y") 'org-roam-dailies-capture-yesterday)
(global-set-key (kbd "C-c j t") 'org-roam-dailies-goto-tomorrow)
(global-set-key (kbd "C-c j y") 'org-roam-dailies-goto-yesterday)
(global-set-key (kbd "C-c j V") 'org-roam-dailies-capture-date)
(global-set-key (kbd "C-c j v") 'org-roam-dailies-goto-date)
(global-set-key (kbd "C-c j n") 'org-roam-dailies-goto-next-note)
(global-set-key (kbd "C-c j p") 'org-roam-dailies-goto-previous-note)


;; Оповещения из emacs на рабочем столе
(use-package alert
  :commands alert
  :config
  (setq alert-default-style 'notifications))


;; Pandoc - для конвертирования файлов в разные форматы
(setq pandoc-binary "/usr/local/bin/pandoc")

;; Eval-buffer keybind
(global-set-key (kbd "C-c E") 'eval-buffer)

;; lsp-mode - нужен для работы с language серверами разных ЯП
(use-package lsp-mode
    :commands (lsp lsp-deferred)
    :init
    (setq lsp-keymap-prefix "C-c l") ;; or "C-l", "s-l"
    ;;:config ;; Интеграция с подсказчиком команд режима Evil
    ;;(lsp-enable-which-key-integration t)
    (defun efs/lsp-mode-setup ()
    (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
    (lsp-headerline-breadcrumb-mode))
    :hook (lsp-mode . efs/lsp-mode-setup)
    )

(use-package company
    :after lsp-mode
    :hook (lsp-mode . company-mode)
    :bind (:map company-active-map
                ("<tab>" . company-complete-selection))
          (:map lsp-mode-map
                ("<tab>" . company-indent-or-complete-common))
    :custom
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.0))

(use-package lsp-ui
    :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-treemacs
    :after lsp)

(use-package lsp-ivy)

;; Комментирование блоков кода нативно для language server нужного языка
(use-package evil-nerd-commenter
    :bind ("M-/" . evilnc-comment-or-uncomment-lines))

;; Python setup
(use-package python-mode
    :ensure t
    :hook (python-mode . lsp-deferred)
    :custom
    (python-shell-interpreter "python3"))

;; (use-package flycheck)  для проверки ошибок на лету
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; which-key - подсказки команд в emacs на лету
(use-package which-key)
(require 'which-key)
(which-key-mode)

;; Отключение номеров строк для определенных режимов
(dolist (mode '(org-mode-hook
                treemacs-mode-hook))
    (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Ledger-mode для управления финансами
(use-package ledger-mode
    :mode ("\\.dat\\'"
           "\\.ledger\\'")
    :custom (ledger-clear-whole-transactions t))
       
  (use-package flycheck-ledger :after ledger-mode)

(eval-after-load 'flycheck '(require 'flycheck-ledger))

;; Автокомплит для леджера и не только 
(setq completion-in-region-function
        (lambda (&rest args)
          (apply (if vertico-mode
                     #'consult-completion-in-region
                   #'completion--in-region)
                 args)))
