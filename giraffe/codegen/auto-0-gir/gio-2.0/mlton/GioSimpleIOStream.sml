structure GioSimpleIOStream :>
  GIO_SIMPLE_I_O_STREAM
    where type 'a class = 'a GioSimpleIOStreamClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class =
  struct
    val getType_ = _import "g_simple_io_stream_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "g_simple_io_stream_new" : GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p * GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p -> GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p;) (x1, x2)
    type 'a class = 'a GioSimpleIOStreamClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (inputStream, outputStream) = (GioInputStreamClass.FFI.withPtr false &&&> GioOutputStreamClass.FFI.withPtr false ---> GioSimpleIOStreamClass.FFI.fromPtr true) new_ (inputStream & outputStream)
    local
      open ValueAccessor
    in
      val inputStreamProp =
        {
          name = "input-stream",
          gtype = fn () => C.gtype GioInputStreamClass.tOpt (),
          get = fn x => fn () => C.get GioInputStreamClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioInputStreamClass.tOpt x
        }
      val outputStreamProp =
        {
          name = "output-stream",
          gtype = fn () => C.gtype GioOutputStreamClass.tOpt (),
          get = fn x => fn () => C.get GioOutputStreamClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioOutputStreamClass.tOpt x
        }
    end
  end
