structure AtkStreamableContent :>
  ATK_STREAMABLE_CONTENT
    where type 'a class_t = 'a AtkStreamableContentClass.t =
  struct
    val getType_ = _import "atk_streamable_content_get_type" : unit -> GObjectType.C.val_;
    val getMimeType_ = fn x1 & x2 => (_import "atk_streamable_content_get_mime_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
    val getNMimeTypes_ = _import "atk_streamable_content_get_n_mime_types" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getStream_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_streamable_content_get_stream" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a AtkStreamableContentClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getMimeType self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.String.C.fromPtr false) getMimeType_ (self & i)
    fun getNMimeTypes self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNMimeTypes_ self
    fun getStream self mimeType = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GLibIOChannelRecord.C.fromPtr true) getStream_ (self & mimeType)
    fun getUri self mimeType = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) getUri_ (self & mimeType)
  end
