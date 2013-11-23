signature GTK_ACTIVATABLE =
  sig
    type 'a class_t
    type 'a actionclass_t
    val getType : unit -> GObject.Type.t
    val doSetRelatedAction :
      'a class_t
       -> 'b actionclass_t
       -> unit
    val getRelatedAction : 'a class_t -> base actionclass_t
    val getUseActionAppearance : 'a class_t -> bool
    val setRelatedAction :
      'a class_t
       -> 'b actionclass_t
       -> unit
    val setUseActionAppearance :
      'a class_t
       -> bool
       -> unit
    val syncActionProperties :
      'a class_t
       -> 'b actionclass_t option
       -> unit
    val relatedActionProp : ('a class_t, base actionclass_t option, 'b actionclass_t option) Property.readwrite
    val useActionAppearanceProp : ('a class_t, bool, bool) Property.readwrite
  end
