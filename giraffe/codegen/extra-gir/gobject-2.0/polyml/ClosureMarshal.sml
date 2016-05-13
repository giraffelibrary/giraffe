(* Copyright (C) 2012-2013, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure ClosureMarshal :>
  sig
    include CLOSURE_MARSHAL
      where type ('a, 'b) accessor = ('a, 'b) GObjectValue.accessor

    structure PolyML :
      sig
        val CALLBACK : C.callback PolyMLFFI.conversion
      end
  end =
  struct
    type ('a, 'b) accessor = ('a, 'b) GObjectValue.accessor

    type state = (
      GObjectValueRecord.C.notnull GObjectValueRecord.C.p,
      (
        GObjectValueRecord.C.notnull GObjectValueRecord.C.Array.array_p,
        FFI.UInt32.C.val_
      ) pair
    ) pair
    type c_callback = state -> unit

    type 'a get = state -> 'a
    type 'a set = state -> 'a -> unit
    type 'a ret = state -> 'a -> unit

    fun get n a (_ & vs & _) = GObjectValue.C.Array.get a vs n
    fun set n a (_ & vs & _) = GObjectValue.C.Array.set a vs n
    fun ret a (v & _ & _) = GObjectValue.C.set a v

    type 'a marshaller = 'a -> c_callback

    fun (f &&&> g) state = f state & g state
    fun (f ---> g) h state = g state (h (f state))
    fun (f && g) state (x & y) = (f state x : unit; g state y : unit)

    fun void _ = ()

    fun ret_void (v & _ & _) () =
      if not (GObjectValue.C.isValue v)
      then ()
      else raise Fail "GIRAFFE internal error: ret_void used \
                      \for callback that has return value";

    fun check f x =
      f x handle e => GiraffeLog.critical (exnMessage e)

    structure C =
      struct
        type callback = c_callback PolyMLFFI.closure

        local
          open PolyMLFFI
        in
          val makeClosure : c_callback -> c_callback closure =
            closure
              (GObjectValueRecord.PolyML.cPtr
                &&> GObjectValueRecord.PolyML.Array.cPtr
                &&> FFI.UInt32.PolyML.cVal
                --> PolyMLFFI.cVoid)
        end

        fun withCallback f (marshaller, callback) =
          f (makeClosure (check (marshaller callback)))
      end

    structure PolyML =
      struct
        val CALLBACK : C.callback PolyMLFFI.conversion = PolyMLFFI.cFunction
      end
  end
