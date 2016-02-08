structure AtkStreamableContent :>
  ATK_STREAMABLE_CONTENT
    where type 'a class_t = 'a AtkStreamableContentClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_streamable_content_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getMimeType_ = call (load_sym libatk "atk_streamable_content_get_mime_type") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> Utf8.PolyML.RETPTR)
      val getNMimeTypes_ = call (load_sym libatk "atk_streamable_content_get_n_mime_types") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getStream_ = call (load_sym libatk "atk_streamable_content_get_stream") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> GLibIOChannelRecord.PolyML.PTR)
      val getUri_ = call (load_sym libatk "atk_streamable_content_get_uri") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> Utf8.PolyML.RETPTR)
    end
    type 'a class_t = 'a AtkStreamableContentClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getMimeType self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> Utf8.C.fromPtr false) getMimeType_ (self & i)
    fun getNMimeTypes self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNMimeTypes_ self
    fun getStream self mimeType = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> GLibIOChannelRecord.C.fromPtr true) getStream_ (self & mimeType)
    fun getUri self mimeType = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> Utf8.C.fromPtr false) getUri_ (self & mimeType)
  end
