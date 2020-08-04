structure VteRegex :>
  VTE_REGEX
    where type t = VteRegexRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "vte_regex_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newForMatch_ =
        call (getSymbol "vte_regex_new_for_match")
          (
            Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> VteRegexRecord.PolyML.cPtr
          )
      val newForSearch_ =
        call (getSymbol "vte_regex_new_for_search")
          (
            Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> VteRegexRecord.PolyML.cPtr
          )
      val jit_ =
        call (getSymbol "vte_regex_jit")
          (
            VteRegexRecord.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
    type t = VteRegexRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newForMatch
      (
        pattern,
        patternLength,
        flags
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GInt64.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> VteRegexRecord.FFI.fromPtr true
      )
        newForMatch_
        (
          pattern
           & patternLength
           & flags
           & []
        )
    fun newForSearch
      (
        pattern,
        patternLength,
        flags
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GInt64.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> VteRegexRecord.FFI.fromPtr true
      )
        newForSearch_
        (
          pattern
           & patternLength
           & flags
           & []
        )
    fun jit self flags =
      (
        VteRegexRecord.FFI.withPtr false
         &&&> GUInt32.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        jit_
        (
          self
           & flags
           & []
        )
  end
