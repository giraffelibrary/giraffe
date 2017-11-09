structure GtkStateFlags :> GTK_STATE_FLAGS =
  struct
    val NORMAL = 0w0
    val ACTIVE = 0w1
    val PRELIGHT = 0w2
    val SELECTED = 0w4
    val INSENSITIVE = 0w8
    val INCONSISTENT = 0w16
    val FOCUSED = 0w32
    val allFlags =
      [
        NORMAL,
        ACTIVE,
        PRELIGHT,
        SELECTED,
        INSENSITIVE,
        INCONSISTENT,
        FOCUSED
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_state_flags_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
