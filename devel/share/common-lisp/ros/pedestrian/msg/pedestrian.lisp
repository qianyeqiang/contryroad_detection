; Auto-generated. Do not edit!


(cl:in-package pedestrian-msg)


;//! \htmlinclude pedestrian.msg.html

(cl:defclass <pedestrian> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (valid
    :reader valid
    :initarg :valid
    :type cl:fixnum
    :initform 0)
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass pedestrian (<pedestrian>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pedestrian>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pedestrian)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pedestrian-msg:<pedestrian> is deprecated: use pedestrian-msg:pedestrian instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <pedestrian>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pedestrian-msg:header-val is deprecated.  Use pedestrian-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'valid-val :lambda-list '(m))
(cl:defmethod valid-val ((m <pedestrian>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pedestrian-msg:valid-val is deprecated.  Use pedestrian-msg:valid instead.")
  (valid m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <pedestrian>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pedestrian-msg:distance-val is deprecated.  Use pedestrian-msg:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pedestrian>) ostream)
  "Serializes a message object of type '<pedestrian>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'valid)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pedestrian>) istream)
  "Deserializes a message object of type '<pedestrian>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'valid) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pedestrian>)))
  "Returns string type for a message object of type '<pedestrian>"
  "pedestrian/pedestrian")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pedestrian)))
  "Returns string type for a message object of type 'pedestrian"
  "pedestrian/pedestrian")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pedestrian>)))
  "Returns md5sum for a message object of type '<pedestrian>"
  "0a72ce5c72daeabc9116e7e1192e981a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pedestrian)))
  "Returns md5sum for a message object of type 'pedestrian"
  "0a72ce5c72daeabc9116e7e1192e981a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pedestrian>)))
  "Returns full string definition for message of type '<pedestrian>"
  (cl:format cl:nil "std_msgs/Header header~%int16 valid~%float32 distance~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pedestrian)))
  "Returns full string definition for message of type 'pedestrian"
  (cl:format cl:nil "std_msgs/Header header~%int16 valid~%float32 distance~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pedestrian>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pedestrian>))
  "Converts a ROS message object to a list"
  (cl:list 'pedestrian
    (cl:cons ':header (header msg))
    (cl:cons ':valid (valid msg))
    (cl:cons ':distance (distance msg))
))
