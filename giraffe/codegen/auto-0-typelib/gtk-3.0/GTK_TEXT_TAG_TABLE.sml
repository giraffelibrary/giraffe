signature GTK_TEXT_TAG_TABLE =
  sig
    type 'a class_t
    type 'a texttagclass_t
    type 'a buildableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val add :
      'a class_t
       -> 'b texttagclass_t
       -> unit
    val getSize : 'a class_t -> LargeInt.int
    val lookup :
      'a class_t
       -> string
       -> base texttagclass_t
    val remove :
      'a class_t
       -> 'b texttagclass_t
       -> unit
    val tagAddedSig : (base texttagclass_t -> unit) -> 'a class_t Signal.signal
    val tagChangedSig :
      (base texttagclass_t
        -> bool
        -> unit)
       -> 'a class_t Signal.signal
    val tagRemovedSig : (base texttagclass_t -> unit) -> 'a class_t Signal.signal
  end
