structure GLibMatchInfo :>
  G_LIB_MATCH_INFO
    where type record_t = GLibMatchInfoRecord.t
    where type regex_record_t = GLibRegexRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_match_info_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val expandReferences_ =
        call (load_sym libglib "g_match_info_expand_references")
          (
            GLibMatchInfoRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val fetch_ = call (load_sym libglib "g_match_info_fetch") (GLibMatchInfoRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val fetchNamed_ = call (load_sym libglib "g_match_info_fetch_named") (GLibMatchInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val fetchNamedPos_ =
        call (load_sym libglib "g_match_info_fetch_named_pos")
          (
            GLibMatchInfoRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
      val fetchPos_ =
        call (load_sym libglib "g_match_info_fetch_pos")
          (
            GLibMatchInfoRecord.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
      val getMatchCount_ = call (load_sym libglib "g_match_info_get_match_count") (GLibMatchInfoRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getRegex_ = call (load_sym libglib "g_match_info_get_regex") (GLibMatchInfoRecord.PolyML.cPtr --> GLibRegexRecord.PolyML.cPtr)
      val getString_ = call (load_sym libglib "g_match_info_get_string") (GLibMatchInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val isPartialMatch_ = call (load_sym libglib "g_match_info_is_partial_match") (GLibMatchInfoRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val matches_ = call (load_sym libglib "g_match_info_matches") (GLibMatchInfoRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val next_ = call (load_sym libglib "g_match_info_next") (GLibMatchInfoRecord.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
    end
    type record_t = GLibMatchInfoRecord.t
    type regex_record_t = GLibRegexRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun expandReferences self stringToExpand =
      (
        GLibMatchInfoRecord.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> Utf8.C.fromPtr true
      )
        expandReferences_
        (
          self
           & stringToExpand
           & []
        )
    fun fetch self matchNum = (GLibMatchInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr true) fetch_ (self & matchNum)
    fun fetchNamed self name = (GLibMatchInfoRecord.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) fetchNamed_ (self & name)
    fun fetchNamedPos self name =
      let
        val startPos
         & endPos
         & retVal =
          (
            GLibMatchInfoRecord.C.withPtr
             &&&> Utf8.C.withPtr
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
    fun getString self = (GLibMatchInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) getString_ self
    fun isPartialMatch self = (GLibMatchInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) isPartialMatch_ self
    fun matches self = (GLibMatchInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) matches_ self
    fun next self = (GLibMatchInfoRecord.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) next_ (self & [])
  end
