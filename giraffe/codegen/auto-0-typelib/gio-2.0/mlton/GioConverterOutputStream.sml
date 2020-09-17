structure GioConverterOutputStream :>
  GIO_CONVERTER_OUTPUT_STREAM
    where type 'a class = 'a GioConverterOutputStreamClass.class
    where type 'a pollable_output_stream_class = 'a GioPollableOutputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class
    where type 'a converter_class = 'a GioConverterClass.class =
  struct
    val getType_ = _import "g_converter_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "g_converter_output_stream_new" : GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p * GioConverterClass.FFI.non_opt GioConverterClass.FFI.p -> GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p;) (x1, x2)
    val getConverter_ = _import "g_converter_output_stream_get_converter" : GioConverterOutputStreamClass.FFI.non_opt GioConverterOutputStreamClass.FFI.p -> GioConverterClass.FFI.non_opt GioConverterClass.FFI.p;
    type 'a class = 'a GioConverterOutputStreamClass.class
    type 'a pollable_output_stream_class = 'a GioPollableOutputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type 'a converter_class = 'a GioConverterClass.class
    type t = base class
    fun asPollableOutputStream self = (GObjectObjectClass.FFI.withPtr false ---> GioPollableOutputStreamClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (baseStream, converter) = (GioOutputStreamClass.FFI.withPtr false &&&> GioConverterClass.FFI.withPtr false ---> GioConverterOutputStreamClass.FFI.fromPtr true) new_ (baseStream & converter)
    fun getConverter self = (GioConverterOutputStreamClass.FFI.withPtr false ---> GioConverterClass.FFI.fromPtr false) getConverter_ self before GioConverterOutputStreamClass.FFI.touchPtr self
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
