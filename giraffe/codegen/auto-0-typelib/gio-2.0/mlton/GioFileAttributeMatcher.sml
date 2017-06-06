structure GioFileAttributeMatcher :>
  GIO_FILE_ATTRIBUTE_MATCHER
    where type t = GioFileAttributeMatcherRecord.t =
  struct
    val getType_ = _import "g_file_attribute_matcher_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_g_file_attribute_matcher_new" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioFileAttributeMatcherRecord.FFI.notnull GioFileAttributeMatcherRecord.FFI.p;
    val enumerateNamespace_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_attribute_matcher_enumerate_namespace" :
              GioFileAttributeMatcherRecord.FFI.notnull GioFileAttributeMatcherRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val enumerateNext_ = _import "g_file_attribute_matcher_enumerate_next" : GioFileAttributeMatcherRecord.FFI.notnull GioFileAttributeMatcherRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val matches_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_attribute_matcher_matches" :
              GioFileAttributeMatcherRecord.FFI.notnull GioFileAttributeMatcherRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val matchesOnly_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_attribute_matcher_matches_only" :
              GioFileAttributeMatcherRecord.FFI.notnull GioFileAttributeMatcherRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GioFileAttributeMatcherRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new attributes = (Utf8.FFI.withPtr ---> GioFileAttributeMatcherRecord.FFI.fromPtr true) new_ attributes
    fun enumerateNamespace self ns = (GioFileAttributeMatcherRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) enumerateNamespace_ (self & ns)
    fun enumerateNext self = (GioFileAttributeMatcherRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) enumerateNext_ self
    fun matches self attribute = (GioFileAttributeMatcherRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) matches_ (self & attribute)
    fun matchesOnly self attribute = (GioFileAttributeMatcherRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) matchesOnly_ (self & attribute)
  end
