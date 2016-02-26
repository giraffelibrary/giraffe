structure AtkStreamableContent :>
  ATK_STREAMABLE_CONTENT
    where type 'a class_t = 'a AtkStreamableContentClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_streamable_content_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getMimeType_ = call (load_sym libatk "atk_streamable_content_get_mime_type") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getNMimeTypes_ = call (load_sym libatk "atk_streamable_content_get_n_mime_types") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getStream_ = call (load_sym libatk "atk_streamable_content_get_stream") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibIOChannelRecord.PolyML.cPtr)
      val getUri_ = call (load_sym libatk "atk_streamable_content_get_uri") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class_t = 'a AtkStreamableContentClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getMimeType self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr false) getMimeType_ (self & i)
    fun getNMimeTypes self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNMimeTypes_ self
    fun getStream self mimeType = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GLibIOChannelRecord.C.fromPtr true) getStream_ (self & mimeType)
    fun getUri self mimeType = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getUri_ (self & mimeType)
  end
