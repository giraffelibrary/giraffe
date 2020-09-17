structure GLibVariantDict :>
  G_LIB_VARIANT_DICT
    where type t = GLibVariantDictRecord.t
    where type variant_t = GLibVariantRecord.t
    where type variant_type_t = GLibVariantTypeRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_variant_dict_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_variant_dict_new") (GLibVariantRecord.PolyML.cOptPtr --> GLibVariantDictRecord.PolyML.cPtr)
      val clear_ = call (getSymbol "g_variant_dict_clear") (GLibVariantDictRecord.PolyML.cPtr --> cVoid)
      val contains_ = call (getSymbol "g_variant_dict_contains") (GLibVariantDictRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val end_ = call (getSymbol "g_variant_dict_end") (GLibVariantDictRecord.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val insertValue_ =
        call (getSymbol "g_variant_dict_insert_value")
          (
            GLibVariantDictRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cPtr
             --> cVoid
          )
      val lookupValue_ =
        call (getSymbol "g_variant_dict_lookup_value")
          (
            GLibVariantDictRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantTypeRecord.PolyML.cOptPtr
             --> GLibVariantRecord.PolyML.cPtr
          )
      val remove_ = call (getSymbol "g_variant_dict_remove") (GLibVariantDictRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
    end
    type t = GLibVariantDictRecord.t
    type variant_t = GLibVariantRecord.t
    type variant_type_t = GLibVariantTypeRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new fromAsv = (GLibVariantRecord.FFI.withOptPtr false ---> GLibVariantDictRecord.FFI.fromPtr true) new_ fromAsv
    fun clear self = (GLibVariantDictRecord.FFI.withPtr false ---> I) clear_ self
    fun contains self key = (GLibVariantDictRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) contains_ (self & key)
    fun end' self = (GLibVariantDictRecord.FFI.withPtr false ---> GLibVariantRecord.FFI.fromPtr false) end_ self before GLibVariantDictRecord.FFI.touchPtr self
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
