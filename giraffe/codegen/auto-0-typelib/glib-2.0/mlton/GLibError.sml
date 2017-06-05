structure GLibError :>
  G_LIB_ERROR
    where type t = GLibErrorRecord.t =
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
               * GUInt32.FFI.val_
               * GInt32.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GLibErrorRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun matches self domain code =
      (
        GLibErrorRecord.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        matches_
        (
          self
           & domain
           & code
        )
  end
