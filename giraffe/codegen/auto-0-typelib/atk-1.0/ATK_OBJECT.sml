signature ATK_OBJECT =
  sig
    type 'a class
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
    val getNAccessibleChildren : 'a class -> LargeInt.int
    val getName : 'a class -> string
    val getParent : 'a class -> base class
    val getRole : 'a class -> role_t
    val notifyStateChange :
      'a class
       -> LargeInt.int * bool
       -> unit
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
    val accessibleComponentLayerProp : ('a class, LargeInt.int) Property.readonly
    val accessibleComponentMdiZorderProp : ('a class, LargeInt.int) Property.readonly
    val accessibleDescriptionProp : ('a class, string option, string option) Property.readwrite
    val accessibleHypertextNlinksProp : ('a class, LargeInt.int) Property.readonly
    val accessibleNameProp : ('a class, string option, string option) Property.readwrite
    val accessibleParentProp : ('a class, base class option, 'b class option) Property.readwrite
    val accessibleRoleProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val accessibleTableCaptionProp : ('a class, string option, string option) Property.readwrite
    val accessibleTableCaptionObjectProp : ('a class, base class option, 'b class option) Property.readwrite
    val accessibleTableColumnDescriptionProp : ('a class, string option, string option) Property.readwrite
    val accessibleTableColumnHeaderProp : ('a class, base class option, 'b class option) Property.readwrite
    val accessibleTableRowDescriptionProp : ('a class, string option, string option) Property.readwrite
    val accessibleTableRowHeaderProp : ('a class, base class option, 'b class option) Property.readwrite
    val accessibleTableSummaryProp : ('a class, base class option, 'b class option) Property.readwrite
    val accessibleValueProp : ('a class, real, real) Property.readwrite
  end
