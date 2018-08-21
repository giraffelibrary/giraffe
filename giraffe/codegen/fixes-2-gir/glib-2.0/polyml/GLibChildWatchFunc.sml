structure GLibChildWatchFunc :>
  G_LIB_CHILD_WATCH_FUNC
    where type pid_t = GLibPid.t =
  struct
    type pid_t = GLibPid.t
    type func = pid_t * LargeInt.int -> unit
    type t = func

    structure C =
      struct
        structure Pointer = CPointerInternal
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.p
      end

    structure FFI =
      struct
        type notnull = C.notnull
        type 'a p = 'a C.p

        type callback = ((GLibPid.FFI.val_, GInt32.FFI.val_) pair -> unit) PolyMLFFI.closure
        local
          open PolyMLFFI
        in
          val makeClosure =
            closure (GLibPid.PolyML.cVal &&> GInt32.PolyML.cVal --> cVoid)
          val nullClosure = nullClosure
        end
        fun withCallback f callback =
          f (
            makeClosure (
              fn (pid : GLibPid.FFI.val_) & (status : GInt32.FFI.val_) =>
                callback (GLibPid.FFI.fromVal pid, GInt32.FFI.fromVal status)
            )
          )
        fun withOptCallback f optCallback =
          case optCallback of
            SOME callback => withCallback f callback
          | NONE          => f nullClosure

        local
          open PolyMLFFI
        in
          fun withPtrToDispatch f () = f (symbolAsAddress (getSymbol "giraffe_child_watch_dispatch"))
          fun withOptPtrToDispatch f =
            fn
              true  => withPtrToDispatch f ()
            | false => f Memory.Pointer.null

          fun withPtrToDestroy f () = f (symbolAsAddress (getSymbol "giraffe_child_watch_destroy"))
          fun withOptPtrToDestroy f =
            fn
              true  => withPtrToDestroy f ()
            | false => f Memory.Pointer.null
        end
      end

    structure PolyML =
      struct
        val cPtr = C.Pointer.PolyML.cVal
        val cOptPtr = C.Pointer.PolyML.cOptVal
        val cFunction = PolyMLFFI.cFunction
      end
  end
