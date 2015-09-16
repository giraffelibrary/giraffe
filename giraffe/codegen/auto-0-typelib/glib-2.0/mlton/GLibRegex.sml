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
              cstring
               * unit CPointer.t
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
    val getCaptureCount_ = _import "g_regex_get_capture_count" : GLibRegexRecord.C.notnull GLibRegexRecord.C.p -> FFI.Int32.C.val_;
    val getCompileFlags_ = _import "g_regex_get_compile_flags" : GLibRegexRecord.C.notnull GLibRegexRecord.C.p -> GLibRegexCompileFlags.C.val_;
    val getMatchFlags_ = _import "g_regex_get_match_flags" : GLibRegexRecord.C.notnull GLibRegexRecord.C.p -> GLibRegexMatchFlags.C.val_;
    val getMaxBackref_ = _import "g_regex_get_max_backref" : GLibRegexRecord.C.notnull GLibRegexRecord.C.p -> FFI.Int32.C.val_;
    val getPattern_ = _import "g_regex_get_pattern" : GLibRegexRecord.C.notnull GLibRegexRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getStringNumber_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_regex_get_string_number" :
              GLibRegexRecord.C.notnull GLibRegexRecord.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Int32.C.val_;
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
               * cstring
               * unit CPointer.t
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
               * cstring
               * unit CPointer.t
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
              cstring
               * unit CPointer.t
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
              cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
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
        FFI.String.C.withConstPtr
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
    fun getPattern self = (GLibRegexRecord.C.withPtr ---> FFI.String.C.fromPtr false) getPattern_ self
    fun getStringNumber self name = (GLibRegexRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Int32.C.fromVal) getStringNumber_ (self & name)
    fun match self string matchOptions =
      let
        val matchInfo & retVal =
          (
            GLibRegexRecord.C.withPtr
             &&&> FFI.String.C.withConstPtr
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
             &&&> FFI.String.C.withConstPtr
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
            FFI.String.C.withConstPtr
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
    fun escapeNul string length = (FFI.String.C.withConstPtr &&&> FFI.Int32.C.withVal ---> FFI.String.C.fromPtr true) escapeNul_ (string & length)
    fun matchSimple pattern string compileOptions matchOptions =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
