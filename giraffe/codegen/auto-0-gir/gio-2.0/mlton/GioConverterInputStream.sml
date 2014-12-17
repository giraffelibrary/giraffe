structure GioConverterInputStream :>
  GIO_CONVERTER_INPUT_STREAM
    where type 'a class_t = 'a GioConverterInputStreamClass.t
    where type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    where type 'a converterclass_t = 'a GioConverterClass.t =
  struct
    val getType_ = _import "g_converter_input_stream_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "g_converter_input_stream_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getConverter_ = _import "g_converter_input_stream_get_converter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GioConverterInputStreamClass.t
    type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    type 'a converterclass_t = 'a GioConverterClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream converter = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GioConverterInputStreamClass.C.fromPtr true) new_ (baseStream & converter)
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
