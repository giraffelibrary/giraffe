structure AtkObject :>
  ATK_OBJECT
    where type 'a class = 'a AtkObjectClass.class
    where type layer_t = AtkLayer.t
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
      val getIndexInParent_ = call (getSymbol "atk_object_get_index_in_parent") (AtkObjectClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getLayer_ = call (getSymbol "atk_object_get_layer") (AtkObjectClass.PolyML.cPtr --> AtkLayer.PolyML.cVal)
      val getMdiZorder_ = call (getSymbol "atk_object_get_mdi_zorder") (AtkObjectClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getNAccessibleChildren_ = call (getSymbol "atk_object_get_n_accessible_children") (AtkObjectClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getName_ = call (getSymbol "atk_object_get_name") (AtkObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getObjectLocale_ = call (getSymbol "atk_object_get_object_locale") (AtkObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getParent_ = call (getSymbol "atk_object_get_parent") (AtkObjectClass.PolyML.cPtr --> AtkObjectClass.PolyML.cPtr)
      val getRole_ = call (getSymbol "atk_object_get_role") (AtkObjectClass.PolyML.cPtr --> AtkRole.PolyML.cVal)
      val notifyStateChange_ =
        call (getSymbol "atk_object_notify_state_change")
          (
            AtkObjectClass.PolyML.cPtr
             &&> GUInt64.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val peekParent_ = call (getSymbol "atk_object_peek_parent") (AtkObjectClass.PolyML.cPtr --> AtkObjectClass.PolyML.cPtr)
      val refAccessibleChild_ = call (getSymbol "atk_object_ref_accessible_child") (AtkObjectClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> AtkObjectClass.PolyML.cPtr)
      val refRelationSet_ = call (getSymbol "atk_object_ref_relation_set") (AtkObjectClass.PolyML.cPtr --> AtkRelationSetClass.PolyML.cPtr)
      val refStateSet_ = call (getSymbol "atk_object_ref_state_set") (AtkObjectClass.PolyML.cPtr --> AtkStateSetClass.PolyML.cPtr)
      val removePropertyChangeHandler_ = call (getSymbol "atk_object_remove_property_change_handler") (AtkObjectClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
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
    type 'a relation_set_class = 'a AtkRelationSetClass.class
    type 'a state_set_class = 'a AtkStateSetClass.class
    type relation_type_t = AtkRelationType.t
    type role_t = AtkRole.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addRelationship self (relationship, target) =
      (
        AtkObjectClass.FFI.withPtr
         &&&> AtkRelationType.FFI.withVal
         &&&> AtkObjectClass.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        addRelationship_
        (
          self
           & relationship
           & target
        )
    fun getDescription self = (AtkObjectClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDescription_ self
    fun getIndexInParent self = (AtkObjectClass.FFI.withPtr ---> GInt32.FFI.fromVal) getIndexInParent_ self
    fun getLayer self = (AtkObjectClass.FFI.withPtr ---> AtkLayer.FFI.fromVal) getLayer_ self
    fun getMdiZorder self = (AtkObjectClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMdiZorder_ self
    fun getNAccessibleChildren self = (AtkObjectClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNAccessibleChildren_ self
    fun getName self = (AtkObjectClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getObjectLocale self = (AtkObjectClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getObjectLocale_ self
    fun getParent self = (AtkObjectClass.FFI.withPtr ---> AtkObjectClass.FFI.fromPtr false) getParent_ self
    fun getRole self = (AtkObjectClass.FFI.withPtr ---> AtkRole.FFI.fromVal) getRole_ self
    fun notifyStateChange self (state, value) =
      (
        AtkObjectClass.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        notifyStateChange_
        (
          self
           & state
           & value
        )
    fun peekParent self = (AtkObjectClass.FFI.withPtr ---> AtkObjectClass.FFI.fromPtr false) peekParent_ self
    fun refAccessibleChild self i = (AtkObjectClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> AtkObjectClass.FFI.fromPtr true) refAccessibleChild_ (self & i)
    fun refRelationSet self = (AtkObjectClass.FFI.withPtr ---> AtkRelationSetClass.FFI.fromPtr true) refRelationSet_ self
    fun refStateSet self = (AtkObjectClass.FFI.withPtr ---> AtkStateSetClass.FFI.fromPtr true) refStateSet_ self
    fun removePropertyChangeHandler self handlerId = (AtkObjectClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) removePropertyChangeHandler_ (self & handlerId)
    fun removeRelationship self (relationship, target) =
      (
        AtkObjectClass.FFI.withPtr
         &&&> AtkRelationType.FFI.withVal
         &&&> AtkObjectClass.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        removeRelationship_
        (
          self
           & relationship
           & target
        )
    fun setDescription self description = (AtkObjectClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setDescription_ (self & description)
    fun setName self name = (AtkObjectClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setName_ (self & name)
    fun setParent self parent = (AtkObjectClass.FFI.withPtr &&&> AtkObjectClass.FFI.withPtr ---> I) setParent_ (self & parent)
    fun setRole self role = (AtkObjectClass.FFI.withPtr &&&> AtkRole.FFI.withVal ---> I) setRole_ (self & role)
    local
      open ClosureMarshal Signal
    in
      fun focusEventSig f = signal "focus-event" (get 0w1 boolean ---> ret_void) f
      fun stateChangeSig f = signal "state-change" (get 0w1 string &&&> get 0w2 boolean ---> ret_void) (fn arg1 & arg2 => f (arg1, arg2))
      fun visibleDataChangedSig f = signal "visible-data-changed" (void ---> ret_void) f
    end
    local
      open Property
    in
      val accessibleComponentLayerProp = {get = fn x => get "accessible-component-layer" int x}
      val accessibleComponentMdiZorderProp = {get = fn x => get "accessible-component-mdi-zorder" int x}
      val accessibleDescriptionProp =
        {
          get = fn x => get "accessible-description" stringOpt x,
          set = fn x => set "accessible-description" stringOpt x,
          new = fn x => new "accessible-description" stringOpt x
        }
      val accessibleHypertextNlinksProp = {get = fn x => get "accessible-hypertext-nlinks" int x}
      val accessibleNameProp =
        {
          get = fn x => get "accessible-name" stringOpt x,
          set = fn x => set "accessible-name" stringOpt x,
          new = fn x => new "accessible-name" stringOpt x
        }
      val accessibleParentProp =
        {
          get = fn x => get "accessible-parent" AtkObjectClass.tOpt x,
          set = fn x => set "accessible-parent" AtkObjectClass.tOpt x,
          new = fn x => new "accessible-parent" AtkObjectClass.tOpt x
        }
      val accessibleRoleProp =
        {
          get = fn x => get "accessible-role" int x,
          set = fn x => set "accessible-role" int x,
          new = fn x => new "accessible-role" int x
        }
      val accessibleTableCaptionProp =
        {
          get = fn x => get "accessible-table-caption" stringOpt x,
          set = fn x => set "accessible-table-caption" stringOpt x,
          new = fn x => new "accessible-table-caption" stringOpt x
        }
      val accessibleTableCaptionObjectProp =
        {
          get = fn x => get "accessible-table-caption-object" AtkObjectClass.tOpt x,
          set = fn x => set "accessible-table-caption-object" AtkObjectClass.tOpt x,
          new = fn x => new "accessible-table-caption-object" AtkObjectClass.tOpt x
        }
      val accessibleTableColumnDescriptionProp =
        {
          get = fn x => get "accessible-table-column-description" stringOpt x,
          set = fn x => set "accessible-table-column-description" stringOpt x,
          new = fn x => new "accessible-table-column-description" stringOpt x
        }
      val accessibleTableColumnHeaderProp =
        {
          get = fn x => get "accessible-table-column-header" AtkObjectClass.tOpt x,
          set = fn x => set "accessible-table-column-header" AtkObjectClass.tOpt x,
          new = fn x => new "accessible-table-column-header" AtkObjectClass.tOpt x
        }
      val accessibleTableRowDescriptionProp =
        {
          get = fn x => get "accessible-table-row-description" stringOpt x,
          set = fn x => set "accessible-table-row-description" stringOpt x,
          new = fn x => new "accessible-table-row-description" stringOpt x
        }
      val accessibleTableRowHeaderProp =
        {
          get = fn x => get "accessible-table-row-header" AtkObjectClass.tOpt x,
          set = fn x => set "accessible-table-row-header" AtkObjectClass.tOpt x,
          new = fn x => new "accessible-table-row-header" AtkObjectClass.tOpt x
        }
      val accessibleTableSummaryProp =
        {
          get = fn x => get "accessible-table-summary" AtkObjectClass.tOpt x,
          set = fn x => set "accessible-table-summary" AtkObjectClass.tOpt x,
          new = fn x => new "accessible-table-summary" AtkObjectClass.tOpt x
        }
      val accessibleValueProp =
        {
          get = fn x => get "accessible-value" double x,
          set = fn x => set "accessible-value" double x,
          new = fn x => new "accessible-value" double x
        }
    end
  end
