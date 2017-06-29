structure GtkSortType :> GTK_SORT_TYPE =
  struct
    datatype enum =
      ASCENDING
    | DESCENDING
    structure Enum =
      Enum(
        type enum = enum
        val null = ASCENDING
        val toInt =
          fn
            ASCENDING => 0
          | DESCENDING => 1
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => ASCENDING
          | 1 => DESCENDING
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_sort_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
