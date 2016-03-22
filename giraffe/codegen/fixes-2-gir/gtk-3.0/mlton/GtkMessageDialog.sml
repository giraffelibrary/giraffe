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
    val getType_ = _import "gtk_message_dialog_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1 & x2 & x3 & x4 =>
          (
            _import "giraffe_gtk_message_dialog_new" : 
              unit GtkWindowClass.C.p
               * GtkDialogFlags.C.val_
               * GtkMessageType.C.val_
               * GtkButtonsType.C.val_
               -> GtkMessageDialogClass.C.notnull GtkMessageDialogClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getImage_ = _import "gtk_message_dialog_get_image" : GtkMessageDialogClass.C.notnull GtkMessageDialogClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getMessageArea_ = _import "gtk_message_dialog_get_message_area" : GtkMessageDialogClass.C.notnull GtkMessageDialogClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val setImage_ = fn x1 & x2 => (_import "gtk_message_dialog_set_image" : GtkMessageDialogClass.C.notnull GtkMessageDialogClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
    val setMarkup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_message_dialog_set_markup" :
              GtkMessageDialogClass.C.notnull GtkMessageDialogClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkMessageDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type dialog_flags_t = GtkDialogFlags.t
    type 'a window_class = 'a GtkWindowClass.class
    type buttons_type_t = GtkButtonsType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type message_type_t = GtkMessageType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new parent flags type' buttons =
      (
        GtkWindowClass.C.withOptPtr
         &&&> GtkDialogFlags.C.withVal
         &&&> GtkMessageType.C.withVal
         &&&> GtkButtonsType.C.withVal
         ---> GtkMessageDialogClass.C.fromPtr false
      )
        new_
        (
          parent
           & flags
           & type'
           & buttons
        )
    fun getImage self = (GtkMessageDialogClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getImage_ self
    fun getMessageArea self = (GtkMessageDialogClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getMessageArea_ self
    fun setImage self image = (GtkMessageDialogClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) setImage_ (self & image)
    fun setMarkup self str = (GtkMessageDialogClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setMarkup_ (self & str)
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
