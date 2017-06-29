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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_image_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
