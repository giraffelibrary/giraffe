signature GTK_TOOL_BUTTON =
  sig
    type 'a class_t
    type 'a widgetclass_t
    type 'a buildableclass_t
    type 'a activatableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      'a widgetclass_t option
       -> string option
       -> base class_t
    val newFromStock : string -> base class_t
    val getIconName : 'a class_t -> string
    val getIconWidget : 'a class_t -> base widgetclass_t
    val getLabel : 'a class_t -> string
    val getLabelWidget : 'a class_t -> base widgetclass_t
    val getStockId : 'a class_t -> string
    val getUseUnderline : 'a class_t -> bool
    val setIconName :
      'a class_t
       -> string option
       -> unit
    val setIconWidget :
      'a class_t
       -> 'b widgetclass_t option
       -> unit
    val setLabel :
      'a class_t
       -> string option
       -> unit
    val setLabelWidget :
      'a class_t
       -> 'b widgetclass_t option
       -> unit
    val setStockId :
      'a class_t
       -> string option
       -> unit
    val setUseUnderline :
      'a class_t
       -> bool
       -> unit
    val clickedSig : (unit -> unit) -> 'a class_t Signal.signal
    val iconNameProp : ('a class_t, string option, string option) Property.readwrite
    val iconWidgetProp : ('a class_t, base widgetclass_t option, 'b widgetclass_t option) Property.readwrite
    val labelProp : ('a class_t, string option, string option) Property.readwrite
    val labelWidgetProp : ('a class_t, base widgetclass_t option, 'b widgetclass_t option) Property.readwrite
    val stockIdProp : ('a class_t, string option, string option) Property.readwrite
    val useUnderlineProp : ('a class_t, bool, bool) Property.readwrite
  end
