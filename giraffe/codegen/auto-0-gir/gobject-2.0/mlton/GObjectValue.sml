structure GObjectValue :>
  G_OBJECT_VALUE
    where type t = GObjectValueRecord.t
    where type 'a object_class = 'a GObjectObjectClass.class
    where type 'a param_spec_class = 'a GObjectParamSpecClass.class
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "g_value_get_type" : unit -> GObjectType.FFI.val_;
    val copy_ = fn x1 & x2 => (_import "g_value_copy" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit;) (x1, x2)
    val dupObject_ = _import "g_value_dup_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p;
    val dupString_ = _import "g_value_dup_string" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val dupVariant_ = _import "g_value_dup_variant" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val fitsPointer_ = _import "g_value_fits_pointer" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GBool.FFI.val_;
    val getBoolean_ = _import "g_value_get_boolean" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GBool.FFI.val_;
    val getChar_ = _import "g_value_get_char" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GChar.FFI.val_;
    val getDouble_ = _import "g_value_get_double" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GDouble.FFI.val_;
    val getEnum_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GInt.FFI.val_;
    val getFlags_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GUInt.FFI.val_;
    val getFloat_ = _import "g_value_get_float" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GFloat.FFI.val_;
    val getGtype_ = _import "g_value_get_gtype" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GObjectType.FFI.val_;
    val getInt_ = _import "g_value_get_int" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GInt.FFI.val_;
    val getInt64_ = _import "g_value_get_int64" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GInt64.FFI.val_;
    val getLong_ = _import "g_value_get_long" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GLong.FFI.val_;
    val getObject_ = _import "g_value_get_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p;
    val getParam_ = _import "g_value_get_param" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
    val getSchar_ = _import "g_value_get_schar" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GInt8.FFI.val_;
    val getString_ = _import "g_value_get_string" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUchar_ = _import "g_value_get_uchar" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GUInt8.FFI.val_;
    val getUint_ = _import "g_value_get_uint" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GUInt.FFI.val_;
    val getUint64_ = _import "g_value_get_uint64" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GUInt64.FFI.val_;
    val getUlong_ = _import "g_value_get_ulong" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GULong.FFI.val_;
    val getVariant_ = _import "g_value_get_variant" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val init_ = fn x1 & x2 => (_import "g_value_init" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GObjectType.FFI.val_ -> GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p;) (x1, x2)
    val reset_ = _import "g_value_reset" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p;
    val setBoolean_ = fn x1 & x2 => (_import "g_value_set_boolean" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setChar_ = fn x1 & x2 => (_import "g_value_set_char" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GChar.FFI.val_ -> unit;) (x1, x2)
    val setDouble_ = fn x1 & x2 => (_import "g_value_set_double" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setEnum_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setFlags_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setFloat_ = fn x1 & x2 => (_import "g_value_set_float" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GFloat.FFI.val_ -> unit;) (x1, x2)
    val setGtype_ = fn x1 & x2 => (_import "g_value_set_gtype" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GObjectType.FFI.val_ -> unit;) (x1, x2)
    val setInt_ = fn x1 & x2 => (_import "g_value_set_int" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setInt64_ = fn x1 & x2 => (_import "g_value_set_int64" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GInt64.FFI.val_ -> unit;) (x1, x2)
    val setLong_ = fn x1 & x2 => (_import "g_value_set_long" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GLong.FFI.val_ -> unit;) (x1, x2)
    val setObject_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * unit GObjectObjectClass.FFI.p -> unit;) (x1, x2)
    val setParam_ = fn x1 & x2 => (_import "g_value_set_param" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * unit GObjectParamSpecClass.FFI.p -> unit;) (x1, x2)
    val setSchar_ = fn x1 & x2 => (_import "g_value_set_schar" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GInt8.FFI.val_ -> unit;) (x1, x2)
    val setStaticString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_value_set_static_string" :
              GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_value_set_string" :
              GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setStringTakeOwnership_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_value_set_string_take_ownership" :
              GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUchar_ = fn x1 & x2 => (_import "g_value_set_uchar" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GUInt8.FFI.val_ -> unit;) (x1, x2)
    val setUint_ = fn x1 & x2 => (_import "g_value_set_uint" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setUint64_ = fn x1 & x2 => (_import "g_value_set_uint64" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GUInt64.FFI.val_ -> unit;) (x1, x2)
    val setUlong_ = fn x1 & x2 => (_import "g_value_set_ulong" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GULong.FFI.val_ -> unit;) (x1, x2)
    val setVariant_ = fn x1 & x2 => (_import "g_value_set_variant" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * unit GLibVariantRecord.FFI.p -> unit;) (x1, x2)
    val takeString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_value_take_string" :
              GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val transform_ = fn x1 & x2 => (_import "g_value_transform" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val unset_ = _import "g_value_unset" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit;
    val typeCompatible_ = fn x1 & x2 => (_import "g_value_type_compatible" : GObjectType.FFI.val_ * GObjectType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val typeTransformable_ = fn x1 & x2 => (_import "g_value_type_transformable" : GObjectType.FFI.val_ * GObjectType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
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
    fun getChar self = (GObjectValueRecord.FFI.withPtr ---> GChar.FFI.fromVal) getChar_ self
    fun getDouble self = (GObjectValueRecord.FFI.withPtr ---> GDouble.FFI.fromVal) getDouble_ self
    fun getEnum self = (GObjectValueRecord.FFI.withPtr ---> GInt.FFI.fromVal) getEnum_ self
    fun getFlags self = (GObjectValueRecord.FFI.withPtr ---> GUInt.FFI.fromVal) getFlags_ self
    fun getFloat self = (GObjectValueRecord.FFI.withPtr ---> GFloat.FFI.fromVal) getFloat_ self
    fun getGtype self = (GObjectValueRecord.FFI.withPtr ---> GObjectType.FFI.fromVal) getGtype_ self
    fun getInt self = (GObjectValueRecord.FFI.withPtr ---> GInt.FFI.fromVal) getInt_ self
    fun getInt64 self = (GObjectValueRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getInt64_ self
    fun getLong self = (GObjectValueRecord.FFI.withPtr ---> GLong.FFI.fromVal) getLong_ self
    fun getObject self = (GObjectValueRecord.FFI.withPtr ---> GObjectObjectClass.FFI.fromPtr false) getObject_ self
    fun getParam self = (GObjectValueRecord.FFI.withPtr ---> GObjectParamSpecClass.FFI.fromPtr false) getParam_ self
    fun getSchar self = (GObjectValueRecord.FFI.withPtr ---> GInt8.FFI.fromVal) getSchar_ self
    fun getString self = (GObjectValueRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getString_ self
    fun getUchar self = (GObjectValueRecord.FFI.withPtr ---> GUInt8.FFI.fromVal) getUchar_ self
    fun getUint self = (GObjectValueRecord.FFI.withPtr ---> GUInt.FFI.fromVal) getUint_ self
    fun getUint64 self = (GObjectValueRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) getUint64_ self
    fun getUlong self = (GObjectValueRecord.FFI.withPtr ---> GULong.FFI.fromVal) getUlong_ self
    fun getVariant self = (GObjectValueRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getVariant_ self
    fun init self gType = (GObjectValueRecord.FFI.withPtr &&&> GObjectType.FFI.withVal ---> GObjectValueRecord.FFI.fromPtr false) init_ (self & gType)
    fun reset self = (GObjectValueRecord.FFI.withPtr ---> GObjectValueRecord.FFI.fromPtr true) reset_ self
    fun setBoolean self vBoolean = (GObjectValueRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setBoolean_ (self & vBoolean)
    fun setChar self vChar = (GObjectValueRecord.FFI.withPtr &&&> GChar.FFI.withVal ---> I) setChar_ (self & vChar)
    fun setDouble self vDouble = (GObjectValueRecord.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setDouble_ (self & vDouble)
    fun setEnum self vEnum = (GObjectValueRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setEnum_ (self & vEnum)
    fun setFlags self vFlags = (GObjectValueRecord.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) setFlags_ (self & vFlags)
    fun setFloat self vFloat = (GObjectValueRecord.FFI.withPtr &&&> GFloat.FFI.withVal ---> I) setFloat_ (self & vFloat)
    fun setGtype self vGtype = (GObjectValueRecord.FFI.withPtr &&&> GObjectType.FFI.withVal ---> I) setGtype_ (self & vGtype)
    fun setInt self vInt = (GObjectValueRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setInt_ (self & vInt)
    fun setInt64 self vInt64 = (GObjectValueRecord.FFI.withPtr &&&> GInt64.FFI.withVal ---> I) setInt64_ (self & vInt64)
    fun setLong self vLong = (GObjectValueRecord.FFI.withPtr &&&> GLong.FFI.withVal ---> I) setLong_ (self & vLong)
    fun setObject self vObject = (GObjectValueRecord.FFI.withPtr &&&> GObjectObjectClass.FFI.withOptPtr ---> I) setObject_ (self & vObject)
    fun setParam self param = (GObjectValueRecord.FFI.withPtr &&&> GObjectParamSpecClass.FFI.withOptPtr ---> I) setParam_ (self & param)
    fun setSchar self vChar = (GObjectValueRecord.FFI.withPtr &&&> GInt8.FFI.withVal ---> I) setSchar_ (self & vChar)
    fun setStaticString self vString = (GObjectValueRecord.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setStaticString_ (self & vString)
    fun setString self vString = (GObjectValueRecord.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setString_ (self & vString)
    fun setStringTakeOwnership self vString = (GObjectValueRecord.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setStringTakeOwnership_ (self & vString)
    fun setUchar self vUchar = (GObjectValueRecord.FFI.withPtr &&&> GUInt8.FFI.withVal ---> I) setUchar_ (self & vUchar)
    fun setUint self vUint = (GObjectValueRecord.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) setUint_ (self & vUint)
    fun setUint64 self vUint64 = (GObjectValueRecord.FFI.withPtr &&&> GUInt64.FFI.withVal ---> I) setUint64_ (self & vUint64)
    fun setUlong self vUlong = (GObjectValueRecord.FFI.withPtr &&&> GULong.FFI.withVal ---> I) setUlong_ (self & vUlong)
    fun setVariant self variant = (GObjectValueRecord.FFI.withPtr &&&> GLibVariantRecord.FFI.withOptPtr ---> I) setVariant_ (self & variant)
    fun takeString self vString = (GObjectValueRecord.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) takeString_ (self & vString)
    fun transform self destValue = (GObjectValueRecord.FFI.withPtr &&&> GObjectValueRecord.FFI.withPtr ---> GBool.FFI.fromVal) transform_ (self & destValue)
    fun unset self = (GObjectValueRecord.FFI.withPtr ---> I) unset_ self
    fun typeCompatible (srcType, destType) = (GObjectType.FFI.withVal &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal) typeCompatible_ (srcType & destType)
    fun typeTransformable (srcType, destType) = (GObjectType.FFI.withVal &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal) typeTransformable_ (srcType & destType)
  end
