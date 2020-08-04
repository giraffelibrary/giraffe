structure AtkStreamableContent :>
  ATK_STREAMABLE_CONTENT
    where type 'a class = 'a AtkStreamableContentClass.class =
  struct
    val getType_ = _import "atk_streamable_content_get_type" : unit -> GObjectType.FFI.val_;
    val getMimeType_ = fn x1 & x2 => (_import "atk_streamable_content_get_mime_type" : AtkStreamableContentClass.FFI.non_opt AtkStreamableContentClass.FFI.p * GInt.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;) (x1, x2)
    val getNMimeTypes_ = _import "atk_streamable_content_get_n_mime_types" : AtkStreamableContentClass.FFI.non_opt AtkStreamableContentClass.FFI.p -> GInt.FFI.val_;
    val getStream_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_streamable_content_get_stream" :
              AtkStreamableContentClass.FFI.non_opt AtkStreamableContentClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p;
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
              AtkStreamableContentClass.FFI.non_opt AtkStreamableContentClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a AtkStreamableContentClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getMimeType self i = (AtkStreamableContentClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> Utf8.FFI.fromPtr 0) getMimeType_ (self & i)
    fun getNMimeTypes self = (AtkStreamableContentClass.FFI.withPtr false ---> GInt.FFI.fromVal) getNMimeTypes_ self
    fun getStream self mimeType = (AtkStreamableContentClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GLibIOChannelRecord.FFI.fromPtr true) getStream_ (self & mimeType)
    fun getUri self mimeType = (AtkStreamableContentClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromOptPtr 0) getUri_ (self & mimeType)
  end
