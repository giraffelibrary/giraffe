structure GioInetAddressMask :>
  GIO_INET_ADDRESS_MASK
    where type 'a class = 'a GioInetAddressMaskClass.class
    where type 'a initable_class = 'a GioInitableClass.class
    where type 'a inet_address_class = 'a GioInetAddressClass.class
    where type socket_family_t = GioSocketFamily.t =
  struct
    val getType_ = _import "g_inet_address_mask_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_inet_address_mask_new" :
              GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p
               * GUInt32.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioInetAddressMaskClass.FFI.non_opt GioInetAddressMaskClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromString_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_inet_address_mask_new_from_string" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioInetAddressMaskClass.FFI.non_opt GioInetAddressMaskClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val equal_ = fn x1 & x2 => (_import "g_inet_address_mask_equal" : GioInetAddressMaskClass.FFI.non_opt GioInetAddressMaskClass.FFI.p * GioInetAddressMaskClass.FFI.non_opt GioInetAddressMaskClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getAddress_ = _import "g_inet_address_mask_get_address" : GioInetAddressMaskClass.FFI.non_opt GioInetAddressMaskClass.FFI.p -> GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p;
    val getFamily_ = _import "g_inet_address_mask_get_family" : GioInetAddressMaskClass.FFI.non_opt GioInetAddressMaskClass.FFI.p -> GioSocketFamily.FFI.val_;
    val getLength_ = _import "g_inet_address_mask_get_length" : GioInetAddressMaskClass.FFI.non_opt GioInetAddressMaskClass.FFI.p -> GUInt32.FFI.val_;
    val matches_ = fn x1 & x2 => (_import "g_inet_address_mask_matches" : GioInetAddressMaskClass.FFI.non_opt GioInetAddressMaskClass.FFI.p * GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val toString_ = _import "g_inet_address_mask_to_string" : GioInetAddressMaskClass.FFI.non_opt GioInetAddressMaskClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
         &&&> GUInt32.FFI.withVal
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
    fun getLength self = (GioInetAddressMaskClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getLength_ self
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
