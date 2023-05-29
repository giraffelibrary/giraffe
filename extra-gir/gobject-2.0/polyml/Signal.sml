(* Copyright (C) 2012-2013, 2017-2021, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure Signal :>
  SIGNAL
    where type 'a object_class = 'a GObjectObjectClass.class
    where type ('object_class, 'get, 'set, 'init) property_t =
            ('object_class, 'get, 'set, 'init) Property.t
    where type ('arg_r, 'arg_w, 'res_r, 'res_w) marshaller =
            ('arg_r, 'arg_w, 'res_r, 'res_w) GObjectClosure.marshaller =
  struct
    type 'a object_class = 'a GObjectObjectClass.class
    type ('object_class, 'get, 'set, 'init) property_t =
      ('object_class, 'get, 'set, 'init) Property.t
    type ('arg_r, 'arg_w, 'res_r, 'res_w) marshaller =
      ('arg_r, 'arg_w, 'res_r, 'res_w) GObjectClosure.marshaller

    local
      open PolyMLFFI
    in
      val quarkFromString_ =
        call (externalFunctionSymbol "g_quark_from_string")
          (Utf8.PolyML.cPtr --> GLib.Quark.PolyML.cVal)

      val signalLookup_ =
        call (externalFunctionSymbol "g_signal_lookup")
          (
            Utf8.PolyML.cInPtr
             &&> GObjectType.PolyML.cVal
             --> GUInt.PolyML.cVal
          )

      val signalEmit_ =
        call
          (externalFunctionSymbol "g_signal_emitv")
          (
            GObjectValueRecordCArrayN.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GLib.Quark.PolyML.cVal
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          );

      val signalConnectClosure_ =
        call
          (externalFunctionSymbol "g_signal_connect_closure")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectClosureRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> GULong.PolyML.cVal
          );

      val handlerBlock_ =
        call
          (externalFunctionSymbol "g_signal_handler_block")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GULong.PolyML.cVal
             --> cVoid
          )

      val handlerUnblock_ =
        call
          (externalFunctionSymbol "g_signal_handler_unblock")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GULong.PolyML.cVal
             --> cVoid
          )

      val handlerDisconnect_ =
        call
          (externalFunctionSymbol "g_signal_handler_disconnect")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GULong.PolyML.cVal
             --> cVoid
          );

      val handlerIsConnected_ =
        call
          (externalFunctionSymbol "g_signal_handler_is_connected")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GULong.PolyML.cVal
             --> GBool.PolyML.cVal
          );
    end

    type ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) t =
      {
        name       : string,
        detail     : string,
        marshaller :
          unit
           -> (
                (unit,          'arg_h) pair,
                ('object_class, 'arg_e) pair,
                'res_e,
                'res_h
              )
               marshaller
      }

    fun conv f {name, detail, marshaller} =
      {
        name       = name,
        detail     = detail,
        marshaller = ClosureMarshal.map (Fn.id, Pair.mapFst f, Fn.id, Fn.id) o marshaller
      }

    local
      val call = Utf8.FFI.withPtr 0 &&&> GObjectType.FFI.withVal ---> I
    in
      fun signalLookup (name, itype) = call signalLookup_ (name & itype)
    end

    fun emit instance signal =
      let
        val {name, detail, marshaller} = signal
        val signalId = signalLookup (name, GObjectObjectClass.instanceType instance)
        val detailQuark =
          case detail of
            "" => GLib.Quark.C.ValueType.toC GLib.Quark.null
          | _  =>
              let
                val s = Utf8.C.ArrayType.toC detail
              in
                quarkFromString_ s before Utf8.C.ArrayType.free ~1 s
              end
      in
        fn arg =>
          let
            val {setArg, getRes, initPars, initRet, ...} = marshaller ()
            val numPars = VectorSequence.length initPars

            val (pars, ret) =
              let
                open GObjectValueRecordCArrayN
                val n = numPars + 1  (* last element is for the return value *)
                fun initValue _ p (i, init) = init (C.ArrayType.get n p i)
                fun getInit i = VectorSequence.get initPars i handle Subscript => initRet
                val p = C.ArrayType.init initValue (n, getInit)
              in
                (p, C.ArrayType.get n p numPars)
              end

            val () = setArg pars (instance & arg)
            val () = signalEmit_ (pars & signalId & detailQuark & ret)
            val res = getRes (pars, ret)

            val () = GObjectValueRecordCArrayN.C.ArrayType.free ~1 numPars pars
          in
            res
          end
      end

    (* For a value `{id, closure, detailedSignal}` of type `handler_id`,
     * `id` is the actual handler id, `closure` is the GClosure instance
     * and `detailedSignal` is a string representation of the signal.
     * `closure` and `detailedSignal` are included for logging purposes
     * when disconnecting a signal.  Although they can be determined from
     * an object instance and handler id, the C API does not expose a way
     * to do this.
     *)
    type handler_id =
      {
        id             : GULong.FFI.val_,
        closure        : GObjectClosure.t,
        detailedSignal : string
      }

    local
      val call =
        GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectClosureRecord.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
    in
      fun signalConnectClosure instance detailedSignal closure after =
        call signalConnectClosure_
          (
            GObjectObjectClass.toBase instance
             & detailedSignal
             & closure
             & after
          )
    end

    fun log (closure1Op, closure, detailedSignal, instance) =
      if GiraffeDebug.logClosureEnabled ()
      then
        GiraffeDebug.logClosure1
          {
            closure1Op     = closure1Op,
            closureAddr    =
              GObjectClosureRecord.FFI.withPtr false
              GObjectClosureRecord.C.Pointer.toString
              closure,
            detailedSignal = detailedSignal,
            instKind       = "object",
            instType       = GObjectType.name (GObjectObjectClass.instanceType instance),
            instAddr       =
              GObjectObjectClass.FFI.withPtr false
                GObjectObjectClass.C.Pointer.toString
                (GObjectObjectClass.toBase instance)
          }
      else
        ()

    local
      val call =
        GObjectObjectClass.FFI.withPtr false
         &&&> I
         ---> I
    in
      fun handlerBlock instance {id, ...} =
        call handlerBlock_
          (GObjectObjectClass.toBase instance & id)
    end

    local
      val call =
        GObjectObjectClass.FFI.withPtr false
         &&&> I
         ---> I
    in
      fun handlerUnblock instance {id, ...} =
        call handlerUnblock_
          (GObjectObjectClass.toBase instance & id)
    end

    local
      val call =
        GObjectObjectClass.FFI.withPtr false
         &&&> I
         ---> I
    in
      fun handlerDisconnect instance {id, closure, detailedSignal} = (
        log (GiraffeDebug.C1Disconnect, closure, detailedSignal, instance);
        call handlerDisconnect_
          (GObjectObjectClass.toBase instance & id)
      )
    end

    local
      val call =
        GObjectObjectClass.FFI.withPtr false
         &&&> I
         ---> GBool.FFI.fromVal
    in
      fun handlerIsConnected instance {id, ...} =
        call handlerIsConnected_
          (GObjectObjectClass.toBase instance & id)
    end

    fun connect instance (signal, f) =
      let
        val {name, detail, marshaller} = signal
        val closure = GObjectClosure.new (marshaller (), fn () & arg => f arg)
        val detailedSignal =
          case detail of
            "" => name
          | _  => name ^ "::" ^ detail
        val () = log (GiraffeDebug.C1Connect, closure, detailedSignal, instance)
        val id = signalConnectClosure instance detailedSignal closure false
      in
        {id = id, closure = closure, detailedSignal = detailedSignal}
      end

    fun connectAfter instance (signal, f) =
      let
        val {name, detail, marshaller} = signal
        val closure = GObjectClosure.new (marshaller (), fn () & arg => f arg)
        val detailedSignal =
          case detail of
            "" => name
          | _  => name ^ "::" ^ detail
        val () = log (GiraffeDebug.C1ConnectAfter, closure, detailedSignal, instance)
        val id = signalConnectClosure instance detailedSignal closure true
      in
        {id = id, closure = closure, detailedSignal = detailedSignal}
      end

    fun detail {detail, ...} = detail

    fun withDetail ({name, marshaller, ...}, detail) =
      {name = name, detail = detail, marshaller = marshaller}

    fun withPropDetail (signal, prop) = withDetail (signal, #name prop)
  end
