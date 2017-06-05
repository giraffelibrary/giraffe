structure GdkVisibilityState :> GDK_VISIBILITY_STATE =
  struct
    datatype enum =
      UNOBSCURED
    | PARTIAL
    | FULLY_OBSCURED
    structure Enum =
      Enum(
        type enum = enum
        val null = UNOBSCURED
        val toInt =
          fn
            UNOBSCURED => 0
          | PARTIAL => 1
          | FULLY_OBSCURED => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => UNOBSCURED
          | 1 => PARTIAL
          | 2 => FULLY_OBSCURED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_visibility_state_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
