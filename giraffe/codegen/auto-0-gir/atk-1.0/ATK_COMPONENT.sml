signature ATK_COMPONENT =
  sig
    type 'a class
    type layer_t
    type 'a object_class
    type coord_type_t
    type rectangle_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val contains :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * coord_type_t
       -> bool
    val getAlpha : 'a class -> real
    val getExtents :
      'a class
       -> coord_type_t
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val getLayer : 'a class -> layer_t
    val getMdiZorder : 'a class -> LargeInt.int
    val getPosition :
      'a class
       -> coord_type_t
       -> LargeInt.int * LargeInt.int
    val getSize : 'a class -> LargeInt.int * LargeInt.int
    val grabFocus : 'a class -> bool
    val refAccessibleAtPoint :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * coord_type_t
       -> base object_class option
    val removeFocusHandler :
      'a class
       -> LargeInt.int
       -> unit
    val setExtents :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * coord_type_t
       -> bool
    val setPosition :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * coord_type_t
       -> bool
    val setSize :
      'a class
       -> LargeInt.int * LargeInt.int
       -> bool
    val boundsChangedSig : (rectangle_t -> unit) -> 'a class Signal.t
  end
