structure GioIOModuleScopeFlags :> GIO_I_O_MODULE_SCOPE_FLAGS =
  struct
    datatype enum =
      NONE
    | BLOCK_DUPLICATES
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | BLOCK_DUPLICATES => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NONE
          | 1 => BLOCK_DUPLICATES
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_io_module_scope_flags_get_type" : unit -> GObjectType.FFI.val_;
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
