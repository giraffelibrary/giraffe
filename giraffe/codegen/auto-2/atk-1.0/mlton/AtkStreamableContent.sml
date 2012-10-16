structure AtkStreamableContent :>
  ATK_STREAMABLE_CONTENT
    where type 'a class_t = 'a AtkStreamableContentClass.t =
  struct
    val getType_ = _import "atk_streamable_content_get_type" : unit -> GObjectType.C.val_;
    val getMimeType_ = fn x1 & x2 => (_import "atk_streamable_content_get_mime_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.val_ -> FFI.String.notnull FFI.String.out_p;) (x1, x2)
    val getNMimeTypes_ = _import "atk_streamable_content_get_n_mime_types" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getStream_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_streamable_content_get_stream" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.String.notnull FFI.String.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a AtkStreamableContentClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getMimeType self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> FFI.String.fromPtr false) getMimeType_ (self & i)
    fun getNMimeTypes self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getNMimeTypes_ self
    fun getStream self mimeType = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GLibIOChannelRecord.C.fromPtr true) getStream_ (self & mimeType)
    fun getUri self mimeType = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr false) getUri_ (self & mimeType)
  end
