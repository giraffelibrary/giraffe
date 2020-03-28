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
    val rgbaProp :
      {
        get : 'a class -> Gdk.RgbaRecord.t option,
        set :
          Gdk.RgbaRecord.t option
           -> 'a class
           -> unit,
        new : Gdk.RgbaRecord.t option -> 'a class Property.t
      }
    val useAlphaProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
