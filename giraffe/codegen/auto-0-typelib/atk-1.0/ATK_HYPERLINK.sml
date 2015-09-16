signature ATK_HYPERLINK =
  sig
    type 'a class_t
    type 'a action_class_t
    type 'a object_class_t
    type t = base class_t
    val asAction : 'a class_t -> base action_class_t
    val getType : unit -> GObject.Type.t
    val getEndIndex : 'a class_t -> LargeInt.int
    val getNAnchors : 'a class_t -> LargeInt.int
    val getObject :
      'a class_t
       -> LargeInt.int
       -> base object_class_t
    val getStartIndex : 'a class_t -> LargeInt.int
    val getUri :
      'a class_t
       -> LargeInt.int
       -> string
    val isInline : 'a class_t -> bool
    val isValid : 'a class_t -> bool
    val linkActivatedSig : (unit -> unit) -> 'a class_t Signal.signal
    val endIndexProp : ('a class_t, LargeInt.int) Property.readonly
    val numberOfAnchorsProp : ('a class_t, LargeInt.int) Property.readonly
    val selectedLinkProp : ('a class_t, bool) Property.readonly
    val startIndexProp : ('a class_t, LargeInt.int) Property.readonly
  end
