structure GioFilesystemPreviewType :> GIO_FILESYSTEM_PREVIEW_TYPE =
  struct
    datatype enum =
      IF_ALWAYS
    | IF_LOCAL
    | NEVER
    structure Enum =
      Enum(
        type enum = enum
        val null = IF_ALWAYS
        val toInt =
          fn
            IF_ALWAYS => 0
          | IF_LOCAL => 1
          | NEVER => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => IF_ALWAYS
          | 1 => IF_LOCAL
          | 2 => NEVER
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_filesystem_preview_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
