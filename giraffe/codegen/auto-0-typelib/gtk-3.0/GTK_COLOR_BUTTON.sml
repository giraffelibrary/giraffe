signature GTK_COLOR_BUTTON =
  sig
    type 'a class_t
    type 'a activatableclass_t
    type 'a buildableclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithColor : Gdk.ColorRecord.t -> base class_t
    val newWithRgba : Gdk.RgbaRecord.t -> base class_t
    val getAlpha : 'a class_t -> LargeInt.int
    val getColor : 'a class_t -> Gdk.ColorRecord.t
    val getRgba : 'a class_t -> Gdk.RgbaRecord.t
    val getTitle : 'a class_t -> string
    val getUseAlpha : 'a class_t -> bool
    val setAlpha :
      'a class_t
       -> LargeInt.int
       -> unit
    val setColor :
      'a class_t
       -> Gdk.ColorRecord.t
       -> unit
    val setRgba :
      'a class_t
       -> Gdk.RgbaRecord.t
       -> unit
    val setTitle :
      'a class_t
       -> string
       -> unit
    val setUseAlpha :
      'a class_t
       -> bool
       -> unit
    val colorSetSig : (unit -> unit) -> 'a class_t Signal.signal
    val alphaProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val colorProp : ('a class_t, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val rgbaProp : ('a class_t, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val titleProp : ('a class_t, string option, string option) Property.readwrite
    val useAlphaProp : ('a class_t, bool, bool) Property.readwrite
  end
