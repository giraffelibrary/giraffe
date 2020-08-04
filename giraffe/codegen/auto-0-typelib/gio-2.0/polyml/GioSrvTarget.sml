structure GioSrvTarget :>
  GIO_SRV_TARGET
    where type t = GioSrvTargetRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_srv_target_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "g_srv_target_new")
          (
            Utf8.PolyML.cInPtr
             &&> GUInt16.PolyML.cVal
             &&> GUInt16.PolyML.cVal
             &&> GUInt16.PolyML.cVal
             --> GioSrvTargetRecord.PolyML.cPtr
          )
      val copy_ = call (getSymbol "g_srv_target_copy") (GioSrvTargetRecord.PolyML.cPtr --> GioSrvTargetRecord.PolyML.cPtr)
      val getHostname_ = call (getSymbol "g_srv_target_get_hostname") (GioSrvTargetRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPort_ = call (getSymbol "g_srv_target_get_port") (GioSrvTargetRecord.PolyML.cPtr --> GUInt16.PolyML.cVal)
      val getPriority_ = call (getSymbol "g_srv_target_get_priority") (GioSrvTargetRecord.PolyML.cPtr --> GUInt16.PolyML.cVal)
      val getWeight_ = call (getSymbol "g_srv_target_get_weight") (GioSrvTargetRecord.PolyML.cPtr --> GUInt16.PolyML.cVal)
    end
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
