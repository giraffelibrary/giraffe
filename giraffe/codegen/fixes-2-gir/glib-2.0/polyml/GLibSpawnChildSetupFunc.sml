structure GLibSpawnChildSetupFunc :> G_LIB_SPAWN_CHILD_SETUP_FUNC =
  struct
    type func = unit -> unit
    type t = func

    structure C =
      struct
        structure Pointer = CPointerInternal
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
      end

    structure FFI =
      struct
        type opt = C.opt
        type non_opt = C.non_opt
        type 'a p = 'a C.p

        type callback = (unit -> unit) PolyMLFFI.closure
        local
          open PolyMLFFI
        in
          val makeClosure = closure (cVoid --> cVoid)
          val nullClosure = nullClosure
        end
        fun withCallback f callback = f (makeClosure callback)
        fun withOptCallback f optCallback =
          case optCallback of
            SOME callback => withCallback f callback
          | NONE          => f nullClosure

        local
          open PolyMLFFI
        in
          fun withPtrToDispatch f () = f (symbolAsAddress (getSymbol "giraffe_spawn_child_setup_dispatch"))
          fun withOptPtrToDispatch f =
            fn
              true  => withPtrToDispatch f ()
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
