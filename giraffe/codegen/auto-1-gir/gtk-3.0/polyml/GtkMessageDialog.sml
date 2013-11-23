structure GtkMessageDialog :>
  GTK_MESSAGE_DIALOG
    where type 'a class_t = 'a GtkMessageDialogClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type buttonstype_t = GtkButtonsType.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type messagetype_t = GtkMessageType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_message_dialog_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getImage_ = call (load_sym libgtk "gtk_message_dialog_get_image") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getMessageArea_ = call (load_sym libgtk "gtk_message_dialog_get_message_area") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val setImage_ = call (load_sym libgtk "gtk_message_dialog_set_image") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setMarkup_ = call (load_sym libgtk "gtk_message_dialog_set_markup") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkMessageDialogClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type buttonstype_t = GtkButtonsType.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type messagetype_t = GtkMessageType.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getImage self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getImage_ self
    fun getMessageArea self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getMessageArea_ self
    fun setImage self image = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setImage_ (self & image)
    fun setMarkup self str = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setMarkup_ (self & str)
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
