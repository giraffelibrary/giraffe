structure GdkPropMode :> GDK_PROP_MODE =
  struct
    datatype enum =
      REPLACE
    | PREPEND
    | APPEND
    structure Enum =
      Enum(
        type enum = enum
        val null = REPLACE
        val toInt =
          fn
            REPLACE => 0
          | PREPEND => 1
          | APPEND => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => REPLACE
          | 1 => PREPEND
          | 2 => APPEND
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_prop_mode_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
