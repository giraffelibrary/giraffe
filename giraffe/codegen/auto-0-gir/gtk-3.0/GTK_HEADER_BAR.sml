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
    val getCustomTitle : 'a class -> base widget_class
    val getDecorationLayout : 'a class -> string
    val getHasSubtitle : 'a class -> bool
    val getShowCloseButton : 'a class -> bool
    val getSubtitle : 'a class -> string
    val getTitle : 'a class -> string
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
    val customTitleProp : ('a class, base widget_class option, 'b widget_class option) Property.readwrite
    val decorationLayoutProp : ('a class, string option, string option) Property.readwrite
    val decorationLayoutSetProp : ('a class, bool, bool) Property.readwrite
    val hasSubtitleProp : ('a class, bool, bool) Property.readwrite
    val showCloseButtonProp : ('a class, bool, bool) Property.readwrite
    val spacingProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val subtitleProp : ('a class, string option, string option) Property.readwrite
    val titleProp : ('a class, string option, string option) Property.readwrite
  end
