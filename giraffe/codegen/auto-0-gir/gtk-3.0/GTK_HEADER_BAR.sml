signature GTK_HEADER_BAR =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getCustomTitle : 'a class -> base widget_class option
    val getDecorationLayout : 'a class -> string
    val getHasSubtitle : 'a class -> bool
    val getShowCloseButton : 'a class -> bool
    val getSubtitle : 'a class -> string option
    val getTitle : 'a class -> string option
    val packEnd :
      'a class
       -> 'b widget_class
       -> unit
    val packStart :
      'a class
       -> 'b widget_class
       -> unit
    val setCustomTitle :
      'a class
       -> 'b widget_class option
       -> unit
    val setDecorationLayout :
      'a class
       -> string option
       -> unit
    val setHasSubtitle :
      'a class
       -> bool
       -> unit
    val setShowCloseButton :
      'a class
       -> bool
       -> unit
    val setSubtitle :
      'a class
       -> string option
       -> unit
    val setTitle :
      'a class
       -> string option
       -> unit
    val customTitleProp :
      {
        get : 'a class -> base widget_class option,
        set :
          'b widget_class option
           -> 'a class
           -> unit,
        new : 'b widget_class option -> 'a class Property.t
      }
    val decorationLayoutProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val decorationLayoutSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val hasSubtitleProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showCloseButtonProp :
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
    val subtitleProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
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
  end
