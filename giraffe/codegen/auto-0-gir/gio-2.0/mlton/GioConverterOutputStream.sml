structure GioConverterOutputStream :>
  GIO_CONVERTER_OUTPUT_STREAM
    where type 'a class_t = 'a GioConverterOutputStreamClass.t
    where type 'a output_stream_class_t = 'a GioOutputStreamClass.t
    where type 'a converter_class_t = 'a GioConverterClass.t =
  struct
    val getType_ = _import "g_converter_output_stream_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "g_converter_output_stream_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getConverter_ = _import "g_converter_output_stream_get_converter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GioConverterOutputStreamClass.t
    type 'a output_stream_class_t = 'a GioOutputStreamClass.t
    type 'a converter_class_t = 'a GioConverterClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream converter = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GioConverterOutputStreamClass.C.fromPtr true) new_ (baseStream & converter)
    fun getConverter self = (GObjectObjectClass.C.withPtr ---> GioConverterClass.C.fromPtr false) getConverter_ self
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
