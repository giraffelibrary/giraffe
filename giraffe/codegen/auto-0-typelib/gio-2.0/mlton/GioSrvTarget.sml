structure GioSrvTarget :>
  GIO_SRV_TARGET
    where type t = GioSrvTargetRecord.t =
  struct
    val getType_ = _import "g_srv_target_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5 =>
          (
            _import "mlton_g_srv_target_new" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt16.FFI.val_
               * GUInt16.FFI.val_
               * GUInt16.FFI.val_
               -> GioSrvTargetRecord.FFI.non_opt GioSrvTargetRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val copy_ = _import "g_srv_target_copy" : GioSrvTargetRecord.FFI.non_opt GioSrvTargetRecord.FFI.p -> GioSrvTargetRecord.FFI.non_opt GioSrvTargetRecord.FFI.p;
    val getHostname_ = _import "g_srv_target_get_hostname" : GioSrvTargetRecord.FFI.non_opt GioSrvTargetRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPort_ = _import "g_srv_target_get_port" : GioSrvTargetRecord.FFI.non_opt GioSrvTargetRecord.FFI.p -> GUInt16.FFI.val_;
    val getPriority_ = _import "g_srv_target_get_priority" : GioSrvTargetRecord.FFI.non_opt GioSrvTargetRecord.FFI.p -> GUInt16.FFI.val_;
    val getWeight_ = _import "g_srv_target_get_weight" : GioSrvTargetRecord.FFI.non_opt GioSrvTargetRecord.FFI.p -> GUInt16.FFI.val_;
    type t = GioSrvTargetRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        hostname,
        port,
        priority,
        weight
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GUInt16.FFI.withVal
         &&&> GUInt16.FFI.withVal
         &&&> GUInt16.FFI.withVal
         ---> GioSrvTargetRecord.FFI.fromPtr true
      )
        new_
        (
          hostname
           & port
           & priority
           & weight
        )
    fun copy self = (GioSrvTargetRecord.FFI.withPtr false ---> GioSrvTargetRecord.FFI.fromPtr true) copy_ self
    fun getHostname self = (GioSrvTargetRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getHostname_ self
    fun getPort self = (GioSrvTargetRecord.FFI.withPtr false ---> GUInt16.FFI.fromVal) getPort_ self
    fun getPriority self = (GioSrvTargetRecord.FFI.withPtr false ---> GUInt16.FFI.fromVal) getPriority_ self
    fun getWeight self = (GioSrvTargetRecord.FFI.withPtr false ---> GUInt16.FFI.fromVal) getWeight_ self
  end
