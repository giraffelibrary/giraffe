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
    fun getBaseStream self = (GioFilterOutputStreamClass.FFI.withPtr false ---> GioOutputStreamClass.FFI.fromPtr false) getBaseStream_ self before GioFilterOutputStreamClass.FFI.touchPtr self
    fun getCloseBaseStream self = (GioFilterOutputStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCloseBaseStream_ self
    fun setCloseBaseStream self closeBase = (GioFilterOutputStreamClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCloseBaseStream_ (self & closeBase)
    local
      open ValueAccessor
    in
      val baseStreamProp =
        {
          name = "base-stream",
          gtype = fn () => C.gtype GioOutputStreamClass.tOpt (),
          get = fn x => fn () => C.get GioOutputStreamClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioOutputStreamClass.tOpt x
        }
      val closeBaseStreamProp =
        {
          name = "close-base-stream",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
    end
  end
