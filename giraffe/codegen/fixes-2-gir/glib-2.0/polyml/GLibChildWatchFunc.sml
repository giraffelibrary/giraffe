structure GLibChildWatchFunc :>
  sig
    include
      G_LIB_CHILD_WATCH_FUNC
        where type pid_t = GLibPid.t

    structure PolyML :
      sig
        val CALLBACK : C.callback CInterface.Conversion
      end
  end =
  struct
    type pid_t = GLibPid.t
    type t = pid_t * LargeInt.int -> unit

    structure C =
      struct
        type callback = GLibPid.C.val_ * FFI.Int32.C.val_ -> unit
        fun withCallback f cf =
          f (
            fn (pid : GLibPid.C.val_, status : FFI.Int32.C.val_) =>
              cf (GLibPid.C.fromVal pid, FFI.Int32.C.fromVal status)
          )
      end

    structure PolyML =
      struct
        val CALLBACK =
          CInterface.FUNCTION2
            (GLibPid.PolyML.VAL, FFI.Int32.PolyML.VAL)
            FFI.PolyML.VOID
      end
  end
