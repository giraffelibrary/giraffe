structure GdkDeviceType :> GDK_DEVICE_TYPE =
  struct
    datatype enum =
      MASTER
    | SLAVE
    | FLOATING
    structure Enum =
      Enum(
        type enum = enum
        val null = MASTER
        val toInt =
          fn
            MASTER => 0
          | SLAVE => 1
          | FLOATING => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => MASTER
          | 1 => SLAVE
          | 2 => FLOATING
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_device_type_get_type" : unit -> GObjectType.FFI.val_;
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
