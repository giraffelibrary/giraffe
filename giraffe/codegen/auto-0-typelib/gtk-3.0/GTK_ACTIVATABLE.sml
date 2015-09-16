signature GTK_ACTIVATABLE =
  sig
    type 'a class_t
    type 'a action_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val doSetRelatedAction :
      'a class_t
       -> 'b action_class_t
       -> unit
    val getRelatedAction : 'a class_t -> base action_class_t
    val getUseActionAppearance : 'a class_t -> bool
    val setRelatedAction :
      'a class_t
       -> 'b action_class_t
       -> unit
    val setUseActionAppearance :
      'a class_t
       -> bool
       -> unit
    val syncActionProperties :
      'a class_t
       -> 'b action_class_t option
       -> unit
    val relatedActionProp : ('a class_t, base action_class_t option, 'b action_class_t option) Property.readwrite
    val useActionAppearanceProp : ('a class_t, bool, bool) Property.readwrite
  end
