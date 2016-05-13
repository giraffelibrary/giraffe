structure GLibChildWatchFunc :>
  sig
    include
      G_LIB_CHILD_WATCH_FUNC
        where type pid_t = GLibPid.t

    structure PolyML :
      sig
        val CALLBACK : C.callback PolyMLFFI.conversion
      end
  end =
  struct
    type pid_t = GLibPid.t
    type t = pid_t * LargeInt.int -> unit

    structure C =
      struct
        type callback = ((GLibPid.C.val_, FFI.Int32.C.val_) pair -> unit) PolyMLFFI.closure
        local
          open PolyMLFFI
        in
          val makeClosure =
            closure (GLibPid.PolyML.cVal &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
        end
        fun withCallback f callback =
          f (
            makeClosure (
              fn (pid : GLibPid.C.val_) & (status : FFI.Int32.C.val_) =>
                callback (GLibPid.C.fromVal pid, FFI.Int32.C.fromVal status)
            )
          )
      end

    structure PolyML =
      struct
        val CALLBACK = PolyMLFFI.cFunction
      end
  end
