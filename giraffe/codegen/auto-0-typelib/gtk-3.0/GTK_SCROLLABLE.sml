signature GTK_SCROLLABLE =
  sig
    type 'a class_t
    type 'a adjustmentclass_t
    type scrollablepolicy_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getHadjustment : 'a class_t -> base adjustmentclass_t
    val getHscrollPolicy : 'a class_t -> scrollablepolicy_t
    val getVadjustment : 'a class_t -> base adjustmentclass_t
    val getVscrollPolicy : 'a class_t -> scrollablepolicy_t
    val setHadjustment :
      'a class_t
       -> 'b adjustmentclass_t option
       -> unit
    val setHscrollPolicy :
      'a class_t
       -> scrollablepolicy_t
       -> unit
    val setVadjustment :
      'a class_t
       -> 'b adjustmentclass_t option
       -> unit
    val setVscrollPolicy :
      'a class_t
       -> scrollablepolicy_t
       -> unit
    val hadjustmentProp : ('a class_t, base adjustmentclass_t option, 'b adjustmentclass_t option) Property.readwrite
    val hscrollPolicyProp : ('a class_t, scrollablepolicy_t, scrollablepolicy_t) Property.readwrite
    val vadjustmentProp : ('a class_t, base adjustmentclass_t option, 'b adjustmentclass_t option) Property.readwrite
    val vscrollPolicyProp : ('a class_t, scrollablepolicy_t, scrollablepolicy_t) Property.readwrite
  end
