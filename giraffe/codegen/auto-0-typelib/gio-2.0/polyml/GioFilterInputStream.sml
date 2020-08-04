structure GioFilterInputStream :>
  GIO_FILTER_INPUT_STREAM
    where type 'a class = 'a GioFilterInputStreamClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_filter_input_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getBaseStream_ = call (getSymbol "g_filter_input_stream_get_base_stream") (GioFilterInputStreamClass.PolyML.cPtr --> GioInputStreamClass.PolyML.cPtr)
      val getCloseBaseStream_ = call (getSymbol "g_filter_input_stream_get_close_base_stream") (GioFilterInputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setCloseBaseStream_ = call (getSymbol "g_filter_input_stream_set_close_base_stream") (GioFilterInputStreamClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioFilterInputStreamClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getBaseStream self = (GioFilterInputStreamClass.FFI.withPtr false ---> GioInputStreamClass.FFI.fromPtr false) getBaseStream_ self
    fun getCloseBaseStream self = (GioFilterInputStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCloseBaseStream_ self
    fun setCloseBaseStream self closeBase = (GioFilterInputStreamClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCloseBaseStream_ (self & closeBase)
    local
      open Property
    in
      val baseStreamProp =
        {
          get = fn x => get "base-stream" GioInputStreamClass.tOpt x,
          new = fn x => new "base-stream" GioInputStreamClass.tOpt x
        }
      val closeBaseStreamProp =
        {
          get = fn x => get "close-base-stream" boolean x,
          set = fn x => set "close-base-stream" boolean x,
          new = fn x => new "close-base-stream" boolean x
        }
    end
  end
