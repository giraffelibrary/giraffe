signature GTK_MESSAGE_DIALOG =
  sig
    type 'a class
    type 'a buildable_class
    type buttons_type_t
    type 'a widget_class
    type message_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val getImage : 'a class -> base widget_class
    val getMessageArea : 'a class -> base widget_class
    val setImage :
      'a class
       -> 'b widget_class
       -> unit
    val setMarkup :
      'a class
       -> string
       -> unit
    val buttonsProp : ('a class, buttons_type_t) Property.writeonly
    val imageProp : ('a class, base widget_class option, 'b widget_class option) Property.readwrite
    val messageAreaProp : ('a class, base widget_class option) Property.readonly
    val messageTypeProp : ('a class, message_type_t, message_type_t) Property.readwrite
    val secondaryTextProp : ('a class, string option, string option) Property.readwrite
    val secondaryUseMarkupProp : ('a class, bool, bool) Property.readwrite
    val textProp : ('a class, string option, string option) Property.readwrite
    val useMarkupProp : ('a class, bool, bool) Property.readwrite
  end
