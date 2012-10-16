structure GioFilterInputStream :>
  GIO_FILTER_INPUT_STREAM
    where type 'a class_t = 'a GioFilterInputStreamClass.t
    where type 'a inputstreamclass_t = 'a GioInputStreamClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_filter_input_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getBaseStream_ = call (load_sym libgio "g_filter_input_stream_get_base_stream") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getCloseBaseStream_ = call (load_sym libgio "g_filter_input_stream_get_close_base_stream") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val setCloseBaseStream_ = call (load_sym libgio "g_filter_input_stream_set_close_base_stream") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioFilterInputStreamClass.t
    type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getBaseStream self = (GObjectObjectClass.C.withPtr ---> GioInputStreamClass.C.fromPtr false) getBaseStream_ self
    fun getCloseBaseStream self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getCloseBaseStream_ self
    fun setCloseBaseStream self closeBase = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setCloseBaseStream_ (self & closeBase)
    local
      open Property
    in
      val baseStreamProp =
        {
          get = fn x => get "base-stream" GioInputStreamClass.tOpt x,
          set = fn x => set "base-stream" GioInputStreamClass.tOpt x
        }
      val closeBaseStreamProp =
        {
          get = fn x => get "close-base-stream" boolean x,
          set = fn x => set "close-base-stream" boolean x
        }
    end
  end
