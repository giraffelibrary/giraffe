structure GioConverterInputStream :>
  GIO_CONVERTER_INPUT_STREAM
    where type 'a class = 'a GioConverterInputStreamClass.class
    where type 'a pollable_input_stream_class = 'a GioPollableInputStreamClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a converter_class = 'a GioConverterClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_converter_input_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_converter_input_stream_new") (GioInputStreamClass.PolyML.cPtr &&> GioConverterClass.PolyML.cPtr --> GioInputStreamClass.PolyML.cPtr)
      val getConverter_ = call (getSymbol "g_converter_input_stream_get_converter") (GioConverterInputStreamClass.PolyML.cPtr --> GioConverterClass.PolyML.cPtr)
    end
    type 'a class = 'a GioConverterInputStreamClass.class
    type 'a pollable_input_stream_class = 'a GioPollableInputStreamClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type t = base class
    fun asPollableInputStream self = (GObjectObjectClass.FFI.withPtr ---> GioPollableInputStreamClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (baseStream, converter) = (GioInputStreamClass.FFI.withPtr &&&> GioConverterClass.FFI.withPtr ---> GioConverterInputStreamClass.FFI.fromPtr true) new_ (baseStream & converter)
    fun getConverter self = (GioConverterInputStreamClass.FFI.withPtr ---> GioConverterClass.FFI.fromPtr false) getConverter_ self
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
