structure VteRegex :>
  VTE_REGEX
    where type t = VteRegexRecord.t =
  struct
    val getType_ = _import "vte_regex_get_type" : unit -> GObjectType.FFI.val_;
    val newForMatch_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5 =>
          (
            _import "mlton_vte_regex_new_for_match" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSSize.FFI.val_
               * GUInt32.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> VteRegexRecord.FFI.non_opt VteRegexRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val newForSearch_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5 =>
          (
            _import "mlton_vte_regex_new_for_search" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSSize.FFI.val_
               * GUInt32.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> VteRegexRecord.FFI.non_opt VteRegexRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val jit_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_regex_jit" :
              VteRegexRecord.FFI.non_opt VteRegexRecord.FFI.p
               * GUInt32.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type t = VteRegexRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newForMatch
      (
        pattern,
        patternLength,
        flags
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GSSize.FFI.withVal
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
        Utf8.FFI.withPtr
         &&&> GSSize.FFI.withVal
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
        VteRegexRecord.FFI.withPtr
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
