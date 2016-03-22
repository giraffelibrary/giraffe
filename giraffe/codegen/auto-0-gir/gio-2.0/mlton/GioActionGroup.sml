structure GioActionGroup :>
  GIO_ACTION_GROUP
    where type 'a class = 'a GioActionGroupClass.class =
  struct
    val getType_ = _import "g_action_group_get_type" : unit -> GObjectType.C.val_;
    val actionAdded_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_action_group_action_added" :
              GioActionGroupClass.C.notnull GioActionGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioActionGroupClass.C.notnull GioActionGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioActionGroupClass.C.notnull GioActionGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioActionGroupClass.C.notnull GioActionGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioActionGroupClass.C.notnull GioActionGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioActionGroupClass.C.notnull GioActionGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioActionGroupClass.C.notnull GioActionGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioActionGroupClass.C.notnull GioActionGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioActionGroupClass.C.notnull GioActionGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioActionGroupClass.C.notnull GioActionGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioActionGroupClass.C.notnull GioActionGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GioActionGroupClass.C.notnull GioActionGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioActionGroupClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun actionAdded self actionName = (GioActionGroupClass.C.withPtr &&&> Utf8.C.withPtr ---> I) actionAdded_ (self & actionName)
    fun actionEnabledChanged self actionName enabled =
      (
        GioActionGroupClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        actionEnabledChanged_
        (
          self
           & actionName
           & enabled
        )
    fun actionRemoved self actionName = (GioActionGroupClass.C.withPtr &&&> Utf8.C.withPtr ---> I) actionRemoved_ (self & actionName)
    fun actionStateChanged self actionName state =
      (
        GioActionGroupClass.C.withPtr
         &&&> Utf8.C.withPtr
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
        GioActionGroupClass.C.withPtr
         &&&> Utf8.C.withPtr
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
        GioActionGroupClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibVariantRecord.C.withPtr
         ---> I
      )
        changeActionState_
        (
          self
           & actionName
           & value
        )
    fun getActionEnabled self actionName = (GioActionGroupClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) getActionEnabled_ (self & actionName)
    fun getActionParameterType self actionName = (GioActionGroupClass.C.withPtr &&&> Utf8.C.withPtr ---> GLibVariantTypeRecord.C.fromPtr false) getActionParameterType_ (self & actionName)
    fun getActionState self actionName = (GioActionGroupClass.C.withPtr &&&> Utf8.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getActionState_ (self & actionName)
    fun getActionStateHint self actionName = (GioActionGroupClass.C.withPtr &&&> Utf8.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getActionStateHint_ (self & actionName)
    fun getActionStateType self actionName = (GioActionGroupClass.C.withPtr &&&> Utf8.C.withPtr ---> GLibVariantTypeRecord.C.fromPtr true) getActionStateType_ (self & actionName)
    fun hasAction self actionName = (GioActionGroupClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasAction_ (self & actionName)
    local
      open ClosureMarshal Signal
    in
      fun actionAddedSig f = signal "action-added" (get 0w1 string ---> ret_void) f
      fun actionEnabledChangedSig f = signal "action-enabled-changed" (get 0w1 string &&&> get 0w2 boolean ---> ret_void) (fn actionName & enabled => f actionName enabled)
      fun actionRemovedSig f = signal "action-removed" (get 0w1 string ---> ret_void) f
      fun actionStateChangedSig f = signal "action-state-changed" (get 0w1 string &&&> get 0w2 GLibVariantRecord.t ---> ret_void) (fn actionName & value => f actionName value)
    end
  end
