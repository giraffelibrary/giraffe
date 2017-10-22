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
    | WAYLAND
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
          | WAYLAND => 7
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
          | 7 => WAYLAND
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_drag_protocol_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
