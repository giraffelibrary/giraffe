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
    val alphaProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val colorProp :
      {
        get : 'a class -> Gdk.ColorRecord.t option,
        set :
          Gdk.ColorRecord.t option
           -> 'a class
           -> unit,
        new : Gdk.ColorRecord.t option -> 'a class Property.t
      }
    val rgbaProp :
      {
        get : 'a class -> Gdk.RgbaRecord.t option,
        set :
          Gdk.RgbaRecord.t option
           -> 'a class
           -> unit,
        new : Gdk.RgbaRecord.t option -> 'a class Property.t
      }
    val showEditorProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val titleProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
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
