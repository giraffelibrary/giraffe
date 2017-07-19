structure AtkObject :>
  ATK_OBJECT
    where type 'a class = 'a AtkObjectClass.class
    where type 'a relation_set_class = 'a AtkRelationSetClass.class
    where type 'a state_set_class = 'a AtkStateSetClass.class
    where type relation_type_t = AtkRelationType.t
    where type role_t = AtkRole.t =
  struct
    val getType_ = _import "atk_object_get_type" : unit -> GObjectType.FFI.val_;
    val addRelationship_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_object_add_relationship" :
              AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p
               * AtkRelationType.FFI.val_
               * AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getDescription_ = _import "atk_object_get_description" : AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getIndexInParent_ = _import "atk_object_get_index_in_parent" : AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p -> GInt32.FFI.val_;
    val getNAccessibleChildren_ = _import "atk_object_get_n_accessible_children" : AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p -> GInt32.FFI.val_;
    val getName_ = _import "atk_object_get_name" : AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getParent_ = _import "atk_object_get_parent" : AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p -> AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p;
    val getRole_ = _import "atk_object_get_role" : AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p -> AtkRole.FFI.val_;
    val notifyStateChange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_object_notify_state_change" :
              AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p
               * GUInt64.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val refAccessibleChild_ = fn x1 & x2 => (_import "atk_object_ref_accessible_child" : AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p * GInt32.FFI.val_ -> AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p;) (x1, x2)
    val refRelationSet_ = _import "atk_object_ref_relation_set" : AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p -> AtkRelationSetClass.FFI.notnull AtkRelationSetClass.FFI.p;
    val refStateSet_ = _import "atk_object_ref_state_set" : AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p -> AtkStateSetClass.FFI.notnull AtkStateSetClass.FFI.p;
    val removePropertyChangeHandler_ = fn x1 & x2 => (_import "atk_object_remove_property_change_handler" : AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val removeRelationship_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_object_remove_relationship" :
              AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p
               * AtkRelationType.FFI.val_
               * AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setDescription_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_object_set_description" :
              AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_object_set_name" :
              AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setParent_ = fn x1 & x2 => (_import "atk_object_set_parent" : AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p * AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p -> unit;) (x1, x2)
    val setRole_ = fn x1 & x2 => (_import "atk_object_set_role" : AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p * AtkRole.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a AtkObjectClass.class
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
    fun getNAccessibleChildren self = (AtkObjectClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNAccessibleChildren_ self
    fun getName self = (AtkObjectClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
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
      fun stateChangeSig f = signal "state-change" (get 0w1 string &&&> get 0w2 boolean ---> ret_void) (fn object & p0 => f (object, p0))
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
