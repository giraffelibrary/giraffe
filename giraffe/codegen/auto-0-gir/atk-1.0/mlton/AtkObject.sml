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
    val getType_ = _import "atk_object_get_type" : unit -> GObjectType.FFI.val_;
    val addRelationship_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_object_add_relationship" :
              AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p
               * AtkRelationType.FFI.val_
               * AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getDescription_ = _import "atk_object_get_description" : AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getIndexInParent_ = _import "atk_object_get_index_in_parent" : AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p -> GInt.FFI.val_;
    val getLayer_ = _import "atk_object_get_layer" : AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p -> AtkLayer.FFI.val_;
    val getMdiZorder_ = _import "atk_object_get_mdi_zorder" : AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p -> GInt.FFI.val_;
    val getNAccessibleChildren_ = _import "atk_object_get_n_accessible_children" : AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p -> GInt.FFI.val_;
    val getName_ = _import "atk_object_get_name" : AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getObjectLocale_ = _import "atk_object_get_object_locale" : AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getParent_ = _import "atk_object_get_parent" : AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p -> AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p;
    val getRole_ = _import "atk_object_get_role" : AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p -> AtkRole.FFI.val_;
    val notifyStateChange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_object_notify_state_change" :
              AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p
               * AtkState.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val peekParent_ = _import "atk_object_peek_parent" : AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p -> AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p;
    val refAccessibleChild_ = fn x1 & x2 => (_import "atk_object_ref_accessible_child" : AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p * GInt.FFI.val_ -> AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p;) (x1, x2)
    val refRelationSet_ = _import "atk_object_ref_relation_set" : AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p -> AtkRelationSetClass.FFI.non_opt AtkRelationSetClass.FFI.p;
    val refStateSet_ = _import "atk_object_ref_state_set" : AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p -> AtkStateSetClass.FFI.non_opt AtkStateSetClass.FFI.p;
    val removePropertyChangeHandler_ = fn x1 & x2 => (_import "atk_object_remove_property_change_handler" : AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val removeRelationship_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_object_remove_relationship" :
              AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p
               * AtkRelationType.FFI.val_
               * AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p
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
              AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setParent_ = fn x1 & x2 => (_import "atk_object_set_parent" : AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p * AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p -> unit;) (x1, x2)
    val setRole_ = fn x1 & x2 => (_import "atk_object_set_role" : AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p * AtkRole.FFI.val_ -> unit;) (x1, x2)
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
    fun getDescription self = (AtkObjectClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDescription_ self before AtkObjectClass.FFI.touchPtr self
    fun getIndexInParent self = (AtkObjectClass.FFI.withPtr false ---> GInt.FFI.fromVal) getIndexInParent_ self
    fun getLayer self = (AtkObjectClass.FFI.withPtr false ---> AtkLayer.FFI.fromVal) getLayer_ self
    fun getMdiZorder self = (AtkObjectClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMdiZorder_ self
    fun getNAccessibleChildren self = (AtkObjectClass.FFI.withPtr false ---> GInt.FFI.fromVal) getNAccessibleChildren_ self
    fun getName self = (AtkObjectClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before AtkObjectClass.FFI.touchPtr self
    fun getObjectLocale self = (AtkObjectClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getObjectLocale_ self before AtkObjectClass.FFI.touchPtr self
    fun getParent self = (AtkObjectClass.FFI.withPtr false ---> AtkObjectClass.FFI.fromPtr false) getParent_ self before AtkObjectClass.FFI.touchPtr self
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
    fun peekParent self = (AtkObjectClass.FFI.withPtr false ---> AtkObjectClass.FFI.fromPtr false) peekParent_ self before AtkObjectClass.FFI.touchPtr self
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
