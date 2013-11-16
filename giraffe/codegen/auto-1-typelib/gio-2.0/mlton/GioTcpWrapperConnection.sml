structure GioTcpWrapperConnection :>
  GIO_TCP_WRAPPER_CONNECTION
    where type 'a class_t = 'a GioTcpWrapperConnectionClass.t
    where type 'a socketclass_t = 'a GioSocketClass.t
    where type 'a iostreamclass_t = 'a GioIOStreamClass.t =
  struct
    val getType_ = _import "g_tcp_wrapper_connection_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "g_tcp_wrapper_connection_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getBaseIoStream_ = _import "g_tcp_wrapper_connection_get_base_io_stream" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GioTcpWrapperConnectionClass.t
    type 'a socketclass_t = 'a GioSocketClass.t
    type 'a iostreamclass_t = 'a GioIOStreamClass.t
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
