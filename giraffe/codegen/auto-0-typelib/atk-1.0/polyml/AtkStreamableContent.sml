structure AtkStreamableContent :>
  ATK_STREAMABLE_CONTENT
    where type 'a class = 'a AtkStreamableContentClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_streamable_content_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getMimeType_ = call (getSymbol "atk_streamable_content_get_mime_type") (AtkStreamableContentClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getNMimeTypes_ = call (getSymbol "atk_streamable_content_get_n_mime_types") (AtkStreamableContentClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getStream_ = call (getSymbol "atk_streamable_content_get_stream") (AtkStreamableContentClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibIOChannelRecord.PolyML.cPtr)
      val getUri_ = call (getSymbol "atk_streamable_content_get_uri") (AtkStreamableContentClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutOptPtr)
    end
    type 'a class = 'a AtkStreamableContentClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getMimeType self i = (AtkStreamableContentClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromPtr 0) getMimeType_ (self & i)
    fun getNMimeTypes self = (AtkStreamableContentClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNMimeTypes_ self
    fun getStream self mimeType = (AtkStreamableContentClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GLibIOChannelRecord.FFI.fromPtr true) getStream_ (self & mimeType)
    fun getUri self mimeType = (AtkStreamableContentClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getUri_ (self & mimeType)
  end
