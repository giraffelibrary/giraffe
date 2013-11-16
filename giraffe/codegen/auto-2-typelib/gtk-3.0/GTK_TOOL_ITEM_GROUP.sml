signature GTK_TOOL_ITEM_GROUP =
  sig
    type 'a class_t
    type 'a widgetclass_t
    type reliefstyle_t
    type 'a toolitemclass_t
    type 'a toolshellclass_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asToolShell : 'a class_t -> base toolshellclass_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val getCollapsed : 'a class_t -> bool
    val getDropItem :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> base toolitemclass_t
    val getEllipsize : 'a class_t -> Pango.EllipsizeMode.t
    val getHeaderRelief : 'a class_t -> reliefstyle_t
    val getItemPosition :
      'a class_t
       -> 'b toolitemclass_t
       -> LargeInt.int
    val getLabel : 'a class_t -> string
    val getLabelWidget : 'a class_t -> base widgetclass_t
    val getNItems : 'a class_t -> LargeInt.int
    val getNthItem :
      'a class_t
       -> LargeInt.int
       -> base toolitemclass_t
    val insert :
      'a class_t
       -> 'b toolitemclass_t
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
       -> reliefstyle_t
       -> unit
    val setItemPosition :
      'a class_t
       -> 'b toolitemclass_t
       -> LargeInt.int
       -> unit
    val setLabel :
      'a class_t
       -> string
       -> unit
    val setLabelWidget :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val collapsedProp : ('a class_t, bool, bool) Property.readwrite
    val ellipsizeProp : ('a class_t, Pango.EllipsizeMode.t, Pango.EllipsizeMode.t) Property.readwrite
    val headerReliefProp : ('a class_t, reliefstyle_t, reliefstyle_t) Property.readwrite
    val labelProp : ('a class_t, string option, string option) Property.readwrite
    val labelWidgetProp : ('a class_t, base widgetclass_t option, 'b widgetclass_t option) Property.readwrite
  end
