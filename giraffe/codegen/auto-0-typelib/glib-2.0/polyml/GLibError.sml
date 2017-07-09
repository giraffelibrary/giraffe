structure GLibError :>
  G_LIB_ERROR
    where type t = GLibErrorRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_error_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val matches_ =
        call (getSymbol "g_error_matches")
          (
            GLibErrorRecord.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GBool.PolyML.cVal
          )
    end
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
