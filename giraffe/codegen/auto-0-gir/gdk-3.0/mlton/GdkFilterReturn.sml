structure GdkFilterReturn :> GDK_FILTER_RETURN =
  struct
    datatype enum =
      CONTINUE
    | TRANSLATE
    | REMOVE
    structure Enum =
      Enum(
        type enum = enum
        val null = CONTINUE
        val toInt =
          fn
            CONTINUE => 0
          | TRANSLATE => 1
          | REMOVE => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => CONTINUE
          | 1 => TRANSLATE
          | 2 => REMOVE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_filter_return_get_type" : unit -> GObjectType.FFI.val_;
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
