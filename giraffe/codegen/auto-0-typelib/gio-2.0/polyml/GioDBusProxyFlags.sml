structure GioDBusProxyFlags :>
  sig
    include GIO_D_BUS_PROXY_FLAGS
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val DO_NOT_LOAD_PROPERTIES = 0w1
    val DO_NOT_CONNECT_SIGNALS = 0w2
    val DO_NOT_AUTO_START = 0w4
    val allFlags =
      [
        NONE,
        DO_NOT_LOAD_PROPERTIES,
        DO_NOT_CONNECT_SIGNALS,
        DO_NOT_AUTO_START
      ]
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
    structure C =
      struct
        type val_ = FFI.Flags.C.val_
        type ref_ = FFI.Flags.C.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.C.withRef f)
        fun fromVal w = w
      end
    structure PolyML =
      struct
        val cVal = FFI.Flags.PolyML.cVal
        val cRef = FFI.Flags.PolyML.cRef
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_proxy_flags_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> FFI.PolyML.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
