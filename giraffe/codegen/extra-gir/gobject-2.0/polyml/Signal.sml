(* Copyright (C) 2012-2013 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure Signal :>
  SIGNAL
    where type 'a object_class_t = 'a GObjectObjectClass.t
    where type 'a marshaller = 'a GObjectClosure.marshaller =
  struct
    type 'a object_class_t = 'a GObjectObjectClass.t
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
             &&> Utf8.PolyML.INPTR
             &&> GObjectClosureRecord.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.ULong.PolyML.VAL
          );

      val signalHandlerDisconnect_ =
        PolyMLFFI.call
          (PolyMLFFI.load_sym libgobject "g_signal_handler_disconnect")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.ULong.PolyML.VAL
             --> FFI.PolyML.VOID
          );

      val signalHandlerIsConnected_ =
        PolyMLFFI.call
          (PolyMLFFI.load_sym libgobject "g_signal_handler_is_connected")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.ULong.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          );
    end

    type 'object_class signal = string * GObjectClosureRecord.t

    fun signal detailedSignal marshaller callback =
      (detailedSignal, GObjectClosure.new marshaller callback)

    type signal_id = FFI.ULong.C.val_

    fun signalConnectClosure instance detailedSignal closure after =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         &&&> GObjectClosureRecord.C.withPtr
         &&&> FFI.Bool.C.withVal
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
         ---> FFI.Bool.C.fromVal
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
