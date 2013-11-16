structure GioActionGroup :>
  GIO_ACTION_GROUP
    where type 'a class_t = 'a GioActionGroupClass.t =
  struct
    val getType_ = _import "g_action_group_get_type" : unit -> GObjectType.C.val_;
    val actionAdded_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_action_group_action_added" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val actionEnabledChanged_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_action_group_action_enabled_changed" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val actionRemoved_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_action_group_action_removed" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val actionStateChanged_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_action_group_action_state_changed" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GLibVariantRecord.C.notnull GLibVariantRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val activateAction_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_action_group_activate_action" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * unit GLibVariantRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val changeActionState_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_action_group_change_action_state" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GLibVariantRecord.C.notnull GLibVariantRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getActionEnabled_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_action_group_get_action_enabled" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getActionParameterType_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_action_group_get_action_parameter_type" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GLibVariantTypeRecord.C.notnull GLibVariantTypeRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getActionState_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_action_group_get_action_state" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getActionStateHint_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_action_group_get_action_state_hint" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getActionStateType_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_action_group_get_action_state_type" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GLibVariantTypeRecord.C.notnull GLibVariantTypeRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val hasAction_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_action_group_has_action" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GioActionGroupClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun actionAdded self actionName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) actionAdded_ (self & actionName)
    fun actionEnabledChanged self actionName enabled =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        actionEnabledChanged_
        (
          self
           & actionName
           & enabled
        )
    fun actionRemoved self actionName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) actionRemoved_ (self & actionName)
    fun actionStateChanged self actionName state =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibVariantRecord.C.withPtr
         ---> I
      )
        actionStateChanged_
        (
          self
           & actionName
           & state
        )
    fun activateAction self actionName parameter =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibVariantRecord.C.withOptPtr
         ---> I
      )
        activateAction_
        (
          self
           & actionName
           & parameter
        )
    fun changeActionState self actionName value =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibVariantRecord.C.withPtr
         ---> I
      )
        changeActionState_
        (
          self
           & actionName
           & value
        )
    fun getActionEnabled self actionName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) getActionEnabled_ (self & actionName)
    fun getActionParameterType self actionName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GLibVariantTypeRecord.C.fromPtr false) getActionParameterType_ (self & actionName)
    fun getActionState self actionName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GLibVariantRecord.C.fromPtr true) getActionState_ (self & actionName)
    fun getActionStateHint self actionName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GLibVariantRecord.C.fromPtr true) getActionStateHint_ (self & actionName)
    fun getActionStateType self actionName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GLibVariantTypeRecord.C.fromPtr true) getActionStateType_ (self & actionName)
    fun hasAction self actionName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) hasAction_ (self & actionName)
    local
      open ClosureMarshal Signal
    in
      fun actionAddedSig f = signal "action-added" (get 0w1 string ---> ret_void) f
      fun actionEnabledChangedSig f = signal "action-enabled-changed" (get 0w1 string &&&> get 0w2 boolean ---> ret_void) (fn actionName & enabled => f actionName enabled)
      fun actionRemovedSig f = signal "action-removed" (get 0w1 string ---> ret_void) f
      fun actionStateChangedSig f = signal "action-state-changed" (get 0w1 string &&&> get 0w2 GLibVariantRecord.t ---> ret_void) (fn actionName & value => f actionName value)
    end
  end
