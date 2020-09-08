signature GTK_SCROLLABLE =
  sig
    type 'a class
    type border_t
    type 'a adjustment_class
    type scrollable_policy_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getBorder : 'a class -> border_t option
    val getHadjustment : 'a class -> base adjustment_class
    val getHscrollPolicy : 'a class -> scrollable_policy_t
    val getVadjustment : 'a class -> base adjustment_class
    val getVscrollPolicy : 'a class -> scrollable_policy_t
    val setHadjustment :
      'a class
       -> 'b adjustment_class option
       -> unit
    val setHscrollPolicy :
      'a class
       -> scrollable_policy_t
       -> unit
    val setVadjustment :
      'a class
       -> 'b adjustment_class option
       -> unit
    val setVscrollPolicy :
      'a class
       -> scrollable_policy_t
       -> unit
    val hadjustmentProp : ('a class, unit -> base adjustment_class option, 'b adjustment_class option -> unit, 'b adjustment_class option -> unit) Property.t
    val hscrollPolicyProp : ('a class, unit -> scrollable_policy_t, scrollable_policy_t -> unit, scrollable_policy_t -> unit) Property.t
    val vadjustmentProp : ('a class, unit -> base adjustment_class option, 'b adjustment_class option -> unit, 'b adjustment_class option -> unit) Property.t
    val vscrollPolicyProp : ('a class, unit -> scrollable_policy_t, scrollable_policy_t -> unit, scrollable_policy_t -> unit) Property.t
  end
