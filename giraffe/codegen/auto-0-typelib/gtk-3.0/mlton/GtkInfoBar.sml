structure GtkInfoBar :>
  GTK_INFO_BAR
    where type 'a class = 'a GtkInfoBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a button_class = 'a GtkButtonClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type message_type_t = GtkMessageType.t =
  struct
    val getType_ = _import "gtk_info_bar_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_info_bar_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val addActionWidget_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_info_bar_add_action_widget" :
              GtkInfoBarClass.FFI.notnull GtkInfoBarClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GInt32.FFI.val_
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
              GtkInfoBarClass.FFI.notnull GtkInfoBarClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.val_
               -> GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getActionArea_ = _import "gtk_info_bar_get_action_area" : GtkInfoBarClass.FFI.notnull GtkInfoBarClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getContentArea_ = _import "gtk_info_bar_get_content_area" : GtkInfoBarClass.FFI.notnull GtkInfoBarClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getMessageType_ = _import "gtk_info_bar_get_message_type" : GtkInfoBarClass.FFI.notnull GtkInfoBarClass.FFI.p -> GtkMessageType.FFI.val_;
    val getShowCloseButton_ = _import "gtk_info_bar_get_show_close_button" : GtkInfoBarClass.FFI.notnull GtkInfoBarClass.FFI.p -> GBool.FFI.val_;
    val response_ = fn x1 & x2 => (_import "gtk_info_bar_response" : GtkInfoBarClass.FFI.notnull GtkInfoBarClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setDefaultResponse_ = fn x1 & x2 => (_import "gtk_info_bar_set_default_response" : GtkInfoBarClass.FFI.notnull GtkInfoBarClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setMessageType_ = fn x1 & x2 => (_import "gtk_info_bar_set_message_type" : GtkInfoBarClass.FFI.notnull GtkInfoBarClass.FFI.p * GtkMessageType.FFI.val_ -> unit;) (x1, x2)
    val setResponseSensitive_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_info_bar_set_response_sensitive" :
              GtkInfoBarClass.FFI.notnull GtkInfoBarClass.FFI.p
               * GInt32.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setShowCloseButton_ = fn x1 & x2 => (_import "gtk_info_bar_set_show_close_button" : GtkInfoBarClass.FFI.notnull GtkInfoBarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkInfoBarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a button_class = 'a GtkButtonClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type message_type_t = GtkMessageType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkInfoBarClass.FFI.fromPtr false) new_ ()
    fun addActionWidget self (child, responseId) =
      (
        GtkInfoBarClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        addActionWidget_
        (
          self
           & child
           & responseId
        )
    fun addButton self (buttonText, responseId) =
      (
        GtkInfoBarClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> GtkButtonClass.FFI.fromPtr false
      )
        addButton_
        (
          self
           & buttonText
           & responseId
        )
    fun getActionArea self = (GtkInfoBarClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getActionArea_ self
    fun getContentArea self = (GtkInfoBarClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getContentArea_ self
    fun getMessageType self = (GtkInfoBarClass.FFI.withPtr ---> GtkMessageType.FFI.fromVal) getMessageType_ self
    fun getShowCloseButton self = (GtkInfoBarClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowCloseButton_ self
    fun response self responseId = (GtkInfoBarClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) response_ (self & responseId)
    fun setDefaultResponse self responseId = (GtkInfoBarClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setDefaultResponse_ (self & responseId)
    fun setMessageType self messageType = (GtkInfoBarClass.FFI.withPtr &&&> GtkMessageType.FFI.withVal ---> I) setMessageType_ (self & messageType)
    fun setResponseSensitive self (responseId, setting) =
      (
        GtkInfoBarClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        setResponseSensitive_
        (
          self
           & responseId
           & setting
        )
    fun setShowCloseButton self setting = (GtkInfoBarClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowCloseButton_ (self & setting)
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
          set = fn x => set "message-type" GtkMessageType.t x,
          new = fn x => new "message-type" GtkMessageType.t x
        }
      val showCloseButtonProp =
        {
          get = fn x => get "show-close-button" boolean x,
          set = fn x => set "show-close-button" boolean x,
          new = fn x => new "show-close-button" boolean x
        }
    end
  end
