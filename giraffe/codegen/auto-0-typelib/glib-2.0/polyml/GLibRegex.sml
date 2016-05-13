structure GLibRegex :>
  G_LIB_REGEX
    where type t = GLibRegexRecord.t
    where type match_info_t = GLibMatchInfoRecord.t
    where type regex_match_flags_t = GLibRegexMatchFlags.t
    where type regex_compile_flags_t = GLibRegexCompileFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_regex_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libglib "g_regex_new")
          (
            Utf8.PolyML.cInPtr
             &&> GLibRegexCompileFlags.PolyML.cVal
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibRegexRecord.PolyML.cPtr
          )
      val getCaptureCount_ = call (load_sym libglib "g_regex_get_capture_count") (GLibRegexRecord.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getCompileFlags_ = call (load_sym libglib "g_regex_get_compile_flags") (GLibRegexRecord.PolyML.cPtr --> GLibRegexCompileFlags.PolyML.cVal)
      val getMatchFlags_ = call (load_sym libglib "g_regex_get_match_flags") (GLibRegexRecord.PolyML.cPtr --> GLibRegexMatchFlags.PolyML.cVal)
      val getMaxBackref_ = call (load_sym libglib "g_regex_get_max_backref") (GLibRegexRecord.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getPattern_ = call (load_sym libglib "g_regex_get_pattern") (GLibRegexRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStringNumber_ = call (load_sym libglib "g_regex_get_string_number") (GLibRegexRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Int32.PolyML.cVal)
      val match_ =
        call (load_sym libglib "g_regex_match")
          (
            GLibRegexRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> GLibMatchInfoRecord.PolyML.cOutRef
             --> FFI.Bool.PolyML.cVal
          )
      val matchAll_ =
        call (load_sym libglib "g_regex_match_all")
          (
            GLibRegexRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> GLibMatchInfoRecord.PolyML.cOutRef
             --> FFI.Bool.PolyML.cVal
          )
      val checkReplacement_ =
        call (load_sym libglib "g_regex_check_replacement")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.Bool.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val escapeNul_ = call (load_sym libglib "g_regex_escape_nul") (Utf8.PolyML.cInPtr &&> FFI.Int32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val matchSimple_ =
        call (load_sym libglib "g_regex_match_simple")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexCompileFlags.PolyML.cVal
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
    end
    type t = GLibRegexRecord.t
    type match_info_t = GLibMatchInfoRecord.t
    type regex_match_flags_t = GLibRegexMatchFlags.t
    type regex_compile_flags_t = GLibRegexCompileFlags.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new pattern compileOptions matchOptions =
      (
        Utf8.C.withPtr
         &&&> GLibRegexCompileFlags.C.withVal
         &&&> GLibRegexMatchFlags.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibRegexRecord.C.fromPtr true
      )
        new_
        (
          pattern
           & compileOptions
           & matchOptions
           & []
        )
    fun getCaptureCount self = (GLibRegexRecord.C.withPtr ---> FFI.Int32.C.fromVal) getCaptureCount_ self
    fun getCompileFlags self = (GLibRegexRecord.C.withPtr ---> GLibRegexCompileFlags.C.fromVal) getCompileFlags_ self
    fun getMatchFlags self = (GLibRegexRecord.C.withPtr ---> GLibRegexMatchFlags.C.fromVal) getMatchFlags_ self
    fun getMaxBackref self = (GLibRegexRecord.C.withPtr ---> FFI.Int32.C.fromVal) getMaxBackref_ self
    fun getPattern self = (GLibRegexRecord.C.withPtr ---> Utf8.C.fromPtr false) getPattern_ self
    fun getStringNumber self name = (GLibRegexRecord.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int32.C.fromVal) getStringNumber_ (self & name)
    fun match self string matchOptions =
      let
        val matchInfo & retVal =
          (
            GLibRegexRecord.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> GLibRegexMatchFlags.C.withVal
             &&&> GLibMatchInfoRecord.C.withRefOptPtr
             ---> GLibMatchInfoRecord.C.fromPtr true && FFI.Bool.C.fromVal
          )
            match_
            (
              self
               & string
               & matchOptions
               & NONE
            )
      in
        if retVal then SOME matchInfo else NONE
      end
    fun matchAll self string matchOptions =
      let
        val matchInfo & retVal =
          (
            GLibRegexRecord.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> GLibRegexMatchFlags.C.withVal
             &&&> GLibMatchInfoRecord.C.withRefOptPtr
             ---> GLibMatchInfoRecord.C.fromPtr true && FFI.Bool.C.fromVal
          )
            matchAll_
            (
              self
               & string
               & matchOptions
               & NONE
            )
      in
        if retVal then SOME matchInfo else NONE
      end
    fun checkReplacement replacement =
      let
        val hasReferences & retVal =
          (
            Utf8.C.withPtr
             &&&> FFI.Bool.C.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> FFI.Bool.C.fromVal && FFI.Bool.C.fromVal
          )
            checkReplacement_
            (
              replacement
               & FFI.Bool.null
               & []
            )
      in
        if retVal then SOME hasReferences else NONE
      end
    fun escapeNul string length = (Utf8.C.withPtr &&&> FFI.Int32.C.withVal ---> Utf8.C.fromPtr true) escapeNul_ (string & length)
    fun matchSimple pattern string compileOptions matchOptions =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibRegexCompileFlags.C.withVal
         &&&> GLibRegexMatchFlags.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        matchSimple_
        (
          pattern
           & string
           & compileOptions
           & matchOptions
        )
  end
