signature GTK_BUTTON =
  sig
    type 'a class_t
    type 'a activatable_class_t
    type 'a buildable_class_t
    type 'a widget_class_t
    type position_type_t
    type relief_style_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatable_class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newFromStock : string -> base class_t
    val newWithLabel : string -> base class_t
    val newWithMnemonic : string -> base class_t
    val clicked : 'a class_t -> unit
    val getAlignment : 'a class_t -> real * real
    val getEventWindow : 'a class_t -> base Gdk.WindowClass.t
    val getFocusOnClick : 'a class_t -> bool
    val getImage : 'a class_t -> base widget_class_t
    val getImagePosition : 'a class_t -> position_type_t
    val getLabel : 'a class_t -> string
    val getRelief : 'a class_t -> relief_style_t
    val getUseStock : 'a class_t -> bool
    val getUseUnderline : 'a class_t -> bool
    val setAlignment :
      'a class_t
       -> real
       -> real
       -> unit
    val setFocusOnClick :
      'a class_t
       -> bool
       -> unit
    val setImage :
      'a class_t
       -> 'b widget_class_t
       -> unit
    val setImagePosition :
      'a class_t
       -> position_type_t
       -> unit
    val setLabel :
      'a class_t
       -> string
       -> unit
    val setRelief :
      'a class_t
       -> relief_style_t
       -> unit
    val setUseStock :
      'a class_t
       -> bool
       -> unit
    val setUseUnderline :
      'a class_t
       -> bool
       -> unit
    val activateSig : (unit -> unit) -> 'a class_t Signal.signal
    val clickedSig : (unit -> unit) -> 'a class_t Signal.signal
    val focusOnClickProp : ('a class_t, bool, bool) Property.readwrite
    val imageProp : ('a class_t, base widget_class_t option, 'b widget_class_t option) Property.readwrite
    val imagePositionProp : ('a class_t, position_type_t, position_type_t) Property.readwrite
    val labelProp : ('a class_t, string option, string option) Property.readwrite
    val reliefProp : ('a class_t, relief_style_t, relief_style_t) Property.readwrite
    val useStockProp : ('a class_t, bool, bool) Property.readwrite
    val useUnderlineProp : ('a class_t, bool, bool) Property.readwrite
    val xalignProp : ('a class_t, real, real) Property.readwrite
    val yalignProp : ('a class_t, real, real) Property.readwrite
  end
