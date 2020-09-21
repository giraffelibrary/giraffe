structure GLibThread :>
  G_LIB_THREAD
    where type t = GLibThreadRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_thread_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val self_ = call (getSymbol "g_thread_self") (cVoid --> GLibThreadRecord.PolyML.cPtr)
      val yield_ = call (getSymbol "g_thread_yield") (cVoid --> cVoid)
    end
    type t = GLibThreadRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun self () = (I ---> GLibThreadRecord.FFI.fromPtr true) self_ ()
    fun yield () = (I ---> I) yield_ ()
  end
