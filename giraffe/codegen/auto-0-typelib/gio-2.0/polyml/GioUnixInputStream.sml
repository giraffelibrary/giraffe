structure GioUnixInputStream :>
  GIO_UNIX_INPUT_STREAM
    where type 'a class = 'a GioUnixInputStreamClass.class
    where type 'a pollable_input_stream_class = 'a GioPollableInputStreamClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_input_stream_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_unix_input_stream_new") (FFI.Int32.PolyML.cVal &&> FFI.Bool.PolyML.cVal --> GioInputStreamClass.PolyML.cPtr)
      val getCloseFd_ = call (load_sym libgio "g_unix_input_stream_get_close_fd") (GioUnixInputStreamClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getFd_ = call (load_sym libgio "g_unix_input_stream_get_fd") (GioUnixInputStreamClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val setCloseFd_ = call (load_sym libgio "g_unix_input_stream_set_close_fd") (GioUnixInputStreamClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GioUnixInputStreamClass.class
    type 'a pollable_input_stream_class = 'a GioPollableInputStreamClass.class
    type t = base class
    fun asPollableInputStream self = (GObjectObjectClass.C.withPtr ---> GioPollableInputStreamClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new fd closeFd = (FFI.Int32.C.withVal &&&> FFI.Bool.C.withVal ---> GioUnixInputStreamClass.C.fromPtr true) new_ (fd & closeFd)
    fun getCloseFd self = (GioUnixInputStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) getCloseFd_ self
    fun getFd self = (GioUnixInputStreamClass.C.withPtr ---> FFI.Int32.C.fromVal) getFd_ self
    fun setCloseFd self closeFd = (GioUnixInputStreamClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCloseFd_ (self & closeFd)
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
