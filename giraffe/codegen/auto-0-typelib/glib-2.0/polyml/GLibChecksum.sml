structure GLibChecksum :>
  G_LIB_CHECKSUM
    where type t = GLibChecksumRecord.t
    where type checksum_type_t = GLibChecksumType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_checksum_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_checksum_new") (GLibChecksumType.PolyML.cVal --> GLibChecksumRecord.PolyML.cPtr)
      val copy_ = call (getSymbol "g_checksum_copy") (GLibChecksumRecord.PolyML.cPtr --> GLibChecksumRecord.PolyML.cPtr)
      val getString_ = call (getSymbol "g_checksum_get_string") (GLibChecksumRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val reset_ = call (getSymbol "g_checksum_reset") (GLibChecksumRecord.PolyML.cPtr --> cVoid)
      val update_ =
        call (getSymbol "g_checksum_update")
          (
            GLibChecksumRecord.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             --> cVoid
          )
      val typeGetLength_ = call (getSymbol "g_checksum_type_get_length") (GLibChecksumType.PolyML.cVal --> GInt64.PolyML.cVal)
    end
    type t = GLibChecksumRecord.t
    type checksum_type_t = GLibChecksumType.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new checksumType = (GLibChecksumType.FFI.withVal ---> GLibChecksumRecord.FFI.fromPtr true) new_ checksumType
    fun copy self = (GLibChecksumRecord.FFI.withPtr false ---> GLibChecksumRecord.FFI.fromPtr true) copy_ self
    fun getString self = (GLibChecksumRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getString_ self
    fun reset self = (GLibChecksumRecord.FFI.withPtr false ---> I) reset_ self
    fun update self data =
      let
        val length = LargeInt.fromInt (GUInt8CArrayN.length data)
        val () =
          (
            GLibChecksumRecord.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GInt64.FFI.withVal
             ---> I
          )
            update_
            (
              self
               & data
               & length
            )
      in
        ()
      end
    fun typeGetLength checksumType = (GLibChecksumType.FFI.withVal ---> GInt64.FFI.fromVal) typeGetLength_ checksumType
  end
