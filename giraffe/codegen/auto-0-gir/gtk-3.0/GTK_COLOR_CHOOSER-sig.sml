signature GTK_COLOR_CHOOSER =
  sig
    type 'a class
    type orientation_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val addPalette :
      'a class
       -> orientation_t
           * LargeInt.int
           * GdkRgbaRecordCArrayN.t option
       -> unit
    val getRgba : 'a class -> Gdk.RgbaRecord.t
    val getUseAlpha : 'a class -> bool
    val setRgba :
      'a class
       -> Gdk.RgbaRecord.t
       -> unit
    val setUseAlpha :
      'a class
       -> bool
       -> unit
    val colorActivatedSig : (Gdk.RgbaRecord.t -> unit) -> 'a class Signal.t
    val rgbaProp : ('a class, unit -> Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option -> unit, Gdk.RgbaRecord.t option -> unit) Property.t
    val useAlphaProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
