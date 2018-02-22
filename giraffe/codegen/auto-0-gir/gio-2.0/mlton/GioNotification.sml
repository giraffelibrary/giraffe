structure GioNotification :>
  GIO_NOTIFICATION
    where type 'a class = 'a GioNotificationClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type notification_priority_t = GioNotificationPriority.t =
  struct
    val getType_ = _import "g_notification_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_g_notification_new" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioNotificationClass.FFI.notnull GioNotificationClass.FFI.p;
    val addButton_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_notification_add_button" :
              GioNotificationClass.FFI.notnull GioNotificationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val addButtonWithTarget_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_notification_add_button_with_target_value" :
              GioNotificationClass.FFI.notnull GioNotificationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setBody_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_notification_set_body" :
              GioNotificationClass.FFI.notnull GioNotificationClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDefaultAction_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_notification_set_default_action" :
              GioNotificationClass.FFI.notnull GioNotificationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDefaultActionAndTarget_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_notification_set_default_action_and_target_value" :
              GioNotificationClass.FFI.notnull GioNotificationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setIcon_ = fn x1 & x2 => (_import "g_notification_set_icon" : GioNotificationClass.FFI.notnull GioNotificationClass.FFI.p * GioIconClass.FFI.notnull GioIconClass.FFI.p -> unit;) (x1, x2)
    val setPriority_ = fn x1 & x2 => (_import "g_notification_set_priority" : GioNotificationClass.FFI.notnull GioNotificationClass.FFI.p * GioNotificationPriority.FFI.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_notification_set_title" :
              GioNotificationClass.FFI.notnull GioNotificationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUrgent_ = fn x1 & x2 => (_import "g_notification_set_urgent" : GioNotificationClass.FFI.notnull GioNotificationClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioNotificationClass.class
    type 'a icon_class = 'a GioIconClass.class
    type notification_priority_t = GioNotificationPriority.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new title = (Utf8.FFI.withPtr ---> GioNotificationClass.FFI.fromPtr true) new_ title
    fun addButton self (label, detailedAction) =
      (
        GioNotificationClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        addButton_
        (
          self
           & label
           & detailedAction
        )
    fun addButtonWithTarget
      self
      (
        label,
        action,
        target
      ) =
      (
        GioNotificationClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         ---> I
      )
        addButtonWithTarget_
        (
          self
           & label
           & action
           & target
        )
    fun setBody self body = (GioNotificationClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setBody_ (self & body)
    fun setDefaultAction self detailedAction = (GioNotificationClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setDefaultAction_ (self & detailedAction)
    fun setDefaultActionAndTarget self (action, target) =
      (
        GioNotificationClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         ---> I
      )
        setDefaultActionAndTarget_
        (
          self
           & action
           & target
        )
    fun setIcon self icon = (GioNotificationClass.FFI.withPtr &&&> GioIconClass.FFI.withPtr ---> I) setIcon_ (self & icon)
    fun setPriority self priority = (GioNotificationClass.FFI.withPtr &&&> GioNotificationPriority.FFI.withVal ---> I) setPriority_ (self & priority)
    fun setTitle self title = (GioNotificationClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTitle_ (self & title)
    fun setUrgent self urgent = (GioNotificationClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUrgent_ (self & urgent)
  end
