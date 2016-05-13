structure GioConverterOutputStream :>
  GIO_CONVERTER_OUTPUT_STREAM
    where type 'a class = 'a GioConverterOutputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class
    where type 'a converter_class = 'a GioConverterClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_converter_output_stream_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_converter_output_stream_new") (GioOutputStreamClass.PolyML.cPtr &&> GioConverterClass.PolyML.cPtr --> GioOutputStreamClass.PolyML.cPtr)
      val getConverter_ = call (load_sym libgio "g_converter_output_stream_get_converter") (GioConverterOutputStreamClass.PolyML.cPtr --> GioConverterClass.PolyML.cPtr)
    end
    type 'a class = 'a GioConverterOutputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream converter = (GioOutputStreamClass.C.withPtr &&&> GioConverterClass.C.withPtr ---> GioConverterOutputStreamClass.C.fromPtr true) new_ (baseStream & converter)
    fun getConverter self = (GioConverterOutputStreamClass.C.withPtr ---> GioConverterClass.C.fromPtr false) getConverter_ self
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
