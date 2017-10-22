structure GLibVariantBuilder :>
  G_LIB_VARIANT_BUILDER
    where type t = GLibVariantBuilderRecord.t
    where type variant_t = GLibVariantRecord.t
    where type variant_type_t = GLibVariantTypeRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_variant_builder_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_variant_builder_new") (GLibVariantTypeRecord.PolyML.cPtr --> GLibVariantBuilderRecord.PolyML.cPtr)
      val addValue_ = call (getSymbol "g_variant_builder_add_value") (GLibVariantBuilderRecord.PolyML.cPtr &&> GLibVariantRecord.PolyML.cPtr --> cVoid)
      val close_ = call (getSymbol "g_variant_builder_close") (GLibVariantBuilderRecord.PolyML.cPtr --> cVoid)
      val end_ = call (getSymbol "g_variant_builder_end") (GLibVariantBuilderRecord.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val open_ = call (getSymbol "g_variant_builder_open") (GLibVariantBuilderRecord.PolyML.cPtr &&> GLibVariantTypeRecord.PolyML.cPtr --> cVoid)
    end
    type t = GLibVariantBuilderRecord.t
    type variant_t = GLibVariantRecord.t
    type variant_type_t = GLibVariantTypeRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new type' = (GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantBuilderRecord.FFI.fromPtr true) new_ type'
    fun addValue self value = (GLibVariantBuilderRecord.FFI.withPtr &&&> GLibVariantRecord.FFI.withPtr ---> I) addValue_ (self & value)
    fun close self = (GLibVariantBuilderRecord.FFI.withPtr ---> I) close_ self
    fun end' self = (GLibVariantBuilderRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) end_ self
    fun open' self type' = (GLibVariantBuilderRecord.FFI.withPtr &&&> GLibVariantTypeRecord.FFI.withPtr ---> I) open_ (self & type')
  end
