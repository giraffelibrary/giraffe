structure GtkDialog :>
  GTK_DIALOG
    where type 'a class = 'a GtkDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_dialog_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_dialog_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val addActionWidget_ =
        call (load_sym libgtk "gtk_dialog_add_action_widget")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val addButton_ =
        call (load_sym libgtk "gtk_dialog_add_button")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getActionArea_ = call (load_sym libgtk "gtk_dialog_get_action_area") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getContentArea_ = call (load_sym libgtk "gtk_dialog_get_content_area") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getResponseForWidget_ = call (load_sym libgtk "gtk_dialog_get_response_for_widget") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getWidgetForResponse_ = call (load_sym libgtk "gtk_dialog_get_widget_for_response") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val response_ = call (load_sym libgtk "gtk_dialog_response") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val run_ = call (load_sym libgtk "gtk_dialog_run") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val setDefaultResponse_ = call (load_sym libgtk "gtk_dialog_set_default_response") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setResponseSensitive_ =
        call (load_sym libgtk "gtk_dialog_set_response_sensitive")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
    end
    type 'a class = 'a GtkDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkDialogClass.C.fromPtr false) new_ ()
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
    fun getResponseForWidget self widget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getResponseForWidget_ (self & widget)
    fun getWidgetForResponse self responseId = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> GtkWidgetClass.C.fromPtr false) getWidgetForResponse_ (self & responseId)
    fun response self responseId = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) response_ (self & responseId)
    fun run self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) run_ self
    fun setDefaultResponse self responseId = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setDefaultResponse_ (self & responseId)
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
  end
