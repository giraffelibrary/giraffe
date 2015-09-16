signature ATK_COMPONENT =
  sig
    type 'a class_t
    type layer_t
    type 'a object_class_t
    type coord_type_t
    type rectangle_record_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val contains :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> coord_type_t
       -> bool
    val getAlpha : 'a class_t -> real
    val getLayer : 'a class_t -> layer_t
    val getMdiZorder : 'a class_t -> LargeInt.int
    val grabFocus : 'a class_t -> bool
    val refAccessibleAtPoint :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> coord_type_t
       -> base object_class_t
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
       -> coord_type_t
       -> bool
    val setPosition :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> coord_type_t
       -> bool
    val setSize :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> bool
    val boundsChangedSig : (rectangle_record_t -> unit) -> 'a class_t Signal.signal
  end
