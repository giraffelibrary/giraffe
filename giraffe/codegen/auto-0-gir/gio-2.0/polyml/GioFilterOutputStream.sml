structure GioFilterOutputStream :>
  GIO_FILTER_OUTPUT_STREAM
    where type 'a class_t = 'a GioFilterOutputStreamClass.t
    where type 'a output_stream_class_t = 'a GioOutputStreamClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_filter_output_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getBaseStream_ = call (load_sym libgio "g_filter_output_stream_get_base_stream") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getCloseBaseStream_ = call (load_sym libgio "g_filter_output_stream_get_close_base_stream") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setCloseBaseStream_ = call (load_sym libgio "g_filter_output_stream_set_close_base_stream") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioFilterOutputStreamClass.t
    type 'a output_stream_class_t = 'a GioOutputStreamClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getBaseStream self = (GObjectObjectClass.C.withPtr ---> GioOutputStreamClass.C.fromPtr false) getBaseStream_ self
    fun getCloseBaseStream self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getCloseBaseStream_ self
    fun setCloseBaseStream self closeBase = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCloseBaseStream_ (self & closeBase)
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
