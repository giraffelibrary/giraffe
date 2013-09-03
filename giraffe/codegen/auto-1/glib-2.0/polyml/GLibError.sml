structure GLibError :>
  G_LIB_ERROR
    where type record_t = GLibErrorRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_error_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val matches_ =
        call (load_sym libglib "g_error_matches")
          (
            GLibErrorRecord.PolyML.PTR
             &&> FFI.PolyML.UInt32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.Bool.VAL
          )
    end
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
