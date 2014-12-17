structure GioConverter :>
  GIO_CONVERTER
    where type 'a class_t = 'a GioConverterClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_converter_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val reset_ = call (load_sym libgio "g_converter_reset") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioConverterClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun reset self = (GObjectObjectClass.C.withPtr ---> I) reset_ self
  end
