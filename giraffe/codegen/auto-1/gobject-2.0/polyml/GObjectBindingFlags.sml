structure GObjectBindingFlags :>
  sig
    include
      G_OBJECT_BINDING_FLAGS
        where type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
        where type type_t = GObjectType.t
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    val DEFAULT = 0w0
    val BIDIRECTIONAL = 0w1
    val SYNCCREATE = 0w2
    val INVERTBOOLEAN = 0w4
    val allFlags =
      [
        DEFAULT,
        BIDIRECTIONAL,
        SYNCCREATE,
        INVERTBOOLEAN
      ]
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
    structure C =
      struct
        type val_ = FFI.Flags.val_
        type ref_ = FFI.Flags.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.withRef f)
        fun fromVal w = w
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Flags.VAL
        val REF = FFI.PolyML.Flags.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_binding_flags_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_flags") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_flags") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
    type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
