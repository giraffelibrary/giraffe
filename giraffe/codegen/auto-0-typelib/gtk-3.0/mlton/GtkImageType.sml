structure GtkImageType :> GTK_IMAGE_TYPE =
  struct
    datatype enum =
      EMPTY
    | PIXBUF
    | STOCK
    | ICON_SET
    | ANIMATION
    | ICON_NAME
    | GICON
    structure Enum =
      Enum(
        type enum = enum
        val null = EMPTY
        val toInt =
          fn
            EMPTY => 0
          | PIXBUF => 1
          | STOCK => 2
          | ICON_SET => 3
          | ANIMATION => 4
          | ICON_NAME => 5
          | GICON => 6
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => EMPTY
          | 1 => PIXBUF
          | 2 => STOCK
          | 3 => ICON_SET
          | 4 => ANIMATION
          | 5 => ICON_NAME
          | 6 => GICON
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_image_type_get_type" : unit -> GObjectType.FFI.val_;
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
