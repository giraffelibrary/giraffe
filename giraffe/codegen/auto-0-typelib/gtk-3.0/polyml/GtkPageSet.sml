structure GtkPageSet :> GTK_PAGE_SET =
  struct
    datatype enum =
      ALL
    | EVEN
    | ODD
    structure Enum =
      Enum(
        type enum = enum
        val null = ALL
        val toInt =
          fn
            ALL => 0
          | EVEN => 1
          | ODD => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => ALL
          | 1 => EVEN
          | 2 => ODD
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_page_set_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
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
