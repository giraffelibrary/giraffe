structure VteTerminalCursorShape :> VTE_TERMINAL_CURSOR_SHAPE =
  struct
    datatype enum =
      BLOCK
    | IBEAM
    | UNDERLINE
    structure Enum =
      Enum(
        type enum = enum
        val null = BLOCK
        val toInt =
          fn
            BLOCK => 0
          | IBEAM => 1
          | UNDERLINE => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => BLOCK
          | 1 => IBEAM
          | 2 => UNDERLINE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "vte_terminal_cursor_shape_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
