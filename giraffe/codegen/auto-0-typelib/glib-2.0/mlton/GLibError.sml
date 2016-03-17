structure GLibError :>
  G_LIB_ERROR
    where type t = GLibErrorRecord.t =
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
               * FFI.UInt32.C.val_
               * FFI.Int32.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GLibErrorRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun matches self domain code =
      (
        GLibErrorRecord.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        matches_
        (
          self
           & domain
           & code
        )
  end
