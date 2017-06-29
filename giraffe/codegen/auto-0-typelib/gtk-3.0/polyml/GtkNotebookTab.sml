structure GtkNotebookTab :> GTK_NOTEBOOK_TAB =
  struct
    datatype enum =
      FIRST
    | LAST
    structure Enum =
      Enum(
        type enum = enum
        val null = FIRST
        val toInt =
          fn
            FIRST => 0
          | LAST => 1
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => FIRST
          | 1 => LAST
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_notebook_tab_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
