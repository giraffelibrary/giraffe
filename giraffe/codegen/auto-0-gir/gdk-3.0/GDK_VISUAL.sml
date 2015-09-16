signature GDK_VISUAL =
  sig
    type 'a class_t
    type byte_order_t
    type 'a screen_class_t
    type visual_type_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getBest : unit -> base class_t
    val getBestDepth : unit -> LargeInt.int
    val getBestType : unit -> visual_type_t
    val getBestWithBoth :
      LargeInt.int
       -> visual_type_t
       -> base class_t
    val getBestWithDepth : LargeInt.int -> base class_t
    val getBestWithType : visual_type_t -> base class_t
    val getSystem : unit -> base class_t
    val getBitsPerRgb : 'a class_t -> LargeInt.int
    val getBluePixelDetails :
      'a class_t
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val getByteOrder : 'a class_t -> byte_order_t
    val getColormapSize : 'a class_t -> LargeInt.int
    val getDepth : 'a class_t -> LargeInt.int
    val getGreenPixelDetails :
      'a class_t
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val getRedPixelDetails :
      'a class_t
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val getScreen : 'a class_t -> base screen_class_t
    val getVisualType : 'a class_t -> visual_type_t
  end
