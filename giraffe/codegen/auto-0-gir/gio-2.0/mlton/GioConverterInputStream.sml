structure GioConverterInputStream :>
  GIO_CONVERTER_INPUT_STREAM
    where type 'a class = 'a GioConverterInputStreamClass.class
    where type 'a pollable_input_stream_class = 'a GioPollableInputStreamClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a converter_class = 'a GioConverterClass.class =
  struct
    val getType_ = _import "g_converter_input_stream_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "g_converter_input_stream_new" : GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p * GioConverterClass.FFI.non_opt GioConverterClass.FFI.p -> GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p;) (x1, x2)
    val getConverter_ = _import "g_converter_input_stream_get_converter" : GioConverterInputStreamClass.FFI.non_opt GioConverterInputStreamClass.FFI.p -> GioConverterClass.FFI.non_opt GioConverterClass.FFI.p;
    type 'a class = 'a GioConverterInputStreamClass.class
    type 'a pollable_input_stream_class = 'a GioPollableInputStreamClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type t = base class
    fun asPollableInputStream self = (GObjectObjectClass.FFI.withPtr false ---> GioPollableInputStreamClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (baseStream, converter) = (GioInputStreamClass.FFI.withPtr false &&&> GioConverterClass.FFI.withPtr false ---> GioConverterInputStreamClass.FFI.fromPtr true) new_ (baseStream & converter)
    fun getConverter self = (GioConverterInputStreamClass.FFI.withPtr false ---> GioConverterClass.FFI.fromPtr false) getConverter_ self
    local
      open ValueAccessor
    in
      val converterProp =
        {
          name = "converter",
          gtype = fn () => C.gtype GioConverterClass.tOpt (),
          get = fn x => fn () => C.get GioConverterClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioConverterClass.tOpt x
        }
    end
  end
