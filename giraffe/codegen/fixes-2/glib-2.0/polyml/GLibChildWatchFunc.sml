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
        type callback = Pid.C.val_ * FFI.Int32.val_ -> unit
        fun withCallback f callback =
          FFI.withVal f
            (fn (pid : Pid.C.val_, status : FFI.Int32.val_) =>
               callback (Pid.C.fromVal pid, FFI.Int32.fromVal status))
      end

    structure PolyML =
      struct
        val CALLBACK =
          CInterface.FUNCTION2
            (Pid.PolyML.VAL, FFI.PolyML.Int32.VAL)
            FFI.PolyML.VOID
      end
  end
