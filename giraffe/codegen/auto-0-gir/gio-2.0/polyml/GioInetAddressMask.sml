structure GioInetAddressMask :>
  GIO_INET_ADDRESS_MASK
    where type 'a class = 'a GioInetAddressMaskClass.class
    where type 'a initable_class = 'a GioInitableClass.class
    where type 'a inet_address_class = 'a GioInetAddressClass.class
    where type socket_family_t = GioSocketFamily.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_inet_address_mask_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "g_inet_address_mask_new")
          (
            GioInetAddressClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioInetAddressMaskClass.PolyML.cPtr
          )
      val newFromString_ = call (getSymbol "g_inet_address_mask_new_from_string") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioInetAddressMaskClass.PolyML.cPtr)
      val equal_ = call (getSymbol "g_inet_address_mask_equal") (GioInetAddressMaskClass.PolyML.cPtr &&> GioInetAddressMaskClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getAddress_ = call (getSymbol "g_inet_address_mask_get_address") (GioInetAddressMaskClass.PolyML.cPtr --> GioInetAddressClass.PolyML.cPtr)
      val getFamily_ = call (getSymbol "g_inet_address_mask_get_family") (GioInetAddressMaskClass.PolyML.cPtr --> GioSocketFamily.PolyML.cVal)
      val getLength_ = call (getSymbol "g_inet_address_mask_get_length") (GioInetAddressMaskClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val matches_ = call (getSymbol "g_inet_address_mask_matches") (GioInetAddressMaskClass.PolyML.cPtr &&> GioInetAddressClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val toString_ = call (getSymbol "g_inet_address_mask_to_string") (GioInetAddressMaskClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GioInetAddressMaskClass.class
    type 'a initable_class = 'a GioInitableClass.class
    type 'a inet_address_class = 'a GioInetAddressClass.class
    type socket_family_t = GioSocketFamily.t
    type t = base class
    fun asInitable self = (GObjectObjectClass.FFI.withPtr ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (addr, length) =
      (
        GioInetAddressClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioInetAddressMaskClass.FFI.fromPtr true
      )
        new_
        (
          addr
           & length
           & []
        )
    fun newFromString maskString = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioInetAddressMaskClass.FFI.fromPtr true) newFromString_ (maskString & [])
    fun equal self mask2 = (GioInetAddressMaskClass.FFI.withPtr &&&> GioInetAddressMaskClass.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & mask2)
    fun getAddress self = (GioInetAddressMaskClass.FFI.withPtr ---> GioInetAddressClass.FFI.fromPtr false) getAddress_ self
    fun getFamily self = (GioInetAddressMaskClass.FFI.withPtr ---> GioSocketFamily.FFI.fromVal) getFamily_ self
    fun getLength self = (GioInetAddressMaskClass.FFI.withPtr ---> GUInt.FFI.fromVal) getLength_ self
    fun matches self address = (GioInetAddressMaskClass.FFI.withPtr &&&> GioInetAddressClass.FFI.withPtr ---> GBool.FFI.fromVal) matches_ (self & address)
    fun toString self = (GioInetAddressMaskClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
    local
      open Property
    in
      val addressProp =
        {
          get = fn x => get "address" GioInetAddressClass.tOpt x,
          set = fn x => set "address" GioInetAddressClass.tOpt x,
          new = fn x => new "address" GioInetAddressClass.tOpt x
        }
      val familyProp = {get = fn x => get "family" GioSocketFamily.t x}
      val lengthProp =
        {
          get = fn x => get "length" uint x,
          set = fn x => set "length" uint x,
          new = fn x => new "length" uint x
        }
    end
  end
