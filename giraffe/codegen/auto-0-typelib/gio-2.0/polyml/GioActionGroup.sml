structure GioActionGroup :>
  GIO_ACTION_GROUP
    where type 'a class = 'a GioActionGroupClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_action_group_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val actionAdded_ = call (getSymbol "g_action_group_action_added") (GioActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val actionEnabledChanged_ =
        call (getSymbol "g_action_group_action_enabled_changed")
          (
            GioActionGroupClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val actionRemoved_ = call (getSymbol "g_action_group_action_removed") (GioActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val actionStateChanged_ =
        call (getSymbol "g_action_group_action_state_changed")
          (
            GioActionGroupClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cPtr
             --> cVoid
          )
      val activateAction_ =
        call (getSymbol "g_action_group_activate_action")
          (
            GioActionGroupClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             --> cVoid
          )
      val changeActionState_ =
        call (getSymbol "g_action_group_change_action_state")
          (
            GioActionGroupClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cPtr
             --> cVoid
          )
      val getActionEnabled_ = call (getSymbol "g_action_group_get_action_enabled") (GioActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val getActionParameterType_ = call (getSymbol "g_action_group_get_action_parameter_type") (GioActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantTypeRecord.PolyML.cOptPtr)
      val getActionState_ = call (getSymbol "g_action_group_get_action_state") (GioActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cOptPtr)
      val getActionStateHint_ = call (getSymbol "g_action_group_get_action_state_hint") (GioActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cOptPtr)
      val getActionStateType_ = call (getSymbol "g_action_group_get_action_state_type") (GioActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantTypeRecord.PolyML.cOptPtr)
      val hasAction_ = call (getSymbol "g_action_group_has_action") (GioActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val listActions_ = call (getSymbol "g_action_group_list_actions") (GioActionGroupClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val queryAction_ =
        call (getSymbol "g_action_group_query_action")
          (
            GioActionGroupClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cRef
             &&> GLibVariantTypeRecord.PolyML.cOutRef
             &&> GLibVariantTypeRecord.PolyML.cOutRef
             &&> GLibVariantRecord.PolyML.cOutRef
             &&> GLibVariantRecord.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GioActionGroupClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun actionAdded self actionName = (GioActionGroupClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) actionAdded_ (self & actionName)
    fun actionEnabledChanged self (actionName, enabled) =
      (
        GioActionGroupClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GBool.FFI.withVal
         ---> I
      )
        actionEnabledChanged_
        (
          self
           & actionName
           & enabled
        )
    fun actionRemoved self actionName = (GioActionGroupClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) actionRemoved_ (self & actionName)
    fun actionStateChanged self (actionName, state) =
      (
        GioActionGroupClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantRecord.FFI.withPtr false
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
        GioActionGroupClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantRecord.FFI.withOptPtr false
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
        GioActionGroupClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantRecord.FFI.withPtr false
         ---> I
      )
        changeActionState_
        (
          self
           & actionName
           & value
        )
    fun getActionEnabled self actionName = (GioActionGroupClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) getActionEnabled_ (self & actionName)
    fun getActionParameterType self actionName = (GioActionGroupClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GLibVariantTypeRecord.FFI.fromOptPtr false) getActionParameterType_ (self & actionName)
    fun getActionState self actionName = (GioActionGroupClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GLibVariantRecord.FFI.fromOptPtr true) getActionState_ (self & actionName)
    fun getActionStateHint self actionName = (GioActionGroupClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GLibVariantRecord.FFI.fromOptPtr true) getActionStateHint_ (self & actionName)
    fun getActionStateType self actionName = (GioActionGroupClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GLibVariantTypeRecord.FFI.fromOptPtr false) getActionStateType_ (self & actionName)
    fun hasAction self actionName = (GioActionGroupClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hasAction_ (self & actionName)
    fun listActions self = (GioActionGroupClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr ~1) listActions_ self
    fun queryAction self actionName =
      let
        val enabled
         & parameterType
         & stateType
         & stateHint
         & state
         & retVal =
          (
            GioActionGroupClass.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GBool.FFI.withRefVal
             &&&> GLibVariantTypeRecord.FFI.withRefOptPtr true
             &&&> GLibVariantTypeRecord.FFI.withRefOptPtr true
             &&&> GLibVariantRecord.FFI.withRefOptPtr true
             &&&> GLibVariantRecord.FFI.withRefOptPtr true
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
