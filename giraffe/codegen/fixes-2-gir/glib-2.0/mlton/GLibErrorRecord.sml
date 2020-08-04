(* Copyright (C) 2013, 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GLibErrorRecord :>
  G_LIB_ERROR_RECORD
    where type quark_t = GLibQuark.t =
  struct
    structure Pointer = CPointer(GMemory)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    val dup_ = _import "g_error_copy" : non_opt p -> non_opt p;
    val free_ = _import "g_error_free" : non_opt p -> unit;
    structure Record =
      BoxedRecord(
        structure Pointer = Pointer
        type opt = opt
        type non_opt = non_opt
        type 'a p = 'a p
        val dup_ = dup_
        val take_ = ignore
        val free_ = free_
      )
    open Record
    val getType_ = _import "g_error_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_boxed" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.non_opt FFI.p;
    val getOptValue_ = _import "g_value_get_boxed" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.opt FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_boxed" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.non_opt FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_boxed" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.opt FFI.p -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr false ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
        }

    val getDomain_ = _import "giraffe_get_g_error_domain" : non_opt p -> GLibQuark.FFI.val_;
    val getCode_ = _import "giraffe_get_g_error_code" : non_opt p -> GInt.FFI.val_;
    val getMessage_ = _import "giraffe_get_g_error_message" : non_opt p -> Utf8.FFI.non_opt Utf8.FFI.out_p;

    type quark_t = GLibQuark.t

    val domain =
      {
        get = fn self => (FFI.withPtr false ---> GLibQuark.FFI.fromVal) getDomain_ self
      }
    val code =
      {
        get = fn self => (FFI.withPtr false ---> GInt.FFI.fromVal) getCode_ self
      }
    val message =
      {
        get = fn self => (FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getMessage_ self
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
        val optErr & retVal = (FFI.withRefOptPtr false ---> FFI.fromOptPtr true && I) f NONE
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
              SOME (domainExn ((FFI.withPtr false ---> fromVal) getCode_ err))
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
