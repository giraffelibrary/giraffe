signature GTK_COLOR_BUTTON =
  sig
    type 'a class
    type 'a activatable_class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithColor : Gdk.ColorRecord.t -> base class
    val newWithRgba : Gdk.RgbaRecord.t -> base class
    val getAlpha : 'a class -> LargeInt.int
    val getColor : 'a class -> Gdk.ColorRecord.t
    val getRgba : 'a class -> Gdk.RgbaRecord.t
    val getTitle : 'a class -> string
    val getUseAlpha : 'a class -> bool
    val setAlpha :
      'a class
       -> LargeInt.int
       -> unit
    val setColor :
      'a class
       -> Gdk.ColorRecord.t
       -> unit
    val setRgba :
      'a class
       -> Gdk.RgbaRecord.t
       -> unit
    val setTitle :
      'a class
       -> string
       -> unit
    val setUseAlpha :
      'a class
       -> bool
       -> unit
    val colorSetSig : (unit -> unit) -> 'a class Signal.signal
    val alphaProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val colorProp : ('a class, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val rgbaProp : ('a class, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val titleProp : ('a class, string option, string option) Property.readwrite
    val useAlphaProp : ('a class, bool, bool) Property.readwrite
  end
