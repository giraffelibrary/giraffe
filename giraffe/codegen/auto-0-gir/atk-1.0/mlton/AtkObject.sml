structure AtkObject :>
  ATK_OBJECT
    where type 'a class = 'a AtkObjectClass.class
    where type state_t = AtkState.t
    where type 'a relation_set_class = 'a AtkRelationSetClass.class
    where type 'a state_set_class = 'a AtkStateSetClass.class
    where type relation_type_t = AtkRelationType.t
    where type role_t = AtkRole.t =
  struct
    val getType_ = _import "atk_object_get_type" : unit -> GObjectType.C.val_;
    val addRelationship_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_object_add_relationship" :
              AtkObjectClass.C.notnull AtkObjectClass.C.p
               * AtkRelationType.C.val_
               * AtkObjectClass.C.notnull AtkObjectClass.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getDescription_ = _import "atk_object_get_description" : AtkObjectClass.C.notnull AtkObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getIndexInParent_ = _import "atk_object_get_index_in_parent" : AtkObjectClass.C.notnull AtkObjectClass.C.p -> FFI.Int.C.val_;
    val getNAccessibleChildren_ = _import "atk_object_get_n_accessible_children" : AtkObjectClass.C.notnull AtkObjectClass.C.p -> FFI.Int.C.val_;
    val getName_ = _import "atk_object_get_name" : AtkObjectClass.C.notnull AtkObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getParent_ = _import "atk_object_get_parent" : AtkObjectClass.C.notnull AtkObjectClass.C.p -> AtkObjectClass.C.notnull AtkObjectClass.C.p;
    val getRole_ = _import "atk_object_get_role" : AtkObjectClass.C.notnull AtkObjectClass.C.p -> AtkRole.C.val_;
    val notifyStateChange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_object_notify_state_change" :
              AtkObjectClass.C.notnull AtkObjectClass.C.p
               * AtkState.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val refAccessibleChild_ = fn x1 & x2 => (_import "atk_object_ref_accessible_child" : AtkObjectClass.C.notnull AtkObjectClass.C.p * FFI.Int.C.val_ -> AtkObjectClass.C.notnull AtkObjectClass.C.p;) (x1, x2)
    val refRelationSet_ = _import "atk_object_ref_relation_set" : AtkObjectClass.C.notnull AtkObjectClass.C.p -> AtkRelationSetClass.C.notnull AtkRelationSetClass.C.p;
    val refStateSet_ = _import "atk_object_ref_state_set" : AtkObjectClass.C.notnull AtkObjectClass.C.p -> AtkStateSetClass.C.notnull AtkStateSetClass.C.p;
    val removePropertyChangeHandler_ = fn x1 & x2 => (_import "atk_object_remove_property_change_handler" : AtkObjectClass.C.notnull AtkObjectClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val removeRelationship_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_object_remove_relationship" :
              AtkObjectClass.C.notnull AtkObjectClass.C.p
               * AtkRelationType.C.val_
               * AtkObjectClass.C.notnull AtkObjectClass.C.p
               -> FFI.Bool.C.val_;
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
              AtkObjectClass.C.notnull AtkObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              AtkObjectClass.C.notnull AtkObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setParent_ = fn x1 & x2 => (_import "atk_object_set_parent" : AtkObjectClass.C.notnull AtkObjectClass.C.p * AtkObjectClass.C.notnull AtkObjectClass.C.p -> unit;) (x1, x2)
    val setRole_ = fn x1 & x2 => (_import "atk_object_set_role" : AtkObjectClass.C.notnull AtkObjectClass.C.p * AtkRole.C.val_ -> unit;) (x1, x2)
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
