structure GdkWindowState :> GDK_WINDOW_STATE =
  struct
    val WITHDRAWN = 0w1
    val ICONIFIED = 0w2
    val MAXIMIZED = 0w4
    val STICKY = 0w8
    val FULLSCREEN = 0w16
    val ABOVE = 0w32
    val BELOW = 0w64
    val FOCUSED = 0w128
    val TILED = 0w256
    val allFlags =
      [
        WITHDRAWN,
        ICONIFIED,
        MAXIMIZED,
        STICKY,
        FULLSCREEN,
        ABOVE,
        BELOW,
        FOCUSED,
        TILED
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "gdk_window_state_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
