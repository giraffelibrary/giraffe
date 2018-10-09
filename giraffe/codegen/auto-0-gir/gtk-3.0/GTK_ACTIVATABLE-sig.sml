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
    val relatedActionProp :
      {
        get : 'a class -> base action_class option,
        set :
          'b action_class option
           -> 'a class
           -> unit,
        new : 'b action_class option -> 'a class Property.t
      }
    val useActionAppearanceProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
