signature GTK_BUTTON =
  sig
    type 'a class
    type 'a activatable_class
    type 'a buildable_class
    type 'a widget_class
    type position_type_t
    type relief_style_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newFromStock : string -> base class
    val newWithLabel : string -> base class
    val newWithMnemonic : string -> base class
    val clicked : 'a class -> unit
    val getAlignment : 'a class -> real * real
    val getEventWindow : 'a class -> base Gdk.WindowClass.class
    val getFocusOnClick : 'a class -> bool
    val getImage : 'a class -> base widget_class
    val getImagePosition : 'a class -> position_type_t
    val getLabel : 'a class -> string
    val getRelief : 'a class -> relief_style_t
    val getUseStock : 'a class -> bool
    val getUseUnderline : 'a class -> bool
    val setAlignment :
      'a class
       -> real * real
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
    val activateSig : (unit -> unit) -> 'a class Signal.signal
    val clickedSig : (unit -> unit) -> 'a class Signal.signal
    val focusOnClickProp : ('a class, bool, bool) Property.readwrite
    val imageProp : ('a class, base widget_class option, 'b widget_class option) Property.readwrite
    val imagePositionProp : ('a class, position_type_t, position_type_t) Property.readwrite
    val labelProp : ('a class, string option, string option) Property.readwrite
    val reliefProp : ('a class, relief_style_t, relief_style_t) Property.readwrite
    val useStockProp : ('a class, bool, bool) Property.readwrite
    val useUnderlineProp : ('a class, bool, bool) Property.readwrite
    val xalignProp : ('a class, real, real) Property.readwrite
    val yalignProp : ('a class, real, real) Property.readwrite
  end
