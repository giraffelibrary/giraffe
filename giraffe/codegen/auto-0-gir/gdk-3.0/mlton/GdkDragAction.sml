structure GdkDragAction :> GDK_DRAG_ACTION =
  struct
    val DEFAULT = 0w1
    val COPY = 0w2
    val MOVE = 0w4
    val LINK = 0w8
    val PRIVATE = 0w16
    val ASK = 0w32
    val allFlags =
      [
        DEFAULT,
        COPY,
        MOVE,
        LINK,
        PRIVATE,
        ASK
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "gdk_drag_action_get_type" : unit -> GObjectType.FFI.val_;
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
