structure GdkByteOrder :> GDK_BYTE_ORDER =
  struct
    datatype enum =
      LSB_FIRST
    | MSB_FIRST
    structure Enum =
      Enum(
        type enum = enum
        val null = LSB_FIRST
        val toInt =
          fn
            LSB_FIRST => 0
          | MSB_FIRST => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => LSB_FIRST
          | 1 => MSB_FIRST
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_byte_order_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
