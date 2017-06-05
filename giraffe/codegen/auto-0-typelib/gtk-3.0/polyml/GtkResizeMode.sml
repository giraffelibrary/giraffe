structure GtkResizeMode :> GTK_RESIZE_MODE =
  struct
    datatype enum =
      PARENT
    | QUEUE
    | IMMEDIATE
    structure Enum =
      Enum(
        type enum = enum
        val null = PARENT
        val toInt =
          fn
            PARENT => 0
          | QUEUE => 1
          | IMMEDIATE => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => PARENT
          | 1 => QUEUE
          | 2 => IMMEDIATE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_resize_mode_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
