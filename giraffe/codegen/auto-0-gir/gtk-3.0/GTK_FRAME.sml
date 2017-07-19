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
    val new : string -> base class
    val getLabel : 'a class -> string
    val getLabelAlign : 'a class -> real * real
    val getLabelWidget : 'a class -> base widget_class
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
       -> 'b widget_class
       -> unit
    val setShadowType :
      'a class
       -> shadow_type_t
       -> unit
    val labelProp : ('a class, string option, string option) Property.readwrite
    val labelWidgetProp : ('a class, base widget_class option, 'b widget_class option) Property.readwrite
    val labelXalignProp : ('a class, real, real) Property.readwrite
    val labelYalignProp : ('a class, real, real) Property.readwrite
    val shadowTypeProp : ('a class, shadow_type_t, shadow_type_t) Property.readwrite
  end
