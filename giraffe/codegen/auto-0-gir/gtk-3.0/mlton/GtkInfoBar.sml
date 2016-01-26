structure GtkInfoBar :>
  GTK_INFO_BAR
    where type 'a class_t = 'a GtkInfoBarClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a orientable_class_t = 'a GtkOrientableClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type message_type_t = GtkMessageType.t =
  struct
    val getType_ = _import "gtk_info_bar_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_info_bar_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addActionWidget_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_info_bar_add_action_widget" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addButton_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_info_bar_add_button" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getActionArea_ = _import "gtk_info_bar_get_action_area" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getContentArea_ = _import "gtk_info_bar_get_content_area" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getMessageType_ = _import "gtk_info_bar_get_message_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkMessageType.C.val_;
    val response_ = fn x1 & x2 => (_import "gtk_info_bar_response" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setDefaultResponse_ = fn x1 & x2 => (_import "gtk_info_bar_set_default_response" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setMessageType_ = fn x1 & x2 => (_import "gtk_info_bar_set_message_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkMessageType.C.val_ -> unit;) (x1, x2)
    val setResponseSensitive_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_info_bar_set_response_sensitive" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkInfoBarClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a orientable_class_t = 'a GtkOrientableClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type message_type_t = GtkMessageType.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkInfoBarClass.C.fromPtr false) new_ ()
    fun addActionWidget self child responseId =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        addActionWidget_
        (
          self
           & child
           & responseId
        )
    fun addButton self buttonText responseId =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int.C.withVal
         ---> GtkWidgetClass.C.fromPtr false
      )
        addButton_
        (
          self
           & buttonText
           & responseId
        )
    fun getActionArea self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getActionArea_ self
    fun getContentArea self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getContentArea_ self
    fun getMessageType self = (GObjectObjectClass.C.withPtr ---> GtkMessageType.C.fromVal) getMessageType_ self
    fun response self responseId = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) response_ (self & responseId)
    fun setDefaultResponse self responseId = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setDefaultResponse_ (self & responseId)
    fun setMessageType self messageType = (GObjectObjectClass.C.withPtr &&&> GtkMessageType.C.withVal ---> I) setMessageType_ (self & messageType)
    fun setResponseSensitive self responseId setting =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setResponseSensitive_
        (
          self
           & responseId
           & setting
        )
    local
      open ClosureMarshal Signal
    in
      fun closeSig f = signal "close" (void ---> ret_void) f
      fun responseSig f = signal "response" (get 0w1 int ---> ret_void) f
    end
    local
      open Property
    in
      val messageTypeProp =
        {
          get = fn x => get "message-type" GtkMessageType.t x,
          set = fn x => set "message-type" GtkMessageType.t x
        }
    end
  end
