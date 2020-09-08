signature GTK_SCROLLED_WINDOW =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type position_type_t
    type direction_type_t
    type scroll_type_t
    type shadow_type_t
    type 'a adjustment_class
    type policy_type_t
    type corner_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : 'a adjustment_class option * 'b adjustment_class option -> base class
    val addWithViewport :
      'a class
       -> 'b widget_class
       -> unit
    val getCaptureButtonPress : 'a class -> bool
    val getHadjustment : 'a class -> base adjustment_class
    val getHscrollbar : 'a class -> base widget_class
    val getKineticScrolling : 'a class -> bool
    val getMaxContentHeight : 'a class -> LargeInt.int
    val getMaxContentWidth : 'a class -> LargeInt.int
    val getMinContentHeight : 'a class -> LargeInt.int
    val getMinContentWidth : 'a class -> LargeInt.int
    val getOverlayScrolling : 'a class -> bool
    val getPlacement : 'a class -> corner_type_t
    val getPolicy : 'a class -> policy_type_t * policy_type_t
    val getPropagateNaturalHeight : 'a class -> bool
    val getPropagateNaturalWidth : 'a class -> bool
    val getShadowType : 'a class -> shadow_type_t
    val getVadjustment : 'a class -> base adjustment_class
    val getVscrollbar : 'a class -> base widget_class
    val setCaptureButtonPress :
      'a class
       -> bool
       -> unit
    val setHadjustment :
      'a class
       -> 'b adjustment_class
       -> unit
    val setKineticScrolling :
      'a class
       -> bool
       -> unit
    val setMaxContentHeight :
      'a class
       -> LargeInt.int
       -> unit
    val setMaxContentWidth :
      'a class
       -> LargeInt.int
       -> unit
    val setMinContentHeight :
      'a class
       -> LargeInt.int
       -> unit
    val setMinContentWidth :
      'a class
       -> LargeInt.int
       -> unit
    val setOverlayScrolling :
      'a class
       -> bool
       -> unit
    val setPlacement :
      'a class
       -> corner_type_t
       -> unit
    val setPolicy :
      'a class
       -> policy_type_t * policy_type_t
       -> unit
    val setPropagateNaturalHeight :
      'a class
       -> bool
       -> unit
    val setPropagateNaturalWidth :
      'a class
       -> bool
       -> unit
    val setShadowType :
      'a class
       -> shadow_type_t
       -> unit
    val setVadjustment :
      'a class
       -> 'b adjustment_class
       -> unit
    val unsetPlacement : 'a class -> unit
    val edgeOvershotSig : (position_type_t -> unit) -> 'a class Signal.t
    val edgeReachedSig : (position_type_t -> unit) -> 'a class Signal.t
    val moveFocusOutSig : (direction_type_t -> unit) -> 'a class Signal.t
    val scrollChildSig : (scroll_type_t * bool -> bool) -> 'a class Signal.t
    val hadjustmentProp : ('a class, unit -> base adjustment_class option, 'b adjustment_class option -> unit, 'b adjustment_class option -> unit) Property.t
    val hscrollbarPolicyProp : ('a class, unit -> policy_type_t, policy_type_t -> unit, policy_type_t -> unit) Property.t
    val kineticScrollingProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val maxContentHeightProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val maxContentWidthProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val minContentHeightProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val minContentWidthProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val overlayScrollingProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val propagateNaturalHeightProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val propagateNaturalWidthProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val shadowTypeProp : ('a class, unit -> shadow_type_t, shadow_type_t -> unit, shadow_type_t -> unit) Property.t
    val vadjustmentProp : ('a class, unit -> base adjustment_class option, 'b adjustment_class option -> unit, 'b adjustment_class option -> unit) Property.t
    val vscrollbarPolicyProp : ('a class, unit -> policy_type_t, policy_type_t -> unit, policy_type_t -> unit) Property.t
    val windowPlacementProp : ('a class, unit -> corner_type_t, corner_type_t -> unit, corner_type_t -> unit) Property.t
    val windowPlacementSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
