structure GioConverterInputStream :>
  GIO_CONVERTER_INPUT_STREAM
    where type 'a class = 'a GioConverterInputStreamClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a converter_class = 'a GioConverterClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_converter_input_stream_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_converter_input_stream_new") (GioInputStreamClass.PolyML.cPtr &&> GioConverterClass.PolyML.cPtr --> GioInputStreamClass.PolyML.cPtr)
      val getConverter_ = call (load_sym libgio "g_converter_input_stream_get_converter") (GioConverterInputStreamClass.PolyML.cPtr --> GioConverterClass.PolyML.cPtr)
    end
    type 'a class = 'a GioConverterInputStreamClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream converter = (GioInputStreamClass.C.withPtr &&&> GioConverterClass.C.withPtr ---> GioConverterInputStreamClass.C.fromPtr true) new_ (baseStream & converter)
    fun getConverter self = (GioConverterInputStreamClass.C.withPtr ---> GioConverterClass.C.fromPtr false) getConverter_ self
    local
      open Property
    in
      val converterProp =
        {
          get = fn x => get "converter" GioConverterClass.tOpt x,
          set = fn x => set "converter" GioConverterClass.tOpt x
        }
    end
  end
