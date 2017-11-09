structure VtePtyFlags :> VTE_PTY_FLAGS =
  struct
    val NO_LASTLOG = 0w1
    val NO_UTMP = 0w2
    val NO_WTMP = 0w4
    val NO_HELPER = 0w8
    val NO_FALLBACK = 0w16
    val DEFAULT = 0w0
    val allFlags =
      [
        NO_LASTLOG,
        NO_UTMP,
        NO_WTMP,
        NO_HELPER,
        NO_FALLBACK,
        DEFAULT
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "vte_pty_flags_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
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
