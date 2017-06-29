structure GioConverter :>
  GIO_CONVERTER
    where type 'a class = 'a GioConverterClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_converter_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val reset_ = call (getSymbol "g_converter_reset") (GioConverterClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GioConverterClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun reset self = (GioConverterClass.FFI.withPtr ---> I) reset_ self
  end
