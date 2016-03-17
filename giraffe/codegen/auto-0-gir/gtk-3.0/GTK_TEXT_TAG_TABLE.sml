signature GTK_TEXT_TAG_TABLE =
  sig
    type 'a class
    type 'a buildable_class
    type 'a text_tag_class
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val add :
      'a class
       -> 'b text_tag_class
       -> unit
    val getSize : 'a class -> LargeInt.int
    val lookup :
      'a class
       -> string
       -> base text_tag_class
    val remove :
      'a class
       -> 'b text_tag_class
       -> unit
    val tagAddedSig : (base text_tag_class -> unit) -> 'a class Signal.signal
    val tagChangedSig :
      (base text_tag_class
        -> bool
        -> unit)
       -> 'a class Signal.signal
    val tagRemovedSig : (base text_tag_class -> unit) -> 'a class Signal.signal
  end
