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
    val hadjustmentProp :
      {
        get : 'a class -> base adjustment_class option,
        set :
          'b adjustment_class option
           -> 'a class
           -> unit,
        new : 'b adjustment_class option -> 'a class Property.t
      }
    val hscrollPolicyProp :
      {
        get : 'a class -> scrollable_policy_t,
        set :
          scrollable_policy_t
           -> 'a class
           -> unit,
        new : scrollable_policy_t -> 'a class Property.t
      }
    val vadjustmentProp :
      {
        get : 'a class -> base adjustment_class option,
        set :
          'b adjustment_class option
           -> 'a class
           -> unit,
        new : 'b adjustment_class option -> 'a class Property.t
      }
    val vscrollPolicyProp :
      {
        get : 'a class -> scrollable_policy_t,
        set :
          scrollable_policy_t
           -> 'a class
           -> unit,
        new : scrollable_policy_t -> 'a class Property.t
      }
  end
