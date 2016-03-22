structure GioConverterInputStream :>
  GIO_CONVERTER_INPUT_STREAM
    where type 'a class = 'a GioConverterInputStreamClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a converter_class = 'a GioConverterClass.class =
  struct
    val getType_ = _import "g_converter_input_stream_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "g_converter_input_stream_new" : GioInputStreamClass.C.notnull GioInputStreamClass.C.p * GioConverterClass.C.notnull GioConverterClass.C.p -> GioInputStreamClass.C.notnull GioInputStreamClass.C.p;) (x1, x2)
    val getConverter_ = _import "g_converter_input_stream_get_converter" : GioConverterInputStreamClass.C.notnull GioConverterInputStreamClass.C.p -> GioConverterClass.C.notnull GioConverterClass.C.p;
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
