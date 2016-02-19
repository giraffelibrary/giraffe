structure GLibRegex :>
  G_LIB_REGEX
    where type record_t = GLibRegexRecord.t
    where type match_info_record_t = GLibMatchInfoRecord.t
    where type regex_match_flags_t = GLibRegexMatchFlags.t
    where type regex_compile_flags_t = GLibRegexCompileFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_regex_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libglib "g_regex_new")
          (
            Utf8.PolyML.INPTR
             &&> GLibRegexCompileFlags.PolyML.VAL
             &&> GLibRegexMatchFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibRegexRecord.PolyML.PTR
          )
      val getCaptureCount_ = call (load_sym libglib "g_regex_get_capture_count") (GLibRegexRecord.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getCompileFlags_ = call (load_sym libglib "g_regex_get_compile_flags") (GLibRegexRecord.PolyML.PTR --> GLibRegexCompileFlags.PolyML.VAL)
      val getMatchFlags_ = call (load_sym libglib "g_regex_get_match_flags") (GLibRegexRecord.PolyML.PTR --> GLibRegexMatchFlags.PolyML.VAL)
      val getMaxBackref_ = call (load_sym libglib "g_regex_get_max_backref") (GLibRegexRecord.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getPattern_ = call (load_sym libglib "g_regex_get_pattern") (GLibRegexRecord.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getStringNumber_ = call (load_sym libglib "g_regex_get_string_number") (GLibRegexRecord.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.Int32.PolyML.VAL)
      val match_ =
        call (load_sym libglib "g_regex_match")
          (
            GLibRegexRecord.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GLibRegexMatchFlags.PolyML.VAL
             &&> GLibMatchInfoRecord.PolyML.OUTREF
             --> FFI.Bool.PolyML.VAL
          )
      val matchAll_ =
        call (load_sym libglib "g_regex_match_all")
          (
            GLibRegexRecord.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GLibRegexMatchFlags.PolyML.VAL
             &&> GLibMatchInfoRecord.PolyML.OUTREF
             --> FFI.Bool.PolyML.VAL
          )
      val checkReplacement_ =
        call (load_sym libglib "g_regex_check_replacement")
          (
            Utf8.PolyML.INPTR
             &&> FFI.Bool.PolyML.REF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val escapeNul_ = call (load_sym libglib "g_regex_escape_nul") (Utf8.PolyML.INPTR &&> FFI.Int32.PolyML.VAL --> Utf8.PolyML.RETPTR)
      val matchSimple_ =
        call (load_sym libglib "g_regex_match_simple")
          (
            Utf8.PolyML.INPTR
             &&> Utf8.PolyML.INPTR
             &&> GLibRegexCompileFlags.PolyML.VAL
             &&> GLibRegexMatchFlags.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
    end
    type record_t = GLibRegexRecord.t
    type match_info_record_t = GLibMatchInfoRecord.t
    type regex_match_flags_t = GLibRegexMatchFlags.t
    type regex_compile_flags_t = GLibRegexCompileFlags.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new pattern compileOptions matchOptions =
      (
        Utf8.C.withPtr
         &&&> GLibRegexCompileFlags.C.withVal
         &&&> GLibRegexMatchFlags.C.withVal
         &&&> GLibErrorRecord.C.handleError
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
             &&&> GLibErrorRecord.C.handleError
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
