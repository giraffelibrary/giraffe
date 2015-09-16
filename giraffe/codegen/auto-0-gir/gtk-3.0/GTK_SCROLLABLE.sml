signature GTK_SCROLLABLE =
  sig
    type 'a class_t
    type 'a adjustment_class_t
    type scrollable_policy_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getHadjustment : 'a class_t -> base adjustment_class_t
    val getHscrollPolicy : 'a class_t -> scrollable_policy_t
    val getVadjustment : 'a class_t -> base adjustment_class_t
    val getVscrollPolicy : 'a class_t -> scrollable_policy_t
    val setHadjustment :
      'a class_t
       -> 'b adjustment_class_t option
       -> unit
    val setHscrollPolicy :
      'a class_t
       -> scrollable_policy_t
       -> unit
    val setVadjustment :
      'a class_t
       -> 'b adjustment_class_t option
       -> unit
    val setVscrollPolicy :
      'a class_t
       -> scrollable_policy_t
       -> unit
    val hadjustmentProp : ('a class_t, base adjustment_class_t option, 'b adjustment_class_t option) Property.readwrite
    val hscrollPolicyProp : ('a class_t, scrollable_policy_t, scrollable_policy_t) Property.readwrite
    val vadjustmentProp : ('a class_t, base adjustment_class_t option, 'b adjustment_class_t option) Property.readwrite
    val vscrollPolicyProp : ('a class_t, scrollable_policy_t, scrollable_policy_t) Property.readwrite
  end
