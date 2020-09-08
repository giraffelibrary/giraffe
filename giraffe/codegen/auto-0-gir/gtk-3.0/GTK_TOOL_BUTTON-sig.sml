signature GTK_TOOL_BUTTON =
  sig
    type 'a class
    type 'a actionable_class
    type 'a activatable_class
    type 'a buildable_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActionable : 'a class -> base actionable_class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : 'a widget_class option * string option -> base class
    val newFromStock : string -> base class
    val getIconName : 'a class -> string option
    val getIconWidget : 'a class -> base widget_class option
    val getLabel : 'a class -> string option
    val getLabelWidget : 'a class -> base widget_class option
    val getStockId : 'a class -> string
    val getUseUnderline : 'a class -> bool
    val setIconName :
      'a class
       -> string option
       -> unit
    val setIconWidget :
      'a class
       -> 'b widget_class option
       -> unit
    val setLabel :
      'a class
       -> string option
       -> unit
    val setLabelWidget :
      'a class
       -> 'b widget_class option
       -> unit
    val setStockId :
      'a class
       -> string option
       -> unit
    val setUseUnderline :
      'a class
       -> bool
       -> unit
    val clickedSig : (unit -> unit) -> 'a class Signal.t
    val iconNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val iconWidgetProp : ('a class, unit -> base widget_class option, 'b widget_class option -> unit, 'b widget_class option -> unit) Property.t
    val labelProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val labelWidgetProp : ('a class, unit -> base widget_class option, 'b widget_class option -> unit, 'b widget_class option -> unit) Property.t
    val stockIdProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val useUnderlineProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
