structure GtkMessageDialog :>
  GTK_MESSAGE_DIALOG
    where type 'a class = 'a GtkMessageDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type buttons_type_t = GtkButtonsType.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type message_type_t = GtkMessageType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_message_dialog_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getImage_ = call (getSymbol "gtk_message_dialog_get_image") (GtkMessageDialogClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getMessageArea_ = call (getSymbol "gtk_message_dialog_get_message_area") (GtkMessageDialogClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val setImage_ = call (getSymbol "gtk_message_dialog_set_image") (GtkMessageDialogClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val setMarkup_ = call (getSymbol "gtk_message_dialog_set_markup") (GtkMessageDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkMessageDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type buttons_type_t = GtkButtonsType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type message_type_t = GtkMessageType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getImage self = (GtkMessageDialogClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getImage_ self
    fun getMessageArea self = (GtkMessageDialogClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getMessageArea_ self
    fun setImage self image = (GtkMessageDialogClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) setImage_ (self & image)
    fun setMarkup self str = (GtkMessageDialogClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setMarkup_ (self & str)
    local
      open Property
    in
      val buttonsProp = {new = fn x => new "buttons" GtkButtonsType.t x}
      val imageProp =
        {
          get = fn x => get "image" GtkWidgetClass.tOpt x,
          set = fn x => set "image" GtkWidgetClass.tOpt x,
          new = fn x => new "image" GtkWidgetClass.tOpt x
        }
      val messageAreaProp = {get = fn x => get "message-area" GtkWidgetClass.tOpt x}
      val messageTypeProp =
        {
          get = fn x => get "message-type" GtkMessageType.t x,
          set = fn x => set "message-type" GtkMessageType.t x,
          new = fn x => new "message-type" GtkMessageType.t x
        }
      val secondaryTextProp =
        {
          get = fn x => get "secondary-text" stringOpt x,
          set = fn x => set "secondary-text" stringOpt x,
          new = fn x => new "secondary-text" stringOpt x
        }
      val secondaryUseMarkupProp =
        {
          get = fn x => get "secondary-use-markup" boolean x,
          set = fn x => set "secondary-use-markup" boolean x,
          new = fn x => new "secondary-use-markup" boolean x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x,
          new = fn x => new "text" stringOpt x
        }
      val useMarkupProp =
        {
          get = fn x => get "use-markup" boolean x,
          set = fn x => set "use-markup" boolean x,
          new = fn x => new "use-markup" boolean x
        }
    end
  end
