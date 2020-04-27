structure GLibVariantType :>
  G_LIB_VARIANT_TYPE
    where type t = GLibVariantTypeRecord.t
    where type variant_type_record_c_ptr_array_n_t = GLibVariantTypeRecordCPtrArrayN.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_variant_type_get_gtype") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_variant_type_new") (Utf8.PolyML.cInPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val newArray_ = call (getSymbol "g_variant_type_new_array") (GLibVariantTypeRecord.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val newDictEntry_ = call (getSymbol "g_variant_type_new_dict_entry") (GLibVariantTypeRecord.PolyML.cPtr &&> GLibVariantTypeRecord.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val newMaybe_ = call (getSymbol "g_variant_type_new_maybe") (GLibVariantTypeRecord.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val newTuple_ = call (getSymbol "g_variant_type_new_tuple") (GLibVariantTypeRecordCPtrArrayN.PolyML.cInPtr &&> GInt.PolyML.cVal --> GLibVariantTypeRecord.PolyML.cPtr)
      val copy_ = call (getSymbol "g_variant_type_copy") (GLibVariantTypeRecord.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val dupString_ = call (getSymbol "g_variant_type_dup_string") (GLibVariantTypeRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val element_ = call (getSymbol "g_variant_type_element") (GLibVariantTypeRecord.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val equal_ = call (getSymbol "g_variant_type_equal") (GLibVariantTypeRecord.PolyML.cPtr &&> GLibVariantTypeRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val first_ = call (getSymbol "g_variant_type_first") (GLibVariantTypeRecord.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val getStringLength_ = call (getSymbol "g_variant_type_get_string_length") (GLibVariantTypeRecord.PolyML.cPtr --> GSize.PolyML.cVal)
      val hash_ = call (getSymbol "g_variant_type_hash") (GLibVariantTypeRecord.PolyML.cPtr --> GUInt.PolyML.cVal)
      val isArray_ = call (getSymbol "g_variant_type_is_array") (GLibVariantTypeRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isBasic_ = call (getSymbol "g_variant_type_is_basic") (GLibVariantTypeRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isContainer_ = call (getSymbol "g_variant_type_is_container") (GLibVariantTypeRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isDefinite_ = call (getSymbol "g_variant_type_is_definite") (GLibVariantTypeRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isDictEntry_ = call (getSymbol "g_variant_type_is_dict_entry") (GLibVariantTypeRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isMaybe_ = call (getSymbol "g_variant_type_is_maybe") (GLibVariantTypeRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isSubtypeOf_ = call (getSymbol "g_variant_type_is_subtype_of") (GLibVariantTypeRecord.PolyML.cPtr &&> GLibVariantTypeRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isTuple_ = call (getSymbol "g_variant_type_is_tuple") (GLibVariantTypeRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isVariant_ = call (getSymbol "g_variant_type_is_variant") (GLibVariantTypeRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val key_ = call (getSymbol "g_variant_type_key") (GLibVariantTypeRecord.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val nItems_ = call (getSymbol "g_variant_type_n_items") (GLibVariantTypeRecord.PolyML.cPtr --> GSize.PolyML.cVal)
      val next_ = call (getSymbol "g_variant_type_next") (GLibVariantTypeRecord.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val value_ = call (getSymbol "g_variant_type_value") (GLibVariantTypeRecord.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val checked_ = call (getSymbol "g_variant_type_checked_") (Utf8.PolyML.cInPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val stringIsValid_ = call (getSymbol "g_variant_type_string_is_valid") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val stringScan_ =
        call (getSymbol "g_variant_type_string_scan")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
    end
    type t = GLibVariantTypeRecord.t
    type variant_type_record_c_ptr_array_n_t = GLibVariantTypeRecordCPtrArrayN.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new typeString = (Utf8.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr true) new_ typeString
    fun newArray element = (GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr true) newArray_ element
    fun newDictEntry (key, value) = (GLibVariantTypeRecord.FFI.withPtr &&&> GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr true) newDictEntry_ (key & value)
    fun newMaybe element = (GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr true) newMaybe_ element
    fun newTuple items =
      let
        val length = LargeInt.fromInt (GLibVariantTypeRecordCPtrArrayN.length items)
        val retVal = (GLibVariantTypeRecordCPtrArrayN.FFI.withPtr &&&> GInt.FFI.withVal ---> GLibVariantTypeRecord.FFI.fromPtr true) newTuple_ (items & length)
      in
        retVal
      end
    fun copy self = (GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr true) copy_ self
    fun dupString self = (GLibVariantTypeRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) dupString_ self
    fun element self = (GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr false) element_ self
    fun equal self type2 = (GLibVariantTypeRecord.FFI.withPtr &&&> GLibVariantTypeRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & type2)
    fun first self = (GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr false) first_ self
    fun getStringLength self = (GLibVariantTypeRecord.FFI.withPtr ---> GSize.FFI.fromVal) getStringLength_ self
    fun hash self = (GLibVariantTypeRecord.FFI.withPtr ---> GUInt.FFI.fromVal) hash_ self
    fun isArray self = (GLibVariantTypeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isArray_ self
    fun isBasic self = (GLibVariantTypeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isBasic_ self
    fun isContainer self = (GLibVariantTypeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isContainer_ self
    fun isDefinite self = (GLibVariantTypeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isDefinite_ self
    fun isDictEntry self = (GLibVariantTypeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isDictEntry_ self
    fun isMaybe self = (GLibVariantTypeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isMaybe_ self
    fun isSubtypeOf self supertype = (GLibVariantTypeRecord.FFI.withPtr &&&> GLibVariantTypeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isSubtypeOf_ (self & supertype)
    fun isTuple self = (GLibVariantTypeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isTuple_ self
    fun isVariant self = (GLibVariantTypeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isVariant_ self
    fun key self = (GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr false) key_ self
    fun nItems self = (GLibVariantTypeRecord.FFI.withPtr ---> GSize.FFI.fromVal) nItems_ self
    fun next self = (GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr false) next_ self
    fun value self = (GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr false) value_ self
    fun checked arg0 = (Utf8.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr false) checked_ arg0
    fun stringIsValid typeString = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) stringIsValid_ typeString
    fun stringScan (string, limit) =
      let
        val endptr & retVal =
          (
            Utf8.FFI.withPtr
             &&&> Utf8.FFI.withOptPtr
             &&&> Utf8.FFI.withRefOptPtr
             ---> Utf8.FFI.fromPtr 1 && GBool.FFI.fromVal
          )
            stringScan_
            (
              string
               & limit
               & NONE
            )
      in
        if retVal then SOME endptr else NONE
      end
  end
