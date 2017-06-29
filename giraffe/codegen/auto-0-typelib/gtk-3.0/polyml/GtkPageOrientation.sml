structure GtkPageOrientation :> GTK_PAGE_ORIENTATION =
  struct
    datatype enum =
      PORTRAIT
    | LANDSCAPE
    | REVERSE_PORTRAIT
    | REVERSE_LANDSCAPE
    structure Enum =
      Enum(
        type enum = enum
        val null = PORTRAIT
        val toInt =
          fn
            PORTRAIT => 0
          | LANDSCAPE => 1
          | REVERSE_PORTRAIT => 2
          | REVERSE_LANDSCAPE => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => PORTRAIT
          | 1 => LANDSCAPE
          | 2 => REVERSE_PORTRAIT
          | 3 => REVERSE_LANDSCAPE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_page_orientation_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
