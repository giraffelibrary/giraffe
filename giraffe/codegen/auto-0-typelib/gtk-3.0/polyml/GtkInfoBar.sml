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
      val getType_ = call (load_sym libgtk "gtk_info_bar_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_info_bar_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val addActionWidget_ =
        call (load_sym libgtk "gtk_info_bar_add_action_widget")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val addButton_ =
        call (load_sym libgtk "gtk_info_bar_add_button")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getActionArea_ = call (load_sym libgtk "gtk_info_bar_get_action_area") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getContentArea_ = call (load_sym libgtk "gtk_info_bar_get_content_area") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getMessageType_ = call (load_sym libgtk "gtk_info_bar_get_message_type") (GObjectObjectClass.PolyML.cPtr --> GtkMessageType.PolyML.cVal)
      val response_ = call (load_sym libgtk "gtk_info_bar_response") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDefaultResponse_ = call (load_sym libgtk "gtk_info_bar_set_default_response") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setMessageType_ = call (load_sym libgtk "gtk_info_bar_set_message_type") (GObjectObjectClass.PolyML.cPtr &&> GtkMessageType.PolyML.cVal --> FFI.PolyML.cVoid)
      val setResponseSensitive_ =
        call (load_sym libgtk "gtk_info_bar_set_response_sensitive")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
    end
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun getActionArea self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getActionArea_ self
    fun getContentArea self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getContentArea_ self
    fun getMessageType self = (GObjectObjectClass.C.withPtr ---> GtkMessageType.C.fromVal) getMessageType_ self
    fun response self responseId = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) response_ (self & responseId)
    fun setDefaultResponse self responseId = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setDefaultResponse_ (self & responseId)
    fun setMessageType self messageType = (GObjectObjectClass.C.withPtr &&&> GtkMessageType.C.withVal ---> I) setMessageType_ (self & messageType)
    fun setResponseSensitive self responseId setting =
      (
        GObjectObjectClass.C.withPtr
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
