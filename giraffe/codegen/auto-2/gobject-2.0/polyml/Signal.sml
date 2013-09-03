structure Signal :>
  SIGNAL
    where type 'a objectclass_t = 'a GObjectObjectClass.t
    where type 'a marshaller = 'a GObjectClosure.marshaller =
  struct
    type 'a objectclass_t = 'a GObjectObjectClass.t
    type 'a marshaller = 'a GObjectClosure.marshaller

    local
      open PolyMLFFI
    in
      val signalConnectClosure_ =
        PolyMLFFI.call
          (
            if GiraffeDebug.isEnabled
            then
              PolyMLFFI.load_sym
                libgiraffegobject
                "giraffe_debug_g_signal_connect_closure"
            else
              PolyMLFFI.load_sym libgobject "g_signal_connect_closure"
          )
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GObjectClosureRecord.PolyML.PTR
             &&> FFI.PolyML.Bool.VAL
             --> FFI.PolyML.ULong.VAL
          );

      val signalHandlerDisconnect_ =
        PolyMLFFI.call
          (PolyMLFFI.load_sym libgobject "g_signal_handler_disconnect")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.ULong.VAL
             --> FFI.PolyML.VOID
          );

      val signalHandlerIsConnected_ =
        PolyMLFFI.call
          (PolyMLFFI.load_sym libgobject "g_signal_handler_is_connected")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.ULong.VAL
             --> FFI.PolyML.Bool.VAL
          );
    end

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
