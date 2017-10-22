structure GLibVariantBuilder :>
  G_LIB_VARIANT_BUILDER
    where type t = GLibVariantBuilderRecord.t
    where type variant_t = GLibVariantRecord.t
    where type variant_type_t = GLibVariantTypeRecord.t =
  struct
    val getType_ = _import "g_variant_builder_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_variant_builder_new" : GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GLibVariantBuilderRecord.FFI.notnull GLibVariantBuilderRecord.FFI.p;
    val addValue_ = fn x1 & x2 => (_import "g_variant_builder_add_value" : GLibVariantBuilderRecord.FFI.notnull GLibVariantBuilderRecord.FFI.p * GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> unit;) (x1, x2)
    val close_ = _import "g_variant_builder_close" : GLibVariantBuilderRecord.FFI.notnull GLibVariantBuilderRecord.FFI.p -> unit;
    val end_ = _import "g_variant_builder_end" : GLibVariantBuilderRecord.FFI.notnull GLibVariantBuilderRecord.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val open_ = fn x1 & x2 => (_import "g_variant_builder_open" : GLibVariantBuilderRecord.FFI.notnull GLibVariantBuilderRecord.FFI.p * GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> unit;) (x1, x2)
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
