structure GioActionGroup :>
  GIO_ACTION_GROUP
    where type 'a class_t = 'a GioActionGroupClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_action_group_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val actionAdded_ = call (load_sym libgio "g_action_group_action_added") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val actionEnabledChanged_ =
        call (load_sym libgio "g_action_group_action_enabled_changed")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val actionRemoved_ = call (load_sym libgio "g_action_group_action_removed") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val actionStateChanged_ =
        call (load_sym libgio "g_action_group_action_state_changed")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val activateAction_ =
        call (load_sym libgio "g_action_group_activate_action")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val changeActionState_ =
        call (load_sym libgio "g_action_group_change_action_state")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getActionEnabled_ = call (load_sym libgio "g_action_group_get_action_enabled") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val getActionParameterType_ = call (load_sym libgio "g_action_group_get_action_parameter_type") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val getActionState_ = call (load_sym libgio "g_action_group_get_action_state") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cPtr)
      val getActionStateHint_ = call (load_sym libgio "g_action_group_get_action_state_hint") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cPtr)
      val getActionStateType_ = call (load_sym libgio "g_action_group_get_action_state_type") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val hasAction_ = call (load_sym libgio "g_action_group_has_action") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class_t = 'a GioActionGroupClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun actionAdded self actionName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) actionAdded_ (self & actionName)
    fun actionEnabledChanged self actionName enabled =
      (
        GObjectObjectClass.C.withPtr
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
    fun actionRemoved self actionName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) actionRemoved_ (self & actionName)
    fun actionStateChanged self actionName state =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun getActionEnabled self actionName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) getActionEnabled_ (self & actionName)
    fun getActionParameterType self actionName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GLibVariantTypeRecord.C.fromPtr false) getActionParameterType_ (self & actionName)
    fun getActionState self actionName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getActionState_ (self & actionName)
    fun getActionStateHint self actionName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getActionStateHint_ (self & actionName)
    fun getActionStateType self actionName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GLibVariantTypeRecord.C.fromPtr true) getActionStateType_ (self & actionName)
    fun hasAction self actionName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasAction_ (self & actionName)
    local
      open ClosureMarshal Signal
    in
      fun actionAddedSig f = signal "action-added" (get 0w1 string ---> ret_void) f
      fun actionEnabledChangedSig f = signal "action-enabled-changed" (get 0w1 string &&&> get 0w2 boolean ---> ret_void) (fn actionName & enabled => f actionName enabled)
      fun actionRemovedSig f = signal "action-removed" (get 0w1 string ---> ret_void) f
      fun actionStateChangedSig f = signal "action-state-changed" (get 0w1 string &&&> get 0w2 GLibVariantRecord.t ---> ret_void) (fn actionName & value => f actionName value)
    end
  end
