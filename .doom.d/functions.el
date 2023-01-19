;;; $DOOMDIR/functions.el -*- lexical-binding: t; -*-

;; Sops
(defun sops ()
  (interactive)
  (start-process "sops" nil "sops" (buffer-file-name)))

;; Ansible Vault
(defun ansible-vault-encrypt ()
  (interactive)
  (start-process "ansible-vault-encrypt" nil "ansible-vault" "encrypt" (buffer-file-name)))

(defun ansible-vault-decrypt ()
  (interactive)
  (start-process "ansible-vault-decrypt" nil "ansible-vault" "decrypt" (buffer-file-name)))
