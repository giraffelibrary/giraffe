signature ATK_OBJECT =
  sig
    type 'a class
    type layer_t
    type 'a relation_set_class
    type 'a state_set_class
    type relation_type_t
    type role_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val addRelationship :
      'a class
       -> relation_type_t * 'b class
       -> bool
    val getDescription : 'a class -> string
    val getIndexInParent : 'a class -> LargeInt.int
    val getLayer : 'a class -> layer_t
    val getMdiZorder : 'a class -> LargeInt.int
    val getNAccessibleChildren : 'a class -> LargeInt.int
    val getName : 'a class -> string
    val getObjectLocale : 'a class -> string
    val getParent : 'a class -> base class
    val getRole : 'a class -> role_t
    val notifyStateChange :
      'a class
       -> LargeInt.int * bool
       -> unit
    val peekParent : 'a class -> base class
    val refAccessibleChild :
      'a class
       -> LargeInt.int
       -> base class
    val refRelationSet : 'a class -> base relation_set_class
    val refStateSet : 'a class -> base state_set_class
    val removePropertyChangeHandler :
      'a class
       -> LargeInt.int
       -> unit
    val removeRelationship :
      'a class
       -> relation_type_t * 'b class
       -> bool
    val setDescription :
      'a class
       -> string
       -> unit
    val setName :
      'a class
       -> string
       -> unit
    val setParent :
      'a class
       -> 'b class
       -> unit
    val setRole :
      'a class
       -> role_t
       -> unit
    val focusEventSig : (bool -> unit) -> 'a class Signal.t
    val stateChangeSig : (string * bool -> unit) -> 'a class Signal.t
    val visibleDataChangedSig : (unit -> unit) -> 'a class Signal.t
    val accessibleComponentLayerProp : {get : 'a class -> LargeInt.int}
    val accessibleComponentMdiZorderProp : {get : 'a class -> LargeInt.int}
    val accessibleDescriptionProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val accessibleHypertextNlinksProp : {get : 'a class -> LargeInt.int}
    val accessibleNameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val accessibleParentProp :
      {
        get : 'a class -> base class option,
        set :
          'b class option
           -> 'a class
           -> unit,
        new : 'b class option -> 'a class Property.t
      }
    val accessibleRoleProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val accessibleTableCaptionProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val accessibleTableCaptionObjectProp :
      {
        get : 'a class -> base class option,
        set :
          'b class option
           -> 'a class
           -> unit,
        new : 'b class option -> 'a class Property.t
      }
    val accessibleTableColumnDescriptionProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val accessibleTableColumnHeaderProp :
      {
        get : 'a class -> base class option,
        set :
          'b class option
           -> 'a class
           -> unit,
        new : 'b class option -> 'a class Property.t
      }
    val accessibleTableRowDescriptionProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val accessibleTableRowHeaderProp :
      {
        get : 'a class -> base class option,
        set :
          'b class option
           -> 'a class
           -> unit,
        new : 'b class option -> 'a class Property.t
      }
    val accessibleTableSummaryProp :
      {
        get : 'a class -> base class option,
        set :
          'b class option
           -> 'a class
           -> unit,
        new : 'b class option -> 'a class Property.t
      }
    val accessibleValueProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
  end
