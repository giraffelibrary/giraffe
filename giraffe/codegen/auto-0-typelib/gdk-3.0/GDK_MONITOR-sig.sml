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
    val displayProp :
      {
        get : 'a class -> base display_class option,
        new : 'b display_class option -> 'a class Property.t
      }
    val geometryProp : {get : 'a class -> rectangle_t option}
    val heightMmProp : {get : 'a class -> LargeInt.int}
    val manufacturerProp : {get : 'a class -> string option}
    val modelProp : {get : 'a class -> string option}
    val refreshRateProp : {get : 'a class -> LargeInt.int}
    val scaleFactorProp : {get : 'a class -> LargeInt.int}
    val subpixelLayoutProp : {get : 'a class -> subpixel_layout_t}
    val widthMmProp : {get : 'a class -> LargeInt.int}
    val workareaProp : {get : 'a class -> rectangle_t option}
  end
