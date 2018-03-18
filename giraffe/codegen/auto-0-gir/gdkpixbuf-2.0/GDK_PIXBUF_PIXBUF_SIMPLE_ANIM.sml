signature GDK_PIXBUF_PIXBUF_SIMPLE_ANIM =
  sig
    type 'a class
    type 'a pixbuf_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new :
      LargeInt.int
       * LargeInt.int
       * real
       -> base class
    val addFrame :
      'a class
       -> 'b pixbuf_class
       -> unit
    val getLoop : 'a class -> bool
    val setLoop :
      'a class
       -> bool
       -> unit
    val loopProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
