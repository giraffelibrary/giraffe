structure PangoGravityHint :> PANGO_GRAVITY_HINT =
  struct
    datatype enum =
      NATURAL
    | STRONG
    | LINE
    structure Enum =
      Enum(
        type enum = enum
        val null = NATURAL
        val toInt =
          fn
            NATURAL => 0
          | STRONG => 1
          | LINE => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NATURAL
          | 1 => STRONG
          | 2 => LINE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_gravity_hint_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
