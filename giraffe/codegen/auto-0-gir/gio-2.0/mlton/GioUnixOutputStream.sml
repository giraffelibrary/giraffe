structure GioUnixOutputStream :>
  GIO_UNIX_OUTPUT_STREAM
    where type 'a class = 'a GioUnixOutputStreamClass.class
    where type 'a file_descriptor_based_class = 'a GioFileDescriptorBasedClass.class
    where type 'a pollable_output_stream_class = 'a GioPollableOutputStreamClass.class =
  struct
    val getType_ = _import "g_unix_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "g_unix_output_stream_new" : GInt.FFI.val_ * GBool.FFI.val_ -> GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p;) (x1, x2)
    val getCloseFd_ = _import "g_unix_output_stream_get_close_fd" : GioUnixOutputStreamClass.FFI.non_opt GioUnixOutputStreamClass.FFI.p -> GBool.FFI.val_;
    val getFd_ = _import "g_unix_output_stream_get_fd" : GioUnixOutputStreamClass.FFI.non_opt GioUnixOutputStreamClass.FFI.p -> GInt.FFI.val_;
    val setCloseFd_ = fn x1 & x2 => (_import "g_unix_output_stream_set_close_fd" : GioUnixOutputStreamClass.FFI.non_opt GioUnixOutputStreamClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioUnixOutputStreamClass.class
    type 'a file_descriptor_based_class = 'a GioFileDescriptorBasedClass.class
    type 'a pollable_output_stream_class = 'a GioPollableOutputStreamClass.class
    type t = base class
    fun asFileDescriptorBased self = (GObjectObjectClass.FFI.withPtr false ---> GioFileDescriptorBasedClass.FFI.fromPtr false) I self
    fun asPollableOutputStream self = (GObjectObjectClass.FFI.withPtr false ---> GioPollableOutputStreamClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (fd, closeFd) = (GInt.FFI.withVal &&&> GBool.FFI.withVal ---> GioUnixOutputStreamClass.FFI.fromPtr true) new_ (fd & closeFd)
    fun getCloseFd self = (GioUnixOutputStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCloseFd_ self
    fun getFd self = (GioUnixOutputStreamClass.FFI.withPtr false ---> GInt.FFI.fromVal) getFd_ self
    fun setCloseFd self closeFd = (GioUnixOutputStreamClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCloseFd_ (self & closeFd)
    local
      open ValueAccessor
    in
      val closeFdProp =
        {
          name = "close-fd",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val fdProp =
        {
          name = "fd",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = fn x => C.set int x
        }
    end
  end
