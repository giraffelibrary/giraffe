structure GioFileAttributeMatcher :>
  GIO_FILE_ATTRIBUTE_MATCHER
    where type t = GioFileAttributeMatcherRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_file_attribute_matcher_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_file_attribute_matcher_new") (Utf8.PolyML.cInPtr --> GioFileAttributeMatcherRecord.PolyML.cPtr)
      val enumerateNamespace_ = call (getSymbol "g_file_attribute_matcher_enumerate_namespace") (GioFileAttributeMatcherRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val enumerateNext_ = call (getSymbol "g_file_attribute_matcher_enumerate_next") (GioFileAttributeMatcherRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val matches_ = call (getSymbol "g_file_attribute_matcher_matches") (GioFileAttributeMatcherRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val matchesOnly_ = call (getSymbol "g_file_attribute_matcher_matches_only") (GioFileAttributeMatcherRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
    end
    type t = GioFileAttributeMatcherRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new attributes = (Utf8.FFI.withPtr ---> GioFileAttributeMatcherRecord.FFI.fromPtr true) new_ attributes
    fun enumerateNamespace self ns = (GioFileAttributeMatcherRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) enumerateNamespace_ (self & ns)
    fun enumerateNext self = (GioFileAttributeMatcherRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) enumerateNext_ self
    fun matches self attribute = (GioFileAttributeMatcherRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) matches_ (self & attribute)
    fun matchesOnly self attribute = (GioFileAttributeMatcherRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) matchesOnly_ (self & attribute)
  end
