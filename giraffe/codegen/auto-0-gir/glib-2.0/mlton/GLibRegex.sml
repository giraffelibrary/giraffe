structure GLibRegex :>
  G_LIB_REGEX
    where type t = GLibRegexRecord.t
    where type match_info_t = GLibMatchInfoRecord.t
    where type regex_match_flags_t = GLibRegexMatchFlags.t
    where type regex_compile_flags_t = GLibRegexCompileFlags.t =
  struct
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    val getType_ = _import "g_regex_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5 =>
          (
            _import "mlton_g_regex_new" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GLibRegexCompileFlags.FFI.val_
               * GLibRegexMatchFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GLibRegexRecord.FFI.notnull GLibRegexRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getCaptureCount_ = _import "g_regex_get_capture_count" : GLibRegexRecord.FFI.notnull GLibRegexRecord.FFI.p -> GInt.FFI.val_;
    val getCompileFlags_ = _import "g_regex_get_compile_flags" : GLibRegexRecord.FFI.notnull GLibRegexRecord.FFI.p -> GLibRegexCompileFlags.FFI.val_;
    val getMatchFlags_ = _import "g_regex_get_match_flags" : GLibRegexRecord.FFI.notnull GLibRegexRecord.FFI.p -> GLibRegexMatchFlags.FFI.val_;
    val getMaxBackref_ = _import "g_regex_get_max_backref" : GLibRegexRecord.FFI.notnull GLibRegexRecord.FFI.p -> GInt.FFI.val_;
    val getPattern_ = _import "g_regex_get_pattern" : GLibRegexRecord.FFI.notnull GLibRegexRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getStringNumber_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_regex_get_string_number" :
              GLibRegexRecord.FFI.notnull GLibRegexRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GInt.FFI.val_;
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
              GLibRegexRecord.FFI.notnull GLibRegexRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GLibRegexMatchFlags.FFI.val_
               * (unit, GLibMatchInfoRecord.FFI.notnull) GLibMatchInfoRecord.FFI.r
               -> GBool.FFI.val_;
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
              GLibRegexRecord.FFI.notnull GLibRegexRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GLibRegexMatchFlags.FFI.val_
               * (unit, GLibMatchInfoRecord.FFI.notnull) GLibMatchInfoRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val matchAllFull_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "mlton_g_regex_match_all_full" :
              GLibRegexRecord.FFI.notnull GLibRegexRecord.FFI.p
               * Utf8CVectorN.MLton.p1
               * Utf8CVectorN.FFI.notnull Utf8CVectorN.MLton.p2
               * GSSize.FFI.val_
               * GInt.FFI.val_
               * GLibRegexMatchFlags.FFI.val_
               * (unit, GLibMatchInfoRecord.FFI.notnull) GLibMatchInfoRecord.FFI.r
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val matchFull_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "mlton_g_regex_match_full" :
              GLibRegexRecord.FFI.notnull GLibRegexRecord.FFI.p
               * Utf8CVectorN.MLton.p1
               * Utf8CVectorN.FFI.notnull Utf8CVectorN.MLton.p2
               * GSSize.FFI.val_
               * GInt.FFI.val_
               * GLibRegexMatchFlags.FFI.val_
               * (unit, GLibMatchInfoRecord.FFI.notnull) GLibMatchInfoRecord.FFI.r
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val replace_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9 =>
          (
            _import "mlton_g_regex_replace" :
              GLibRegexRecord.FFI.notnull GLibRegexRecord.FFI.p
               * Utf8CVectorN.MLton.p1
               * Utf8CVectorN.FFI.notnull Utf8CVectorN.MLton.p2
               * GSSize.FFI.val_
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GLibRegexMatchFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val replaceLiteral_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & (x6, x7)
         & x8
         & x9 =>
          (
            _import "mlton_g_regex_replace_literal" :
              GLibRegexRecord.FFI.notnull GLibRegexRecord.FFI.p
               * Utf8CVectorN.MLton.p1
               * Utf8CVectorN.FFI.notnull Utf8CVectorN.MLton.p2
               * GSSize.FFI.val_
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GLibRegexMatchFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val checkReplacement_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_regex_check_replacement" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GBool.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GLibRegexCompileFlags.FFI.val_
               * GLibRegexMatchFlags.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    type t = GLibRegexRecord.t
    type match_info_t = GLibMatchInfoRecord.t
    type regex_match_flags_t = GLibRegexMatchFlags.t
    type regex_compile_flags_t = GLibRegexCompileFlags.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        pattern,
        compileOptions,
        matchOptions
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GLibRegexCompileFlags.FFI.withVal
         &&&> GLibRegexMatchFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibRegexRecord.FFI.fromPtr true
      )
        new_
        (
          pattern
           & compileOptions
           & matchOptions
           & []
        )
    fun getCaptureCount self = (GLibRegexRecord.FFI.withPtr ---> GInt.FFI.fromVal) getCaptureCount_ self
    fun getCompileFlags self = (GLibRegexRecord.FFI.withPtr ---> GLibRegexCompileFlags.FFI.fromVal) getCompileFlags_ self
    fun getMatchFlags self = (GLibRegexRecord.FFI.withPtr ---> GLibRegexMatchFlags.FFI.fromVal) getMatchFlags_ self
    fun getMaxBackref self = (GLibRegexRecord.FFI.withPtr ---> GInt.FFI.fromVal) getMaxBackref_ self
    fun getPattern self = (GLibRegexRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getPattern_ self
    fun getStringNumber self name = (GLibRegexRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GInt.FFI.fromVal) getStringNumber_ (self & name)
    fun match self (string, matchOptions) =
      let
        val matchInfo & retVal =
          (
            GLibRegexRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibMatchInfoRecord.FFI.withRefOptPtr
             ---> GLibMatchInfoRecord.FFI.fromPtr true && GBool.FFI.fromVal
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
    fun matchAll self (string, matchOptions) =
      let
        val matchInfo & retVal =
          (
            GLibRegexRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibMatchInfoRecord.FFI.withRefOptPtr
             ---> GLibMatchInfoRecord.FFI.fromPtr true && GBool.FFI.fromVal
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
    fun matchAllFull
      self
      (
        string,
        startPosition,
        matchOptions
      ) =
      let
        val stringLen = LargeInt.fromInt (Utf8CVectorN.length string)
        val matchInfo & () =
          (
            GLibRegexRecord.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GSSize.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibMatchInfoRecord.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GLibMatchInfoRecord.FFI.fromPtr true && ignore
          )
            matchAllFull_
            (
              self
               & string
               & stringLen
               & startPosition
               & matchOptions
               & NONE
               & []
            )
      in
        matchInfo
      end
    fun matchFull
      self
      (
        string,
        startPosition,
        matchOptions
      ) =
      let
        val stringLen = LargeInt.fromInt (Utf8CVectorN.length string)
        val matchInfo & () =
          (
            GLibRegexRecord.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GSSize.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibMatchInfoRecord.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GLibMatchInfoRecord.FFI.fromPtr true && ignore
          )
            matchFull_
            (
              self
               & string
               & stringLen
               & startPosition
               & matchOptions
               & NONE
               & []
            )
      in
        matchInfo
      end
    fun replace
      self
      (
        string,
        startPosition,
        replacement,
        matchOptions
      ) =
      let
        val stringLen = LargeInt.fromInt (Utf8CVectorN.length string)
        val retVal =
          (
            GLibRegexRecord.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GSSize.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> Utf8.FFI.withPtr
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1
          )
            replace_
            (
              self
               & string
               & stringLen
               & startPosition
               & replacement
               & matchOptions
               & []
            )
      in
        retVal
      end
    fun replaceLiteral
      self
      (
        string,
        startPosition,
        replacement,
        matchOptions
      ) =
      let
        val stringLen = LargeInt.fromInt (Utf8CVectorN.length string)
        val retVal =
          (
            GLibRegexRecord.FFI.withPtr
             &&&> Utf8CVectorN.FFI.withPtr
             &&&> GSSize.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> Utf8.FFI.withPtr
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1
          )
            replaceLiteral_
            (
              self
               & string
               & stringLen
               & startPosition
               & replacement
               & matchOptions
               & []
            )
      in
        retVal
      end
    fun checkReplacement replacement =
      let
        val hasReferences & () =
          (
            Utf8.FFI.withPtr
             &&&> GBool.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GBool.FFI.fromVal && ignore
          )
            checkReplacement_
            (
              replacement
               & GBool.null
               & []
            )
      in
        hasReferences
      end
    fun escapeNul (string, length) = (Utf8.FFI.withPtr &&&> GInt.FFI.withVal ---> Utf8.FFI.fromPtr 1) escapeNul_ (string & length)
    fun matchSimple
      (
        pattern,
        string,
        compileOptions,
        matchOptions
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibRegexCompileFlags.FFI.withVal
         &&&> GLibRegexMatchFlags.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        matchSimple_
        (
          pattern
           & string
           & compileOptions
           & matchOptions
        )
  end
