signature GDK_VISUAL =
  sig
    type 'a class
    type byte_order_t
    type 'a screen_class
    type visual_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getBest : unit -> base class
    val getBestDepth : unit -> LargeInt.int
    val getBestType : unit -> visual_type_t
    val getBestWithBoth : LargeInt.int * visual_type_t -> base class option
    val getBestWithDepth : LargeInt.int -> base class
    val getBestWithType : visual_type_t -> base class
    val getSystem : unit -> base class
    val getBitsPerRgb : 'a class -> LargeInt.int
    val getBluePixelDetails :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val getByteOrder : 'a class -> byte_order_t
    val getColormapSize : 'a class -> LargeInt.int
    val getDepth : 'a class -> LargeInt.int
    val getGreenPixelDetails :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val getRedPixelDetails :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val getScreen : 'a class -> base screen_class
    val getVisualType : 'a class -> visual_type_t
  end
