structure AtkObject :>
  ATK_OBJECT
    where type 'a class = 'a AtkObjectClass.class
    where type layer_t = AtkLayer.t
    where type state_t = AtkState.t
    where type 'a relation_set_class = 'a AtkRelationSetClass.class
    where type 'a state_set_class = 'a AtkStateSetClass.class
    where type relation_type_t = AtkRelationType.t
    where type role_t = AtkRole.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_object_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val addRelationship_ =
        call (getSymbol "atk_object_add_relationship")
          (
            AtkObjectClass.PolyML.cPtr
             &&> AtkRelationType.PolyML.cVal
             &&> AtkObjectClass.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val getDescription_ = call (getSymbol "atk_object_get_description") (AtkObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getIndexInParent_ = call (getSymbol "atk_object_get_index_in_parent") (AtkObjectClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getLayer_ = call (getSymbol "atk_object_get_layer") (AtkObjectClass.PolyML.cPtr --> AtkLayer.PolyML.cVal)
      val getMdiZorder_ = call (getSymbol "atk_object_get_mdi_zorder") (AtkObjectClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getNAccessibleChildren_ = call (getSymbol "atk_object_get_n_accessible_children") (AtkObjectClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getName_ = call (getSymbol "atk_object_get_name") (AtkObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getObjectLocale_ = call (getSymbol "atk_object_get_object_locale") (AtkObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getParent_ = call (getSymbol "atk_object_get_parent") (AtkObjectClass.PolyML.cPtr --> AtkObjectClass.PolyML.cPtr)
      val getRole_ = call (getSymbol "atk_object_get_role") (AtkObjectClass.PolyML.cPtr --> AtkRole.PolyML.cVal)
      val notifyStateChange_ =
        call (getSymbol "atk_object_notify_state_change")
          (
            AtkObjectClass.PolyML.cPtr
             &&> AtkState.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val peekParent_ = call (getSymbol "atk_object_peek_parent") (AtkObjectClass.PolyML.cPtr --> AtkObjectClass.PolyML.cPtr)
      val refAccessibleChild_ = call (getSymbol "atk_object_ref_accessible_child") (AtkObjectClass.PolyML.cPtr &&> GInt.PolyML.cVal --> AtkObjectClass.PolyML.cPtr)
      val refRelationSet_ = call (getSymbol "atk_object_ref_relation_set") (AtkObjectClass.PolyML.cPtr --> AtkRelationSetClass.PolyML.cPtr)
      val refStateSet_ = call (getSymbol "atk_object_ref_state_set") (AtkObjectClass.PolyML.cPtr --> AtkStateSetClass.PolyML.cPtr)
      val removePropertyChangeHandler_ = call (getSymbol "atk_object_remove_property_change_handler") (AtkObjectClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val removeRelationship_ =
        call (getSymbol "atk_object_remove_relationship")
          (
            AtkObjectClass.PolyML.cPtr
             &&> AtkRelationType.PolyML.cVal
             &&> AtkObjectClass.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val setDescription_ = call (getSymbol "atk_object_set_description") (AtkObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setName_ = call (getSymbol "atk_object_set_name") (AtkObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setParent_ = call (getSymbol "atk_object_set_parent") (AtkObjectClass.PolyML.cPtr &&> AtkObjectClass.PolyML.cPtr --> cVoid)
      val setRole_ = call (getSymbol "atk_object_set_role") (AtkObjectClass.PolyML.cPtr &&> AtkRole.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a AtkObjectClass.class
    type layer_t = AtkLayer.t
    type state_t = AtkState.t
    type 'a relation_set_class = 'a AtkRelationSetClass.class
    type 'a state_set_class = 'a AtkStateSetClass.class
    type relation_type_t = AtkRelationType.t
    type role_t = AtkRole.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addRelationship self (relationship, target) =
      (
        AtkObjectClass.FFI.withPtr false
         &&&> AtkRelationType.FFI.withVal
         &&&> AtkObjectClass.FFI.withPtr false
         ---> GBool.FFI.fromVal
      )
        addRelationship_
        (
          self
           & relationship
           & target
        )
    fun getDescription self = (AtkObjectClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDescription_ self
    fun getIndexInParent self = (AtkObjectClass.FFI.withPtr false ---> GInt.FFI.fromVal) getIndexInParent_ self
    fun getLayer self = (AtkObjectClass.FFI.withPtr false ---> AtkLayer.FFI.fromVal) getLayer_ self
    fun getMdiZorder self = (AtkObjectClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMdiZorder_ self
    fun getNAccessibleChildren self = (AtkObjectClass.FFI.withPtr false ---> GInt.FFI.fromVal) getNAccessibleChildren_ self
    fun getName self = (AtkObjectClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getObjectLocale self = (AtkObjectClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getObjectLocale_ self
    fun getParent self = (AtkObjectClass.FFI.withPtr false ---> AtkObjectClass.FFI.fromPtr false) getParent_ self
    fun getRole self = (AtkObjectClass.FFI.withPtr false ---> AtkRole.FFI.fromVal) getRole_ self
    fun notifyStateChange self (state, value) =
      (
        AtkObjectClass.FFI.withPtr false
         &&&> AtkState.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        notifyStateChange_
        (
          self
           & state
           & value
        )
    fun peekParent self = (AtkObjectClass.FFI.withPtr false ---> AtkObjectClass.FFI.fromPtr false) peekParent_ self
    fun refAccessibleChild self i = (AtkObjectClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> AtkObjectClass.FFI.fromPtr true) refAccessibleChild_ (self & i)
    fun refRelationSet self = (AtkObjectClass.FFI.withPtr false ---> AtkRelationSetClass.FFI.fromPtr true) refRelationSet_ self
    fun refStateSet self = (AtkObjectClass.FFI.withPtr false ---> AtkStateSetClass.FFI.fromPtr true) refStateSet_ self
    fun removePropertyChangeHandler self handlerId = (AtkObjectClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) removePropertyChangeHandler_ (self & handlerId)
    fun removeRelationship self (relationship, target) =
      (
        AtkObjectClass.FFI.withPtr false
         &&&> AtkRelationType.FFI.withVal
         &&&> AtkObjectClass.FFI.withPtr false
         ---> GBool.FFI.fromVal
      )
        removeRelationship_
        (
          self
           & relationship
           & target
        )
    fun setDescription self description = (AtkObjectClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setDescription_ (self & description)
    fun setName self name = (AtkObjectClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setName_ (self & name)
    fun setParent self parent = (AtkObjectClass.FFI.withPtr false &&&> AtkObjectClass.FFI.withPtr false ---> I) setParent_ (self & parent)
    fun setRole self role = (AtkObjectClass.FFI.withPtr false &&&> AtkRole.FFI.withVal ---> I) setRole_ (self & role)
    local
      open ClosureMarshal Signal
    in
      fun focusEventSig f = signal "focus-event" (get 0w1 boolean ---> ret_void) f
      fun stateChangeSig f = signal "state-change" (get 0w1 string &&&> get 0w2 boolean ---> ret_void) (fn arg1 & arg2 => f (arg1, arg2))
      fun visibleDataChangedSig f = signal "visible-data-changed" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val accessibleComponentLayerProp =
        {
          name = "accessible-component-layer",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val accessibleComponentMdiZorderProp =
        {
          name = "accessible-component-mdi-zorder",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val accessibleDescriptionProp =
        {
          name = "accessible-description",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val accessibleHypertextNlinksProp =
        {
          name = "accessible-hypertext-nlinks",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val accessibleNameProp =
        {
          name = "accessible-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val accessibleParentProp =
        {
          name = "accessible-parent",
          gtype = fn () => C.gtype AtkObjectClass.tOpt (),
          get = fn x => fn () => C.get AtkObjectClass.tOpt x,
          set = fn x => C.set AtkObjectClass.tOpt x,
          init = fn x => C.set AtkObjectClass.tOpt x
        }
      val accessibleRoleProp =
        {
          name = "accessible-role",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val accessibleTableCaptionProp =
        {
          name = "accessible-table-caption",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val accessibleTableCaptionObjectProp =
        {
          name = "accessible-table-caption-object",
          gtype = fn () => C.gtype AtkObjectClass.tOpt (),
          get = fn x => fn () => C.get AtkObjectClass.tOpt x,
          set = fn x => C.set AtkObjectClass.tOpt x,
          init = fn x => C.set AtkObjectClass.tOpt x
        }
      val accessibleTableColumnDescriptionProp =
        {
          name = "accessible-table-column-description",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val accessibleTableColumnHeaderProp =
        {
          name = "accessible-table-column-header",
          gtype = fn () => C.gtype AtkObjectClass.tOpt (),
          get = fn x => fn () => C.get AtkObjectClass.tOpt x,
          set = fn x => C.set AtkObjectClass.tOpt x,
          init = fn x => C.set AtkObjectClass.tOpt x
        }
      val accessibleTableRowDescriptionProp =
        {
          name = "accessible-table-row-description",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val accessibleTableRowHeaderProp =
        {
          name = "accessible-table-row-header",
          gtype = fn () => C.gtype AtkObjectClass.tOpt (),
          get = fn x => fn () => C.get AtkObjectClass.tOpt x,
          set = fn x => C.set AtkObjectClass.tOpt x,
          init = fn x => C.set AtkObjectClass.tOpt x
        }
      val accessibleTableSummaryProp =
        {
          name = "accessible-table-summary",
          gtype = fn () => C.gtype AtkObjectClass.tOpt (),
          get = fn x => fn () => C.get AtkObjectClass.tOpt x,
          set = fn x => C.set AtkObjectClass.tOpt x,
          init = fn x => C.set AtkObjectClass.tOpt x
        }
      val accessibleValueProp =
        {
          name = "accessible-value",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
    end
  end
