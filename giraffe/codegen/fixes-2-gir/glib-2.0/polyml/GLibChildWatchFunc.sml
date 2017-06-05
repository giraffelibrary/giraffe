structure GLibChildWatchFunc :>
  sig
    include
      G_LIB_CHILD_WATCH_FUNC
        where type pid_t = GLibPid.t

    structure PolyML :
      sig
        val CALLBACK : FFI.callback PolyMLFFI.conversion
      end
  end =
  struct
    type pid_t = GLibPid.t
    type t = pid_t * LargeInt.int -> unit

    structure FFI =
      struct
        type callback = ((GLibPid.FFI.val_, GInt32.FFI.val_) pair -> unit) PolyMLFFI.closure
        local
          open PolyMLFFI
        in
          val makeClosure =
            closure (GLibPid.PolyML.cVal &&> GInt32.PolyML.cVal --> PolyMLFFI.cVoid)
        end
        fun withCallback f callback =
          f (
            makeClosure (
              fn (pid : GLibPid.FFI.val_) & (status : GInt32.FFI.val_) =>
                callback (GLibPid.FFI.fromVal pid, GInt32.FFI.fromVal status)
            )
          )
      end

    structure PolyML =
      struct
        val CALLBACK = PolyMLFFI.cFunction
      end
  end
