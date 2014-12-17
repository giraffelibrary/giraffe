signature GDK_VISUAL =
  sig
    type 'a class_t
    type byteorder_t
    type 'a screenclass_t
    type visualtype_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getBest : unit -> base class_t
    val getBestDepth : unit -> LargeInt.int
    val getBestType : unit -> visualtype_t
    val getBestWithBoth :
      LargeInt.int
       -> visualtype_t
       -> base class_t
    val getBestWithDepth : LargeInt.int -> base class_t
    val getBestWithType : visualtype_t -> base class_t
    val getSystem : unit -> base class_t
    val getBitsPerRgb : 'a class_t -> LargeInt.int
    val getBluePixelDetails :
      'a class_t
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val getByteOrder : 'a class_t -> byteorder_t
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
    val getScreen : 'a class_t -> base screenclass_t
    val getVisualType : 'a class_t -> visualtype_t
  end
