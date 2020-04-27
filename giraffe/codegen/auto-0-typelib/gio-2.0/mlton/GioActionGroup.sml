structure GioActionGroup :>
  GIO_ACTION_GROUP
    where type 'a class = 'a GioActionGroupClass.class =
  struct
    val getType_ = _import "g_action_group_get_type" : unit -> GObjectType.FFI.val_;
    val actionAdded_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_action_group_action_added" :
              GioActionGroupClass.FFI.notnull GioActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              GioActionGroupClass.FFI.notnull GioActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GBool.FFI.val_
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
              GioActionGroupClass.FFI.notnull GioActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              GioActionGroupClass.FFI.notnull GioActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p
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
              GioActionGroupClass.FFI.notnull GioActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.FFI.p
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
              GioActionGroupClass.FFI.notnull GioActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p
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
              GioActionGroupClass.FFI.notnull GioActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
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
              GioActionGroupClass.FFI.notnull GioActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit GLibVariantTypeRecord.FFI.p;
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
              GioActionGroupClass.FFI.notnull GioActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit GLibVariantRecord.FFI.p;
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
              GioActionGroupClass.FFI.notnull GioActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit GLibVariantRecord.FFI.p;
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
              GioActionGroupClass.FFI.notnull GioActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit GLibVariantTypeRecord.FFI.p;
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
              GioActionGroupClass.FFI.notnull GioActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val listActions_ = _import "g_action_group_list_actions" : GioActionGroupClass.FFI.notnull GioActionGroupClass.FFI.p -> Utf8CPtrArray.FFI.notnull Utf8CPtrArray.FFI.out_p;
    val queryAction_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "mlton_g_action_group_query_action" :
              GioActionGroupClass.FFI.notnull GioActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GBool.FFI.ref_
               * (unit, GLibVariantTypeRecord.FFI.notnull) GLibVariantTypeRecord.FFI.r
               * (unit, GLibVariantTypeRecord.FFI.notnull) GLibVariantTypeRecord.FFI.r
               * (unit, GLibVariantRecord.FFI.notnull) GLibVariantRecord.FFI.r
               * (unit, GLibVariantRecord.FFI.notnull) GLibVariantRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    type 'a class = 'a GioActionGroupClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun actionAdded self actionName = (GioActionGroupClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) actionAdded_ (self & actionName)
    fun actionEnabledChanged self (actionName, enabled) =
      (
        GioActionGroupClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        actionEnabledChanged_
        (
          self
           & actionName
           & enabled
        )
    fun actionRemoved self actionName = (GioActionGroupClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) actionRemoved_ (self & actionName)
    fun actionStateChanged self (actionName, state) =
      (
        GioActionGroupClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withPtr
         ---> I
      )
        actionStateChanged_
        (
          self
           & actionName
           & state
        )
    fun activateAction self (actionName, parameter) =
      (
        GioActionGroupClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         ---> I
      )
        activateAction_
        (
          self
           & actionName
           & parameter
        )
    fun changeActionState self (actionName, value) =
      (
        GioActionGroupClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withPtr
         ---> I
      )
        changeActionState_
        (
          self
           & actionName
           & value
        )
    fun getActionEnabled self actionName = (GioActionGroupClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) getActionEnabled_ (self & actionName)
    fun getActionParameterType self actionName = (GioActionGroupClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromOptPtr false) getActionParameterType_ (self & actionName)
    fun getActionState self actionName = (GioActionGroupClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GLibVariantRecord.FFI.fromOptPtr true) getActionState_ (self & actionName)
    fun getActionStateHint self actionName = (GioActionGroupClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GLibVariantRecord.FFI.fromOptPtr true) getActionStateHint_ (self & actionName)
    fun getActionStateType self actionName = (GioActionGroupClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromOptPtr false) getActionStateType_ (self & actionName)
    fun hasAction self actionName = (GioActionGroupClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hasAction_ (self & actionName)
    fun listActions self = (GioActionGroupClass.FFI.withPtr ---> Utf8CPtrArray.FFI.fromPtr 2) listActions_ self
    fun queryAction self actionName =
      let
        val enabled
         & parameterType
         & stateType
         & stateHint
         & state
         & retVal =
          (
            GioActionGroupClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GBool.FFI.withRefVal
             &&&> GLibVariantTypeRecord.FFI.withRefOptPtr
             &&&> GLibVariantTypeRecord.FFI.withRefOptPtr
             &&&> GLibVariantRecord.FFI.withRefOptPtr
             &&&> GLibVariantRecord.FFI.withRefOptPtr
             ---> GBool.FFI.fromVal
                   && GLibVariantTypeRecord.FFI.fromPtr true
                   && GLibVariantTypeRecord.FFI.fromPtr true
                   && GLibVariantRecord.FFI.fromPtr true
                   && GLibVariantRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
          )
            queryAction_
            (
              self
               & actionName
               & GBool.null
               & NONE
               & NONE
               & NONE
               & NONE
            )
      in
        if retVal
        then
          SOME
            (
              enabled,
              parameterType,
              stateType,
              stateHint,
              state
            )
        else NONE
      end
    local
      open ClosureMarshal Signal
    in
      fun actionAddedSig f = signal "action-added" (get 0w1 string ---> ret_void) f
      fun actionEnabledChangedSig f = signal "action-enabled-changed" (get 0w1 string &&&> get 0w2 boolean ---> ret_void) (fn actionName & enabled => f (actionName, enabled))
      fun actionRemovedSig f = signal "action-removed" (get 0w1 string ---> ret_void) f
      fun actionStateChangedSig f = signal "action-state-changed" (get 0w1 string &&&> get 0w2 GLibVariantRecord.t ---> ret_void) (fn actionName & value => f (actionName, value))
    end
  end
