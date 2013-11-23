structure AtkObject :>
  ATK_OBJECT
    where type 'a class_t = 'a AtkObjectClass.t
    where type state_t = AtkState.t
    where type 'a relationsetclass_t = 'a AtkRelationSetClass.t
    where type 'a statesetclass_t = 'a AtkStateSetClass.t
    where type relationtype_t = AtkRelationType.t
    where type role_t = AtkRole.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_object_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val addRelationship_ =
        call (load_sym libatk "atk_object_add_relationship")
          (
            GObjectObjectClass.PolyML.PTR
             &&> AtkRelationType.PolyML.VAL
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
      val getDescription_ = call (load_sym libatk "atk_object_get_description") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getIndexInParent_ = call (load_sym libatk "atk_object_get_index_in_parent") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getNAccessibleChildren_ = call (load_sym libatk "atk_object_get_n_accessible_children") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getName_ = call (load_sym libatk "atk_object_get_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getParent_ = call (load_sym libatk "atk_object_get_parent") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getRole_ = call (load_sym libatk "atk_object_get_role") (GObjectObjectClass.PolyML.PTR --> AtkRole.PolyML.VAL)
      val notifyStateChange_ =
        call (load_sym libatk "atk_object_notify_state_change")
          (
            GObjectObjectClass.PolyML.PTR
             &&> AtkState.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val refAccessibleChild_ = call (load_sym libatk "atk_object_ref_accessible_child") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val refRelationSet_ = call (load_sym libatk "atk_object_ref_relation_set") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val refStateSet_ = call (load_sym libatk "atk_object_ref_state_set") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val removePropertyChangeHandler_ = call (load_sym libatk "atk_object_remove_property_change_handler") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt.PolyML.VAL --> FFI.PolyML.VOID)
      val removeRelationship_ =
        call (load_sym libatk "atk_object_remove_relationship")
          (
            GObjectObjectClass.PolyML.PTR
             &&> AtkRelationType.PolyML.VAL
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
      val setDescription_ = call (load_sym libatk "atk_object_set_description") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setName_ = call (load_sym libatk "atk_object_set_name") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setParent_ = call (load_sym libatk "atk_object_set_parent") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setRole_ = call (load_sym libatk "atk_object_set_role") (GObjectObjectClass.PolyML.PTR &&> AtkRole.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a AtkObjectClass.t
    type state_t = AtkState.t
    type 'a relationsetclass_t = 'a AtkRelationSetClass.t
    type 'a statesetclass_t = 'a AtkStateSetClass.t
    type relationtype_t = AtkRelationType.t
    type role_t = AtkRole.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addRelationship self relationship target =
      (
        GObjectObjectClass.C.withPtr
         &&&> AtkRelationType.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        addRelationship_
        (
          self
           & relationship
           & target
        )
    fun getDescription self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getDescription_ self
    fun getIndexInParent self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getIndexInParent_ self
    fun getNAccessibleChildren self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNAccessibleChildren_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getName_ self
    fun getParent self = (GObjectObjectClass.C.withPtr ---> AtkObjectClass.C.fromPtr false) getParent_ self
    fun getRole self = (GObjectObjectClass.C.withPtr ---> AtkRole.C.fromVal) getRole_ self
    fun notifyStateChange self state value =
      (
        GObjectObjectClass.C.withPtr
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
    fun refAccessibleChild self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> AtkObjectClass.C.fromPtr true) refAccessibleChild_ (self & i)
    fun refRelationSet self = (GObjectObjectClass.C.withPtr ---> AtkRelationSetClass.C.fromPtr true) refRelationSet_ self
    fun refStateSet self = (GObjectObjectClass.C.withPtr ---> AtkStateSetClass.C.fromPtr true) refStateSet_ self
    fun removePropertyChangeHandler self handlerId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) removePropertyChangeHandler_ (self & handlerId)
    fun removeRelationship self relationship target =
      (
        GObjectObjectClass.C.withPtr
         &&&> AtkRelationType.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        removeRelationship_
        (
          self
           & relationship
           & target
        )
    fun setDescription self description = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setDescription_ (self & description)
    fun setName self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setName_ (self & name)
    fun setParent self parent = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setParent_ (self & parent)
    fun setRole self role = (GObjectObjectClass.C.withPtr &&&> AtkRole.C.withVal ---> I) setRole_ (self & role)
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
