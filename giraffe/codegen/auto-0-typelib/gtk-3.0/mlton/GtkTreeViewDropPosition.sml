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
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => BEFORE
          | 1 => AFTER
          | 2 => INTO_OR_BEFORE
          | 3 => INTO_OR_AFTER
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_tree_view_drop_position_get_type" : unit -> GObjectType.FFI.val_;
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
