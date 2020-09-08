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
    val isSelectedLink : 'a class -> bool
    val isValid : 'a class -> bool
    val linkActivatedSig : (unit -> unit) -> 'a class Signal.t
    val endIndexProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val numberOfAnchorsProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val selectedLinkProp : ('a class, unit -> bool, unit, unit) Property.t
    val startIndexProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
  end
