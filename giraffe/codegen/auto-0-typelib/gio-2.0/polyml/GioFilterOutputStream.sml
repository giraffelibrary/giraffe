structure GioFilterOutputStream :>
  GIO_FILTER_OUTPUT_STREAM
    where type 'a class = 'a GioFilterOutputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_filter_output_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getBaseStream_ = call (getSymbol "g_filter_output_stream_get_base_stream") (GioFilterOutputStreamClass.PolyML.cPtr --> GioOutputStreamClass.PolyML.cPtr)
      val getCloseBaseStream_ = call (getSymbol "g_filter_output_stream_get_close_base_stream") (GioFilterOutputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setCloseBaseStream_ = call (getSymbol "g_filter_output_stream_set_close_base_stream") (GioFilterOutputStreamClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioFilterOutputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getBaseStream self = (GioFilterOutputStreamClass.FFI.withPtr ---> GioOutputStreamClass.FFI.fromPtr false) getBaseStream_ self
    fun getCloseBaseStream self = (GioFilterOutputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) getCloseBaseStream_ self
    fun setCloseBaseStream self closeBase = (GioFilterOutputStreamClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setCloseBaseStream_ (self & closeBase)
    local
      open Property
    in
      val baseStreamProp =
        {
          get = fn x => get "base-stream" GioOutputStreamClass.tOpt x,
          set = fn x => set "base-stream" GioOutputStreamClass.tOpt x
        }
      val closeBaseStreamProp =
        {
          get = fn x => get "close-base-stream" boolean x,
          set = fn x => set "close-base-stream" boolean x
        }
    end
  end
