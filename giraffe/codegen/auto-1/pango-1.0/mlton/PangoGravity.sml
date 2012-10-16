structure PangoGravity :>
  sig
    include
      PANGO_GRAVITY
        where type matrixrecord_t = PangoMatrixRecord.t
        where type gravityhint_t = PangoGravityHint.t
        where type script_t = PangoScript.t
  end =
  struct
    datatype t =
      SOUTH
    | EAST
    | NORTH
    | WEST
    | AUTO
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            SOUTH => f 0
          | EAST => f 1
          | NORTH => f 2
          | WEST => f 3
          | AUTO => f 4
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => SOUTH
          | 1 => EAST
          | 2 => NORTH
          | 3 => WEST
          | 4 => AUTO
          | n => raise Value n
      end
    val getType_ = _import "pango_gravity_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = SOUTH
    val getForMatrix_ = _import "pango_gravity_get_for_matrix" : PangoMatrixRecord.C.notnull PangoMatrixRecord.C.p -> C.val_;
    val getForScript_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_gravity_get_for_script" :
              PangoScript.C.val_
               * C.val_
               * PangoGravityHint.C.val_
               -> C.val_;
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
              PangoScript.C.val_
               * FFI.Bool.val_
               * C.val_
               * PangoGravityHint.C.val_
               -> C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val toRotation_ = _import "pango_gravity_to_rotation" : C.val_ -> FFI.Double.val_;
    type matrixrecord_t = PangoMatrixRecord.t
    type gravityhint_t = PangoGravityHint.t
    type script_t = PangoScript.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getForMatrix matrix = (PangoMatrixRecord.C.withPtr ---> C.fromVal) getForMatrix_ matrix
    fun getForScript script baseGravity hint =
      (
        PangoScript.C.withVal
         &&&> C.withVal
         &&&> PangoGravityHint.C.withVal
         ---> C.fromVal
      )
        getForScript_
        (
          script
           & baseGravity
           & hint
        )
    fun getForScriptAndWidth script wide baseGravity hint =
      (
        PangoScript.C.withVal
         &&&> FFI.Bool.withVal
         &&&> C.withVal
         &&&> PangoGravityHint.C.withVal
         ---> C.fromVal
      )
        getForScriptAndWidth_
        (
          script
           & wide
           & baseGravity
           & hint
        )
    fun toRotation gravity = (C.withVal ---> FFI.Double.fromVal) toRotation_ gravity
  end
