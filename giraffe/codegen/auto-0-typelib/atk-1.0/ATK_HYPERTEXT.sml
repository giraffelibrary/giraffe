signature ATK_HYPERTEXT =
  sig
    type 'a class_t
    type 'a hyperlink_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getLink :
      'a class_t
       -> LargeInt.int
       -> base hyperlink_class_t
    val getLinkIndex :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
    val getNLinks : 'a class_t -> LargeInt.int
    val linkSelectedSig : (LargeInt.int -> unit) -> 'a class_t Signal.signal
  end
