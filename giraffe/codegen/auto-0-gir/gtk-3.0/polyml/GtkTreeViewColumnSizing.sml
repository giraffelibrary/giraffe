structure GtkTreeViewColumnSizing :> GTK_TREE_VIEW_COLUMN_SIZING =
  struct
    datatype enum =
      GROW_ONLY
    | AUTOSIZE
    | FIXED
    structure Enum =
      Enum(
        type enum = enum
        val null = GROW_ONLY
        val toInt =
          fn
            GROW_ONLY => 0
          | AUTOSIZE => 1
          | FIXED => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => GROW_ONLY
          | 1 => AUTOSIZE
          | 2 => FIXED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_view_column_sizing_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
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
