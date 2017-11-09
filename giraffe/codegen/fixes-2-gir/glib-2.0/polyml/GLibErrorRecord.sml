(* Copyright (C) 2013, 2016-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GLibErrorRecord :>
  G_LIB_ERROR_RECORD
    where type quark_t = GLibQuark.t =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    val cPtr = Pointer.PolyML.cVal
    local
      open PolyMLFFI
    in
      val dup_ = call (getSymbol "g_error_copy") (cPtr --> cPtr)
      val free_ = call (getSymbol "g_error_free") (cPtr --> cVoid)
    end
    structure Record =
      BoxedRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val dup_ = dup_
        val take_ = ignore
        val free_ = free_
      )
    open Record
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_error_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_boxed") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_boxed") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_boxed") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_boxed") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }

    local
      open PolyMLFFI
    in
      val getDomain_ =
        call
          (getSymbol "giraffe_get_g_error_domain")
          (PolyML.cPtr --> GLibQuark.PolyML.cVal)

      val getCode_ =
        call
          (getSymbol "giraffe_get_g_error_code")
          (PolyML.cPtr --> GInt.PolyML.cVal)

      val getMessage_ =
        call
          (getSymbol "giraffe_get_g_error_message")
          (PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end

    type quark_t = GLibQuark.t

    val domain =
      {
        get = fn self => (FFI.withPtr ---> GLibQuark.FFI.fromVal) getDomain_ self
      }
    val code =
      {
        get = fn self => (FFI.withPtr ---> GInt.FFI.fromVal) getCode_ self
      }
    val message =
      {
        get = fn self => (FFI.withPtr ---> Utf8.FFI.fromPtr 0) getMessage_ self
      }

    exception Error of exn * t

    type handler = t -> exn option

    fun makeErrorExn handlers err =
      case List.mapPartial (fn handler => handler err) handlers of
        []              => Error (Fail "unknown domain", err)
      | domainExn :: [] => Error (domainExn, err)
      | _ :: _ :: _     => Error (Fail "internal error: multiple domains", err)

    fun handleError f handlers =
      let
        val optErr & retVal = (FFI.withRefOptPtr ---> FFI.fromOptPtr true && I) f NONE
      in
        case optErr of
          NONE     => retVal
        | SOME err => raise (makeErrorExn handlers err)
      end

    fun makeHandler (domainName, fromVal, domainExn) =
      let
        fun domainHandler err =
          let
            val errQuark = #get domain err
          in
            if errQuark = GLibQuark.fromString domainName
            then
              SOME (domainExn ((FFI.withPtr ---> fromVal) getCode_ err))
                handle
                  _ =>
                    let
                      val msg = concat [
                        "internal error in error handler: unknown error code ",
                        LargeInt.toString (#get code err), " in error domain \"",
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
