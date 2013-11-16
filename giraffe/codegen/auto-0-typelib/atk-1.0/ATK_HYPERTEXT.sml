signature ATK_HYPERTEXT =
  sig
    type 'a class_t
    type 'a hyperlinkclass_t
    val getType : unit -> GObject.Type.t
    val getLink :
      'a class_t
       -> LargeInt.int
       -> base hyperlinkclass_t
    val getLinkIndex :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
    val getNLinks : 'a class_t -> LargeInt.int
    val linkSelectedSig : (LargeInt.int -> unit) -> 'a class_t Signal.signal
  end
