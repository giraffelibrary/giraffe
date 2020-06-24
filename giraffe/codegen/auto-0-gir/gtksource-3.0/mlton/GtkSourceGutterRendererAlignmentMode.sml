structure GtkSourceGutterRendererAlignmentMode :> GTK_SOURCE_GUTTER_RENDERER_ALIGNMENT_MODE =
  struct
    datatype enum =
      CELL
    | FIRST
    | LAST
    structure Enum =
      Enum(
        type enum = enum
        val null = CELL
        val toInt =
          fn
            CELL => 0
          | FIRST => 1
          | LAST => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => CELL
          | 1 => FIRST
          | 2 => LAST
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_source_gutter_renderer_alignment_mode_get_type" : unit -> GObjectType.FFI.val_;
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
