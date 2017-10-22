structure GLibVariantDict :>
  G_LIB_VARIANT_DICT
    where type t = GLibVariantDictRecord.t
    where type variant_t = GLibVariantRecord.t
    where type variant_type_t = GLibVariantTypeRecord.t =
  struct
    val getType_ = _import "g_variant_dict_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_variant_dict_new" : unit GLibVariantRecord.FFI.p -> GLibVariantDictRecord.FFI.notnull GLibVariantDictRecord.FFI.p;
    val clear_ = _import "g_variant_dict_clear" : GLibVariantDictRecord.FFI.notnull GLibVariantDictRecord.FFI.p -> unit;
    val contains_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_variant_dict_contains" :
              GLibVariantDictRecord.FFI.notnull GLibVariantDictRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val end_ = _import "g_variant_dict_end" : GLibVariantDictRecord.FFI.notnull GLibVariantDictRecord.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val insertValue_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_variant_dict_insert_value" :
              GLibVariantDictRecord.FFI.notnull GLibVariantDictRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val lookupValue_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_variant_dict_lookup_value" :
              GLibVariantDictRecord.FFI.notnull GLibVariantDictRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GLibVariantTypeRecord.FFI.p
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val remove_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_variant_dict_remove" :
              GLibVariantDictRecord.FFI.notnull GLibVariantDictRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GLibVariantDictRecord.t
    type variant_t = GLibVariantRecord.t
    type variant_type_t = GLibVariantTypeRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new fromAsv = (GLibVariantRecord.FFI.withOptPtr ---> GLibVariantDictRecord.FFI.fromPtr true) new_ fromAsv
    fun clear self = (GLibVariantDictRecord.FFI.withPtr ---> I) clear_ self
    fun contains self key = (GLibVariantDictRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) contains_ (self & key)
    fun end' self = (GLibVariantDictRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) end_ self
    fun insertValue self (key, value) =
      (
        GLibVariantDictRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withPtr
         ---> I
      )
        insertValue_
        (
          self
           & key
           & value
        )
    fun lookupValue self (key, expectedType) =
      (
        GLibVariantDictRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantTypeRecord.FFI.withOptPtr
         ---> GLibVariantRecord.FFI.fromPtr true
      )
        lookupValue_
        (
          self
           & key
           & expectedType
        )
    fun remove self key = (GLibVariantDictRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) remove_ (self & key)
  end
