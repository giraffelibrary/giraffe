structure GLibBytes :>
  G_LIB_BYTES
    where type t = GLibBytesRecord.t =
  struct
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_bytes_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_bytes_new") (GUInt8CVectorN.PolyML.cInOptPtr &&> GSize.PolyML.cVal --> GLibBytesRecord.PolyML.cPtr)
      val compare_ = call (getSymbol "g_bytes_compare") (GLibBytesRecord.PolyML.cPtr &&> GLibBytesRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val equal_ = call (getSymbol "g_bytes_equal") (GLibBytesRecord.PolyML.cPtr &&> GLibBytesRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getData_ = call (getSymbol "g_bytes_get_data") (GLibBytesRecord.PolyML.cPtr &&> GSize.PolyML.cRef --> GUInt8CVectorN.PolyML.cOutOptPtr)
      val getSize_ = call (getSymbol "g_bytes_get_size") (GLibBytesRecord.PolyML.cPtr --> GSize.PolyML.cVal)
      val hash_ = call (getSymbol "g_bytes_hash") (GLibBytesRecord.PolyML.cPtr --> GUInt.PolyML.cVal)
      val newFromBytes_ =
        call (getSymbol "g_bytes_new_from_bytes")
          (
            GLibBytesRecord.PolyML.cPtr
             &&> GSize.PolyML.cVal
             &&> GSize.PolyML.cVal
             --> GLibBytesRecord.PolyML.cPtr
          )
      val unrefToData_ = call (getSymbol "g_bytes_unref_to_data") (GLibBytesRecord.PolyML.cPtr &&> GSize.PolyML.cRef --> GUInt8CVectorN.PolyML.cOutPtr)
    end
    type t = GLibBytesRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new data =
      let
        val size =
          case data of
            SOME data => LargeInt.fromInt (GUInt8CVectorN.length data)
          | NONE => GSize.null
        val retVal = (GUInt8CVectorN.FFI.withOptPtr &&&> GSize.FFI.withVal ---> GLibBytesRecord.FFI.fromPtr true) new_ (data & size)
      in
        retVal
      end
    fun compare self bytes2 = (GLibBytesRecord.FFI.withPtr &&&> GLibBytesRecord.FFI.withPtr ---> GInt.FFI.fromVal) compare_ (self & bytes2)
    fun equal self bytes2 = (GLibBytesRecord.FFI.withPtr &&&> GLibBytesRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & bytes2)
    fun getData self =
      let
        val size & retVal = (GLibBytesRecord.FFI.withPtr &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && GUInt8CVectorN.FFI.fromOptPtr 0) getData_ (self & GSize.null)
      in
        retVal (LargeInt.toInt size)
      end
    fun getSize self = (GLibBytesRecord.FFI.withPtr ---> GSize.FFI.fromVal) getSize_ self
    fun hash self = (GLibBytesRecord.FFI.withPtr ---> GUInt.FFI.fromVal) hash_ self
    fun newFromBytes self (offset, length) =
      (
        GLibBytesRecord.FFI.withPtr
         &&&> GSize.FFI.withVal
         &&&> GSize.FFI.withVal
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
        val size & retVal = (GLibBytesRecord.FFI.withPtr &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && GUInt8CVectorN.FFI.fromPtr 1) unrefToData_ (self & GSize.null)
      in
        retVal (LargeInt.toInt size)
      end
  end
