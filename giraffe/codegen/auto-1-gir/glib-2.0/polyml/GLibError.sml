structure GLibError :>
  G_LIB_ERROR
    where type record_t = GLibErrorRecord.t
    where type quark_t = GLibQuark.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_error_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val matches_ =
        call (load_sym libglib "g_error_matches")
          (
            GLibErrorRecord.PolyML.PTR
             &&> GLibQuark.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
    end
    type record_t = GLibErrorRecord.t
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
