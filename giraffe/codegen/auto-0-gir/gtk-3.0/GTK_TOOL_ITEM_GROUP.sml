signature GTK_TOOL_ITEM_GROUP =
  sig
    type 'a class
    type 'a buildable_class
    type 'a tool_shell_class
    type 'a tool_item_class
    type relief_style_t
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asToolShell : 'a class -> base tool_shell_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val getCollapsed : 'a class -> bool
    val getDropItem :
      'a class
       -> LargeInt.int
       -> LargeInt.int
       -> base tool_item_class
    val getEllipsize : 'a class -> Pango.EllipsizeMode.t
    val getHeaderRelief : 'a class -> relief_style_t
    val getItemPosition :
      'a class
       -> 'b tool_item_class
       -> LargeInt.int
    val getLabel : 'a class -> string
    val getLabelWidget : 'a class -> base widget_class
    val getNItems : 'a class -> LargeInt.int
    val getNthItem :
      'a class
       -> LargeInt.int
       -> base tool_item_class
    val insert :
      'a class
       -> 'b tool_item_class
       -> LargeInt.int
       -> unit
    val setCollapsed :
      'a class
       -> bool
       -> unit
    val setEllipsize :
      'a class
       -> Pango.EllipsizeMode.t
       -> unit
    val setHeaderRelief :
      'a class
       -> relief_style_t
       -> unit
    val setItemPosition :
      'a class
       -> 'b tool_item_class
       -> LargeInt.int
       -> unit
    val setLabel :
      'a class
       -> string
       -> unit
    val setLabelWidget :
      'a class
       -> 'b widget_class
       -> unit
    val collapsedProp : ('a class, bool, bool) Property.readwrite
    val ellipsizeProp : ('a class, Pango.EllipsizeMode.t, Pango.EllipsizeMode.t) Property.readwrite
    val headerReliefProp : ('a class, relief_style_t, relief_style_t) Property.readwrite
    val labelProp : ('a class, string option, string option) Property.readwrite
    val labelWidgetProp : ('a class, base widget_class option, 'b widget_class option) Property.readwrite
  end
