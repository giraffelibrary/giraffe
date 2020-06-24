structure GtkStateFlags :> GTK_STATE_FLAGS =
  struct
    val NORMAL = 0w0
    val ACTIVE = 0w1
    val PRELIGHT = 0w2
    val SELECTED = 0w4
    val INSENSITIVE = 0w8
    val INCONSISTENT = 0w16
    val FOCUSED = 0w32
    val BACKDROP = 0w64
    val DIR_LTR = 0w128
    val DIR_RTL = 0w256
    val LINK = 0w512
    val VISITED = 0w1024
    val CHECKED = 0w2048
    val DROP_ACTIVE = 0w4096
    val allFlags =
      [
        NORMAL,
        ACTIVE,
        PRELIGHT,
        SELECTED,
        INSENSITIVE,
        INCONSISTENT,
        FOCUSED,
        BACKDROP,
        DIR_LTR,
        DIR_RTL,
        LINK,
        VISITED,
        CHECKED,
        DROP_ACTIVE
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "gtk_state_flags_get_type" : unit -> GObjectType.FFI.val_;
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
