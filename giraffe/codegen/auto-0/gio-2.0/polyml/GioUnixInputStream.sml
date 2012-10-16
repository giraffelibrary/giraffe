structure GioUnixInputStream :>
  GIO_UNIX_INPUT_STREAM
    where type 'a class_t = 'a GioUnixInputStreamClass.t
    where type 'a pollableinputstreamclass_t = 'a GioPollableInputStreamClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_input_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_unix_input_stream_new") (FFI.PolyML.Int32.VAL &&> FFI.PolyML.Bool.VAL --> GObjectObjectClass.PolyML.PTR)
      val getCloseFd_ = call (load_sym libgio "g_unix_input_stream_get_close_fd") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getFd_ = call (load_sym libgio "g_unix_input_stream_get_fd") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val setCloseFd_ = call (load_sym libgio "g_unix_input_stream_set_close_fd") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioUnixInputStreamClass.t
    type 'a pollableinputstreamclass_t = 'a GioPollableInputStreamClass.t
    fun asPollableInputStream self = (GObjectObjectClass.C.withPtr ---> GioPollableInputStreamClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new fd closeFd = (FFI.Int32.withVal &&&> FFI.Bool.withVal ---> GioUnixInputStreamClass.C.fromPtr true) new_ (fd & closeFd)
    fun getCloseFd self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getCloseFd_ self
    fun getFd self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getFd_ self
    fun setCloseFd self closeFd = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setCloseFd_ (self & closeFd)
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
