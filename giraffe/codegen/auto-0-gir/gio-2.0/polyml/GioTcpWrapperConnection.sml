structure GioTcpWrapperConnection :>
  GIO_TCP_WRAPPER_CONNECTION
    where type 'a class_t = 'a GioTcpWrapperConnectionClass.t
    where type 'a socket_class_t = 'a GioSocketClass.t
    where type 'a i_o_stream_class_t = 'a GioIOStreamClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tcp_wrapper_connection_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_tcp_wrapper_connection_new") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getBaseIoStream_ = call (load_sym libgio "g_tcp_wrapper_connection_get_base_io_stream") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class_t = 'a GioTcpWrapperConnectionClass.t
    type 'a socket_class_t = 'a GioSocketClass.t
    type 'a i_o_stream_class_t = 'a GioIOStreamClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseIoStream socket = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GioTcpWrapperConnectionClass.C.fromPtr true) new_ (baseIoStream & socket)
    fun getBaseIoStream self = (GObjectObjectClass.C.withPtr ---> GioIOStreamClass.C.fromPtr false) getBaseIoStream_ self
    local
      open Property
    in
      val baseIoStreamProp =
        {
          get = fn x => get "base-io-stream" GioIOStreamClass.tOpt x,
          set = fn x => set "base-io-stream" GioIOStreamClass.tOpt x
        }
    end
  end
