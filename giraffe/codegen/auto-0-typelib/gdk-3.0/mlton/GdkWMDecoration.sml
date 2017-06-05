structure GdkWMDecoration :> GDK_W_M_DECORATION =
  struct
    val ALL = 0w1
    val BORDER = 0w2
    val RESIZEH = 0w4
    val TITLE = 0w8
    val MENU = 0w16
    val MINIMIZE = 0w32
    val MAXIMIZE = 0w64
    val allFlags =
      [
        ALL,
        BORDER,
        RESIZEH,
        TITLE,
        MENU,
        MINIMIZE,
        MAXIMIZE
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "gdk_wm_decoration_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
