structure GtkTreeViewGridLines :>
  sig
    include GTK_TREE_VIEW_GRID_LINES
  end =
  struct
    datatype t =
      NONE
    | HORIZONTAL
    | VERTICAL
    | BOTH
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NONE => f 0
          | HORIZONTAL => f 1
          | VERTICAL => f 2
          | BOTH => f 3
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => NONE
          | 1 => HORIZONTAL
          | 2 => VERTICAL
          | 3 => BOTH
          | n => raise Value n
      end
    val getType_ = _import "gtk_tree_view_grid_lines_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NONE
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
