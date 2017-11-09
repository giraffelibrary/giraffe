structure GdkDragProtocol :> GDK_DRAG_PROTOCOL =
  struct
    datatype enum =
      NONE
    | MOTIF
    | XDND
    | ROOTWIN
    | WIN_32_DROPFILES
    | OLE_2
    | LOCAL
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | MOTIF => 1
          | XDND => 2
          | ROOTWIN => 3
          | WIN_32_DROPFILES => 4
          | OLE_2 => 5
          | LOCAL => 6
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NONE
          | 1 => MOTIF
          | 2 => XDND
          | 3 => ROOTWIN
          | 4 => WIN_32_DROPFILES
          | 5 => OLE_2
          | 6 => LOCAL
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_drag_protocol_get_type" : unit -> GObjectType.FFI.val_;
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
