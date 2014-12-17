structure GtkMessageDialog :>
  GTK_MESSAGE_DIALOG
    where type 'a class_t = 'a GtkMessageDialogClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type buttonstype_t = GtkButtonsType.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type messagetype_t = GtkMessageType.t =
  struct
    val getType_ = _import "gtk_message_dialog_get_type" : unit -> GObjectType.C.val_;
    val getImage_ = _import "gtk_message_dialog_get_image" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getMessageArea_ = _import "gtk_message_dialog_get_message_area" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val setImage_ = fn x1 & x2 => (_import "gtk_message_dialog_set_image" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setMarkup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_message_dialog_set_markup" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkMessageDialogClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type buttonstype_t = GtkButtonsType.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type messagetype_t = GtkMessageType.t
    type t = base class_t
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
