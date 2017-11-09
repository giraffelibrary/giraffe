structure GtkCellRendererState :> GTK_CELL_RENDERER_STATE =
  struct
    val SELECTED = 0w1
    val PRELIT = 0w2
    val INSENSITIVE = 0w4
    val SORTED = 0w8
    val FOCUSED = 0w16
    val allFlags =
      [
        SELECTED,
        PRELIT,
        INSENSITIVE,
        SORTED,
        FOCUSED
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "gtk_cell_renderer_state_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
