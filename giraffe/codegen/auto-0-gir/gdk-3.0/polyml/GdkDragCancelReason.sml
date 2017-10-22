structure GdkDragCancelReason :> GDK_DRAG_CANCEL_REASON =
  struct
    datatype enum =
      NO_TARGET
    | USER_CANCELLED
    | ERROR
    structure Enum =
      Enum(
        type enum = enum
        val null = NO_TARGET
        val toInt =
          fn
            NO_TARGET => 0
          | USER_CANCELLED => 1
          | ERROR => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NO_TARGET
          | 1 => USER_CANCELLED
          | 2 => ERROR
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_drag_cancel_reason_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
