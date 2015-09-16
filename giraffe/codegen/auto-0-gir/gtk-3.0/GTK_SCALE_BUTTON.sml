signature GTK_SCALE_BUTTON =
  sig
    type 'a class_t
    type 'a activatable_class_t
    type 'a buildable_class_t
    type 'a orientable_class_t
    type 'a widget_class_t
    type 'a adjustment_class_t
    type icon_size_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatable_class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val getType : unit -> GObject.Type.t
    val getAdjustment : 'a class_t -> base adjustment_class_t
    val getMinusButton : 'a class_t -> base widget_class_t
    val getPlusButton : 'a class_t -> base widget_class_t
    val getPopup : 'a class_t -> base widget_class_t
    val getValue : 'a class_t -> real
    val setAdjustment :
      'a class_t
       -> 'b adjustment_class_t
       -> unit
    val setValue :
      'a class_t
       -> real
       -> unit
    val popdownSig : (unit -> unit) -> 'a class_t Signal.signal
    val popupSig : (unit -> unit) -> 'a class_t Signal.signal
    val valueChangedSig : (real -> unit) -> 'a class_t Signal.signal
    val adjustmentProp : ('a class_t, base adjustment_class_t option, 'b adjustment_class_t option) Property.readwrite
    val sizeProp : ('a class_t, icon_size_t, icon_size_t) Property.readwrite
    val valueProp : ('a class_t, real, real) Property.readwrite
  end
