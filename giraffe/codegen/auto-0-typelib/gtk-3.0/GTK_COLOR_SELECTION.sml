signature GTK_COLOR_SELECTION =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a orientable_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getCurrentAlpha : 'a class_t -> LargeInt.int
    val getCurrentColor : 'a class_t -> Gdk.ColorRecord.t
    val getCurrentRgba : 'a class_t -> Gdk.RgbaRecord.t
    val getHasOpacityControl : 'a class_t -> bool
    val getHasPalette : 'a class_t -> bool
    val getPreviousAlpha : 'a class_t -> LargeInt.int
    val getPreviousColor : 'a class_t -> Gdk.ColorRecord.t
    val getPreviousRgba : 'a class_t -> Gdk.RgbaRecord.t
    val isAdjusting : 'a class_t -> bool
    val setCurrentAlpha :
      'a class_t
       -> LargeInt.int
       -> unit
    val setCurrentColor :
      'a class_t
       -> Gdk.ColorRecord.t
       -> unit
    val setCurrentRgba :
      'a class_t
       -> Gdk.RgbaRecord.t
       -> unit
    val setHasOpacityControl :
      'a class_t
       -> bool
       -> unit
    val setHasPalette :
      'a class_t
       -> bool
       -> unit
    val setPreviousAlpha :
      'a class_t
       -> LargeInt.int
       -> unit
    val setPreviousColor :
      'a class_t
       -> Gdk.ColorRecord.t
       -> unit
    val setPreviousRgba :
      'a class_t
       -> Gdk.RgbaRecord.t
       -> unit
    val colorChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val currentAlphaProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val currentColorProp : ('a class_t, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val currentRgbaProp : ('a class_t, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val hasOpacityControlProp : ('a class_t, bool, bool) Property.readwrite
    val hasPaletteProp : ('a class_t, bool, bool) Property.readwrite
  end
