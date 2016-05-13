structure GLibError :>
  G_LIB_ERROR
    where type t = GLibErrorRecord.t
    where type quark_t = GLibQuark.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_error_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val matches_ =
        call (load_sym libglib "g_error_matches")
          (
            GLibErrorRecord.PolyML.cPtr
             &&> GLibQuark.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
    end
    type t = GLibErrorRecord.t
    type quark_t = GLibQuark.t
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
