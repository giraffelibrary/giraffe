structure GtkDebugFlag :> GTK_DEBUG_FLAG =
  struct
    val MISC = 0w1
    val PLUGSOCKET = 0w2
    val TEXT = 0w4
    val TREE = 0w8
    val UPDATES = 0w16
    val KEYBINDINGS = 0w32
    val MULTIHEAD = 0w64
    val MODULES = 0w128
    val GEOMETRY = 0w256
    val ICONTHEME = 0w512
    val PRINTING = 0w1024
    val BUILDER = 0w2048
    val SIZE_REQUEST = 0w4096
    val NO_CSS_CACHE = 0w8192
    val BASELINES = 0w16384
    val PIXEL_CACHE = 0w32768
    val NO_PIXEL_CACHE = 0w65536
    val INTERACTIVE = 0w131072
    val TOUCHSCREEN = 0w262144
    val ACTIONS = 0w524288
    val RESIZE = 0w1048576
    val LAYOUT = 0w2097152
    val allFlags =
      [
        MISC,
        PLUGSOCKET,
        TEXT,
        TREE,
        UPDATES,
        KEYBINDINGS,
        MULTIHEAD,
        MODULES,
        GEOMETRY,
        ICONTHEME,
        PRINTING,
        BUILDER,
        SIZE_REQUEST,
        NO_CSS_CACHE,
        BASELINES,
        PIXEL_CACHE,
        NO_PIXEL_CACHE,
        INTERACTIVE,
        TOUCHSCREEN,
        ACTIONS,
        RESIZE,
        LAYOUT
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "gtk_debug_flag_get_type" : unit -> GObjectType.FFI.val_;
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
