signature GTK_BUTTON =
  sig
    type 'a class
    type 'a actionable_class
    type 'a activatable_class
    type 'a buildable_class
    type 'a widget_class
    type position_type_t
    type relief_style_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActionable : 'a class -> base actionable_class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newFromIconName : string option * LargeInt.int -> base class
    val newFromStock : string -> base class
    val newWithLabel : string -> base class
    val newWithMnemonic : string -> base class
    val clicked : 'a class -> unit
    val enter : 'a class -> unit
    val getAlignment : 'a class -> real * real
    val getAlwaysShowImage : 'a class -> bool
    val getEventWindow : 'a class -> base Gdk.WindowClass.class
    val getFocusOnClick : 'a class -> bool
    val getImage : 'a class -> base widget_class option
    val getImagePosition : 'a class -> position_type_t
    val getLabel : 'a class -> string
    val getRelief : 'a class -> relief_style_t
    val getUseStock : 'a class -> bool
    val getUseUnderline : 'a class -> bool
    val leave : 'a class -> unit
    val pressed : 'a class -> unit
    val released : 'a class -> unit
    val setAlignment :
      'a class
       -> real * real
       -> unit
    val setAlwaysShowImage :
      'a class
       -> bool
       -> unit
    val setFocusOnClick :
      'a class
       -> bool
       -> unit
    val setImage :
      'a class
       -> 'b widget_class
       -> unit
    val setImagePosition :
      'a class
       -> position_type_t
       -> unit
    val setLabel :
      'a class
       -> string
       -> unit
    val setRelief :
      'a class
       -> relief_style_t
       -> unit
    val setUseStock :
      'a class
       -> bool
       -> unit
    val setUseUnderline :
      'a class
       -> bool
       -> unit
    val activateSig : (unit -> unit) -> 'a class Signal.t
    val clickedSig : (unit -> unit) -> 'a class Signal.t
    val enterSig : (unit -> unit) -> 'a class Signal.t
    val leaveSig : (unit -> unit) -> 'a class Signal.t
    val pressedSig : (unit -> unit) -> 'a class Signal.t
    val releasedSig : (unit -> unit) -> 'a class Signal.t
    val alwaysShowImageProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val imageProp :
      {
        get : 'a class -> base widget_class option,
        set :
          'b widget_class option
           -> 'a class
           -> unit,
        new : 'b widget_class option -> 'a class Property.t
      }
    val imagePositionProp :
      {
        get : 'a class -> position_type_t,
        set :
          position_type_t
           -> 'a class
           -> unit,
        new : position_type_t -> 'a class Property.t
      }
    val labelProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val reliefProp :
      {
        get : 'a class -> relief_style_t,
        set :
          relief_style_t
           -> 'a class
           -> unit,
        new : relief_style_t -> 'a class Property.t
      }
    val useStockProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val useUnderlineProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val xalignProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val yalignProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
  end
