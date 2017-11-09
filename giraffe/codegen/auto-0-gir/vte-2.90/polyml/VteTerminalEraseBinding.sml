structure VteTerminalEraseBinding :> VTE_TERMINAL_ERASE_BINDING =
  struct
    datatype enum =
      AUTO
    | ASCII_BACKSPACE
    | ASCII_DELETE
    | DELETE_SEQUENCE
    | TTY
    structure Enum =
      Enum(
        type enum = enum
        val null = AUTO
        val toInt =
          fn
            AUTO => 0
          | ASCII_BACKSPACE => 1
          | ASCII_DELETE => 2
          | DELETE_SEQUENCE => 3
          | TTY => 4
        exception Value of GInt.t
        val fromInt =
          fn
            0 => AUTO
          | 1 => ASCII_BACKSPACE
          | 2 => ASCII_DELETE
          | 3 => DELETE_SEQUENCE
          | 4 => TTY
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "vte_terminal_erase_binding_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
