structure ClosureMarshal :>
  sig
    include CLOSURE_MARSHAL
      where type ('a, 'b) accessor = ('a, 'b) GObjectValue.accessor

    structure PolyML :
      sig
        val CALLBACK : C.callback CInterface.Conversion
      end
  end =
  struct
    type ('a, 'b) accessor = ('a, 'b) GObjectValue.accessor

    type state =
      GObjectValueRecord.C.notnull GObjectValueRecord.C.p
       * GObjectValueRecord.C.notnull GObjectValueRecord.C.Array.p
       * FFI.UInt32.C.val_
    type callback = state -> unit

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

    fun check f x =
      f x handle e => GiraffeLog.critical (exnMessage e)

    structure C =
      struct
        type callback = callback

        fun withCallback f (marshaller, callback) =
          f (check (marshaller callback))
      end

    structure PolyML =
      struct
        val CALLBACK : callback CInterface.Conversion =
          CInterface.FUNCTION3
            (GObjectValueRecord.PolyML.PTR, GObjectValueRecord.PolyML.Array.PTR, FFI.UInt32.PolyML.VAL)
            FFI.PolyML.VOID
      end
  end
