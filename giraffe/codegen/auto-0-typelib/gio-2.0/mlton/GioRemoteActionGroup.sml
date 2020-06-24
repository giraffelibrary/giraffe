structure GioRemoteActionGroup :>
  GIO_REMOTE_ACTION_GROUP
    where type 'a class = 'a GioRemoteActionGroupClass.class =
  struct
    val getType_ = _import "g_remote_action_group_get_type" : unit -> GObjectType.FFI.val_;
    val activateActionFull_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_remote_action_group_activate_action_full" :
              GioRemoteActionGroupClass.FFI.non_opt GioRemoteActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p
               * GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val changeActionStateFull_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_remote_action_group_change_action_state_full" :
              GioRemoteActionGroupClass.FFI.non_opt GioRemoteActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p
               * GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
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
