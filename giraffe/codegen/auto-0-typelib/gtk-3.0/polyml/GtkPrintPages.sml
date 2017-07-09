structure GtkPrintPages :> GTK_PRINT_PAGES =
  struct
    datatype enum =
      ALL
    | CURRENT
    | RANGES
    | SELECTION
    structure Enum =
      Enum(
        type enum = enum
        val null = ALL
        val toInt =
          fn
            ALL => 0
          | CURRENT => 1
          | RANGES => 2
          | SELECTION => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => ALL
          | 1 => CURRENT
          | 2 => RANGES
          | 3 => SELECTION
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_print_pages_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
