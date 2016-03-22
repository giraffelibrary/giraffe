structure GioConverterOutputStream :>
  GIO_CONVERTER_OUTPUT_STREAM
    where type 'a class = 'a GioConverterOutputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class
    where type 'a converter_class = 'a GioConverterClass.class =
  struct
    val getType_ = _import "g_converter_output_stream_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "g_converter_output_stream_new" : GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p * GioConverterClass.C.notnull GioConverterClass.C.p -> GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p;) (x1, x2)
    val getConverter_ = _import "g_converter_output_stream_get_converter" : GioConverterOutputStreamClass.C.notnull GioConverterOutputStreamClass.C.p -> GioConverterClass.C.notnull GioConverterClass.C.p;
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
