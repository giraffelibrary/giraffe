structure GdkFullscreenMode :> GDK_FULLSCREEN_MODE =
  struct
    datatype enum =
      CURRENT_MONITOR
    | ALL_MONITORS
    structure Enum =
      Enum(
        type enum = enum
        val null = CURRENT_MONITOR
        val toInt =
          fn
            CURRENT_MONITOR => 0
          | ALL_MONITORS => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => CURRENT_MONITOR
          | 1 => ALL_MONITORS
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_fullscreen_mode_get_type" : unit -> GObjectType.FFI.val_;
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