structure PangoGravity :>
  sig
    include
      PANGO_GRAVITY
        where type matrix_record_t = PangoMatrixRecord.t
        where type gravity_hint_t = PangoGravityHint.t
        where type script_t = PangoScript.t
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
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
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            SOUTH => f 0
          | EAST => f 1
          | NORTH => f 2
          | WEST => f 3
          | AUTO => f 4
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => SOUTH
          | 1 => EAST
          | 2 => NORTH
          | 3 => WEST
          | 4 => AUTO
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_gravity_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = SOUTH
    local
      open PolyMLFFI
    in
      val getForMatrix_ = call (load_sym libpango "pango_gravity_get_for_matrix") (PangoMatrixRecord.PolyML.PTR --> PolyML.VAL)
      val getForScript_ =
        call (load_sym libpango "pango_gravity_get_for_script")
          (
            PangoScript.PolyML.VAL
             &&> PolyML.VAL
             &&> PangoGravityHint.PolyML.VAL
             --> PolyML.VAL
          )
      val getForScriptAndWidth_ =
        call (load_sym libpango "pango_gravity_get_for_script_and_width")
          (
            PangoScript.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             &&> PolyML.VAL
             &&> PangoGravityHint.PolyML.VAL
             --> PolyML.VAL
          )
      val toRotation_ = call (load_sym libpango "pango_gravity_to_rotation") (PolyML.VAL --> FFI.Double.PolyML.VAL)
    end
    type matrix_record_t = PangoMatrixRecord.t
    type gravity_hint_t = PangoGravityHint.t
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
         &&&> FFI.Bool.C.withVal
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
    fun toRotation gravity = (C.withVal ---> FFI.Double.C.fromVal) toRotation_ gravity
  end
