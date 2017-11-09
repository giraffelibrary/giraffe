structure GioSettingsBindFlags :> GIO_SETTINGS_BIND_FLAGS =
  struct
    val DEFAULT = 0w0
    val GET = 0w1
    val SET = 0w2
    val NO_SENSITIVITY = 0w4
    val GET_NO_CHANGES = 0w8
    val INVERT_BOOLEAN = 0w16
    val allFlags =
      [
        DEFAULT,
        GET,
        SET,
        NO_SENSITIVITY,
        GET_NO_CHANGES,
        INVERT_BOOLEAN
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "g_settings_bind_flags_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
