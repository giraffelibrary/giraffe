structure GtkWindowPosition :> GTK_WINDOW_POSITION =
  struct
    datatype enum =
      NONE
    | CENTER
    | MOUSE
    | CENTER_ALWAYS
    | CENTER_ON_PARENT
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | CENTER => 1
          | MOUSE => 2
          | CENTER_ALWAYS => 3
          | CENTER_ON_PARENT => 4
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NONE
          | 1 => CENTER
          | 2 => MOUSE
          | 3 => CENTER_ALWAYS
          | 4 => CENTER_ON_PARENT
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_window_position_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
