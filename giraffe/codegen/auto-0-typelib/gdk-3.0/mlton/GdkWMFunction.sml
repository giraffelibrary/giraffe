structure GdkWMFunction :> GDK_W_M_FUNCTION =
  struct
    val ALL = 0w1
    val RESIZE = 0w2
    val MOVE = 0w4
    val MINIMIZE = 0w8
    val MAXIMIZE = 0w16
    val CLOSE = 0w32
    val allFlags =
      [
        ALL,
        RESIZE,
        MOVE,
        MINIMIZE,
        MAXIMIZE,
        CLOSE
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "gdk_wm_function_get_type" : unit -> GObjectType.FFI.val_;
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
