structure GObjectValue :>
  G_OBJECT_VALUE
    where type t = GObjectValueRecord.t
    where type 'a object_class = 'a GObjectObjectClass.class
    where type 'a param_spec_class = 'a GObjectParamSpecClass.class
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_value_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (getSymbol "g_value_copy") (GObjectValueRecord.PolyML.cPtr &&> GObjectValueRecord.PolyML.cPtr --> cVoid)
      val dupObject_ = call (getSymbol "g_value_dup_object") (GObjectValueRecord.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val dupString_ = call (getSymbol "g_value_dup_string") (GObjectValueRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val dupVariant_ = call (getSymbol "g_value_dup_variant") (GObjectValueRecord.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val fitsPointer_ = call (getSymbol "g_value_fits_pointer") (GObjectValueRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getBoolean_ = call (getSymbol "g_value_get_boolean") (GObjectValueRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getChar_ = call (getSymbol "g_value_get_char") (GObjectValueRecord.PolyML.cPtr --> GInt8.PolyML.cVal)
      val getDouble_ = call (getSymbol "g_value_get_double") (GObjectValueRecord.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getEnum_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getFlags_ = call (getSymbol "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getFloat_ = call (getSymbol "g_value_get_float") (GObjectValueRecord.PolyML.cPtr --> GFloat.PolyML.cVal)
      val getGtype_ = call (getSymbol "g_value_get_gtype") (GObjectValueRecord.PolyML.cPtr --> GObjectType.PolyML.cVal)
      val getInt_ = call (getSymbol "g_value_get_int") (GObjectValueRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getInt64_ = call (getSymbol "g_value_get_int64") (GObjectValueRecord.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getLong_ = call (getSymbol "g_value_get_long") (GObjectValueRecord.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getObject_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getParam_ = call (getSymbol "g_value_get_param") (GObjectValueRecord.PolyML.cPtr --> GObjectParamSpecClass.PolyML.cPtr)
      val getSchar_ = call (getSymbol "g_value_get_schar") (GObjectValueRecord.PolyML.cPtr --> GInt8.PolyML.cVal)
      val getString_ = call (getSymbol "g_value_get_string") (GObjectValueRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUchar_ = call (getSymbol "g_value_get_uchar") (GObjectValueRecord.PolyML.cPtr --> GUInt8.PolyML.cVal)
      val getUint_ = call (getSymbol "g_value_get_uint") (GObjectValueRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getUint64_ = call (getSymbol "g_value_get_uint64") (GObjectValueRecord.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val getUlong_ = call (getSymbol "g_value_get_ulong") (GObjectValueRecord.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val getVariant_ = call (getSymbol "g_value_get_variant") (GObjectValueRecord.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val init_ = call (getSymbol "g_value_init") (GObjectValueRecord.PolyML.cPtr &&> GObjectType.PolyML.cVal --> GObjectValueRecord.PolyML.cPtr)
      val reset_ = call (getSymbol "g_value_reset") (GObjectValueRecord.PolyML.cPtr --> GObjectValueRecord.PolyML.cPtr)
      val setBoolean_ = call (getSymbol "g_value_set_boolean") (GObjectValueRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setChar_ = call (getSymbol "g_value_set_char") (GObjectValueRecord.PolyML.cPtr &&> GInt8.PolyML.cVal --> cVoid)
      val setDouble_ = call (getSymbol "g_value_set_double") (GObjectValueRecord.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setEnum_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setFlags_ = call (getSymbol "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setFloat_ = call (getSymbol "g_value_set_float") (GObjectValueRecord.PolyML.cPtr &&> GFloat.PolyML.cVal --> cVoid)
      val setGtype_ = call (getSymbol "g_value_set_gtype") (GObjectValueRecord.PolyML.cPtr &&> GObjectType.PolyML.cVal --> cVoid)
      val setInt_ = call (getSymbol "g_value_set_int") (GObjectValueRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setInt64_ = call (getSymbol "g_value_set_int64") (GObjectValueRecord.PolyML.cPtr &&> GInt64.PolyML.cVal --> cVoid)
      val setLong_ = call (getSymbol "g_value_set_long") (GObjectValueRecord.PolyML.cPtr &&> GInt64.PolyML.cVal --> cVoid)
      val setObject_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> cVoid)
      val setParam_ = call (getSymbol "g_value_set_param") (GObjectValueRecord.PolyML.cPtr &&> GObjectParamSpecClass.PolyML.cOptPtr --> cVoid)
      val setSchar_ = call (getSymbol "g_value_set_schar") (GObjectValueRecord.PolyML.cPtr &&> GInt8.PolyML.cVal --> cVoid)
      val setStaticString_ = call (getSymbol "g_value_set_static_string") (GObjectValueRecord.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setString_ = call (getSymbol "g_value_set_string") (GObjectValueRecord.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setStringTakeOwnership_ = call (getSymbol "g_value_set_string_take_ownership") (GObjectValueRecord.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setUchar_ = call (getSymbol "g_value_set_uchar") (GObjectValueRecord.PolyML.cPtr &&> GUInt8.PolyML.cVal --> cVoid)
      val setUint_ = call (getSymbol "g_value_set_uint") (GObjectValueRecord.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setUint64_ = call (getSymbol "g_value_set_uint64") (GObjectValueRecord.PolyML.cPtr &&> GUInt64.PolyML.cVal --> cVoid)
      val setUlong_ = call (getSymbol "g_value_set_ulong") (GObjectValueRecord.PolyML.cPtr &&> GUInt64.PolyML.cVal --> cVoid)
      val setVariant_ = call (getSymbol "g_value_set_variant") (GObjectValueRecord.PolyML.cPtr &&> GLibVariantRecord.PolyML.cOptPtr --> cVoid)
      val takeString_ = call (getSymbol "g_value_take_string") (GObjectValueRecord.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val takeVariant_ = call (getSymbol "g_value_take_variant") (GObjectValueRecord.PolyML.cPtr &&> GLibVariantRecord.PolyML.cOptPtr --> cVoid)
      val transform_ = call (getSymbol "g_value_transform") (GObjectValueRecord.PolyML.cPtr &&> GObjectValueRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val unset_ = call (getSymbol "g_value_unset") (GObjectValueRecord.PolyML.cPtr --> cVoid)
      val typeCompatible_ = call (getSymbol "g_value_type_compatible") (GObjectType.PolyML.cVal &&> GObjectType.PolyML.cVal --> GBool.PolyML.cVal)
      val typeTransformable_ = call (getSymbol "g_value_type_transformable") (GObjectType.PolyML.cVal &&> GObjectType.PolyML.cVal --> GBool.PolyML.cVal)
    end
    type t = GObjectValueRecord.t
    type 'a object_class = 'a GObjectObjectClass.class
    type 'a param_spec_class = 'a GObjectParamSpecClass.class
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self destValue = (GObjectValueRecord.FFI.withPtr &&&> GObjectValueRecord.FFI.withPtr ---> I) copy_ (self & destValue)
    fun dupObject self = (GObjectValueRecord.FFI.withPtr ---> GObjectObjectClass.FFI.fromPtr true) dupObject_ self
    fun dupString self = (GObjectValueRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) dupString_ self
    fun dupVariant self = (GObjectValueRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) dupVariant_ self
    fun fitsPointer self = (GObjectValueRecord.FFI.withPtr ---> GBool.FFI.fromVal) fitsPointer_ self
    fun getBoolean self = (GObjectValueRecord.FFI.withPtr ---> GBool.FFI.fromVal) getBoolean_ self
    fun getChar self = (GObjectValueRecord.FFI.withPtr ---> GInt8.FFI.fromVal) getChar_ self
    fun getDouble self = (GObjectValueRecord.FFI.withPtr ---> GDouble.FFI.fromVal) getDouble_ self
    fun getEnum self = (GObjectValueRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getEnum_ self
    fun getFlags self = (GObjectValueRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) getFlags_ self
    fun getFloat self = (GObjectValueRecord.FFI.withPtr ---> GFloat.FFI.fromVal) getFloat_ self
    fun getGtype self = (GObjectValueRecord.FFI.withPtr ---> GObjectType.FFI.fromVal) getGtype_ self
    fun getInt self = (GObjectValueRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getInt_ self
    fun getInt64 self = (GObjectValueRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getInt64_ self
    fun getLong self = (GObjectValueRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getLong_ self
    fun getObject self = (GObjectValueRecord.FFI.withPtr ---> GObjectObjectClass.FFI.fromPtr false) getObject_ self
    fun getParam self = (GObjectValueRecord.FFI.withPtr ---> GObjectParamSpecClass.FFI.fromPtr false) getParam_ self
    fun getSchar self = (GObjectValueRecord.FFI.withPtr ---> GInt8.FFI.fromVal) getSchar_ self
    fun getString self = (GObjectValueRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getString_ self
    fun getUchar self = (GObjectValueRecord.FFI.withPtr ---> GUInt8.FFI.fromVal) getUchar_ self
    fun getUint self = (GObjectValueRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) getUint_ self
    fun getUint64 self = (GObjectValueRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) getUint64_ self
    fun getUlong self = (GObjectValueRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) getUlong_ self
    fun getVariant self = (GObjectValueRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getVariant_ self
    fun init self gType = (GObjectValueRecord.FFI.withPtr &&&> GObjectType.FFI.withVal ---> GObjectValueRecord.FFI.fromPtr false) init_ (self & gType)
    fun reset self = (GObjectValueRecord.FFI.withPtr ---> GObjectValueRecord.FFI.fromPtr true) reset_ self
    fun setBoolean self vBoolean = (GObjectValueRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setBoolean_ (self & vBoolean)
    fun setChar self vChar = (GObjectValueRecord.FFI.withPtr &&&> GInt8.FFI.withVal ---> I) setChar_ (self & vChar)
    fun setDouble self vDouble = (GObjectValueRecord.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setDouble_ (self & vDouble)
    fun setEnum self vEnum = (GObjectValueRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setEnum_ (self & vEnum)
    fun setFlags self vFlags = (GObjectValueRecord.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setFlags_ (self & vFlags)
    fun setFloat self vFloat = (GObjectValueRecord.FFI.withPtr &&&> GFloat.FFI.withVal ---> I) setFloat_ (self & vFloat)
    fun setGtype self vGtype = (GObjectValueRecord.FFI.withPtr &&&> GObjectType.FFI.withVal ---> I) setGtype_ (self & vGtype)
    fun setInt self vInt = (GObjectValueRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setInt_ (self & vInt)
    fun setInt64 self vInt64 = (GObjectValueRecord.FFI.withPtr &&&> GInt64.FFI.withVal ---> I) setInt64_ (self & vInt64)
    fun setLong self vLong = (GObjectValueRecord.FFI.withPtr &&&> GInt64.FFI.withVal ---> I) setLong_ (self & vLong)
    fun setObject self vObject = (GObjectValueRecord.FFI.withPtr &&&> GObjectObjectClass.FFI.withOptPtr ---> I) setObject_ (self & vObject)
    fun setParam self param = (GObjectValueRecord.FFI.withPtr &&&> GObjectParamSpecClass.FFI.withOptPtr ---> I) setParam_ (self & param)
    fun setSchar self vChar = (GObjectValueRecord.FFI.withPtr &&&> GInt8.FFI.withVal ---> I) setSchar_ (self & vChar)
    fun setStaticString self vString = (GObjectValueRecord.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setStaticString_ (self & vString)
    fun setString self vString = (GObjectValueRecord.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setString_ (self & vString)
    fun setStringTakeOwnership self vString = (GObjectValueRecord.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setStringTakeOwnership_ (self & vString)
    fun setUchar self vUchar = (GObjectValueRecord.FFI.withPtr &&&> GUInt8.FFI.withVal ---> I) setUchar_ (self & vUchar)
    fun setUint self vUint = (GObjectValueRecord.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setUint_ (self & vUint)
    fun setUint64 self vUint64 = (GObjectValueRecord.FFI.withPtr &&&> GUInt64.FFI.withVal ---> I) setUint64_ (self & vUint64)
    fun setUlong self vUlong = (GObjectValueRecord.FFI.withPtr &&&> GUInt64.FFI.withVal ---> I) setUlong_ (self & vUlong)
    fun setVariant self variant = (GObjectValueRecord.FFI.withPtr &&&> GLibVariantRecord.FFI.withOptPtr ---> I) setVariant_ (self & variant)
    fun takeString self vString = (GObjectValueRecord.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) takeString_ (self & vString)
    fun takeVariant self variant = (GObjectValueRecord.FFI.withPtr &&&> GLibVariantRecord.FFI.withDupOptPtr ---> I) takeVariant_ (self & variant)
    fun transform self destValue = (GObjectValueRecord.FFI.withPtr &&&> GObjectValueRecord.FFI.withPtr ---> GBool.FFI.fromVal) transform_ (self & destValue)
    fun unset self = (GObjectValueRecord.FFI.withPtr ---> I) unset_ self
    fun typeCompatible (srcType, destType) = (GObjectType.FFI.withVal &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal) typeCompatible_ (srcType & destType)
    fun typeTransformable (srcType, destType) = (GObjectType.FFI.withVal &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal) typeTransformable_ (srcType & destType)
  end
