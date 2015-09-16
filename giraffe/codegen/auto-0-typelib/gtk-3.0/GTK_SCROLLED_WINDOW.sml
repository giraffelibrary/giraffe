signature GTK_SCROLLED_WINDOW =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a widget_class_t
    type direction_type_t
    type scroll_type_t
    type shadow_type_t
    type 'a adjustment_class_t
    type policy_type_t
    type corner_type_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a adjustment_class_t option
       -> 'b adjustment_class_t option
       -> base class_t
    val addWithViewport :
      'a class_t
       -> 'b widget_class_t
       -> unit
    val getHadjustment : 'a class_t -> base adjustment_class_t
    val getHscrollbar : 'a class_t -> base widget_class_t
    val getMinContentHeight : 'a class_t -> LargeInt.int
    val getMinContentWidth : 'a class_t -> LargeInt.int
    val getPlacement : 'a class_t -> corner_type_t
    val getPolicy : 'a class_t -> policy_type_t * policy_type_t
    val getShadowType : 'a class_t -> shadow_type_t
    val getVadjustment : 'a class_t -> base adjustment_class_t
    val getVscrollbar : 'a class_t -> base widget_class_t
    val setHadjustment :
      'a class_t
       -> 'b adjustment_class_t
       -> unit
    val setMinContentHeight :
      'a class_t
       -> LargeInt.int
       -> unit
    val setMinContentWidth :
      'a class_t
       -> LargeInt.int
       -> unit
    val setPlacement :
      'a class_t
       -> corner_type_t
       -> unit
    val setPolicy :
      'a class_t
       -> policy_type_t
       -> policy_type_t
       -> unit
    val setShadowType :
      'a class_t
       -> shadow_type_t
       -> unit
    val setVadjustment :
      'a class_t
       -> 'b adjustment_class_t
       -> unit
    val unsetPlacement : 'a class_t -> unit
    val moveFocusOutSig : (direction_type_t -> unit) -> 'a class_t Signal.signal
    val scrollChildSig :
      (scroll_type_t
        -> bool
        -> bool)
       -> 'a class_t Signal.signal
    val hadjustmentProp : ('a class_t, base adjustment_class_t option, 'b adjustment_class_t option) Property.readwrite
    val hscrollbarPolicyProp : ('a class_t, policy_type_t, policy_type_t) Property.readwrite
    val minContentHeightProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val minContentWidthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val shadowTypeProp : ('a class_t, shadow_type_t, shadow_type_t) Property.readwrite
    val vadjustmentProp : ('a class_t, base adjustment_class_t option, 'b adjustment_class_t option) Property.readwrite
    val vscrollbarPolicyProp : ('a class_t, policy_type_t, policy_type_t) Property.readwrite
    val windowPlacementProp : ('a class_t, corner_type_t, corner_type_t) Property.readwrite
    val windowPlacementSetProp : ('a class_t, bool, bool) Property.readwrite
  end
