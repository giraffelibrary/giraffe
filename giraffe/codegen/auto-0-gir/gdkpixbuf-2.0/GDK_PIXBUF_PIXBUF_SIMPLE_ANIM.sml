signature GDK_PIXBUF_PIXBUF_SIMPLE_ANIM =
  sig
    type 'a class_t
    type 'a pixbuf_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new :
      LargeInt.int
       -> LargeInt.int
       -> real
       -> base class_t
    val addFrame :
      'a class_t
       -> 'b pixbuf_class_t
       -> unit
    val getLoop : 'a class_t -> bool
    val setLoop :
      'a class_t
       -> bool
       -> unit
    val loopProp : ('a class_t, bool, bool) Property.readwrite
  end
