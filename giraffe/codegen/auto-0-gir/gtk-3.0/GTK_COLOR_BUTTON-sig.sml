signature GTK_COLOR_BUTTON =
  sig
    type 'a class
    type 'a actionable_class
    type 'a activatable_class
    type 'a buildable_class
    type 'a color_chooser_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActionable : 'a class -> base actionable_class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val asColorChooser : 'a class -> base color_chooser_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithColor : Gdk.ColorRecord.t -> base class
    val newWithRgba : Gdk.RgbaRecord.t -> base class
    val getAlpha : 'a class -> LargeInt.int
    val getColor : 'a class -> Gdk.ColorRecord.t
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
    val setTitle :
      'a class
       -> string
       -> unit
    val setUseAlpha :
      'a class
       -> bool
       -> unit
    val colorSetSig : (unit -> unit) -> 'a class Signal.t
    val alphaProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val colorProp : ('a class, unit -> Gdk.ColorRecord.t option, Gdk.ColorRecord.t option -> unit, Gdk.ColorRecord.t option -> unit) Property.t
    val rgbaProp : ('a class, unit -> Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option -> unit, Gdk.RgbaRecord.t option -> unit) Property.t
    val showEditorProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val titleProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val useAlphaProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
