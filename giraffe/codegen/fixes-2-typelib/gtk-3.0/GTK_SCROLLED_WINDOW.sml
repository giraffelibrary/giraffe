signature GTK_SCROLLED_WINDOW =
  sig
    type 'a class_t
    type ('widget, 'a) styleproperty_readonly
    type cornertype_t
    type policytype_t
    type 'a adjustmentclass_t
    type shadowtype_t
    type scrolltype_t
    type directiontype_t
    type 'a widgetclass_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      'a adjustmentclass_t option
       -> 'b adjustmentclass_t option
       -> base class_t
    val addWithViewport :
      'a class_t
       -> 'b widgetclass_t
       -> unit
    val getHadjustment : 'a class_t -> base adjustmentclass_t
    val getHscrollbar : 'a class_t -> base widgetclass_t
    val getMinContentHeight : 'a class_t -> LargeInt.int
    val getMinContentWidth : 'a class_t -> LargeInt.int
    val getPlacement : 'a class_t -> cornertype_t
    val getPolicy : 'a class_t -> policytype_t * policytype_t
    val getShadowType : 'a class_t -> shadowtype_t
    val getVadjustment : 'a class_t -> base adjustmentclass_t
    val getVscrollbar : 'a class_t -> base widgetclass_t
    val setHadjustment :
      'a class_t
       -> 'b adjustmentclass_t
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
       -> cornertype_t
       -> unit
    val setPolicy :
      'a class_t
       -> policytype_t
       -> policytype_t
       -> unit
    val setShadowType :
      'a class_t
       -> shadowtype_t
       -> unit
    val setVadjustment :
      'a class_t
       -> 'b adjustmentclass_t
       -> unit
    val unsetPlacement : 'a class_t -> unit
    val moveFocusOutSig : (directiontype_t -> unit) -> 'a class_t Signal.signal
    val scrollChildSig :
      (scrolltype_t
        -> bool
        -> bool)
       -> 'a class_t Signal.signal
    val scrollbarSpacingStyleProp : ('a class_t, LargeInt.int) styleproperty_readonly
    val hadjustmentProp : ('a class_t, base adjustmentclass_t option, 'b adjustmentclass_t option) Property.readwrite
    val hscrollbarPolicyProp : ('a class_t, policytype_t, policytype_t) Property.readwrite
    val minContentHeightProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val minContentWidthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val shadowTypeProp : ('a class_t, shadowtype_t, shadowtype_t) Property.readwrite
    val vadjustmentProp : ('a class_t, base adjustmentclass_t option, 'b adjustmentclass_t option) Property.readwrite
    val vscrollbarPolicyProp : ('a class_t, policytype_t, policytype_t) Property.readwrite
    val windowPlacementProp : ('a class_t, cornertype_t, cornertype_t) Property.readwrite
    val windowPlacementSetProp : ('a class_t, bool, bool) Property.readwrite
  end
