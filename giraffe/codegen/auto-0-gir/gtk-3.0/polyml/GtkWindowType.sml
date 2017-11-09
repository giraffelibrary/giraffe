structure GtkWindowType :> GTK_WINDOW_TYPE =
  struct
    datatype enum =
      TOPLEVEL
    | POPUP
    structure Enum =
      Enum(
        type enum = enum
        val null = TOPLEVEL
        val toInt =
          fn
            TOPLEVEL => 0
          | POPUP => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => TOPLEVEL
          | 1 => POPUP
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_window_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
