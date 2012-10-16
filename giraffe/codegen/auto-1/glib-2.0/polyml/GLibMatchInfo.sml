structure GLibMatchInfo :>
  G_LIB_MATCH_INFO
    where type record_t = GLibMatchInfoRecord.t
    where type regexrecord_t = GLibRegexRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_match_info_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val expandReferences_ =
        call (load_sym libglib "g_match_info_expand_references")
          (
            GLibMatchInfoRecord.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.String.RETPTR
          )
      val fetch_ = call (load_sym libglib "g_match_info_fetch") (GLibMatchInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.String.RETPTR)
      val fetchNamed_ = call (load_sym libglib "g_match_info_fetch_named") (GLibMatchInfoRecord.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val fetchNamedPos_ =
        call (load_sym libglib "g_match_info_fetch_named_pos")
          (
            GLibMatchInfoRecord.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.REF
             &&> FFI.PolyML.Int32.REF
             --> FFI.PolyML.Bool.VAL
          )
      val fetchPos_ =
        call (load_sym libglib "g_match_info_fetch_pos")
          (
            GLibMatchInfoRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.REF
             &&> FFI.PolyML.Int32.REF
             --> FFI.PolyML.Bool.VAL
          )
      val getMatchCount_ = call (load_sym libglib "g_match_info_get_match_count") (GLibMatchInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getRegex_ = call (load_sym libglib "g_match_info_get_regex") (GLibMatchInfoRecord.PolyML.PTR --> GLibRegexRecord.PolyML.PTR)
      val getString_ = call (load_sym libglib "g_match_info_get_string") (GLibMatchInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val isPartialMatch_ = call (load_sym libglib "g_match_info_is_partial_match") (GLibMatchInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val matches_ = call (load_sym libglib "g_match_info_matches") (GLibMatchInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val next_ = call (load_sym libglib "g_match_info_next") (GLibMatchInfoRecord.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.PolyML.Bool.VAL)
    end
    type record_t = GLibMatchInfoRecord.t
    type regexrecord_t = GLibRegexRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun expandReferences self stringToExpand =
      (
        GLibMatchInfoRecord.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.String.fromPtr true
      )
        expandReferences_
        (
          self
           & stringToExpand
           & []
        )
    fun fetch self matchNum = (GLibMatchInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.String.fromPtr true) fetch_ (self & matchNum)
    fun fetchNamed self name = (GLibMatchInfoRecord.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr true) fetchNamed_ (self & name)
    fun fetchNamedPos self name =
      let
        val startPos
         & endPos
         & retVal =
          (
            GLibMatchInfoRecord.C.withPtr
             &&&> FFI.String.withConstPtr
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && FFI.Bool.fromVal
          )
            fetchNamedPos_
            (
              self
               & name
               & 0
               & 0
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
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && FFI.Bool.fromVal
          )
            fetchPos_
            (
              self
               & matchNum
               & 0
               & 0
            )
      in
        if retVal then SOME (startPos, endPos) else NONE
      end
    fun getMatchCount self = (GLibMatchInfoRecord.C.withPtr ---> FFI.Int32.fromVal) getMatchCount_ self
    fun getRegex self = (GLibMatchInfoRecord.C.withPtr ---> GLibRegexRecord.C.fromPtr true) getRegex_ self
    fun getString self = (GLibMatchInfoRecord.C.withPtr ---> FFI.String.fromPtr false) getString_ self
    fun isPartialMatch self = (GLibMatchInfoRecord.C.withPtr ---> FFI.Bool.fromVal) isPartialMatch_ self
    fun matches self = (GLibMatchInfoRecord.C.withPtr ---> FFI.Bool.fromVal) matches_ self
    fun next self = (GLibMatchInfoRecord.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.fromVal) next_ (self & [])
  end
