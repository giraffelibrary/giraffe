structure GioSimpleIOStream :>
  GIO_SIMPLE_I_O_STREAM
    where type 'a class = 'a GioSimpleIOStreamClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class =
  struct
    val getType_ = _import "g_simple_io_stream_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "g_simple_io_stream_new" : GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p * GioOutputStreamClass.FFI.notnull GioOutputStreamClass.FFI.p -> GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p;) (x1, x2)
    type 'a class = 'a GioSimpleIOStreamClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (inputStream, outputStream) = (GioInputStreamClass.FFI.withPtr &&&> GioOutputStreamClass.FFI.withPtr ---> GioSimpleIOStreamClass.FFI.fromPtr true) new_ (inputStream & outputStream)
    local
      open Property
    in
      val inputStreamProp =
        {
          get = fn x => get "input-stream" GioInputStreamClass.tOpt x,
          new = fn x => new "input-stream" GioInputStreamClass.tOpt x
        }
      val outputStreamProp =
        {
          get = fn x => get "output-stream" GioOutputStreamClass.tOpt x,
          new = fn x => new "output-stream" GioOutputStreamClass.tOpt x
        }
    end
  end
