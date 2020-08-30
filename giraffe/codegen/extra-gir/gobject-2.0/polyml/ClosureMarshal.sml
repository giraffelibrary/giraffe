(* Copyright (C) 2012-2013, 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure ClosureMarshal :>
  sig
    include CLOSURE_MARSHAL
      where type ('a, 'b) accessor = ('a, 'b) ValueAccessor.t

    structure PolyML :
      sig
        val cPtr : FFI.non_opt FFI.p PolyMLFFI.conversion
        val cOptPtr : FFI.opt FFI.p PolyMLFFI.conversion
        val cDispatchPtr : FFI.non_opt FFI.dispatch_p PolyMLFFI.conversion
        val cOptDispatchPtr : FFI.opt FFI.dispatch_p PolyMLFFI.conversion
        val cDestroyNotifyPtr : FFI.destroy_notify_p PolyMLFFI.conversion
      end
  end =
  struct
    type ('a, 'b) accessor = ('a, 'b) ValueAccessor.t

    structure GObjectValueRecordArray = 
      struct
        structure C =
          struct
            structure Pointer = CTypedPointer(GObjectValueRecord.C.ValueType)
            type opt = Pointer.opt
            type non_opt = Pointer.non_opt
            type 'a p = 'a Pointer.p
            fun get a vs n = ValueAccessor.C.get a (Pointer.get (vs, n))
            fun set a vs n = ValueAccessor.C.set a (Pointer.get (vs, n))
          end
        structure PolyML =
          struct
            val cPtr = C.Pointer.PolyML.cVal	
          end
      end

    structure Pointer = CPointer(GMemory)
    structure Closure =
      Closure(
        val name = "GObject.Closure"
        type args =
          (
            GObjectValueRecord.C.non_opt GObjectValueRecord.C.p,
            (
              GObjectValueRecordArray.C.non_opt GObjectValueRecordArray.C.p,
              GUInt32.FFI.val_
            ) pair
          ) pair
        type ret = unit
        val exnRetVal = ()
        local
          open PolyMLFFI
        in
          val callbackFunc =
            GObjectValueRecord.PolyML.cPtr
             &&> GObjectValueRecordArray.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             --> cVoid
        end
      )

    type 'a get = Closure.args -> 'a
    type 'a set = Closure.args -> 'a -> unit
    type 'a ret = Closure.args -> 'a -> unit

    fun get n a (_ & vs & _) = GObjectValueRecordArray.C.get a vs (Word.toInt n)
    fun set n a (_ & vs & _) = GObjectValueRecordArray.C.set a vs (Word.toInt n)
    fun ret a (v & _ & _) = ValueAccessor.C.set a v

    type 'a marshaller = 'a -> Closure.callback

    fun (f &&&> g) args = f args & g args
    fun (f ---> g) h args = g args (h (f args))
    fun (f && g) args (x & y) = (f args x : unit; g args y : unit)

    fun void _ = ()

    fun ret_void (v & _ & _) () =
      if not (ValueAccessor.C.isValue v)
      then ()
      else raise Fail "GIRAFFE internal error: ret_void used \
                      \for callback that has return value";

    structure FFI =
      struct
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = Closure.t
        type 'a dispatch_p = 'a Pointer.p
        type destroy_notify_p = Pointer.t

        fun withPtr f (marshaller, func) =
          let
            val closure = Closure.make (marshaller func)
          in
            f closure
              handle
                e => (Closure.free closure; raise e)
          end
        fun withOptPtr f optMarshallerFunc =
          case optMarshallerFunc of
            SOME marshallerFunc => withPtr f marshallerFunc
          | NONE                => f Closure.null

        local
          open PolyMLFFI
        in
          fun dispatchPtr () = Pointer.PolyML.symbolAsAddress (getSymbol "giraffe_closure_dispatch")
          fun destroyNotifyPtr () = Pointer.PolyML.symbolAsAddress (getSymbol "giraffe_closure_destroy")
        end

        fun withDispatchPtr f () = f (dispatchPtr ())
        fun withOptDispatchPtr f =
          fn
            true  => withDispatchPtr (f o Pointer.toOptPtr) ()
          | false => f Pointer.null

        fun withDestroyNotifyPtr f () = f (destroyNotifyPtr ())
      end

    structure PolyML =
      struct
        val cPtr = Closure.PolyML.cFunction
        val cOptPtr = Closure.PolyML.cFunction
        val cDispatchPtr = Pointer.PolyML.cVal
        val cOptDispatchPtr = Pointer.PolyML.cOptVal
        val cDestroyNotifyPtr = Pointer.PolyML.cVal
      end
  end
