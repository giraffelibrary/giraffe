structure Signal :>
  SIGNAL
    where type 'a objectclass_t = 'a GObjectObjectClass.t
    where type 'a marshaller = 'a GObjectClosure.marshaller =
  struct
    type 'a objectclass_t = 'a GObjectObjectClass.t
    type 'a marshaller = 'a GObjectClosure.marshaller

    val signalConnectClosure_ =
      fn x1 & (x2, x3) & x4 & x5 =>
        (
          _import "mlton_g_signal_connect_closure" :
            GObjectObjectClass.C.notnull GObjectObjectClass.C.p
             * cstring * unit CPointer.t  (* FFI.String.notnull FFI.String.inp *)
             * GObjectClosureRecord.C.notnull GObjectClosureRecord.C.p
             * FFI.Bool.val_
             -> FFI.ULong.val_;
        )
          (x1, x2, x3, x4, x5)

    val signalHandlerDisconnect_ =
      fn x1 & x2 =>
        (
          _import "g_signal_handler_disconnect" :
            GObjectObjectClass.C.notnull GObjectObjectClass.C.p
             * FFI.ULong.val_
             -> unit;
        )
          (x1, x2)

    val signalHandlerIsConnected_ =
      fn x1 & x2 =>
        (
          _import "g_signal_handler_is_connected" :
            GObjectObjectClass.C.notnull GObjectObjectClass.C.p
             * FFI.ULong.val_
             -> FFI.Bool.val_;
        )
          (x1, x2)

    type 'objectclass signal = string * GObjectClosureRecord.t

    fun signal detailedSignal marshaller callback =
      (detailedSignal, GObjectClosure.new marshaller callback)

    type signal_id = FFI.ULong.val_

    fun signalConnectClosure instance detailedSignal closure after =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GObjectClosureRecord.C.withPtr
         &&&> FFI.Bool.withVal
         ---> I
      )
        signalConnectClosure_
        (
          instance
           & detailedSignal
           & closure
           & after
        )

    fun signalHandlerDisconnect instance handlerId =
      (
        GObjectObjectClass.C.withPtr
         &&&> I
         ---> I
      )
        signalHandlerDisconnect_
        (instance & handlerId)

    fun signalHandlerIsConnected instance handlerId =
      (
        GObjectObjectClass.C.withPtr
         &&&> I
         ---> FFI.Bool.fromVal
      )
        signalHandlerIsConnected_
        (instance & handlerId)


    fun connect instance signal f =
      let
        val (detailedSignal, closure) = signal f
      in
        signalConnectClosure instance detailedSignal closure false
      end

    fun connectAfter instance signal f =
      let
        val (detailedSignal, closure) = signal f
      in
        signalConnectClosure instance detailedSignal closure true
      end

    val disconnect = signalHandlerDisconnect

    val isConnected = signalHandlerIsConnected
  end
