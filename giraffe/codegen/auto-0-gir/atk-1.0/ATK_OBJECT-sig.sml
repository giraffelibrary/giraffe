signature ATK_OBJECT =
  sig
    type 'a class
    type layer_t
    type state_t
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
       -> state_t * bool
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
    val accessibleComponentLayerProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val accessibleComponentMdiZorderProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val accessibleDescriptionProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val accessibleHypertextNlinksProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val accessibleNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val accessibleParentProp : ('a class, unit -> base class option, 'b class option -> unit, 'b class option -> unit) Property.t
    val accessibleRoleProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val accessibleTableCaptionProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val accessibleTableCaptionObjectProp : ('a class, unit -> base class option, 'b class option -> unit, 'b class option -> unit) Property.t
    val accessibleTableColumnDescriptionProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val accessibleTableColumnHeaderProp : ('a class, unit -> base class option, 'b class option -> unit, 'b class option -> unit) Property.t
    val accessibleTableRowDescriptionProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val accessibleTableRowHeaderProp : ('a class, unit -> base class option, 'b class option -> unit, 'b class option -> unit) Property.t
    val accessibleTableSummaryProp : ('a class, unit -> base class option, 'b class option -> unit, 'b class option -> unit) Property.t
    val accessibleValueProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
  end
