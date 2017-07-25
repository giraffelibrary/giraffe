structure GLibString :>
  G_LIB_STRING
    where type t = GLibStringRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_gstring_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type t = GLibStringRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
