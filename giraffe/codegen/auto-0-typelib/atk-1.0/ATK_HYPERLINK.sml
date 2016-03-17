signature ATK_HYPERLINK =
  sig
    type 'a class
    type 'a action_class
    type 'a object_class
    type t = base class
    val asAction : 'a class -> base action_class
    val getType : unit -> GObject.Type.t
    val getEndIndex : 'a class -> LargeInt.int
    val getNAnchors : 'a class -> LargeInt.int
    val getObject :
      'a class
       -> LargeInt.int
       -> base object_class
    val getStartIndex : 'a class -> LargeInt.int
    val getUri :
      'a class
       -> LargeInt.int
       -> string
    val isInline : 'a class -> bool
    val isValid : 'a class -> bool
    val linkActivatedSig : (unit -> unit) -> 'a class Signal.signal
    val endIndexProp : ('a class, LargeInt.int) Property.readonly
    val numberOfAnchorsProp : ('a class, LargeInt.int) Property.readonly
    val selectedLinkProp : ('a class, bool) Property.readonly
    val startIndexProp : ('a class, LargeInt.int) Property.readonly
  end
