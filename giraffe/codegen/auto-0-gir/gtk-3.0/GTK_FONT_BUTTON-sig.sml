signature GTK_FONT_BUTTON =
  sig
    type 'a class
    type 'a actionable_class
    type 'a activatable_class
    type 'a buildable_class
    type 'a font_chooser_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActionable : 'a class -> base actionable_class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val asFontChooser : 'a class -> base font_chooser_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithFont : string -> base class
    val getFontName : 'a class -> string
    val getShowSize : 'a class -> bool
    val getShowStyle : 'a class -> bool
    val getTitle : 'a class -> string
    val getUseFont : 'a class -> bool
    val getUseSize : 'a class -> bool
    val setFontName :
      'a class
       -> string
       -> bool
    val setShowSize :
      'a class
       -> bool
       -> unit
    val setShowStyle :
      'a class
       -> bool
       -> unit
    val setTitle :
      'a class
       -> string
       -> unit
    val setUseFont :
      'a class
       -> bool
       -> unit
    val setUseSize :
      'a class
       -> bool
       -> unit
    val fontSetSig : (unit -> unit) -> 'a class Signal.t
    val fontNameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val showSizeProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showStyleProp :
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
    val useFontProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val useSizeProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
