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
    val labelProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val labelWidgetProp :
      {
        get : 'a class -> base widget_class option,
        set :
          'b widget_class option
           -> 'a class
           -> unit,
        new : 'b widget_class option -> 'a class Property.t
      }
    val labelXalignProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val labelYalignProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val shadowTypeProp :
      {
        get : 'a class -> shadow_type_t,
        set :
          shadow_type_t
           -> 'a class
           -> unit,
        new : shadow_type_t -> 'a class Property.t
      }
  end
