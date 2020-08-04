structure GioUnixOutputStream :>
  GIO_UNIX_OUTPUT_STREAM
    where type 'a class = 'a GioUnixOutputStreamClass.class
    where type 'a file_descriptor_based_class = 'a GioFileDescriptorBasedClass.class
    where type 'a pollable_output_stream_class = 'a GioPollableOutputStreamClass.class =
  struct
    val getType_ = _import "g_unix_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "g_unix_output_stream_new" : GInt32.FFI.val_ * GBool.FFI.val_ -> GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p;) (x1, x2)
    val getCloseFd_ = _import "g_unix_output_stream_get_close_fd" : GioUnixOutputStreamClass.FFI.non_opt GioUnixOutputStreamClass.FFI.p -> GBool.FFI.val_;
    val getFd_ = _import "g_unix_output_stream_get_fd" : GioUnixOutputStreamClass.FFI.non_opt GioUnixOutputStreamClass.FFI.p -> GInt32.FFI.val_;
    val setCloseFd_ = fn x1 & x2 => (_import "g_unix_output_stream_set_close_fd" : GioUnixOutputStreamClass.FFI.non_opt GioUnixOutputStreamClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioUnixOutputStreamClass.class
    type 'a file_descriptor_based_class = 'a GioFileDescriptorBasedClass.class
    type 'a pollable_output_stream_class = 'a GioPollableOutputStreamClass.class
    type t = base class
    fun asFileDescriptorBased self = (GObjectObjectClass.FFI.withPtr false ---> GioFileDescriptorBasedClass.FFI.fromPtr false) I self
    fun asPollableOutputStream self = (GObjectObjectClass.FFI.withPtr false ---> GioPollableOutputStreamClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (fd, closeFd) = (GInt32.FFI.withVal &&&> GBool.FFI.withVal ---> GioUnixOutputStreamClass.FFI.fromPtr true) new_ (fd & closeFd)
    fun getCloseFd self = (GioUnixOutputStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCloseFd_ self
    fun getFd self = (GioUnixOutputStreamClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getFd_ self
    fun setCloseFd self closeFd = (GioUnixOutputStreamClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCloseFd_ (self & closeFd)
    local
      open Property
    in
      val closeFdProp =
        {
          get = fn x => get "close-fd" boolean x,
          set = fn x => set "close-fd" boolean x,
          new = fn x => new "close-fd" boolean x
        }
      val fdProp =
        {
          get = fn x => get "fd" int x,
          new = fn x => new "fd" int x
        }
    end
  end
