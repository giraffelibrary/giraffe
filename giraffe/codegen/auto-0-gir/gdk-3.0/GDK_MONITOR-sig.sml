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
    val getManufacturer : 'a class -> string option
    val getModel : 'a class -> string option
    val getRefreshRate : 'a class -> LargeInt.int
    val getScaleFactor : 'a class -> LargeInt.int
    val getSubpixelLayout : 'a class -> subpixel_layout_t
    val getWidthMm : 'a class -> LargeInt.int
    val getWorkarea : 'a class -> rectangle_t
    val isPrimary : 'a class -> bool
    val invalidateSig : (unit -> unit) -> 'a class Signal.t
    val displayProp : ('a class, unit -> base display_class option, unit, 'b display_class option -> unit) Property.t
    val geometryProp : ('a class, unit -> rectangle_t option, unit, unit) Property.t
    val heightMmProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val manufacturerProp : ('a class, unit -> string option, unit, unit) Property.t
    val modelProp : ('a class, unit -> string option, unit, unit) Property.t
    val refreshRateProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val scaleFactorProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val subpixelLayoutProp : ('a class, unit -> subpixel_layout_t, unit, unit) Property.t
    val widthMmProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val workareaProp : ('a class, unit -> rectangle_t option, unit, unit) Property.t
  end
