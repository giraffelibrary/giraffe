signature GTK_SCALE_BUTTON =
  sig
    type 'a class_t
    type 'a activatableclass_t
    type 'a buildableclass_t
    type 'a orientableclass_t
    type 'a widgetclass_t
    type 'a adjustmentclass_t
    type iconsize_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asOrientable : 'a class_t -> base orientableclass_t
    val getType : unit -> GObject.Type.t
    val getAdjustment : 'a class_t -> base adjustmentclass_t
    val getMinusButton : 'a class_t -> base widgetclass_t
    val getPlusButton : 'a class_t -> base widgetclass_t
    val getPopup : 'a class_t -> base widgetclass_t
    val getValue : 'a class_t -> real
    val setAdjustment :
      'a class_t
       -> 'b adjustmentclass_t
       -> unit
    val setValue :
      'a class_t
       -> real
       -> unit
    val popdownSig : (unit -> unit) -> 'a class_t Signal.signal
    val popupSig : (unit -> unit) -> 'a class_t Signal.signal
    val valueChangedSig : (real -> unit) -> 'a class_t Signal.signal
    val adjustmentProp : ('a class_t, base adjustmentclass_t option, 'b adjustmentclass_t option) Property.readwrite
    val sizeProp : ('a class_t, iconsize_t, iconsize_t) Property.readwrite
    val valueProp : ('a class_t, real, real) Property.readwrite
  end
