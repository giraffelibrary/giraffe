signature GTK_TEXT_MARK =
  sig
    type 'a class_t
    type 'a text_buffer_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new :
      string option
       -> bool
       -> base class_t
    val getBuffer : 'a class_t -> base text_buffer_class_t
    val getDeleted : 'a class_t -> bool
    val getLeftGravity : 'a class_t -> bool
    val getName : 'a class_t -> string
    val getVisible : 'a class_t -> bool
    val setVisible :
      'a class_t
       -> bool
       -> unit
    val leftGravityProp : ('a class_t, bool, bool) Property.readwrite
    val nameProp : ('a class_t, string option, string option) Property.readwrite
  end
