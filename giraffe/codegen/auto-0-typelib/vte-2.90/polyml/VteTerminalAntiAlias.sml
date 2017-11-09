structure VteTerminalAntiAlias :> VTE_TERMINAL_ANTI_ALIAS =
  struct
    datatype enum =
      USE_DEFAULT
    | FORCE_ENABLE
    | FORCE_DISABLE
    structure Enum =
      Enum(
        type enum = enum
        val null = USE_DEFAULT
        val toInt =
          fn
            USE_DEFAULT => 0
          | FORCE_ENABLE => 1
          | FORCE_DISABLE => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => USE_DEFAULT
          | 1 => FORCE_ENABLE
          | 2 => FORCE_DISABLE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "vte_terminal_anti_alias_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
