structure GLibMatchInfo :>
  G_LIB_MATCH_INFO
    where type record_t = GLibMatchInfoRecord.t
    where type regexrecord_t = GLibRegexRecord.t =
  struct
    val getType_ = _import "g_match_info_get_type" : unit -> GObjectType.C.val_;
    val expandReferences_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_match_info_expand_references" :
              GLibMatchInfoRecord.C.notnull GLibMatchInfoRecord.C.p
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val fetch_ = fn x1 & x2 => (_import "g_match_info_fetch" : GLibMatchInfoRecord.C.notnull GLibMatchInfoRecord.C.p * FFI.Int.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
    val fetchNamed_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_match_info_fetch_named" :
              GLibMatchInfoRecord.C.notnull GLibMatchInfoRecord.C.p
               * cstring
               * unit CPointer.t
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
              GLibMatchInfoRecord.C.notnull GLibMatchInfoRecord.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> FFI.Bool.C.val_;
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
              GLibMatchInfoRecord.C.notnull GLibMatchInfoRecord.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getMatchCount_ = _import "g_match_info_get_match_count" : GLibMatchInfoRecord.C.notnull GLibMatchInfoRecord.C.p -> FFI.Int.C.val_;
    val getRegex_ = _import "g_match_info_get_regex" : GLibMatchInfoRecord.C.notnull GLibMatchInfoRecord.C.p -> GLibRegexRecord.C.notnull GLibRegexRecord.C.p;
    val getString_ = _import "g_match_info_get_string" : GLibMatchInfoRecord.C.notnull GLibMatchInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val isPartialMatch_ = _import "g_match_info_is_partial_match" : GLibMatchInfoRecord.C.notnull GLibMatchInfoRecord.C.p -> FFI.Bool.C.val_;
    val matches_ = _import "g_match_info_matches" : GLibMatchInfoRecord.C.notnull GLibMatchInfoRecord.C.p -> FFI.Bool.C.val_;
    val next_ = fn x1 & x2 => (_import "g_match_info_next" : GLibMatchInfoRecord.C.notnull GLibMatchInfoRecord.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    type record_t = GLibMatchInfoRecord.t
    type regexrecord_t = GLibRegexRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun expandReferences self stringToExpand =
      (
        GLibMatchInfoRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.String.C.fromPtr true
      )
        expandReferences_
        (
          self
           & stringToExpand
           & []
        )
    fun fetch self matchNum = (GLibMatchInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.String.C.fromPtr true) fetch_ (self & matchNum)
    fun fetchNamed self name = (GLibMatchInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) fetchNamed_ (self & name)
    fun fetchNamedPos self name =
      let
        val startPos
         & endPos
         & retVal =
          (
            GLibMatchInfoRecord.C.withPtr
             &&&> FFI.String.C.withConstPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            fetchNamedPos_
            (
              self
               & name
               & FFI.Int.null
               & FFI.Int.null
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
            GLibMatchInfoRecord.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            fetchPos_
            (
              self
               & matchNum
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        if retVal then SOME (startPos, endPos) else NONE
      end
    fun getMatchCount self = (GLibMatchInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) getMatchCount_ self
    fun getRegex self = (GLibMatchInfoRecord.C.withPtr ---> GLibRegexRecord.C.fromPtr true) getRegex_ self
    fun getString self = (GLibMatchInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) getString_ self
    fun isPartialMatch self = (GLibMatchInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) isPartialMatch_ self
    fun matches self = (GLibMatchInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) matches_ self
    fun next self = (GLibMatchInfoRecord.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) next_ (self & [])
  end
