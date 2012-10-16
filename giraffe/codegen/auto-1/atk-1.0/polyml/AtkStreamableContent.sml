structure AtkStreamableContent :>
  ATK_STREAMABLE_CONTENT
    where type 'a class_t = 'a AtkStreamableContentClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_streamable_content_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getMimeType_ = call (load_sym libatk "atk_streamable_content_get_mime_type") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.String.RETPTR)
      val getNMimeTypes_ = call (load_sym libatk "atk_streamable_content_get_n_mime_types") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getStream_ = call (load_sym libatk "atk_streamable_content_get_stream") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> GLibIOChannelRecord.PolyML.PTR)
      val getUri_ = call (load_sym libatk "atk_streamable_content_get_uri") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
    end
    type 'a class_t = 'a AtkStreamableContentClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getMimeType self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> FFI.String.fromPtr false) getMimeType_ (self & i)
    fun getNMimeTypes self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getNMimeTypes_ self
    fun getStream self mimeType = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GLibIOChannelRecord.C.fromPtr true) getStream_ (self & mimeType)
    fun getUri self mimeType = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr false) getUri_ (self & mimeType)
  end
