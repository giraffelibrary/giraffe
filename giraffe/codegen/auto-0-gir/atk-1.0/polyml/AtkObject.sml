structure AtkObject :>
  ATK_OBJECT
    where type 'a class = 'a AtkObjectClass.class
    where type state_t = AtkState.t
    where type 'a relation_set_class = 'a AtkRelationSetClass.class
    where type 'a state_set_class = 'a AtkStateSetClass.class
    where type relation_type_t = AtkRelationType.t
    where type role_t = AtkRole.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_object_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val addRelationship_ =
        call (load_sym libatk "atk_object_add_relationship")
          (
            AtkObjectClass.PolyML.cPtr
             &&> AtkRelationType.PolyML.cVal
             &&> AtkObjectClass.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val getDescription_ = call (load_sym libatk "atk_object_get_description") (AtkObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getIndexInParent_ = call (load_sym libatk "atk_object_get_index_in_parent") (AtkObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getNAccessibleChildren_ = call (load_sym libatk "atk_object_get_n_accessible_children") (AtkObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getName_ = call (load_sym libatk "atk_object_get_name") (AtkObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getParent_ = call (load_sym libatk "atk_object_get_parent") (AtkObjectClass.PolyML.cPtr --> AtkObjectClass.PolyML.cPtr)
      val getRole_ = call (load_sym libatk "atk_object_get_role") (AtkObjectClass.PolyML.cPtr --> AtkRole.PolyML.cVal)
      val notifyStateChange_ =
        call (load_sym libatk "atk_object_notify_state_change")
          (
            AtkObjectClass.PolyML.cPtr
             &&> AtkState.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val refAccessibleChild_ = call (load_sym libatk "atk_object_ref_accessible_child") (AtkObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> AtkObjectClass.PolyML.cPtr)
      val refRelationSet_ = call (load_sym libatk "atk_object_ref_relation_set") (AtkObjectClass.PolyML.cPtr --> AtkRelationSetClass.PolyML.cPtr)
      val refStateSet_ = call (load_sym libatk "atk_object_ref_state_set") (AtkObjectClass.PolyML.cPtr --> AtkStateSetClass.PolyML.cPtr)
      val removePropertyChangeHandler_ = call (load_sym libatk "atk_object_remove_property_change_handler") (AtkObjectClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
      val removeRelationship_ =
        call (load_sym libatk "atk_object_remove_relationship")
          (
            AtkObjectClass.PolyML.cPtr
             &&> AtkRelationType.PolyML.cVal
             &&> AtkObjectClass.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val setDescription_ = call (load_sym libatk "atk_object_set_description") (AtkObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setName_ = call (load_sym libatk "atk_object_set_name") (AtkObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setParent_ = call (load_sym libatk "atk_object_set_parent") (AtkObjectClass.PolyML.cPtr &&> AtkObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setRole_ = call (load_sym libatk "atk_object_set_role") (AtkObjectClass.PolyML.cPtr &&> AtkRole.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a AtkObjectClass.class
    type state_t = AtkState.t
    type 'a relation_set_class = 'a AtkRelationSetClass.class
    type 'a state_set_class = 'a AtkStateSetClass.class
    type relation_type_t = AtkRelationType.t
    type role_t = AtkRole.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addRelationship self relationship target =
      (
        AtkObjectClass.C.withPtr
         &&&> AtkRelationType.C.withVal
         &&&> AtkObjectClass.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        addRelationship_
        (
          self
           & relationship
           & target
        )
    fun getDescription self = (AtkObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getDescription_ self
    fun getIndexInParent self = (AtkObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getIndexInParent_ self
    fun getNAccessibleChildren self = (AtkObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNAccessibleChildren_ self
    fun getName self = (AtkObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getParent self = (AtkObjectClass.C.withPtr ---> AtkObjectClass.C.fromPtr false) getParent_ self
    fun getRole self = (AtkObjectClass.C.withPtr ---> AtkRole.C.fromVal) getRole_ self
    fun notifyStateChange self state value =
      (
        AtkObjectClass.C.withPtr
         &&&> AtkState.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        notifyStateChange_
        (
          self
           & state
           & value
        )
    fun refAccessibleChild self i = (AtkObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> AtkObjectClass.C.fromPtr true) refAccessibleChild_ (self & i)
    fun refRelationSet self = (AtkObjectClass.C.withPtr ---> AtkRelationSetClass.C.fromPtr true) refRelationSet_ self
    fun refStateSet self = (AtkObjectClass.C.withPtr ---> AtkStateSetClass.C.fromPtr true) refStateSet_ self
    fun removePropertyChangeHandler self handlerId = (AtkObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) removePropertyChangeHandler_ (self & handlerId)
    fun removeRelationship self relationship target =
      (
        AtkObjectClass.C.withPtr
         &&&> AtkRelationType.C.withVal
         &&&> AtkObjectClass.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        removeRelationship_
        (
          self
           & relationship
           & target
        )
    fun setDescription self description = (AtkObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setDescription_ (self & description)
    fun setName self name = (AtkObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setName_ (self & name)
    fun setParent self parent = (AtkObjectClass.C.withPtr &&&> AtkObjectClass.C.withPtr ---> I) setParent_ (self & parent)
    fun setRole self role = (AtkObjectClass.C.withPtr &&&> AtkRole.C.withVal ---> I) setRole_ (self & role)
    local
      open ClosureMarshal Signal
    in
      fun focusEventSig f = signal "focus-event" (get 0w1 boolean ---> ret_void) f
      fun stateChangeSig f = signal "state-change" (get 0w1 string &&&> get 0w2 boolean ---> ret_void) (fn object & p0 => f object p0)
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
          set = fn x => set "accessible-description" stringOpt x
        }
      val accessibleHypertextNlinksProp = {get = fn x => get "accessible-hypertext-nlinks" int x}
      val accessibleNameProp =
        {
          get = fn x => get "accessible-name" stringOpt x,
          set = fn x => set "accessible-name" stringOpt x
        }
      val accessibleParentProp =
        {
          get = fn x => get "accessible-parent" AtkObjectClass.tOpt x,
          set = fn x => set "accessible-parent" AtkObjectClass.tOpt x
        }
      val accessibleRoleProp =
        {
          get = fn x => get "accessible-role" int x,
          set = fn x => set "accessible-role" int x
        }
      val accessibleTableCaptionProp =
        {
          get = fn x => get "accessible-table-caption" stringOpt x,
          set = fn x => set "accessible-table-caption" stringOpt x
        }
      val accessibleTableCaptionObjectProp =
        {
          get = fn x => get "accessible-table-caption-object" AtkObjectClass.tOpt x,
          set = fn x => set "accessible-table-caption-object" AtkObjectClass.tOpt x
        }
      val accessibleTableColumnDescriptionProp =
        {
          get = fn x => get "accessible-table-column-description" stringOpt x,
          set = fn x => set "accessible-table-column-description" stringOpt x
        }
      val accessibleTableColumnHeaderProp =
        {
          get = fn x => get "accessible-table-column-header" AtkObjectClass.tOpt x,
          set = fn x => set "accessible-table-column-header" AtkObjectClass.tOpt x
        }
      val accessibleTableRowDescriptionProp =
        {
          get = fn x => get "accessible-table-row-description" stringOpt x,
          set = fn x => set "accessible-table-row-description" stringOpt x
        }
      val accessibleTableRowHeaderProp =
        {
          get = fn x => get "accessible-table-row-header" AtkObjectClass.tOpt x,
          set = fn x => set "accessible-table-row-header" AtkObjectClass.tOpt x
        }
      val accessibleTableSummaryProp =
        {
          get = fn x => get "accessible-table-summary" AtkObjectClass.tOpt x,
          set = fn x => set "accessible-table-summary" AtkObjectClass.tOpt x
        }
      val accessibleValueProp =
        {
          get = fn x => get "accessible-value" double x,
          set = fn x => set "accessible-value" double x
        }
    end
  end
