structure PangoGravity :>
  PANGO_GRAVITY
    where type matrix_t = PangoMatrixRecord.t
    where type gravity_hint_t = PangoGravityHint.t
    where type script_t = PangoScript.t =
  struct
    datatype enum =
      SOUTH
    | EAST
    | NORTH
    | WEST
    | AUTO
    structure Enum =
      Enum(
        type enum = enum
        val null = SOUTH
        val toInt =
          fn
            SOUTH => 0
          | EAST => 1
          | NORTH => 2
          | WEST => 3
          | AUTO => 4
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => SOUTH
          | 1 => EAST
          | 2 => NORTH
          | 3 => WEST
          | 4 => AUTO
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_gravity_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    local
      open PolyMLFFI
    in
      val getForMatrix_ = call (getSymbol "pango_gravity_get_for_matrix") (PangoMatrixRecord.PolyML.cPtr --> PolyML.cVal)
      val getForScript_ =
        call (getSymbol "pango_gravity_get_for_script")
          (
            PangoScript.PolyML.cVal
             &&> PolyML.cVal
             &&> PangoGravityHint.PolyML.cVal
             --> PolyML.cVal
          )
      val getForScriptAndWidth_ =
        call (getSymbol "pango_gravity_get_for_script_and_width")
          (
            PangoScript.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> PolyML.cVal
             &&> PangoGravityHint.PolyML.cVal
             --> PolyML.cVal
          )
      val toRotation_ = call (getSymbol "pango_gravity_to_rotation") (PolyML.cVal --> GDouble.PolyML.cVal)
    end
    type matrix_t = PangoMatrixRecord.t
    type gravity_hint_t = PangoGravityHint.t
    type script_t = PangoScript.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getForMatrix matrix = (PangoMatrixRecord.FFI.withPtr ---> FFI.fromVal) getForMatrix_ matrix
    fun getForScript script baseGravity hint =
      (
        PangoScript.FFI.withVal
         &&&> FFI.withVal
         &&&> PangoGravityHint.FFI.withVal
         ---> FFI.fromVal
      )
        getForScript_
        (
          script
           & baseGravity
           & hint
        )
    fun getForScriptAndWidth script wide baseGravity hint =
      (
        PangoScript.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> FFI.withVal
         &&&> PangoGravityHint.FFI.withVal
         ---> FFI.fromVal
      )
        getForScriptAndWidth_
        (
          script
           & wide
           & baseGravity
           & hint
        )
    fun toRotation gravity = (FFI.withVal ---> GDouble.FFI.fromVal) toRotation_ gravity
  end
