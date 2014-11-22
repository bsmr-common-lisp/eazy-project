(in-package :eazy-project)

;;;; project-local information

(defmenu (create-project :in ep-main
                         :message "Create a new project.")
  (ask "Select and enter the information, then select 'CREATE'.
Current global configuration:
~{~20@<~s~> = ~s~%~}
Current local configuration:
~:[(no configuration specified)~;~{~20@<~s~> = ~s~%~}~]~2%"
       *config* *project-config* *project-config*))

(macrolet ((set-x (what &optional control)
             `(defmenu (,what :in create-project)
                ,(if control
                     `(q ,control)
                     `(q "Enter the ~a information." ,what))
                (print-config-update-direction ,what t)
                (qif (str)
                     (update-config-item ,what str t))
                (up))))
  (set-x :name
         "Enter the new project name, this affects the name of the
subfolder, asdf system name and the package name."))

(defmenu (add-local-dependency :in create-project)
  (q "Enter a name of a library. The input string is converted to a keyword.
Example:   oSiCaT   -->  finally appears as :OSICAT")
  (print-config-update-direction :depends-on t)
  (qif (str)
       (update-config-item
        :depends-on
        (union
         (list (intern (string-upcase str)
                       (find-package "KEYWORD")))
         (getf *project-config* :depends-on))
        t))
  (up))

(defmenu (reset-local-config
          :in create-project
          :message "Reset the current local config")
  (q "Enter the name of a field. The input string is converted to a keyword.
Example:   oSiCaT   -->  finally appears as :OSICAT")
  (print-config-update-direction :depends-on t)
  (qif (str)
       (update-config-item
        (intern (string-upcase str)
                (find-package "KEYWORD"))
        nil t))
  (up))

(defmenu (create :in create-project)
  (actually-create-project)
  (quit-session))

