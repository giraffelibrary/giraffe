structure GLibMatchInfo :>
  G_LIB_MATCH_INFO
    where type record_t = GLibMatchInfoRecord.t
    where type regex_record_t = GLibRegexRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_match_info_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val expandReferences_ =
        call (load_sym libglib "g_match_info_expand_references")
          (
            GLibMatchInfoRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.String.PolyML.RETPTR
          )
      val fetch_ = call (load_sym libglib "g_match_info_fetch") (GLibMatchInfoRecord.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.String.PolyML.RETPTR)
      val fetchNamed_ = call (load_sym libglib "g_match_info_fetch_named") (GLibMatchInfoRecord.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
      val fetchNamedPos_ =
        call (load_sym libglib "g_match_info_fetch_named_pos")
          (
            GLibMatchInfoRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val fetchPos_ =
        call (load_sym libglib "g_match_info_fetch_pos")
          (
            GLibMatchInfoRecord.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val getMatchCount_ = call (load_sym libglib "g_match_info_get_match_count") (GLibMatchInfoRecord.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getRegex_ = call (load_sym libglib "g_match_info_get_regex") (GLibMatchInfoRecord.PolyML.PTR --> GLibRegexRecord.PolyML.PTR)
      val getString_ = call (load_sym libglib "g_match_info_get_string") (GLibMatchInfoRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val isPartialMatch_ = call (load_sym libglib "g_match_info_is_partial_match") (GLibMatchInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val matches_ = call (load_sym libglib "g_match_info_matches") (GLibMatchInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val next_ = call (load_sym libglib "g_match_info_next") (GLibMatchInfoRecord.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.Bool.PolyML.VAL)
    end
    type record_t = GLibMatchInfoRecord.t
    type regex_record_t = GLibRegexRecord.t
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
    fun fetch self matchNum = (GLibMatchInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.String.C.fromPtr true) fetch_ (self & matchNum)
    fun fetchNamed self name = (GLibMatchInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) fetchNamed_ (self & name)
    fun fetchNamedPos self name =
      let
        val startPos
         & endPos
         & retVal =
          (
            GLibMatchInfoRecord.C.withPtr
             &&&> FFI.String.C.withConstPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            fetchNamedPos_
            (
              self
               & name
               & FFI.Int32.null
               & FFI.Int32.null
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
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            fetchPos_
            (
              self
               & matchNum
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        if retVal then SOME (startPos, endPos) else NONE
      end
    fun getMatchCount self = (GLibMatchInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) getMatchCount_ self
    fun getRegex self = (GLibMatchInfoRecord.C.withPtr ---> GLibRegexRecord.C.fromPtr true) getRegex_ self
    fun getString self = (GLibMatchInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) getString_ self
    fun isPartialMatch self = (GLibMatchInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) isPartialMatch_ self
    fun matches self = (GLibMatchInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) matches_ self
    fun next self = (GLibMatchInfoRecord.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) next_ (self & [])
  end
