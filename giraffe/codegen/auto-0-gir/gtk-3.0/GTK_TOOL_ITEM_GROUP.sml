signature GTK_TOOL_ITEM_GROUP =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a tool_shell_class_t
    type 'a tool_item_class_t
    type relief_style_t
    type 'a widget_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asToolShell : 'a class_t -> base tool_shell_class_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val getCollapsed : 'a class_t -> bool
    val getDropItem :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> base tool_item_class_t
    val getEllipsize : 'a class_t -> Pango.EllipsizeMode.t
    val getHeaderRelief : 'a class_t -> relief_style_t
    val getItemPosition :
      'a class_t
       -> 'b tool_item_class_t
       -> LargeInt.int
    val getLabel : 'a class_t -> string
    val getLabelWidget : 'a class_t -> base widget_class_t
    val getNItems : 'a class_t -> LargeInt.int
    val getNthItem :
      'a class_t
       -> LargeInt.int
       -> base tool_item_class_t
    val insert :
      'a class_t
       -> 'b tool_item_class_t
       -> LargeInt.int
       -> unit
    val setCollapsed :
      'a class_t
       -> bool
       -> unit
    val setEllipsize :
      'a class_t
       -> Pango.EllipsizeMode.t
       -> unit
    val setHeaderRelief :
      'a class_t
       -> relief_style_t
       -> unit
    val setItemPosition :
      'a class_t
       -> 'b tool_item_class_t
       -> LargeInt.int
       -> unit
    val setLabel :
      'a class_t
       -> string
       -> unit
    val setLabelWidget :
      'a class_t
       -> 'b widget_class_t
       -> unit
    val collapsedProp : ('a class_t, bool, bool) Property.readwrite
    val ellipsizeProp : ('a class_t, Pango.EllipsizeMode.t, Pango.EllipsizeMode.t) Property.readwrite
    val headerReliefProp : ('a class_t, relief_style_t, relief_style_t) Property.readwrite
    val labelProp : ('a class_t, string option, string option) Property.readwrite
    val labelWidgetProp : ('a class_t, base widget_class_t option, 'b widget_class_t option) Property.readwrite
  end
