structure GLibSourceFunc :> G_LIB_SOURCE_FUNC =
  struct
    type func = unit -> bool
    type t = func

    structure C =
      struct
        structure Pointer = CPointerInternal
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.p
      end

    structure SourceCallbackTable = CallbackTable(type callback = t)

    local
      fun dispatch (id : SourceCallbackTable.id) : bool =
        case SourceCallbackTable.lookup id of
          SOME f => (
            f ()
              handle
                e => (
                  GiraffeLog.critical (exnMessage e);
                  false  (* return false to remove the source *)
                )
          )
        | NONE   => (
            GiraffeLog.critical (
              concat [
                "source callback error: source function id ",
                SourceCallbackTable.fmtId id,
                " is invalid (callback does not exist)"
              ]
            );
            true (* return true to prevent an attempt
                  * to remove a non-existent source *)
          )
    in
      val _ = _export "giraffe_source_dispatch_smlside" : (SourceCallbackTable.id -> bool) -> unit;
      dispatch
    end

    val _ = _export "giraffe_source_destroy_smlside" : (SourceCallbackTable.id -> unit) -> unit; 
    SourceCallbackTable.remove

    structure FFI =
      struct
        type notnull = C.notnull
        type 'a p = 'a C.p

        type callback = SourceCallbackTable.id
        fun withCallback f callback =
          let
            val callbackId = SourceCallbackTable.add callback
          in
            f callbackId
              handle
                e => (SourceCallbackTable.remove callbackId; raise e)
          end
        fun withOptCallback f optCallback =
          case optCallback of
            SOME callback => withCallback f callback
          | NONE          => f SourceCallbackTable.nullId

        fun withPtrToDispatch f () = f (_address "giraffe_source_dispatch" : MLton.Pointer.t;)
        fun withOptPtrToDispatch f =
          fn
            true  => withPtrToDispatch f ()
          | false => f MLton.Pointer.null

        fun withPtrToDestroy f () = f (_address "giraffe_source_destroy" : MLton.Pointer.t;)
        fun withOptPtrToDestroy f =
          fn
            true  => withPtrToDestroy f ()
          | false => f MLton.Pointer.null
      end
  end
