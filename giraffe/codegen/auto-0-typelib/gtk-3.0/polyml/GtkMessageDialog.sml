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
    fun getImage self = (GtkMessageDialogClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getImage_ self before GtkMessageDialogClass.FFI.touchPtr self
    fun getMessageArea self = (GtkMessageDialogClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getMessageArea_ self before GtkMessageDialogClass.FFI.touchPtr self
    fun setImage self image = (GtkMessageDialogClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) setImage_ (self & image)
    fun setMarkup self str = (GtkMessageDialogClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setMarkup_ (self & str)
    local
      open ValueAccessor
    in
      val buttonsProp =
        {
          name = "buttons",
          gtype = fn () => C.gtype GtkButtonsType.t (),
          get = ignore,
          set = ignore,
          init = fn x => C.set GtkButtonsType.t x
        }
      val imageProp =
        {
          name = "image",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val messageAreaProp =
        {
          name = "message-area",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = ignore,
          init = ignore
        }
      val messageTypeProp =
        {
          name = "message-type",
          gtype = fn () => C.gtype GtkMessageType.t (),
          get = fn x => fn () => C.get GtkMessageType.t x,
          set = fn x => C.set GtkMessageType.t x,
          init = fn x => C.set GtkMessageType.t x
        }
      val secondaryTextProp =
        {
          name = "secondary-text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val secondaryUseMarkupProp =
        {
          name = "secondary-use-markup",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val textProp =
        {
          name = "text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val useMarkupProp =
        {
          name = "use-markup",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
