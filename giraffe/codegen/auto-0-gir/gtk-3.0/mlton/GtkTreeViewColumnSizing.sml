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
    val getType_ = _import "gtk_tree_view_column_sizing_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
