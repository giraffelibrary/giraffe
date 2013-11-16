signature GTK_FRAME =
  sig
    type 'a class_t
    type shadowtype_t
    type 'a widgetclass_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val getLabel : 'a class_t -> string
    val getLabelAlign : 'a class_t -> real * real
    val getLabelWidget : 'a class_t -> base widgetclass_t
    val getShadowType : 'a class_t -> shadowtype_t
    val setLabel :
      'a class_t
       -> string option
       -> unit
    val setLabelAlign :
      'a class_t
       -> real
       -> real
       -> unit
    val setLabelWidget :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val setShadowType :
      'a class_t
       -> shadowtype_t
       -> unit
    val labelProp : ('a class_t, string option, string option) Property.readwrite
    val labelWidgetProp : ('a class_t, base widgetclass_t option, 'b widgetclass_t option) Property.readwrite
    val labelXalignProp : ('a class_t, real, real) Property.readwrite
    val labelYalignProp : ('a class_t, real, real) Property.readwrite
    val shadowTypeProp : ('a class_t, shadowtype_t, shadowtype_t) Property.readwrite
  end
