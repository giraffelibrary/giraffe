(* Copyright (C) 2012-2013, 2016-2018 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure ClosureMarshal :>
  sig
    include CLOSURE_MARSHAL
      where type ('a, 'b) accessor = ('a, 'b) ValueAccessor.t
  end =
  struct
    type ('a, 'b) accessor = ('a, 'b) ValueAccessor.t

    structure GObjectValueRecordArray = 
      struct
        structure C =
          struct
            structure Pointer = CTypedPointer (GObjectValueRecord.C.ValueType)
            type notnull = Pointer.notnull
            type 'a p = 'a Pointer.p
            fun get a vs n = ValueAccessor.C.get a (Pointer.get (vs, n))
            fun set a vs n = ValueAccessor.C.set a (Pointer.get (vs, n))
          end
      end

    type state =
      GObjectValueRecord.C.notnull GObjectValueRecord.C.p
       * GObjectValueRecordArray.C.notnull GObjectValueRecordArray.C.p
       * GUInt32.FFI.val_
    type c_callback = state -> unit

    structure ClosureCallbackTable = CallbackTable(struct type callback = c_callback end)

    local
      val dispatch :
        ClosureCallbackTable.id
         * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
         * GObjectValueRecordArray.C.notnull GObjectValueRecordArray.C.p
         * GUInt32.FFI.val_
         -> unit =
        fn (id, v, vs, size) =>
          case ClosureCallbackTable.lookup id of
            SOME f => (
              f (v, vs, size)
                handle
                  e => GiraffeLog.critical (exnMessage e)
            )
          | NONE   =>
              GiraffeLog.critical (
                concat [
                  "closure callback error: invalid closure function id ",
                  ClosureCallbackTable.fmtId id
                ]
              )
    in
      val _ =
        _export "giraffe_closure_dispatch_smlside" :
          (ClosureCallbackTable.id
            * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
            * GObjectValueRecordArray.C.notnull GObjectValueRecordArray.C.p
            * GUInt32.FFI.val_
            -> unit)
           -> unit;
      dispatch
    end

    val _ =
      _export "giraffe_closure_destroy_smlside" :
        (ClosureCallbackTable.id -> unit) -> unit;
    ClosureCallbackTable.remove


    type 'a get = state -> 'a
    type 'a set = state -> 'a -> unit
    type 'a ret = state -> 'a -> unit

    fun get n a (_, vs, _) = GObjectValueRecordArray.C.get a vs (Word.toInt n)
    fun set n a (_, vs, _) = GObjectValueRecordArray.C.set a vs (Word.toInt n)
    fun ret a (v, _, _) = ValueAccessor.C.set a v

    type 'a marshaller = 'a -> c_callback

    fun (f &&&> g) state = f state & g state
    fun (f ---> g) h state = g state (h (f state))
    fun (f && g) state (x & y) = (f state x : unit; g state y : unit)

    fun void _ = ()

    fun ret_void (v, _, _) () =
      if not (ValueAccessor.C.isValue v)
      then ()
      else raise Fail "GIRAFFE internal error: ret_void used \
                      \for callback that has return value";

    structure FFI =
      struct
        type callback = ClosureCallbackTable.id

        fun withCallback f (marshaller, callback) =
          let
            val callbackId = ClosureCallbackTable.add (marshaller callback)
          in
            f callbackId
              handle
                e => (ClosureCallbackTable.remove callbackId; raise e)
          end
      end
  end
