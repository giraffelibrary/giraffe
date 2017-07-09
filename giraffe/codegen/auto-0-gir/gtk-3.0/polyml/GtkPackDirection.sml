structure GtkPackDirection :> GTK_PACK_DIRECTION =
  struct
    datatype enum =
      LTR
    | RTL
    | TTB
    | BTT
    structure Enum =
      Enum(
        type enum = enum
        val null = LTR
        val toInt =
          fn
            LTR => 0
          | RTL => 1
          | TTB => 2
          | BTT => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => LTR
          | 1 => RTL
          | 2 => TTB
          | 3 => BTT
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_pack_direction_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
