structure GLibRegex :>
  G_LIB_REGEX
    where type record_t = GLibRegexRecord.t
    where type matchinforecord_t = GLibMatchInfoRecord.t
    where type regexmatchflags_t = GLibRegexMatchFlags.t
    where type regexcompileflags_t = GLibRegexCompileFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_regex_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libglib "g_regex_new")
          (
            FFI.PolyML.String.INPTR
             &&> GLibRegexCompileFlags.PolyML.VAL
             &&> GLibRegexMatchFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibRegexRecord.PolyML.PTR
          )
      val getCaptureCount_ = call (load_sym libglib "g_regex_get_capture_count") (GLibRegexRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getCompileFlags_ = call (load_sym libglib "g_regex_get_compile_flags") (GLibRegexRecord.PolyML.PTR --> GLibRegexCompileFlags.PolyML.VAL)
      val getMatchFlags_ = call (load_sym libglib "g_regex_get_match_flags") (GLibRegexRecord.PolyML.PTR --> GLibRegexMatchFlags.PolyML.VAL)
      val getMaxBackref_ = call (load_sym libglib "g_regex_get_max_backref") (GLibRegexRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getPattern_ = call (load_sym libglib "g_regex_get_pattern") (GLibRegexRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getStringNumber_ = call (load_sym libglib "g_regex_get_string_number") (GLibRegexRecord.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Int32.VAL)
      val match_ =
        call (load_sym libglib "g_regex_match")
          (
            GLibRegexRecord.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibRegexMatchFlags.PolyML.VAL
             &&> GLibMatchInfoRecord.PolyML.OUTREF
             --> FFI.PolyML.Bool.VAL
          )
      val matchAll_ =
        call (load_sym libglib "g_regex_match_all")
          (
            GLibRegexRecord.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibRegexMatchFlags.PolyML.VAL
             &&> GLibMatchInfoRecord.PolyML.OUTREF
             --> FFI.PolyML.Bool.VAL
          )
      val checkReplacement_ =
        call (load_sym libglib "g_regex_check_replacement")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Bool.REF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val escapeNul_ = call (load_sym libglib "g_regex_escape_nul") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.String.RETPTR)
      val matchSimple_ =
        call (load_sym libglib "g_regex_match_simple")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibRegexCompileFlags.PolyML.VAL
             &&> GLibRegexMatchFlags.PolyML.VAL
             --> FFI.PolyML.Bool.VAL
          )
    end
    type record_t = GLibRegexRecord.t
    type matchinforecord_t = GLibMatchInfoRecord.t
    type regexmatchflags_t = GLibRegexMatchFlags.t
    type regexcompileflags_t = GLibRegexCompileFlags.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new pattern compileOptions matchOptions =
      (
        FFI.String.withConstPtr
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
    fun getCaptureCount self = (GLibRegexRecord.C.withPtr ---> FFI.Int32.fromVal) getCaptureCount_ self
    fun getCompileFlags self = (GLibRegexRecord.C.withPtr ---> GLibRegexCompileFlags.C.fromVal) getCompileFlags_ self
    fun getMatchFlags self = (GLibRegexRecord.C.withPtr ---> GLibRegexMatchFlags.C.fromVal) getMatchFlags_ self
    fun getMaxBackref self = (GLibRegexRecord.C.withPtr ---> FFI.Int32.fromVal) getMaxBackref_ self
    fun getPattern self = (GLibRegexRecord.C.withPtr ---> FFI.String.fromPtr false) getPattern_ self
    fun getStringNumber self name = (GLibRegexRecord.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Int32.fromVal) getStringNumber_ (self & name)
    fun match self string matchOptions =
      let
        val matchInfo & retVal =
          (
            GLibRegexRecord.C.withPtr
             &&&> FFI.String.withConstPtr
             &&&> GLibRegexMatchFlags.C.withVal
             &&&> GLibMatchInfoRecord.C.withRefOptPtr
             ---> GLibMatchInfoRecord.C.fromPtr true && FFI.Bool.fromVal
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
             &&&> FFI.String.withConstPtr
             &&&> GLibRegexMatchFlags.C.withVal
             &&&> GLibMatchInfoRecord.C.withRefOptPtr
             ---> GLibMatchInfoRecord.C.fromPtr true && FFI.Bool.fromVal
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
            FFI.String.withConstPtr
             &&&> FFI.Bool.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Bool.fromVal && FFI.Bool.fromVal
          )
            checkReplacement_
            (
              replacement
               & false
               & []
            )
      in
        if retVal then SOME hasReferences else NONE
      end
    fun escapeNul string length = (FFI.String.withConstPtr &&&> FFI.Int32.withVal ---> FFI.String.fromPtr true) escapeNul_ (string & length)
    fun matchSimple pattern string compileOptions matchOptions =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibRegexCompileFlags.C.withVal
         &&&> GLibRegexMatchFlags.C.withVal
         ---> FFI.Bool.fromVal
      )
        matchSimple_
        (
          pattern
           & string
           & compileOptions
           & matchOptions
        )
  end
