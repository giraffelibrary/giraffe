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
    val customTitleProp : ('a class, unit -> base widget_class option, 'b widget_class option -> unit, 'b widget_class option -> unit) Property.t
    val decorationLayoutProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val decorationLayoutSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val hasSubtitleProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val showCloseButtonProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val spacingProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val subtitleProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val titleProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
