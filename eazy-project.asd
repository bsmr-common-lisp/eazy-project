
(defsystem eazy-project
  :version "0.1"
  :author "Masataro Asai"
  :license "LLGPL"
  :depends-on (:trivial-shell
               :asdf
               :optima
               :cl-emb
               :osicat
               :cl-syntax
               :cl-syntax-annot
               :local-time
               :iterate
               :introspect-environment
               :bordeaux-threads
               :lisp-namespace)
  :components ((:module "src"
                :components
                ((:file :package)
                 (:file :specials)
                 (:file :defmenu)
                 (:file :ask)
                 (:file :loop)
                 (:file :menu-definitions)
                 (:file :simulate)
                 (:module "create"
                          :components
                          ((:file :global)
                           (:file :project-local)
                           (:file :actually-create-project)))
                 (:module "restore"
                          :components
                          ((:file :restore)
                           (:file :watch))))
                :serial t))
  :description "Generate and Manage a Project"
  :in-order-to ((test-op (load-op eazy-project.test))))
