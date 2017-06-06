structure GLibVariantType :>
  G_LIB_VARIANT_TYPE
    where type t = GLibVariantTypeRecord.t =
  struct
    structure GLibVariantTypeRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GLibVariantTypeRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GLibVariantTypeRecordCVectorN = CVectorN(GLibVariantTypeRecordCVectorNType)
    val getType_ = _import "g_variant_type_get_gtype" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_g_variant_type_new" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p;
    val newTuple_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_variant_type_new_tuple" :
              GLibVariantTypeRecordCVectorN.MLton.p1
               * GLibVariantTypeRecordCVectorN.FFI.notnull GLibVariantTypeRecordCVectorN.MLton.p2
               * GInt.FFI.val_
               -> GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val copy_ = _import "g_variant_type_copy" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p;
    val dupString_ = _import "g_variant_type_dup_string" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val element_ = _import "g_variant_type_element" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p;
    val equal_ = fn x1 & x2 => (_import "g_variant_type_equal" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p * GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val first_ = _import "g_variant_type_first" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p;
    val getStringLength_ = _import "g_variant_type_get_string_length" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GSize.FFI.val_;
    val hash_ = _import "g_variant_type_hash" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GUInt.FFI.val_;
    val isArray_ = _import "g_variant_type_is_array" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;
    val isBasic_ = _import "g_variant_type_is_basic" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;
    val isContainer_ = _import "g_variant_type_is_container" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;
    val isDefinite_ = _import "g_variant_type_is_definite" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;
    val isDictEntry_ = _import "g_variant_type_is_dict_entry" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;
    val isMaybe_ = _import "g_variant_type_is_maybe" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;
    val isSubtypeOf_ = fn x1 & x2 => (_import "g_variant_type_is_subtype_of" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p * GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val isTuple_ = _import "g_variant_type_is_tuple" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;
    val isVariant_ = _import "g_variant_type_is_variant" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GBool.FFI.val_;
    val key_ = _import "g_variant_type_key" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p;
    val nItems_ = _import "g_variant_type_n_items" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GSize.FFI.val_;
    val newArray_ = _import "g_variant_type_new_array" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p;
    val newDictEntry_ = fn x1 & x2 => (_import "g_variant_type_new_dict_entry" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p * GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p;) (x1, x2)
    val newMaybe_ = _import "g_variant_type_new_maybe" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p;
    val next_ = _import "g_variant_type_next" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p;
    val value_ = _import "g_variant_type_value" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p;
    val stringIsValid_ = _import "mlton_g_variant_type_string_is_valid" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val stringScan_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_variant_type_string_scan" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new typeString = (Utf8.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr true) new_ typeString
    fun newTuple items =
      let
        val length = LargeInt.fromInt (GLibVariantTypeRecordCVectorN.length items)
        val retVal = (GLibVariantTypeRecordCVectorN.FFI.withPtr &&&> GInt.FFI.withVal ---> GLibVariantTypeRecord.FFI.fromPtr true) newTuple_ (items & length)
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
    fun newArray self = (GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr true) newArray_ self
    fun newDictEntry self value = (GLibVariantTypeRecord.FFI.withPtr &&&> GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr true) newDictEntry_ (self & value)
    fun newMaybe self = (GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr true) newMaybe_ self
    fun next self = (GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr false) next_ self
    fun value self = (GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr false) value_ self
    fun stringIsValid typeString = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) stringIsValid_ typeString
    fun stringScan string limit =
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
