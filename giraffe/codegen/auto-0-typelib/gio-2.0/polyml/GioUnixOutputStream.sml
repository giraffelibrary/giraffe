structure GioUnixOutputStream :>
  GIO_UNIX_OUTPUT_STREAM
    where type 'a class_t = 'a GioUnixOutputStreamClass.t
    where type 'a pollableoutputstreamclass_t = 'a GioPollableOutputStreamClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_output_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_unix_output_stream_new") (FFI.Int32.PolyML.VAL &&> FFI.Bool.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getCloseFd_ = call (load_sym libgio "g_unix_output_stream_get_close_fd") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getFd_ = call (load_sym libgio "g_unix_output_stream_get_fd") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val setCloseFd_ = call (load_sym libgio "g_unix_output_stream_set_close_fd") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioUnixOutputStreamClass.t
    type 'a pollableoutputstreamclass_t = 'a GioPollableOutputStreamClass.t
    type t = base class_t
    fun asPollableOutputStream self = (GObjectObjectClass.C.withPtr ---> GioPollableOutputStreamClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new fd closeFd = (FFI.Int32.C.withVal &&&> FFI.Bool.C.withVal ---> GioUnixOutputStreamClass.C.fromPtr true) new_ (fd & closeFd)
    fun getCloseFd self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getCloseFd_ self
    fun getFd self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getFd_ self
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
