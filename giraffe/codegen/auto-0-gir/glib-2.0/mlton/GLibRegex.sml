structure GLibRegex :>
  G_LIB_REGEX
    where type record_t = GLibRegexRecord.t
    where type match_info_record_t = GLibMatchInfoRecord.t
    where type regex_match_flags_t = GLibRegexMatchFlags.t
    where type regex_compile_flags_t = GLibRegexCompileFlags.t =
  struct
    val getType_ = _import "g_regex_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5 =>
          (
            _import "mlton_g_regex_new" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GLibRegexCompileFlags.C.val_
               * GLibRegexMatchFlags.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GLibRegexRecord.C.notnull GLibRegexRecord.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getCaptureCount_ = _import "g_regex_get_capture_count" : GLibRegexRecord.C.notnull GLibRegexRecord.C.p -> FFI.Int.C.val_;
    val getCompileFlags_ = _import "g_regex_get_compile_flags" : GLibRegexRecord.C.notnull GLibRegexRecord.C.p -> GLibRegexCompileFlags.C.val_;
    val getMatchFlags_ = _import "g_regex_get_match_flags" : GLibRegexRecord.C.notnull GLibRegexRecord.C.p -> GLibRegexMatchFlags.C.val_;
    val getMaxBackref_ = _import "g_regex_get_max_backref" : GLibRegexRecord.C.notnull GLibRegexRecord.C.p -> FFI.Int.C.val_;
    val getPattern_ = _import "g_regex_get_pattern" : GLibRegexRecord.C.notnull GLibRegexRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getStringNumber_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_regex_get_string_number" :
              GLibRegexRecord.C.notnull GLibRegexRecord.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val match_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_regex_match" :
              GLibRegexRecord.C.notnull GLibRegexRecord.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GLibRegexMatchFlags.C.val_
               * (unit, GLibMatchInfoRecord.C.notnull) GLibMatchInfoRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val matchAll_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_regex_match_all" :
              GLibRegexRecord.C.notnull GLibRegexRecord.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GLibRegexMatchFlags.C.val_
               * (unit, GLibMatchInfoRecord.C.notnull) GLibMatchInfoRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val checkReplacement_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_regex_check_replacement" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Bool.C.ref_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val escapeNul_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_regex_escape_nul" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val matchSimple_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_g_regex_match_simple" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GLibRegexCompileFlags.C.val_
               * GLibRegexMatchFlags.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
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
    fun getCaptureCount self = (GLibRegexRecord.C.withPtr ---> FFI.Int.C.fromVal) getCaptureCount_ self
    fun getCompileFlags self = (GLibRegexRecord.C.withPtr ---> GLibRegexCompileFlags.C.fromVal) getCompileFlags_ self
    fun getMatchFlags self = (GLibRegexRecord.C.withPtr ---> GLibRegexMatchFlags.C.fromVal) getMatchFlags_ self
    fun getMaxBackref self = (GLibRegexRecord.C.withPtr ---> FFI.Int.C.fromVal) getMaxBackref_ self
    fun getPattern self = (GLibRegexRecord.C.withPtr ---> Utf8.C.fromPtr false) getPattern_ self
    fun getStringNumber self name = (GLibRegexRecord.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int.C.fromVal) getStringNumber_ (self & name)
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
    fun escapeNul string length = (Utf8.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr true) escapeNul_ (string & length)
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
