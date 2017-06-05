structure CairoContent :> CAIRO_CONTENT =
  struct
    datatype enum =
      COLOR
    | ALPHA
    | COLOR_ALPHA
    structure Enum =
      Enum(
        type enum = enum
        val null = COLOR
        val toInt =
          fn
            COLOR => 4096
          | ALPHA => 8192
          | COLOR_ALPHA => 12288
        exception Value of GInt.t
        val fromInt =
          fn
            4096 => COLOR
          | 8192 => ALPHA
          | 12288 => COLOR_ALPHA
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "cairo_gobject_content_get_type" : unit -> GObjectType.FFI.val_;
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
