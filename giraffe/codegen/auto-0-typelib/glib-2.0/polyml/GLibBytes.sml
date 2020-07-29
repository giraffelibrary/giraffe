structure GLibBytes :>
  G_LIB_BYTES
    where type t = GLibBytesRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_bytes_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_bytes_new") (GUInt8CArrayN.PolyML.cInOptPtr &&> GUInt64.PolyML.cVal --> GLibBytesRecord.PolyML.cPtr)
      val newTake_ = call (getSymbol "g_bytes_new_take") (GUInt8CArrayN.PolyML.cInOptPtr &&> GUInt64.PolyML.cVal --> GLibBytesRecord.PolyML.cPtr)
      val compare_ = call (getSymbol "g_bytes_compare") (GLibBytesRecord.PolyML.cPtr &&> GLibBytesRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val equal_ = call (getSymbol "g_bytes_equal") (GLibBytesRecord.PolyML.cPtr &&> GLibBytesRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getData_ = call (getSymbol "g_bytes_get_data") (GLibBytesRecord.PolyML.cPtr &&> GUInt64.PolyML.cRef --> GUInt8CArrayN.PolyML.cOutOptPtr)
      val getSize_ = call (getSymbol "g_bytes_get_size") (GLibBytesRecord.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val hash_ = call (getSymbol "g_bytes_hash") (GLibBytesRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val newFromBytes_ =
        call (getSymbol "g_bytes_new_from_bytes")
          (
            GLibBytesRecord.PolyML.cPtr
             &&> GUInt64.PolyML.cVal
             &&> GUInt64.PolyML.cVal
             --> GLibBytesRecord.PolyML.cPtr
          )
      val unrefToData_ = call (getSymbol "g_bytes_unref_to_data") (GLibBytesRecord.PolyML.cPtr &&> GUInt64.PolyML.cRef --> GUInt8CArrayN.PolyML.cOutPtr)
    end
    type t = GLibBytesRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new data =
      let
        val size =
          case data of
            SOME data => LargeInt.fromInt (GUInt8CArrayN.length data)
          | NONE => GUInt64.null
        val retVal = (GUInt8CArrayN.FFI.withOptPtr &&&> GUInt64.FFI.withVal ---> GLibBytesRecord.FFI.fromPtr true) new_ (data & size)
      in
        retVal
      end
    fun newTake data =
      let
        val size =
          case data of
            SOME data => LargeInt.fromInt (GUInt8CArrayN.length data)
          | NONE => GUInt64.null
        val retVal = (GUInt8CArrayN.FFI.withDupOptPtr 1 &&&> GUInt64.FFI.withVal ---> GLibBytesRecord.FFI.fromPtr true) newTake_ (data & size)
      in
        retVal
      end
    fun compare self bytes2 = (GLibBytesRecord.FFI.withPtr &&&> GLibBytesRecord.FFI.withPtr ---> GInt32.FFI.fromVal) compare_ (self & bytes2)
    fun equal self bytes2 = (GLibBytesRecord.FFI.withPtr &&&> GLibBytesRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & bytes2)
    fun getData self =
      let
        val size & retVal = (GLibBytesRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && GUInt8CArrayN.FFI.fromOptPtr 0) getData_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt size)
      end
    fun getSize self = (GLibBytesRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) getSize_ self
    fun hash self = (GLibBytesRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) hash_ self
    fun newFromBytes self (offset, length) =
      (
        GLibBytesRecord.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         &&&> GUInt64.FFI.withVal
         ---> GLibBytesRecord.FFI.fromPtr true
      )
        newFromBytes_
        (
          self
           & offset
           & length
        )
    fun unrefToData self =
      let
        val size & retVal = (GLibBytesRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && GUInt8CArrayN.FFI.fromPtr 1) unrefToData_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt size)
      end
  end
