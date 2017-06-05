structure PangoCoverageLevel :> PANGO_COVERAGE_LEVEL =
  struct
    datatype enum =
      NONE
    | FALLBACK
    | APPROXIMATE
    | EXACT
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | FALLBACK => 1
          | APPROXIMATE => 2
          | EXACT => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NONE
          | 1 => FALLBACK
          | 2 => APPROXIMATE
          | 3 => EXACT
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_coverage_level_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
