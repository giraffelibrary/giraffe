structure GLibError :>
  G_LIB_ERROR
    where type t = GLibErrorRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_error_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val matches_ =
        call (load_sym libglib "g_error_matches")
          (
            GLibErrorRecord.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
    end
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
