signature GTK_COLOR_SELECTION =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val paletteFromString : string -> GdkColorRecordCArrayN.t option
    val paletteToString : GdkColorRecordCArrayN.t -> string
    val getCurrentAlpha : 'a class -> LargeInt.int
    val getCurrentColor : 'a class -> Gdk.ColorRecord.t
    val getCurrentRgba : 'a class -> Gdk.RgbaRecord.t
    val getHasOpacityControl : 'a class -> bool
    val getHasPalette : 'a class -> bool
    val getPreviousAlpha : 'a class -> LargeInt.int
    val getPreviousColor : 'a class -> Gdk.ColorRecord.t
    val getPreviousRgba : 'a class -> Gdk.RgbaRecord.t
    val isAdjusting : 'a class -> bool
    val setCurrentAlpha :
      'a class
       -> LargeInt.int
       -> unit
    val setCurrentColor :
      'a class
       -> Gdk.ColorRecord.t
       -> unit
    val setCurrentRgba :
      'a class
       -> Gdk.RgbaRecord.t
       -> unit
    val setHasOpacityControl :
      'a class
       -> bool
       -> unit
    val setHasPalette :
      'a class
       -> bool
       -> unit
    val setPreviousAlpha :
      'a class
       -> LargeInt.int
       -> unit
    val setPreviousColor :
      'a class
       -> Gdk.ColorRecord.t
       -> unit
    val setPreviousRgba :
      'a class
       -> Gdk.RgbaRecord.t
       -> unit
    val colorChangedSig : (unit -> unit) -> 'a class Signal.t
    val currentAlphaProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val currentColorProp : ('a class, unit -> Gdk.ColorRecord.t option, Gdk.ColorRecord.t option -> unit, Gdk.ColorRecord.t option -> unit) Property.t
    val currentRgbaProp : ('a class, unit -> Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option -> unit, Gdk.RgbaRecord.t option -> unit) Property.t
    val hasOpacityControlProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val hasPaletteProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
