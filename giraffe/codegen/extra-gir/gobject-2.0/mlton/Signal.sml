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

    val signalConnectClosure_ =
      fn x1 & (x2, x3) & x4 & x5 =>
        (
          _import "mlton_g_signal_connect_closure" :
            GObjectObjectClass.C.notnull GObjectObjectClass.C.p
             * GCharVec.MLton.p1
             * GCharVec.C.notnull GCharVec.MLton.p2
             * GObjectClosureRecord.C.notnull GObjectClosureRecord.C.p
             * FFI.Bool.C.val_
             -> FFI.ULong.C.val_;
        )
          (x1, x2, x3, x4, x5)

    val signalHandlerDisconnect_ =
      fn x1 & x2 =>
        (
          _import "g_signal_handler_disconnect" :
            GObjectObjectClass.C.notnull GObjectObjectClass.C.p
             * FFI.ULong.C.val_
             -> unit;
        )
          (x1, x2)

    val signalHandlerIsConnected_ =
      fn x1 & x2 =>
        (
          _import "g_signal_handler_is_connected" :
            GObjectObjectClass.C.notnull GObjectObjectClass.C.p
             * FFI.ULong.C.val_
             -> FFI.Bool.C.val_;
        )
          (x1, x2)

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
