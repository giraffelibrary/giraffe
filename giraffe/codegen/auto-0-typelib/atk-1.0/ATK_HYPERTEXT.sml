signature ATK_HYPERTEXT =
  sig
    type 'a class
    type 'a hyperlink_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getLink :
      'a class
       -> LargeInt.int
       -> base hyperlink_class
    val getLinkIndex :
      'a class
       -> LargeInt.int
       -> LargeInt.int
    val getNLinks : 'a class -> LargeInt.int
    val linkSelectedSig : (LargeInt.int -> unit) -> 'a class Signal.t
  end
