structure GLibMatchInfo :>
  G_LIB_MATCH_INFO
    where type t = GLibMatchInfoRecord.t
    where type regex_t = GLibRegexRecord.t =
  struct
    val getType_ = _import "g_match_info_get_type" : unit -> GObjectType.FFI.val_;
    val expandReferences_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_match_info_expand_references" :
              GLibMatchInfoRecord.FFI.notnull GLibMatchInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val fetch_ = fn x1 & x2 => (_import "g_match_info_fetch" : GLibMatchInfoRecord.FFI.notnull GLibMatchInfoRecord.FFI.p * GInt32.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val fetchNamed_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_match_info_fetch_named" :
              GLibMatchInfoRecord.FFI.notnull GLibMatchInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val fetchNamedPos_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_match_info_fetch_named_pos" :
              GLibMatchInfoRecord.FFI.notnull GLibMatchInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val fetchPos_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_match_info_fetch_pos" :
              GLibMatchInfoRecord.FFI.notnull GLibMatchInfoRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getMatchCount_ = _import "g_match_info_get_match_count" : GLibMatchInfoRecord.FFI.notnull GLibMatchInfoRecord.FFI.p -> GInt32.FFI.val_;
    val getRegex_ = _import "g_match_info_get_regex" : GLibMatchInfoRecord.FFI.notnull GLibMatchInfoRecord.FFI.p -> GLibRegexRecord.FFI.notnull GLibRegexRecord.FFI.p;
    val getString_ = _import "g_match_info_get_string" : GLibMatchInfoRecord.FFI.notnull GLibMatchInfoRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val isPartialMatch_ = _import "g_match_info_is_partial_match" : GLibMatchInfoRecord.FFI.notnull GLibMatchInfoRecord.FFI.p -> GBool.FFI.val_;
    val matches_ = _import "g_match_info_matches" : GLibMatchInfoRecord.FFI.notnull GLibMatchInfoRecord.FFI.p -> GBool.FFI.val_;
    val next_ = fn x1 & x2 => (_import "g_match_info_next" : GLibMatchInfoRecord.FFI.notnull GLibMatchInfoRecord.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    type t = GLibMatchInfoRecord.t
    type regex_t = GLibRegexRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun expandReferences self stringToExpand =
      (
        GLibMatchInfoRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 1
      )
        expandReferences_
        (
          self
           & stringToExpand
           & []
        )
    fun fetch self matchNum = (GLibMatchInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromPtr 1) fetch_ (self & matchNum)
    fun fetchNamed self name = (GLibMatchInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) fetchNamed_ (self & name)
    fun fetchNamedPos self name =
      let
        val startPos
         & endPos
         & retVal =
          (
            GLibMatchInfoRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            fetchNamedPos_
            (
              self
               & name
               & GInt32.null
               & GInt32.null
            )
      in
        if retVal then SOME (startPos, endPos) else NONE
      end
    fun fetchPos self matchNum =
      let
        val startPos
         & endPos
         & retVal =
          (
            GLibMatchInfoRecord.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            fetchPos_
            (
              self
               & matchNum
               & GInt32.null
               & GInt32.null
            )
      in
        if retVal then SOME (startPos, endPos) else NONE
      end
    fun getMatchCount self = (GLibMatchInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getMatchCount_ self
    fun getRegex self = (GLibMatchInfoRecord.FFI.withPtr ---> GLibRegexRecord.FFI.fromPtr true) getRegex_ self
    fun getString self = (GLibMatchInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getString_ self
    fun isPartialMatch self = (GLibMatchInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) isPartialMatch_ self
    fun matches self = (GLibMatchInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) matches_ self
    fun next self = (GLibMatchInfoRecord.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) next_ (self & [])
  end
