structure GioConverter :>
  GIO_CONVERTER
    where type 'a class = 'a GioConverterClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_converter_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val reset_ = call (load_sym libgio "g_converter_reset") (GioConverterClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioConverterClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun reset self = (GioConverterClass.C.withPtr ---> I) reset_ self
  end
