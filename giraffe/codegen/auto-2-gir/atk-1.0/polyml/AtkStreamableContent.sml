structure AtkStreamableContent :>
  ATK_STREAMABLE_CONTENT
    where type 'a class_t = 'a AtkStreamableContentClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_streamable_content_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getMimeType_ = call (load_sym libatk "atk_streamable_content_get_mime_type") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.String.PolyML.RETPTR)
      val getNMimeTypes_ = call (load_sym libatk "atk_streamable_content_get_n_mime_types") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getStream_ = call (load_sym libatk "atk_streamable_content_get_stream") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GLibIOChannelRecord.PolyML.PTR)
      val getUri_ = call (load_sym libatk "atk_streamable_content_get_uri") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
    end
    type 'a class_t = 'a AtkStreamableContentClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getMimeType self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.String.C.fromPtr false) getMimeType_ (self & i)
    fun getNMimeTypes self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNMimeTypes_ self
    fun getStream self mimeType = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GLibIOChannelRecord.C.fromPtr true) getStream_ (self & mimeType)
    fun getUri self mimeType = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) getUri_ (self & mimeType)
  end
