structure GioResourceError :> GIO_RESOURCE_ERROR =
  struct
    datatype enum =
      NOT_FOUND
    | INTERNAL
    structure Enum =
      Enum(
        type enum = enum
        val null = NOT_FOUND
        val toInt =
          fn
            NOT_FOUND => 0
          | INTERNAL => 1
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NOT_FOUND
          | 1 => INTERNAL
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_resource_error_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-resource-error-quark",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GioResourceError = GioResourceError.Error
