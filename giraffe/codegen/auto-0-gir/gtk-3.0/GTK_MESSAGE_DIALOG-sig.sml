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
    val buttonsProp : {new : buttons_type_t -> 'a class Property.t}
    val imageProp :
      {
        get : 'a class -> base widget_class option,
        set :
          'b widget_class option
           -> 'a class
           -> unit,
        new : 'b widget_class option -> 'a class Property.t
      }
    val messageAreaProp : {get : 'a class -> base widget_class option}
    val messageTypeProp :
      {
        get : 'a class -> message_type_t,
        set :
          message_type_t
           -> 'a class
           -> unit,
        new : message_type_t -> 'a class Property.t
      }
    val secondaryTextProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val secondaryUseMarkupProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val textProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val useMarkupProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
