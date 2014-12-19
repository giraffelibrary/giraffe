(* Copyright (C) 2012-2013 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure ClosureMarshal :>
  sig
    include CLOSURE_MARSHAL
      where type ('a, 'b) accessor = ('a, 'b) GObjectValue.accessor
  end =
  struct
    type ('a, 'b) accessor = ('a, 'b) GObjectValue.accessor

    type state =
      GObjectValueRecord.C.notnull GObjectValueRecord.C.p
       * GObjectValueRecord.C.notnull GObjectValueRecord.C.Array.p
       * FFI.UInt32.C.val_
    type callback = state -> unit

    structure ClosureCallback = Callback (struct type callback = callback end)

    local
      val dispatch :
        ClosureCallback.id
         * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
         * GObjectValueRecord.C.notnull GObjectValueRecord.C.Array.p
         * FFI.UInt32.C.val_
         -> unit =
        fn (id, v, vs, size) =>
          case ClosureCallback.lookup id of
            SOME f => (
              f (v, vs, size)
                handle
                  e => GiraffeLog.critical (exnMessage e)
            )
          | NONE   =>
              GiraffeLog.critical (
                concat [
                  "closure callback error: invalid closure function id ",
                  ClosureCallback.fmtId id
                ]
              )
    in
      val _ =
        _export "giraffe_closure_dispatch_smlside" :
          (ClosureCallback.id
            * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
            * GObjectValueRecord.C.notnull GObjectValueRecord.C.Array.p
            * FFI.UInt32.C.val_
            -> unit)
           -> unit;
      dispatch
    end

    val _ =
      _export "giraffe_closure_destroy_smlside" :
        (ClosureCallback.id -> unit) -> unit;
    ClosureCallback.remove


    type 'a get = state -> 'a
    type 'a set = state -> 'a -> unit
    type 'a ret = state -> 'a -> unit

    fun get n a (_, vs, _) = GObjectValue.C.Array.get a vs n
    fun set n a (_, vs, _) = GObjectValue.C.Array.set a vs n
    fun ret a (v, _, _) = GObjectValue.C.set a v

    type 'a marshaller = 'a -> callback

    fun (f &&&> g) state = f state & g state
    fun (f ---> g) h state = g state (h (f state))
    fun (f && g) state (x & y) = (f state x : unit; g state y : unit)

    fun void _ = ()

    fun ret_void (v, _, _) () =
      if not (GObjectValue.C.isValue v)
      then ()
      else raise Fail "GIRAFFE internal error: ret_void used \
                      \for callback that has return value";

    structure C =
      struct
        type callback = ClosureCallback.id

        fun withCallback f (marshaller, callback) =
          let
            val callbackId = ClosureCallback.add (marshaller callback)
          in
            f callbackId
              handle
                e => (ClosureCallback.remove callbackId; raise e)
          end
      end
  end
