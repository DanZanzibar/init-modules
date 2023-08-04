;; Org-mode-capture-templates

(setq org-directory "~/orghome")
(setq org-agenda-entry-text-maxlines 10)
(setq org-refile-use-outline-path t)

(setq org-agenda-files '("~/sync-general/gtd/gtd.org"))
(setq zan-gtd "~/sync-general/gtd/gtd.org")

(define-key global-map (kbd "C-c c") 'org-capture)
(define-key global-map (kbd "C-c a") 'org-agenda)

(setq org-capture-templates
      '(
	("g" "Templates for gtd")
	("gu"
	 "Urgent"
	 entry
	 (file+headline zan-gtd "Urgent")
	 "* TODO %?")
	("ga"
	 "Anytime"
	 entry
	 (file+headline zan-gtd "Anytime")
	 "* TODO %?")
	
	("gd" "Daytime")
	("gda"
	 "Add Attachment"
	 entry
	 (file+headline zan-gtd "Daytime")
	 "* TODO %a %?")
	("gdn"
	 "None"
	 entry
	 (file+headline zan-gtd "Daytime")
	 "* TODO %?")
	
	("gp"
	 "Personal"
	 entry
	 (file+headline zan-gtd "Personal")
	 "* TODO %?")
	
	("gw" "Waiting")
	("gwa"
	 "Add Attachment"
	 entry
	 (file+headline zan-gtd "Waiting")
	 "* TODO %u %a %?")
	("gwn"
	 "None"
	 entry
	 (file+headline zan-gtd "Waiting")
	 "* TODO %u %?")
	
	("gh"
	 "Home"
	 entry
	 (file+headline zan-gtd "Home")
	 "* TODO %?")
	("ge"
	 "Errands"
	 entry
	 (file+headline zan-gtd "Errands")
	 "* Todo %?")
	("gc"
	 "Casi"
	 entry
	 (file+headline zan-gtd "Casi")
	 "* TODO %?")
	("gD"
	 "Dave"
	 entry
	 (file+headline zan-gtd "Dave")
	 "* TODO %?")
	("gP"
	 "Prot"
	 entry
	 (file+headline zan-gtd "Prot")
	 "* TODO %?")

	("gt"
	 "Tickler"
	 entry
	 (file+headline zan-gtd "Tickler")
	 "* TODO %? %^g\nSCHEDULED: %^t")

	("gs"
	 "Someday"
	 entry
	 (file+headline zan-gtd "Someday")
	 "* TODO %?")
	))

(provide 'zan-org-capture)
