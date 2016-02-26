structure GioFilterInputStream :>
  GIO_FILTER_INPUT_STREAM
    where type 'a class_t = 'a GioFilterInputStreamClass.t
    where type 'a input_stream_class_t = 'a GioInputStreamClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_filter_input_stream_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getBaseStream_ = call (load_sym libgio "g_filter_input_stream_get_base_stream") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getCloseBaseStream_ = call (load_sym libgio "g_filter_input_stream_get_close_base_stream") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setCloseBaseStream_ = call (load_sym libgio "g_filter_input_stream_set_close_base_stream") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GioFilterInputStreamClass.t
    type 'a input_stream_class_t = 'a GioInputStreamClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getBaseStream self = (GObjectObjectClass.C.withPtr ---> GioInputStreamClass.C.fromPtr false) getBaseStream_ self
    fun getCloseBaseStream self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getCloseBaseStream_ self
    fun setCloseBaseStream self closeBase = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCloseBaseStream_ (self & closeBase)
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
