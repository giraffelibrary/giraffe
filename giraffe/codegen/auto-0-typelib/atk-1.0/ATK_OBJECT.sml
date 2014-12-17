signature ATK_OBJECT =
  sig
    type 'a class_t
    type 'a relationsetclass_t
    type 'a statesetclass_t
    type relationtype_t
    type role_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val addRelationship :
      'a class_t
       -> relationtype_t
       -> 'b class_t
       -> bool
    val getDescription : 'a class_t -> string
    val getIndexInParent : 'a class_t -> LargeInt.int
    val getNAccessibleChildren : 'a class_t -> LargeInt.int
    val getName : 'a class_t -> string
    val getParent : 'a class_t -> base class_t
    val getRole : 'a class_t -> role_t
    val notifyStateChange :
      'a class_t
       -> LargeInt.int
       -> bool
       -> unit
    val refAccessibleChild :
      'a class_t
       -> LargeInt.int
       -> base class_t
    val refRelationSet : 'a class_t -> base relationsetclass_t
    val refStateSet : 'a class_t -> base statesetclass_t
    val removePropertyChangeHandler :
      'a class_t
       -> LargeInt.int
       -> unit
    val removeRelationship :
      'a class_t
       -> relationtype_t
       -> 'b class_t
       -> bool
    val setDescription :
      'a class_t
       -> string
       -> unit
    val setName :
      'a class_t
       -> string
       -> unit
    val setParent :
      'a class_t
       -> 'b class_t
       -> unit
    val setRole :
      'a class_t
       -> role_t
       -> unit
    val focusEventSig : (bool -> unit) -> 'a class_t Signal.signal
    val stateChangeSig :
      (string
        -> bool
        -> unit)
       -> 'a class_t Signal.signal
    val visibleDataChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val accessibleComponentLayerProp : ('a class_t, LargeInt.int) Property.readonly
    val accessibleComponentMdiZorderProp : ('a class_t, LargeInt.int) Property.readonly
    val accessibleDescriptionProp : ('a class_t, string option, string option) Property.readwrite
    val accessibleHypertextNlinksProp : ('a class_t, LargeInt.int) Property.readonly
    val accessibleNameProp : ('a class_t, string option, string option) Property.readwrite
    val accessibleParentProp : ('a class_t, base class_t option, 'b class_t option) Property.readwrite
    val accessibleRoleProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val accessibleTableCaptionProp : ('a class_t, string option, string option) Property.readwrite
    val accessibleTableCaptionObjectProp : ('a class_t, base class_t option, 'b class_t option) Property.readwrite
    val accessibleTableColumnDescriptionProp : ('a class_t, string option, string option) Property.readwrite
    val accessibleTableColumnHeaderProp : ('a class_t, base class_t option, 'b class_t option) Property.readwrite
    val accessibleTableRowDescriptionProp : ('a class_t, string option, string option) Property.readwrite
    val accessibleTableRowHeaderProp : ('a class_t, base class_t option, 'b class_t option) Property.readwrite
    val accessibleTableSummaryProp : ('a class_t, base class_t option, 'b class_t option) Property.readwrite
    val accessibleValueProp : ('a class_t, real, real) Property.readwrite
  end
