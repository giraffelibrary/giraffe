structure GLibChildWatchFunc :>
  sig
    include G_LIB_CHILD_WATCH_FUNC

    structure PolyML :
      sig
        val CALLBACK : C.callback CInterface.Conversion
      end
  end =
  struct
    type t = Pid.t * LargeInt.int -> unit

    structure C =
      struct
        type callback = Pid.C.val_ * FFI.Int32.C.val_ -> unit
        fun withCallback f cf =
          f (
            fn (pid : Pid.C.val_, status : FFI.Int32.C.val_) =>
              cf (Pid.C.fromVal pid, FFI.Int32.C.fromVal status)
          )
      end

    structure PolyML =
      struct
        val CALLBACK =
          CInterface.FUNCTION2
            (Pid.PolyML.VAL, FFI.Int32.PolyML.VAL)
            FFI.PolyML.VOID
      end
  end
