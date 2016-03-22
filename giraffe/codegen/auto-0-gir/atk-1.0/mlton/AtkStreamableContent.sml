structure AtkStreamableContent :>
  ATK_STREAMABLE_CONTENT
    where type 'a class = 'a AtkStreamableContentClass.class =
  struct
    val getType_ = _import "atk_streamable_content_get_type" : unit -> GObjectType.C.val_;
    val getMimeType_ = fn x1 & x2 => (_import "atk_streamable_content_get_mime_type" : AtkStreamableContentClass.C.notnull AtkStreamableContentClass.C.p * FFI.Int.C.val_ -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getNMimeTypes_ = _import "atk_streamable_content_get_n_mime_types" : AtkStreamableContentClass.C.notnull AtkStreamableContentClass.C.p -> FFI.Int.C.val_;
    val getStream_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_streamable_content_get_stream" :
              AtkStreamableContentClass.C.notnull AtkStreamableContentClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getUri_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_streamable_content_get_uri" :
              AtkStreamableContentClass.C.notnull AtkStreamableContentClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a AtkStreamableContentClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getMimeType self i = (AtkStreamableContentClass.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr false) getMimeType_ (self & i)
    fun getNMimeTypes self = (AtkStreamableContentClass.C.withPtr ---> FFI.Int.C.fromVal) getNMimeTypes_ self
    fun getStream self mimeType = (AtkStreamableContentClass.C.withPtr &&&> Utf8.C.withPtr ---> GLibIOChannelRecord.C.fromPtr true) getStream_ (self & mimeType)
    fun getUri self mimeType = (AtkStreamableContentClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getUri_ (self & mimeType)
  end
