structure GtkSourceDrawSpacesFlags :> GTK_SOURCE_DRAW_SPACES_FLAGS =
  struct
    val SPACE = 0w1
    val TAB = 0w2
    val NEWLINE = 0w4
    val NBSP = 0w8
    val LEADING = 0w16
    val TEXT = 0w32
    val TRAILING = 0w64
    val ALL = 0w127
    val allFlags =
      [
        SPACE,
        TAB,
        NEWLINE,
        NBSP,
        LEADING,
        TEXT,
        TRAILING,
        ALL
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "gtk_source_draw_spaces_flags_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
