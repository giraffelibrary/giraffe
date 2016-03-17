structure GioUnixOutputStream :>
  GIO_UNIX_OUTPUT_STREAM
    where type 'a class = 'a GioUnixOutputStreamClass.class
    where type 'a pollable_output_stream_class = 'a GioPollableOutputStreamClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_output_stream_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_unix_output_stream_new") (FFI.Int.PolyML.cVal &&> FFI.Bool.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val getCloseFd_ = call (load_sym libgio "g_unix_output_stream_get_close_fd") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getFd_ = call (load_sym libgio "g_unix_output_stream_get_fd") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val setCloseFd_ = call (load_sym libgio "g_unix_output_stream_set_close_fd") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioUnixOutputStreamClass.class
    type 'a pollable_output_stream_class = 'a GioPollableOutputStreamClass.class
    type t = base class
    fun asPollableOutputStream self = (GObjectObjectClass.C.withPtr ---> GioPollableOutputStreamClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new fd closeFd = (FFI.Int.C.withVal &&&> FFI.Bool.C.withVal ---> GioUnixOutputStreamClass.C.fromPtr true) new_ (fd & closeFd)
    fun getCloseFd self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getCloseFd_ self
    fun getFd self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getFd_ self
    fun setCloseFd self closeFd = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCloseFd_ (self & closeFd)
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
