structure GLibError :>
  G_LIB_ERROR
    where type t = GLibErrorRecord.t
    where type quark_t = GLibQuark.t =
  struct
    val getType_ = _import "g_error_get_type" : unit -> GObjectType.FFI.val_;
    val matches_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_error_matches" :
              GLibErrorRecord.FFI.notnull GLibErrorRecord.FFI.p
               * GLibQuark.FFI.val_
               * GInt.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GLibErrorRecord.t
    type quark_t = GLibQuark.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun matches self (domain, code) =
      (
        GLibErrorRecord.FFI.withPtr
         &&&> GLibQuark.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        matches_
        (
          self
           & domain
           & code
        )
  end
