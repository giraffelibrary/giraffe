structure GtkInfoBar :>
  GTK_INFO_BAR
    where type 'a class = 'a GtkInfoBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type message_type_t = GtkMessageType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_info_bar_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_info_bar_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val addActionWidget_ =
        call (getSymbol "gtk_info_bar_add_action_widget")
          (
            GtkInfoBarClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val addButton_ =
        call (getSymbol "gtk_info_bar_add_button")
          (
            GtkInfoBarClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> GtkWidgetClass.PolyML.cPtr
          )
      val getActionArea_ = call (getSymbol "gtk_info_bar_get_action_area") (GtkInfoBarClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getContentArea_ = call (getSymbol "gtk_info_bar_get_content_area") (GtkInfoBarClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getMessageType_ = call (getSymbol "gtk_info_bar_get_message_type") (GtkInfoBarClass.PolyML.cPtr --> GtkMessageType.PolyML.cVal)
      val response_ = call (getSymbol "gtk_info_bar_response") (GtkInfoBarClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setDefaultResponse_ = call (getSymbol "gtk_info_bar_set_default_response") (GtkInfoBarClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setMessageType_ = call (getSymbol "gtk_info_bar_set_message_type") (GtkInfoBarClass.PolyML.cPtr &&> GtkMessageType.PolyML.cVal --> cVoid)
      val setResponseSensitive_ =
        call (getSymbol "gtk_info_bar_set_response_sensitive")
          (
            GtkInfoBarClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GtkInfoBarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
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
         &&&> GInt.FFI.withVal
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
         &&&> GInt.FFI.withVal
         ---> GtkWidgetClass.FFI.fromPtr false
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
    fun response self responseId = (GtkInfoBarClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) response_ (self & responseId)
    fun setDefaultResponse self responseId = (GtkInfoBarClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setDefaultResponse_ (self & responseId)
    fun setMessageType self messageType = (GtkInfoBarClass.FFI.withPtr &&&> GtkMessageType.FFI.withVal ---> I) setMessageType_ (self & messageType)
    fun setResponseSensitive self (responseId, setting) =
      (
        GtkInfoBarClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GBool.FFI.withVal
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
