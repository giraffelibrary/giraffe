structure GioUnixOutputStream :>
  GIO_UNIX_OUTPUT_STREAM
    where type 'a class = 'a GioUnixOutputStreamClass.class
    where type 'a file_descriptor_based_class = 'a GioFileDescriptorBasedClass.class
    where type 'a pollable_output_stream_class = 'a GioPollableOutputStreamClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_unix_output_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_unix_output_stream_new") (GInt32.PolyML.cVal &&> GBool.PolyML.cVal --> GioOutputStreamClass.PolyML.cPtr)
      val getCloseFd_ = call (getSymbol "g_unix_output_stream_get_close_fd") (GioUnixOutputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFd_ = call (getSymbol "g_unix_output_stream_get_fd") (GioUnixOutputStreamClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val setCloseFd_ = call (getSymbol "g_unix_output_stream_set_close_fd") (GioUnixOutputStreamClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioUnixOutputStreamClass.class
    type 'a file_descriptor_based_class = 'a GioFileDescriptorBasedClass.class
    type 'a pollable_output_stream_class = 'a GioPollableOutputStreamClass.class
    type t = base class
    fun asFileDescriptorBased self = (GObjectObjectClass.FFI.withPtr ---> GioFileDescriptorBasedClass.FFI.fromPtr false) I self
    fun asPollableOutputStream self = (GObjectObjectClass.FFI.withPtr ---> GioPollableOutputStreamClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (fd, closeFd) = (GInt32.FFI.withVal &&&> GBool.FFI.withVal ---> GioUnixOutputStreamClass.FFI.fromPtr true) new_ (fd & closeFd)
    fun getCloseFd self = (GioUnixOutputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) getCloseFd_ self
    fun getFd self = (GioUnixOutputStreamClass.FFI.withPtr ---> GInt32.FFI.fromVal) getFd_ self
    fun setCloseFd self closeFd = (GioUnixOutputStreamClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setCloseFd_ (self & closeFd)
    local
      open Property
    in
      val closeFdProp =
        {
          get = fn x => get "close-fd" boolean x,
          set = fn x => set "close-fd" boolean x
        }
      val fdProp =
        {
          get = fn x => get "fd" int x,
          set = fn x => set "fd" int x
        }
    end
  end
