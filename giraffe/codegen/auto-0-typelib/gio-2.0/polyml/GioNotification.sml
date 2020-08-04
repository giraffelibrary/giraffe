structure GioNotification :>
  GIO_NOTIFICATION
    where type 'a class = 'a GioNotificationClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type notification_priority_t = GioNotificationPriority.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_notification_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_notification_new") (Utf8.PolyML.cInPtr --> GioNotificationClass.PolyML.cPtr)
      val addButton_ =
        call (getSymbol "g_notification_add_button")
          (
            GioNotificationClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val addButtonWithTarget_ =
        call (getSymbol "g_notification_add_button_with_target_value")
          (
            GioNotificationClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             --> cVoid
          )
      val setBody_ = call (getSymbol "g_notification_set_body") (GioNotificationClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setDefaultAction_ = call (getSymbol "g_notification_set_default_action") (GioNotificationClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setDefaultActionAndTarget_ =
        call (getSymbol "g_notification_set_default_action_and_target_value")
          (
            GioNotificationClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             --> cVoid
          )
      val setIcon_ = call (getSymbol "g_notification_set_icon") (GioNotificationClass.PolyML.cPtr &&> GioIconClass.PolyML.cPtr --> cVoid)
      val setPriority_ = call (getSymbol "g_notification_set_priority") (GioNotificationClass.PolyML.cPtr &&> GioNotificationPriority.PolyML.cVal --> cVoid)
      val setTitle_ = call (getSymbol "g_notification_set_title") (GioNotificationClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setUrgent_ = call (getSymbol "g_notification_set_urgent") (GioNotificationClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioNotificationClass.class
    type 'a icon_class = 'a GioIconClass.class
    type notification_priority_t = GioNotificationPriority.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new title = (Utf8.FFI.withPtr 0 ---> GioNotificationClass.FFI.fromPtr true) new_ title
    fun addButton self (label, detailedAction) =
      (
        GioNotificationClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
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
        GioNotificationClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantRecord.FFI.withOptPtr false
         ---> I
      )
        addButtonWithTarget_
        (
          self
           & label
           & action
           & target
        )
    fun setBody self body = (GioNotificationClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setBody_ (self & body)
    fun setDefaultAction self detailedAction = (GioNotificationClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setDefaultAction_ (self & detailedAction)
    fun setDefaultActionAndTarget self (action, target) =
      (
        GioNotificationClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantRecord.FFI.withOptPtr false
         ---> I
      )
        setDefaultActionAndTarget_
        (
          self
           & action
           & target
        )
    fun setIcon self icon = (GioNotificationClass.FFI.withPtr false &&&> GioIconClass.FFI.withPtr false ---> I) setIcon_ (self & icon)
    fun setPriority self priority = (GioNotificationClass.FFI.withPtr false &&&> GioNotificationPriority.FFI.withVal ---> I) setPriority_ (self & priority)
    fun setTitle self title = (GioNotificationClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTitle_ (self & title)
    fun setUrgent self urgent = (GioNotificationClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUrgent_ (self & urgent)
  end
