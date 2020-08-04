structure GLibVariantType :>
  G_LIB_VARIANT_TYPE
    where type t = GLibVariantTypeRecord.t
    where type variant_type_record_c_ptr_array_n_t = GLibVariantTypeRecordCPtrArrayN.t =
  struct
    val getType_ = _import "g_variant_type_get_gtype" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_g_variant_type_new" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p;
    val newArray_ = _import "g_variant_type_new_array" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p;
    val newDictEntry_ = fn x1 & x2 => (_import "g_variant_type_new_dict_entry" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p * GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p;) (x1, x2)
    val newMaybe_ = _import "g_variant_type_new_maybe" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p;
    val newTuple_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_variant_type_new_tuple" :
              GLibVariantTypeRecordCPtrArrayN.MLton.p1
               * GLibVariantTypeRecordCPtrArrayN.FFI.non_opt GLibVariantTypeRecordCPtrArrayN.MLton.p2
               * GInt.FFI.val_
               -> GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val copy_ = _import "g_variant_type_copy" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p;
    val dupString_ = _import "g_variant_type_dup_string" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val element_ = _import "g_variant_type_element" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p;
    val equal_ = fn x1 & x2 => (_import "g_variant_type_equal" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p * GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val first_ = _import "g_variant_type_first" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p;
    val getStringLength_ = _import "g_variant_type_get_string_length" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GSize.FFI.val_;
    val hash_ = _import "g_variant_type_hash" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GUInt.FFI.val_;
    val isArray_ = _import "g_variant_type_is_array" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;
    val isBasic_ = _import "g_variant_type_is_basic" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;
    val isContainer_ = _import "g_variant_type_is_container" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;
    val isDefinite_ = _import "g_variant_type_is_definite" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;
    val isDictEntry_ = _import "g_variant_type_is_dict_entry" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;
    val isMaybe_ = _import "g_variant_type_is_maybe" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;
    val isSubtypeOf_ = fn x1 & x2 => (_import "g_variant_type_is_subtype_of" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p * GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val isTuple_ = _import "g_variant_type_is_tuple" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;
    val isVariant_ = _import "g_variant_type_is_variant" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;
    val key_ = _import "g_variant_type_key" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p;
    val nItems_ = _import "g_variant_type_n_items" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GSize.FFI.val_;
    val next_ = _import "g_variant_type_next" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p;
    val value_ = _import "g_variant_type_value" : GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p;
    val checked_ = _import "mlton_g_variant_type_checked_" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GLibVariantTypeRecord.FFI.non_opt GLibVariantTypeRecord.FFI.p;
    val stringIsValid_ = _import "mlton_g_variant_type_string_is_valid" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GBool.FFI.val_;
    val stringScan_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_variant_type_string_scan" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    type t = GLibVariantTypeRecord.t
    type variant_type_record_c_ptr_array_n_t = GLibVariantTypeRecordCPtrArrayN.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new typeString = (Utf8.FFI.withPtr 0 ---> GLibVariantTypeRecord.FFI.fromPtr true) new_ typeString
    fun newArray element = (GLibVariantTypeRecord.FFI.withPtr false ---> GLibVariantTypeRecord.FFI.fromPtr true) newArray_ element
    fun newDictEntry (key, value) = (GLibVariantTypeRecord.FFI.withPtr false &&&> GLibVariantTypeRecord.FFI.withPtr false ---> GLibVariantTypeRecord.FFI.fromPtr true) newDictEntry_ (key & value)
    fun newMaybe element = (GLibVariantTypeRecord.FFI.withPtr false ---> GLibVariantTypeRecord.FFI.fromPtr true) newMaybe_ element
    fun newTuple items =
      let
        val length = LargeInt.fromInt (GLibVariantTypeRecordCPtrArrayN.length items)
        val retVal = (GLibVariantTypeRecordCPtrArrayN.FFI.withPtr 0 &&&> GInt.FFI.withVal ---> GLibVariantTypeRecord.FFI.fromPtr true) newTuple_ (items & length)
      in
        retVal
      end
    fun copy self = (GLibVariantTypeRecord.FFI.withPtr false ---> GLibVariantTypeRecord.FFI.fromPtr true) copy_ self
    fun dupString self = (GLibVariantTypeRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) dupString_ self
    fun element self = (GLibVariantTypeRecord.FFI.withPtr false ---> GLibVariantTypeRecord.FFI.fromPtr false) element_ self
    fun equal self type2 = (GLibVariantTypeRecord.FFI.withPtr false &&&> GLibVariantTypeRecord.FFI.withPtr false ---> GBool.FFI.fromVal) equal_ (self & type2)
    fun first self = (GLibVariantTypeRecord.FFI.withPtr false ---> GLibVariantTypeRecord.FFI.fromPtr false) first_ self
    fun getStringLength self = (GLibVariantTypeRecord.FFI.withPtr false ---> GSize.FFI.fromVal) getStringLength_ self
    fun hash self = (GLibVariantTypeRecord.FFI.withPtr false ---> GUInt.FFI.fromVal) hash_ self
    fun isArray self = (GLibVariantTypeRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isArray_ self
    fun isBasic self = (GLibVariantTypeRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isBasic_ self
    fun isContainer self = (GLibVariantTypeRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isContainer_ self
    fun isDefinite self = (GLibVariantTypeRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isDefinite_ self
    fun isDictEntry self = (GLibVariantTypeRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isDictEntry_ self
    fun isMaybe self = (GLibVariantTypeRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isMaybe_ self
    fun isSubtypeOf self supertype = (GLibVariantTypeRecord.FFI.withPtr false &&&> GLibVariantTypeRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isSubtypeOf_ (self & supertype)
    fun isTuple self = (GLibVariantTypeRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isTuple_ self
    fun isVariant self = (GLibVariantTypeRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isVariant_ self
    fun key self = (GLibVariantTypeRecord.FFI.withPtr false ---> GLibVariantTypeRecord.FFI.fromPtr false) key_ self
    fun nItems self = (GLibVariantTypeRecord.FFI.withPtr false ---> GSize.FFI.fromVal) nItems_ self
    fun next self = (GLibVariantTypeRecord.FFI.withPtr false ---> GLibVariantTypeRecord.FFI.fromPtr false) next_ self
    fun value self = (GLibVariantTypeRecord.FFI.withPtr false ---> GLibVariantTypeRecord.FFI.fromPtr false) value_ self
    fun checked arg0 = (Utf8.FFI.withPtr 0 ---> GLibVariantTypeRecord.FFI.fromPtr false) checked_ arg0
    fun stringIsValid typeString = (Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) stringIsValid_ typeString
    fun stringScan (string, limit) =
      let
        val endptr & retVal =
          (
            Utf8.FFI.withPtr 0
             &&&> Utf8.FFI.withOptPtr 0
             &&&> Utf8.FFI.withRefOptPtr 0
             ---> Utf8.FFI.fromPtr ~1 && GBool.FFI.fromVal
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
