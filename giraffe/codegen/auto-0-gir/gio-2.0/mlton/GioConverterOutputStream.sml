structure GioConverterOutputStream :>
  GIO_CONVERTER_OUTPUT_STREAM
    where type 'a class = 'a GioConverterOutputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class
    where type 'a converter_class = 'a GioConverterClass.class =
  struct
    val getType_ = _import "g_converter_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "g_converter_output_stream_new" : GioOutputStreamClass.FFI.notnull GioOutputStreamClass.FFI.p * GioConverterClass.FFI.notnull GioConverterClass.FFI.p -> GioOutputStreamClass.FFI.notnull GioOutputStreamClass.FFI.p;) (x1, x2)
    val getConverter_ = _import "g_converter_output_stream_get_converter" : GioConverterOutputStreamClass.FFI.notnull GioConverterOutputStreamClass.FFI.p -> GioConverterClass.FFI.notnull GioConverterClass.FFI.p;
    type 'a class = 'a GioConverterOutputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (baseStream, converter) = (GioOutputStreamClass.FFI.withPtr &&&> GioConverterClass.FFI.withPtr ---> GioConverterOutputStreamClass.FFI.fromPtr true) new_ (baseStream & converter)
    fun getConverter self = (GioConverterOutputStreamClass.FFI.withPtr ---> GioConverterClass.FFI.fromPtr false) getConverter_ self
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
