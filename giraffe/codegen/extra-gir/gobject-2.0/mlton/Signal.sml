(* Copyright (C) 2012-2013, 2017-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure Signal :>
  SIGNAL
    where type 'a object_class = 'a GObjectObjectClass.class
    where type 'a marshaller = 'a GObjectClosure.marshaller =
  struct
    type 'a object_class = 'a GObjectObjectClass.class
    type 'a marshaller = 'a GObjectClosure.marshaller

    val signalConnectClosure_ =
      fn x1 & (x2, x3) & x4 & x5 =>
        (
          _import "mlton_g_signal_connect_closure" :
            GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
             * Utf8.MLton.p1
             * Utf8.FFI.non_opt Utf8.MLton.p2
             * GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p
             * GBool.FFI.val_
             -> GULong.FFI.val_;
        )
          (x1, x2, x3, x4, x5)

    val signalHandlerDisconnect_ =
      fn x1 & x2 =>
        (
          _import "g_signal_handler_disconnect" :
            GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
             * GULong.FFI.val_
             -> unit;
        )
          (x1, x2)

    val signalHandlerIsConnected_ =
      fn x1 & x2 =>
        (
          _import "g_signal_handler_is_connected" :
            GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
             * GULong.FFI.val_
             -> GBool.FFI.val_;
        )
          (x1, x2)

    type 'object_class t = string * GObjectClosureRecord.t

    fun signal detailedSignal marshaller callback =
      (detailedSignal, GObjectClosure.new marshaller callback)

    type id = GULong.FFI.val_

    fun signalConnectClosure instance detailedSignal closure after =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectClosureRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
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
        GObjectObjectClass.FFI.withPtr
         &&&> I
         ---> I
      )
        signalHandlerDisconnect_
        (instance & handlerId)

    fun signalHandlerIsConnected instance handlerId =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> I
         ---> GBool.FFI.fromVal
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
