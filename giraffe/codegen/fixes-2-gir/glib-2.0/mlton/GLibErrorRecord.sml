structure GLibErrorRecord :>
  sig
    include G_LIB_ERROR_RECORD
      where type quark_t = GLibQuark.t
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.p
    type ('a, 'b) r = ('a, 'b) CPointer.r

    val copy_ = _import "g_error_copy" : notnull p -> notnull p;

    val free_ = _import "g_error_free" : notnull p -> unit;

    type t = notnull p Finalizable.t
    type handler = t -> exn option

    exception Error of exn * t

    fun makeErrorExn handlers err =
      case List.mapPartial ($ err) handlers of
        []              => Error (Fail "unknown domain", err)
      | domainExn :: [] => Error (domainExn, err)
      | _ :: _ :: _     => Error (Fail "internal error: multiple domains", err)

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
        type 'a p = 'a p
        type ('a, 'b) r = ('a, 'b) r

        fun withPtr f ptr = Finalizable.withValue (ptr, Pointer.withVal f)

        fun withOptPtr f =
          fn
            SOME ptr => Finalizable.withValue (ptr, Pointer.withOptVal f o SOME)
          | NONE     => Pointer.withOptVal f NONE

        fun withRefPtr f ptr = Finalizable.withValue (ptr, Pointer.withRefVal f)

        fun withRefOptPtr f =
          fn
            SOME ptr => Finalizable.withValue (ptr, Pointer.withRefOptVal f o SOME)
          | NONE     => Pointer.withRefOptVal f NONE

        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then ptr  (* take the existing reference *)
                else copy_ ptr
              )
          in
            Finalizable.addFinalizer (object, free_);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.fromOptVal optptr)


        fun handleError f handlers =
          let
            val p & retVal = withRefOptPtr f NONE
          in
            case fromOptPtr true p of
              NONE     => retVal
            | SOME err => raise (makeErrorExn handlers err)
          end
      end

    val getDomain_ =
      _import "giraffe_get_g_error_domain" : notnull p -> GLibQuark.C.val_;

    val getCode_ = _import "giraffe_get_g_error_code" : notnull p -> FFI.Enum.C.val_;

    val getMessage_ =
      _import "giraffe_get_g_error_message" :
        notnull p -> FFI.String.C.notnull FFI.String.C.out_p;

    type quark_t = GLibQuark.t

    val domain =
      {
        get = fn self => (C.withPtr ---> GLibQuark.C.fromVal) getDomain_ self
      }

    val code =
      {
        get = fn self => (C.withPtr ---> I) getCode_ self
      }

    val message =
      {
        get = fn self => (C.withPtr ---> FFI.String.C.fromPtr false) getMessage_ self
      }

    fun makeHandler (domainName, fromVal, domainExn) =
      let
        fun domainHandler err =
          let
            val errQuark = #get domain err
          in 
            if errQuark = GLibQuark.fromString domainName
            then
              SOME (domainExn (fromVal (#get code err)))
                handle
                  Subscript =>
                    let
                      val msg = concat [
                        "internal error in error handler: unknown error code ",
                        Int32.toString (#get code err), " in error domain \"",
                        GLibQuark.toString errQuark, "\"\n"
                      ]
                    in
                      GiraffeLog.critical msg;
                      SOME (Fail "unknown code")
                    end
            else
              NONE
          end
      in
        domainHandler
      end
  end
exception GLibError = GLibErrorRecord.Error
