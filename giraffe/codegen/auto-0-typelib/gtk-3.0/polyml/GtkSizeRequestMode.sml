structure GtkSizeRequestMode :> GTK_SIZE_REQUEST_MODE =
  struct
    datatype enum =
      HEIGHT_FOR_WIDTH
    | WIDTH_FOR_HEIGHT
    | CONSTANT_SIZE
    structure Enum =
      Enum(
        type enum = enum
        val null = HEIGHT_FOR_WIDTH
        val toInt =
          fn
            HEIGHT_FOR_WIDTH => 0
          | WIDTH_FOR_HEIGHT => 1
          | CONSTANT_SIZE => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => HEIGHT_FOR_WIDTH
          | 1 => WIDTH_FOR_HEIGHT
          | 2 => CONSTANT_SIZE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_size_request_mode_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
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
