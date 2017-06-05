structure GtkMessageDialog :>
  GTK_MESSAGE_DIALOG
    where type 'a class = 'a GtkMessageDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type dialog_flags_t = GtkDialogFlags.t
    where type 'a window_class = 'a GtkWindowClass.class
    where type buttons_type_t = GtkButtonsType.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type message_type_t = GtkMessageType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_message_dialog_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgiraffegtk "giraffe_gtk_message_dialog_new")
          (
            GtkWindowClass.PolyML.cOptPtr
             &&> GtkDialogFlags.PolyML.cVal
             &&> GtkMessageType.PolyML.cVal
             &&> GtkButtonsType.PolyML.cVal
             --> GtkMessageDialogClass.PolyML.cPtr
          )
      val getImage_ = call (load_sym libgtk "gtk_message_dialog_get_image") (GtkMessageDialogClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getMessageArea_ = call (load_sym libgtk "gtk_message_dialog_get_message_area") (GtkMessageDialogClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val setImage_ = call (load_sym libgtk "gtk_message_dialog_set_image") (GtkMessageDialogClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setMarkup_ = call (load_sym libgtk "gtk_message_dialog_set_markup") (GtkMessageDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkMessageDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type dialog_flags_t = GtkDialogFlags.t
    type 'a window_class = 'a GtkWindowClass.class
    type buttons_type_t = GtkButtonsType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type message_type_t = GtkMessageType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new parent flags type' buttons =
      (
        GtkWindowClass.FFI.withOptPtr
         &&&> GtkDialogFlags.FFI.withVal
         &&&> GtkMessageType.FFI.withVal
         &&&> GtkButtonsType.FFI.withVal
         ---> GtkMessageDialogClass.FFI.fromPtr false
      )
        new_
        (
          parent
           & flags
           & type'
           & buttons
        )
    fun getImage self = (GtkMessageDialogClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getImage_ self
    fun getMessageArea self = (GtkMessageDialogClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getMessageArea_ self
    fun setImage self image = (GtkMessageDialogClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) setImage_ (self & image)
    fun setMarkup self str = (GtkMessageDialogClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setMarkup_ (self & str)
    local
      open Property
    in
      val buttonsProp = {set = fn x => set "buttons" GtkButtonsType.t x}
      val imageProp =
        {
          get = fn x => get "image" GtkWidgetClass.tOpt x,
          set = fn x => set "image" GtkWidgetClass.tOpt x
        }
      val messageAreaProp = {get = fn x => get "message-area" GtkWidgetClass.tOpt x}
      val messageTypeProp =
        {
          get = fn x => get "message-type" GtkMessageType.t x,
          set = fn x => set "message-type" GtkMessageType.t x
        }
      val secondaryTextProp =
        {
          get = fn x => get "secondary-text" stringOpt x,
          set = fn x => set "secondary-text" stringOpt x
        }
      val secondaryUseMarkupProp =
        {
          get = fn x => get "secondary-use-markup" boolean x,
          set = fn x => set "secondary-use-markup" boolean x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x
        }
      val useMarkupProp =
        {
          get = fn x => get "use-markup" boolean x,
          set = fn x => set "use-markup" boolean x
        }
    end
  end
