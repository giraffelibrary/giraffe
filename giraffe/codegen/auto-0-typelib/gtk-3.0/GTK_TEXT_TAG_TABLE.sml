signature GTK_TEXT_TAG_TABLE =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a text_tag_class_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val add :
      'a class_t
       -> 'b text_tag_class_t
       -> unit
    val getSize : 'a class_t -> LargeInt.int
    val lookup :
      'a class_t
       -> string
       -> base text_tag_class_t
    val remove :
      'a class_t
       -> 'b text_tag_class_t
       -> unit
    val tagAddedSig : (base text_tag_class_t -> unit) -> 'a class_t Signal.signal
    val tagChangedSig :
      (base text_tag_class_t
        -> bool
        -> unit)
       -> 'a class_t Signal.signal
    val tagRemovedSig : (base text_tag_class_t -> unit) -> 'a class_t Signal.signal
  end
