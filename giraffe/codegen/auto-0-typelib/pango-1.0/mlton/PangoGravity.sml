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
    val getType_ = _import "pango_gravity_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getForMatrix_ = _import "pango_gravity_get_for_matrix" : PangoMatrixRecord.FFI.notnull PangoMatrixRecord.FFI.p -> FFI.val_;
    val getForScript_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_gravity_get_for_script" :
              PangoScript.FFI.val_
               * FFI.val_
               * PangoGravityHint.FFI.val_
               -> FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getForScriptAndWidth_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_gravity_get_for_script_and_width" :
              PangoScript.FFI.val_
               * GBool.FFI.val_
               * FFI.val_
               * PangoGravityHint.FFI.val_
               -> FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val toRotation_ = _import "pango_gravity_to_rotation" : FFI.val_ -> GDouble.FFI.val_;
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
