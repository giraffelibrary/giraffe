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
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NONE
          | 1 => HORIZONTAL
          | 2 => VERTICAL
          | 3 => BOTH
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_tree_view_grid_lines_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
