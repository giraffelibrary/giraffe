signature GTK_EXPANDER =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val newWithMnemonic : string option -> base class
    val getExpanded : 'a class -> bool
    val getLabel : 'a class -> string
    val getLabelFill : 'a class -> bool
    val getLabelWidget : 'a class -> base widget_class option
    val getResizeToplevel : 'a class -> bool
    val getSpacing : 'a class -> LargeInt.int
    val getUseMarkup : 'a class -> bool
    val getUseUnderline : 'a class -> bool
    val setExpanded :
      'a class
       -> bool
       -> unit
    val setLabel :
      'a class
       -> string option
       -> unit
    val setLabelFill :
      'a class
       -> bool
       -> unit
    val setLabelWidget :
      'a class
       -> 'b widget_class option
       -> unit
    val setResizeToplevel :
      'a class
       -> bool
       -> unit
    val setSpacing :
      'a class
       -> LargeInt.int
       -> unit
    val setUseMarkup :
      'a class
       -> bool
       -> unit
    val setUseUnderline :
      'a class
       -> bool
       -> unit
    val activateSig : (unit -> unit) -> 'a class Signal.t
    val expandedProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val labelProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val labelFillProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val labelWidgetProp :
      {
        get : 'a class -> base widget_class option,
        set :
          'b widget_class option
           -> 'a class
           -> unit,
        new : 'b widget_class option -> 'a class Property.t
      }
    val resizeToplevelProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val spacingProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val useMarkupProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val useUnderlineProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
