structure GLibError :>
  G_LIB_ERROR
    where type record_t = GLibErrorRecord.t =
  struct
    val getType_ = _import "g_error_get_type" : unit -> GObjectType.C.val_;
    val matches_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_error_matches" :
              GLibErrorRecord.C.notnull GLibErrorRecord.C.p
               * FFI.UInt32.val_
               * FFI.Int32.val_
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type record_t = GLibErrorRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun matches self domain code =
      (
        GLibErrorRecord.C.withPtr
         &&&> FFI.UInt32.withVal
         &&&> FFI.Int32.withVal
         ---> FFI.Bool.fromVal
      )
        matches_
        (
          self
           & domain
           & code
        )
  end
