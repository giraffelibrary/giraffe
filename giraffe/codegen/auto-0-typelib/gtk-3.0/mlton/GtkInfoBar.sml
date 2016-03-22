structure GtkInfoBar :>
  GTK_INFO_BAR
    where type 'a class = 'a GtkInfoBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type message_type_t = GtkMessageType.t =
  struct
    val getType_ = _import "gtk_info_bar_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_info_bar_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val addActionWidget_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_info_bar_add_action_widget" :
              GtkInfoBarClass.C.notnull GtkInfoBarClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int32.C.val_
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
              GtkInfoBarClass.C.notnull GtkInfoBarClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
               -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getActionArea_ = _import "gtk_info_bar_get_action_area" : GtkInfoBarClass.C.notnull GtkInfoBarClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getContentArea_ = _import "gtk_info_bar_get_content_area" : GtkInfoBarClass.C.notnull GtkInfoBarClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getMessageType_ = _import "gtk_info_bar_get_message_type" : GtkInfoBarClass.C.notnull GtkInfoBarClass.C.p -> GtkMessageType.C.val_;
    val response_ = fn x1 & x2 => (_import "gtk_info_bar_response" : GtkInfoBarClass.C.notnull GtkInfoBarClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setDefaultResponse_ = fn x1 & x2 => (_import "gtk_info_bar_set_default_response" : GtkInfoBarClass.C.notnull GtkInfoBarClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setMessageType_ = fn x1 & x2 => (_import "gtk_info_bar_set_message_type" : GtkInfoBarClass.C.notnull GtkInfoBarClass.C.p * GtkMessageType.C.val_ -> unit;) (x1, x2)
    val setResponseSensitive_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_info_bar_set_response_sensitive" :
              GtkInfoBarClass.C.notnull GtkInfoBarClass.C.p
               * FFI.Int32.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkInfoBarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type message_type_t = GtkMessageType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkInfoBarClass.C.fromPtr false) new_ ()
    fun addActionWidget self child responseId =
      (
        GtkInfoBarClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Int32.C.withVal
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
        GtkInfoBarClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> GtkWidgetClass.C.fromPtr false
      )
        addButton_
        (
          self
           & buttonText
           & responseId
        )
    fun getActionArea self = (GtkInfoBarClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getActionArea_ self
    fun getContentArea self = (GtkInfoBarClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getContentArea_ self
    fun getMessageType self = (GtkInfoBarClass.C.withPtr ---> GtkMessageType.C.fromVal) getMessageType_ self
    fun response self responseId = (GtkInfoBarClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) response_ (self & responseId)
    fun setDefaultResponse self responseId = (GtkInfoBarClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setDefaultResponse_ (self & responseId)
    fun setMessageType self messageType = (GtkInfoBarClass.C.withPtr &&&> GtkMessageType.C.withVal ---> I) setMessageType_ (self & messageType)
    fun setResponseSensitive self responseId setting =
      (
        GtkInfoBarClass.C.withPtr
         &&&> FFI.Int32.C.withVal
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
