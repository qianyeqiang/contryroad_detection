
(cl:in-package :asdf)

(defsystem "pedestrian-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "pedestrian" :depends-on ("_package_pedestrian"))
    (:file "_package_pedestrian" :depends-on ("_package"))
  ))