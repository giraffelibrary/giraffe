structure GdkVisualType :> GDK_VISUAL_TYPE =
  struct
    datatype enum =
      STATIC_GRAY
    | GRAYSCALE
    | STATIC_COLOR
    | PSEUDO_COLOR
    | TRUE_COLOR
    | DIRECT_COLOR
    structure Enum =
      Enum(
        type enum = enum
        val null = STATIC_GRAY
        val toInt =
          fn
            STATIC_GRAY => 0
          | GRAYSCALE => 1
          | STATIC_COLOR => 2
          | PSEUDO_COLOR => 3
          | TRUE_COLOR => 4
          | DIRECT_COLOR => 5
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => STATIC_GRAY
          | 1 => GRAYSCALE
          | 2 => STATIC_COLOR
          | 3 => PSEUDO_COLOR
          | 4 => TRUE_COLOR
          | 5 => DIRECT_COLOR
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_visual_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
