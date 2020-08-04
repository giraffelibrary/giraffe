structure GLibVariantDict :>
  G_LIB_VARIANT_DICT
    where type t = GLibVariantDictRecord.t
    where type variant_t = GLibVariantRecord.t
    where type variant_type_t = GLibVariantTypeRecord.t =
  struct
    val getType_ = _import "g_variant_dict_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_variant_dict_new" : GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p -> GLibVariantDictRecord.FFI.non_opt GLibVariantDictRecord.FFI.p;
    val clear_ = _import "g_variant_dict_clear" : GLibVariantDictRecord.FFI.non_opt GLibVariantDictRecord.FFI.p -> unit;
    val contains_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_variant_dict_contains" :
              GLibVariantDictRecord.FFI.non_opt GLibVariantDictRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val end_ = _import "g_variant_dict_end" : GLibVariantDictRecord.FFI.non_opt GLibVariantDictRecord.FFI.p -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val insertValue_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_variant_dict_insert_value" :
              GLibVariantDictRecord.FFI.non_opt GLibVariantDictRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p
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
              GLibVariantDictRecord.FFI.non_opt GLibVariantDictRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantTypeRecord.FFI.opt GLibVariantTypeRecord.FFI.p
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
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
              GLibVariantDictRecord.FFI.non_opt GLibVariantDictRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
    fun new fromAsv = (GLibVariantRecord.FFI.withOptPtr false ---> GLibVariantDictRecord.FFI.fromPtr true) new_ fromAsv
    fun clear self = (GLibVariantDictRecord.FFI.withPtr false ---> I) clear_ self
    fun contains self key = (GLibVariantDictRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) contains_ (self & key)
    fun end' self = (GLibVariantDictRecord.FFI.withPtr false ---> GLibVariantRecord.FFI.fromPtr false) end_ self
    fun insertValue self (key, value) =
      (
        GLibVariantDictRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantRecord.FFI.withPtr false
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
        GLibVariantDictRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantTypeRecord.FFI.withOptPtr false
         ---> GLibVariantRecord.FFI.fromPtr true
      )
        lookupValue_
        (
          self
           & key
           & expectedType
        )
    fun remove self key = (GLibVariantDictRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) remove_ (self & key)
  end
