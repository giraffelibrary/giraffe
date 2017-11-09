structure GtkArrowPlacement :> GTK_ARROW_PLACEMENT =
  struct
    datatype enum =
      BOTH
    | START
    | END
    structure Enum =
      Enum(
        type enum = enum
        val null = BOTH
        val toInt =
          fn
            BOTH => 0
          | START => 1
          | END => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => BOTH
          | 1 => START
          | 2 => END
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_arrow_placement_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
