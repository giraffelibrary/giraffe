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
      where type C.value_v = GObjectValueRecord.C.v
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
        val noneRetVal = ()
      )

    val getData_ =
      _import "giraffe_closure_get_data" :
        GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p -> Closure.t;

    fun log action =
      if GiraffeDebug.getClosure ()
      then
        fn (closure, dir) =>
          List.app print [
            action,
            " closure ",
            GObjectClosureRecord.C.Pointer.toString closure,
            " [", dir, "]\n"
          ]
      else
        fn _ => ()

    (* The closure called in `dispatch` and `destroyNotify` should catch any
     * exceptions but we still handle exceptions for unforeseen reasons to
     * ensure that they are reported and control returns from the callback.
     *)
    fun dispatch (closure, v, size, vs, _, _) = (
      log "dispatch" (closure, "enter");
      Closure.call (getData_ closure) (v & vs & size)
       before log "dispatch" (closure, "leave")
    ) handle e => app print [exnMessage e, "\n"]

    fun destroyNotify (data, closure) = (
      log "destroy" (closure, "enter");
      Closure.free data
       before log "destroy" (closure, "leave")
    ) handle e => app print [exnMessage e, "\n"]

    val () =
      _export "giraffe_closure_dispatch" private :
        (
          GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p
           * GObjectValueRecord.C.non_opt GObjectValueRecord.C.p
           * GUInt32.FFI.val_
           * GObjectValueRecordArray.C.non_opt GObjectValueRecordArray.C.p
           * Pointer.t
           * Pointer.t
           -> unit
        ) -> unit;
        dispatch

    val () =
      _export "giraffe_closure_destroy" private :
        (
          Closure.t
           * GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p
           -> unit
        ) -> unit;
        destroyNotify

    type 'a get = Closure.args -> 'a
    type 'a set = Closure.args -> 'a -> unit
    type 'a ret = Closure.args -> 'a -> unit

    structure C =
      struct
        type value_v = GObjectValueRecord.C.v
        fun offset vs n = GObjectValueRecordArray.C.Pointer.get (vs, Word.toInt n)
        fun get n getValue (_ & vs & _) = getValue (offset vs n)
        fun set n setValue (_ & vs & _) x = setValue (offset vs n) x
        fun ret setValue (v & _ & _) x = setValue v x
      end

    fun get n a = C.get n (ValueAccessor.C.get a)
    fun set n a = C.set n (ValueAccessor.C.set a)
    fun ret a = C.ret (ValueAccessor.C.set a)

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

        val dispatchPtr = _address "giraffe_closure_dispatch" private : Pointer.t;
        val destroyNotifyPtr = _address "giraffe_closure_destroy" private : Pointer.t;

        fun withDispatchPtr f () = f dispatchPtr
        fun withOptDispatchPtr f =
          fn
            true  => withDispatchPtr (f o Pointer.toOptPtr) ()
          | false => f Pointer.null

        fun withDestroyNotifyPtr f () = f destroyNotifyPtr
      end
  end
