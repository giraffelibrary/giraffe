structure GtkTreeViewGridLines :> GTK_TREE_VIEW_GRID_LINES =
  struct
    datatype enum =
      NONE
    | HORIZONTAL
    | VERTICAL
    | BOTH
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | HORIZONTAL => 1
          | VERTICAL => 2
          | BOTH => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NONE
          | 1 => HORIZONTAL
          | 2 => VERTICAL
          | 3 => BOTH
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tree_view_grid_lines_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
