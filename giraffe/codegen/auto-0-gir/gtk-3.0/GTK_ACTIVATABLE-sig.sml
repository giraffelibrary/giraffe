signature GTK_ACTIVATABLE =
  sig
    type 'a class
    type 'a action_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val doSetRelatedAction :
      'a class
       -> 'b action_class
       -> unit
    val getRelatedAction : 'a class -> base action_class
    val getUseActionAppearance : 'a class -> bool
    val setRelatedAction :
      'a class
       -> 'b action_class
       -> unit
    val setUseActionAppearance :
      'a class
       -> bool
       -> unit
    val syncActionProperties :
      'a class
       -> 'b action_class option
       -> unit
    val relatedActionProp : ('a class, unit -> base action_class option, 'b action_class option -> unit, 'b action_class option -> unit) Property.t
    val useActionAppearanceProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
