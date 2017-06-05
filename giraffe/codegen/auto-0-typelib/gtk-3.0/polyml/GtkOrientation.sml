structure GtkOrientation :> GTK_ORIENTATION =
  struct
    datatype enum =
      HORIZONTAL
    | VERTICAL
    structure Enum =
      Enum(
        type enum = enum
        val null = HORIZONTAL
        val toInt =
          fn
            HORIZONTAL => 0
          | VERTICAL => 1
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => HORIZONTAL
          | 1 => VERTICAL
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_orientation_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
