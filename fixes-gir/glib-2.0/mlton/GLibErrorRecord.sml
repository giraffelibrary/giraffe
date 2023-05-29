(* Copyright (C) 2013, 2016-2021, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GLibErrorRecord :> G_LIB_ERROR_RECORD =
  struct
    structure Pointer = CPointer(GMemory)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    val getType_ = _import "g_error_get_type" : unit -> GObjectType.FFI.val_;
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    val dup_ =
      let
        val boxedFun_ = fn x1 & x2 => (_import "g_boxed_copy" : GObjectType.FFI.val_ * non_opt p -> non_opt p;) (x1, x2)
      in
        fn x1 => boxedFun_ (getType_ () & x1)
      end
    val free_ =
      let
        val boxedFun_ = fn x1 & x2 => (_import "g_boxed_free" : GObjectType.FFI.val_ * non_opt p -> unit;) (x1, x2)
      in
        fn x1 => boxedFun_ (getType_ () & x1)
      end
    structure Record =
      BoxedRecord(
        structure Pointer = Pointer
        type opt = opt
        type non_opt = non_opt
        type 'a p = 'a p
        val dup_ = dup_
        val take_ = ignore
        val free_ = free_
        val getTypeName = GObjectType.name o getType
      )
    open Record
    val getValue_ = _import "g_value_get_boxed" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.non_opt FFI.p;
    val getOptValue_ = _import "g_value_get_boxed" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.opt FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_boxed" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.non_opt FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_boxed" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.opt FFI.p -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = getType,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr false ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = getType,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
        }

    val domain'Offset_ = _import "giraffe_g_lib_error_domain_offset" : unit -> GSize.FFI.val_;
    val code'Offset_ = _import "giraffe_g_lib_error_code_offset" : unit -> GSize.FFI.val_;

    val domain'Offset = (I ---> GSize.FFI.fromVal) domain'Offset_
    val code'Offset = (I ---> GSize.FFI.fromVal) code'Offset_

    fun getDomain_ (p : C.non_opt C.p) : GLibQuark.FFI.val_ =
      let
        val offsetWord = Word.fromInt (domain'Offset ())
        val p =
          GLibQuark.C.ValueType.Memory.Pointer.fromPointer (
            CMemory.Pointer.add (
              C.Pointer.Memory.Pointer.toPointer p,
              offsetWord
            )
          )
      in
        GLibQuark.C.ValueType.get p
      end

    fun getCode_ (p : C.non_opt C.p) : GInt.FFI.val_ =
      let
        val offsetWord = Word.fromInt (code'Offset ())
        val p =
          GInt.C.ValueType.Memory.Pointer.fromPointer (
            CMemory.Pointer.add (
              C.Pointer.Memory.Pointer.toPointer p,
              offsetWord
            )
          )
      in
        GInt.C.ValueType.get p
      end

    local
      val call = FFI.withPtr false ---> GLibQuark.FFI.fromVal
    in
      fun getDomain self = call getDomain_ self before FFI.touchPtr self
    end
    local
      val call = FFI.withPtr false ---> GInt.FFI.fromVal
    in
      fun getCode self = call getCode_ self before FFI.touchPtr self
    end

    exception Error of exn * t

    type handler = t -> exn option

    fun makeErrorExn handlers err =
      case List.mapPartial (fn handler => handler err) handlers of
        []              => Error (Fail "unknown domain", err)
      | domainExn :: [] => Error (domainExn, err)
      | _ :: _ :: _     => Error (Fail "internal error: multiple domains", err)

    fun handleError f =
      let
        val optErr & retVal = (FFI.withRefOptPtr false ---> FFI.fromOptPtr true && I) f NONE
      in
        fn handlers =>
          case optErr of
            NONE     => retVal
          | SOME err => raise (makeErrorExn handlers err)
      end

    local
      val withPtr = FFI.withPtr false
    in
      fun makeHandler (domainName, fromVal, domainExn) =
        let
          fun domainHandler err =
            let
              val errQuark = getDomain err
            in
              if errQuark = GLibQuark.fromString domainName
              then
                SOME (domainExn ((withPtr ---> fromVal) getCode_ err))
                  handle
                    _ =>
                      let
                        val msg = concat [
                          "internal error in error handler: unknown error code ",
                          LargeInt.toString (getCode err), " in error domain \"",
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
  end
exception GLibError = GLibErrorRecord.Error
