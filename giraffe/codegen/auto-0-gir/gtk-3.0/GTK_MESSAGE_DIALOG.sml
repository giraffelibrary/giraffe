signature GTK_MESSAGE_DIALOG =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type buttons_type_t
    type 'a widget_class_t
    type message_type_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val getImage : 'a class_t -> base widget_class_t
    val getMessageArea : 'a class_t -> base widget_class_t
    val setImage :
      'a class_t
       -> 'b widget_class_t
       -> unit
    val setMarkup :
      'a class_t
       -> string
       -> unit
    val buttonsProp : ('a class_t, buttons_type_t) Property.writeonly
    val imageProp : ('a class_t, base widget_class_t option, 'b widget_class_t option) Property.readwrite
    val messageAreaProp : ('a class_t, base widget_class_t option) Property.readonly
    val messageTypeProp : ('a class_t, message_type_t, message_type_t) Property.readwrite
    val secondaryTextProp : ('a class_t, string option, string option) Property.readwrite
    val secondaryUseMarkupProp : ('a class_t, bool, bool) Property.readwrite
    val textProp : ('a class_t, string option, string option) Property.readwrite
    val useMarkupProp : ('a class_t, bool, bool) Property.readwrite
  end
