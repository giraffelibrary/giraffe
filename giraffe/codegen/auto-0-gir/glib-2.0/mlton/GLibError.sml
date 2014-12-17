structure GLibError :>
  G_LIB_ERROR
    where type record_t = GLibErrorRecord.t
    where type quark_t = GLibQuark.t =
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
               * GLibQuark.C.val_
               * FFI.Int.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type record_t = GLibErrorRecord.t
    type quark_t = GLibQuark.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun matches self domain code =
      (
        GLibErrorRecord.C.withPtr
         &&&> GLibQuark.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        matches_
        (
          self
           & domain
           & code
        )
  end
