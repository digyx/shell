;;; dap-elixir.el -*- lexical-binding: t; -*-
;;;
;;; Custom dap-elixir.el module since the default one is built mostly for only debugging tests.
(require 'dap-mode)
(require 'lsp-elixir)

(defun dap-elixir--populate-start-file-args (conf)
  "Populate CONF with the required arguments."
  (-> conf
      (dap--put-if-absent :dap-server-path (list (concat (file-name-as-directory lsp-elixir-ls-server-dir) "debugger.sh")))
      (dap--put-if-absent :type "mix_task")
      (dap--put-if-absent :name "mix run")
      (dap--put-if-absent :request "launch")
      (dap--put-if-absent :task "run")
      (dap--put-if-absent :projectDir (lsp-find-session-folder (lsp-session) (buffer-file-name)))
      (dap--put-if-absent :cwd (lsp-find-session-folder (lsp-session) (buffer-file-name)))))

(dap-register-debug-provider "Elixir" 'dap-elixir--populate-start-file-args)

(dap-register-debug-template
 "Elixir :: Run"
 (list :type "Elixir"
       :task "run"
       :name "Elixir::Run"))

(dap-register-debug-template
 "Elixir :: Run No Halt"
 (list :type "Elixir"
       :task "run"
       :taskArgs (list "--no-halt")
       :name "Elixir::Run No Halt"))

(dap-register-debug-template
 "Elixir :: Phoenix Server"
 (list :type "Elixir"
       :name "Elixir::Phoenix Server"
       :task "phx.server"))

(dap-register-debug-template
 "Elixir :: Test"
 (list :type "Elixir"
       :name "Elixir::Test"
       :task "test"
       :taskArgs (list "--trace")
       :startApps t
       :requireFiles (list
                      "test/**/test_helper.exs"
                      "test/**/*_test.exs")))

(provide 'dap-elixir)
