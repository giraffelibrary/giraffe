signature GDK_MONITOR =
  sig
    type 'a class
    type 'a display_class
    type subpixel_layout_t
    type rectangle_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getDisplay : 'a class -> base display_class
    val getGeometry : 'a class -> rectangle_t
    val getHeightMm : 'a class -> LargeInt.int
    val getManufacturer : 'a class -> string
    val getModel : 'a class -> string
    val getRefreshRate : 'a class -> LargeInt.int
    val getScaleFactor : 'a class -> LargeInt.int
    val getSubpixelLayout : 'a class -> subpixel_layout_t
    val getWidthMm : 'a class -> LargeInt.int
    val getWorkarea : 'a class -> rectangle_t
    val isPrimary : 'a class -> bool
    val invalidateSig : (unit -> unit) -> 'a class Signal.t
    val displayProp : ('a class, base display_class option, 'b display_class option) Property.readwrite
    val geometryProp : ('a class, rectangle_t option) Property.readonly
    val heightMmProp : ('a class, LargeInt.int) Property.readonly
    val manufacturerProp : ('a class, string option) Property.readonly
    val modelProp : ('a class, string option) Property.readonly
    val refreshRateProp : ('a class, LargeInt.int) Property.readonly
    val scaleFactorProp : ('a class, LargeInt.int) Property.readonly
    val subpixelLayoutProp : ('a class, subpixel_layout_t) Property.readonly
    val widthMmProp : ('a class, LargeInt.int) Property.readonly
    val workareaProp : ('a class, rectangle_t option) Property.readonly
  end
