signature GTK_FRAME =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type shadow_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : string option -> base class
    val getLabel : 'a class -> string option
    val getLabelAlign : 'a class -> real * real
    val getLabelWidget : 'a class -> base widget_class option
    val getShadowType : 'a class -> shadow_type_t
    val setLabel :
      'a class
       -> string option
       -> unit
    val setLabelAlign :
      'a class
       -> real * real
       -> unit
    val setLabelWidget :
      'a class
       -> 'b widget_class option
       -> unit
    val setShadowType :
      'a class
       -> shadow_type_t
       -> unit
    val labelProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val labelWidgetProp : ('a class, unit -> base widget_class option, 'b widget_class option -> unit, 'b widget_class option -> unit) Property.t
    val labelXalignProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val labelYalignProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val shadowTypeProp : ('a class, unit -> shadow_type_t, shadow_type_t -> unit, shadow_type_t -> unit) Property.t
  end
