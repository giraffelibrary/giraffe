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
    val buttonsProp : ('a class, unit, unit, buttons_type_t -> unit) Property.t
    val imageProp : ('a class, unit -> base widget_class option, 'b widget_class option -> unit, 'b widget_class option -> unit) Property.t
    val messageAreaProp : ('a class, unit -> base widget_class option, unit, unit) Property.t
    val messageTypeProp : ('a class, unit -> message_type_t, message_type_t -> unit, message_type_t -> unit) Property.t
    val secondaryTextProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val secondaryUseMarkupProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val textProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val useMarkupProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
