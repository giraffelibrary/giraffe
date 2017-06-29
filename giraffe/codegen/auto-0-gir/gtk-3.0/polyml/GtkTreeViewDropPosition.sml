structure GtkTreeViewDropPosition :> GTK_TREE_VIEW_DROP_POSITION =
  struct
    datatype enum =
      BEFORE
    | AFTER
    | INTO_OR_BEFORE
    | INTO_OR_AFTER
    structure Enum =
      Enum(
        type enum = enum
        val null = BEFORE
        val toInt =
          fn
            BEFORE => 0
          | AFTER => 1
          | INTO_OR_BEFORE => 2
          | INTO_OR_AFTER => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => BEFORE
          | 1 => AFTER
          | 2 => INTO_OR_BEFORE
          | 3 => INTO_OR_AFTER
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tree_view_drop_position_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
