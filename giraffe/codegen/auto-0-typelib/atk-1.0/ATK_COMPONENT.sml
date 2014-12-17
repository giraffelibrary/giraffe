signature ATK_COMPONENT =
  sig
    type 'a class_t
    type layer_t
    type 'a objectclass_t
    type coordtype_t
    type rectanglerecord_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val contains :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> coordtype_t
       -> bool
    val getAlpha : 'a class_t -> real
    val getLayer : 'a class_t -> layer_t
    val getMdiZorder : 'a class_t -> LargeInt.int
    val grabFocus : 'a class_t -> bool
    val refAccessibleAtPoint :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> coordtype_t
       -> base objectclass_t
    val removeFocusHandler :
      'a class_t
       -> LargeInt.int
       -> unit
    val setExtents :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> coordtype_t
       -> bool
    val setPosition :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> coordtype_t
       -> bool
    val setSize :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> bool
    val boundsChangedSig : (rectanglerecord_t -> unit) -> 'a class_t Signal.signal
  end
