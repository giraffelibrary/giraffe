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
    val hadjustmentProp : ('a class, base adjustment_class option, 'b adjustment_class option) Property.readwrite
    val hscrollbarPolicyProp : ('a class, policy_type_t, policy_type_t) Property.readwrite
    val kineticScrollingProp : ('a class, bool, bool) Property.readwrite
    val maxContentHeightProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val maxContentWidthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val minContentHeightProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val minContentWidthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val overlayScrollingProp : ('a class, bool, bool) Property.readwrite
    val propagateNaturalHeightProp : ('a class, bool, bool) Property.readwrite
    val propagateNaturalWidthProp : ('a class, bool, bool) Property.readwrite
    val shadowTypeProp : ('a class, shadow_type_t, shadow_type_t) Property.readwrite
    val vadjustmentProp : ('a class, base adjustment_class option, 'b adjustment_class option) Property.readwrite
    val vscrollbarPolicyProp : ('a class, policy_type_t, policy_type_t) Property.readwrite
    val windowPlacementProp : ('a class, corner_type_t, corner_type_t) Property.readwrite
    val windowPlacementSetProp : ('a class, bool, bool) Property.readwrite
  end
