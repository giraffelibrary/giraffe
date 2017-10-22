structure GioRemoteActionGroup :>
  GIO_REMOTE_ACTION_GROUP
    where type 'a class = 'a GioRemoteActionGroupClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_remote_action_group_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val activateActionFull_ =
        call (getSymbol "g_remote_action_group_activate_action_full")
          (
            GioRemoteActionGroupClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             &&> GLibVariantRecord.PolyML.cPtr
             --> cVoid
          )
      val changeActionStateFull_ =
        call (getSymbol "g_remote_action_group_change_action_state_full")
          (
            GioRemoteActionGroupClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cPtr
             &&> GLibVariantRecord.PolyML.cPtr
             --> cVoid
          )
    end
    type 'a class = 'a GioRemoteActionGroupClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun activateActionFull
      self
      (
        actionName,
        parameter,
        platformData
      ) =
      (
        GioRemoteActionGroupClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         &&&> GLibVariantRecord.FFI.withPtr
         ---> I
      )
        activateActionFull_
        (
          self
           & actionName
           & parameter
           & platformData
        )
    fun changeActionStateFull
      self
      (
        actionName,
        value,
        platformData
      ) =
      (
        GioRemoteActionGroupClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withPtr
         ---> I
      )
        changeActionStateFull_
        (
          self
           & actionName
           & value
           & platformData
        )
  end
