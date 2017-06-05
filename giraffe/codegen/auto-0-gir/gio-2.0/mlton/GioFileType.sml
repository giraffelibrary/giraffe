structure GioFileType :> GIO_FILE_TYPE =
  struct
    datatype enum =
      UNKNOWN
    | REGULAR
    | DIRECTORY
    | SYMBOLIC_LINK
    | SPECIAL
    | SHORTCUT
    | MOUNTABLE
    structure Enum =
      Enum(
        type enum = enum
        val null = UNKNOWN
        val toInt =
          fn
            UNKNOWN => 0
          | REGULAR => 1
          | DIRECTORY => 2
          | SYMBOLIC_LINK => 3
          | SPECIAL => 4
          | SHORTCUT => 5
          | MOUNTABLE => 6
        exception Value of GInt.t
        val fromInt =
          fn
            0 => UNKNOWN
          | 1 => REGULAR
          | 2 => DIRECTORY
          | 3 => SYMBOLIC_LINK
          | 4 => SPECIAL
          | 5 => SHORTCUT
          | 6 => MOUNTABLE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_file_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
