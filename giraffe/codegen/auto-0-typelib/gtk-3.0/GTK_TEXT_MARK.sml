signature GTK_TEXT_MARK =
  sig
    type 'a class
    type 'a text_buffer_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : string option * bool -> base class
    val getBuffer : 'a class -> base text_buffer_class
    val getDeleted : 'a class -> bool
    val getLeftGravity : 'a class -> bool
    val getName : 'a class -> string option
    val getVisible : 'a class -> bool
    val setVisible :
      'a class
       -> bool
       -> unit
    val leftGravityProp : ('a class, bool, bool) Property.readwrite
    val nameProp : ('a class, string option, string option) Property.readwrite
  end
