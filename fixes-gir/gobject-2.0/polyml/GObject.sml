structure GObject :
  G_OBJECT
    where type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
    where type 'a signal_t = 'a Signal.t
    where type ('object_class, 'get, 'set, 'init) property_t = ('object_class, 'get, 'set, 'init) Property.t
    where type 'object_class property_init_t = 'object_class Property.init_t =
  struct
    local
      open PolyMLFFI
    in
      val enumToString_ = call (externalFunctionSymbol "g_enum_to_string") (GObjectType.PolyML.cVal &&> GInt.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val flagsToString_ = call (externalFunctionSymbol "g_flags_to_string") (GObjectType.PolyML.cVal &&> GUInt.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val gtypeGetType_ = call (externalFunctionSymbol "g_gtype_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val paramSpecBoolean_ =
        call (externalFunctionSymbol "g_param_spec_boolean")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecBoxed_ =
        call (externalFunctionSymbol "g_param_spec_boxed")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectType.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecChar_ =
        call (externalFunctionSymbol "g_param_spec_char")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt8.PolyML.cVal
             &&> GInt8.PolyML.cVal
             &&> GInt8.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecDouble_ =
        call (externalFunctionSymbol "g_param_spec_double")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecEnum_ =
        call (externalFunctionSymbol "g_param_spec_enum")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectType.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecFlags_ =
        call (externalFunctionSymbol "g_param_spec_flags")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectType.PolyML.cVal
             &&> GUInt.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecFloat_ =
        call (externalFunctionSymbol "g_param_spec_float")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecGtype_ =
        call (externalFunctionSymbol "g_param_spec_gtype")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectType.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecInt_ =
        call (externalFunctionSymbol "g_param_spec_int")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecInt64_ =
        call (externalFunctionSymbol "g_param_spec_int64")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> GInt64.PolyML.cVal
             &&> GInt64.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecLong_ =
        call (externalFunctionSymbol "g_param_spec_long")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLong.PolyML.cVal
             &&> GLong.PolyML.cVal
             &&> GLong.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecObject_ =
        call (externalFunctionSymbol "g_param_spec_object")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectType.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecParam_ =
        call (externalFunctionSymbol "g_param_spec_param")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectType.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecPointer_ =
        call (externalFunctionSymbol "g_param_spec_pointer")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecString_ =
        call (externalFunctionSymbol "g_param_spec_string")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecUchar_ =
        call (externalFunctionSymbol "g_param_spec_uchar")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt8.PolyML.cVal
             &&> GUInt8.PolyML.cVal
             &&> GUInt8.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecUint_ =
        call (externalFunctionSymbol "g_param_spec_uint")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecUint64_ =
        call (externalFunctionSymbol "g_param_spec_uint64")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GUInt64.PolyML.cVal
             &&> GUInt64.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecUlong_ =
        call (externalFunctionSymbol "g_param_spec_ulong")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GULong.PolyML.cVal
             &&> GULong.PolyML.cVal
             &&> GULong.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecUnichar_ =
        call (externalFunctionSymbol "g_param_spec_unichar")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GChar.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecVariant_ =
        call (externalFunctionSymbol "g_param_spec_variant")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantTypeRecord.PolyML.cPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val pointerTypeRegisterStatic_ = call (externalFunctionSymbol "g_pointer_type_register_static") (Utf8.PolyML.cInPtr --> GObjectType.PolyML.cVal)
      val signalIsValidName_ = call (externalFunctionSymbol "g_signal_is_valid_name") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val signalListIds_ = call (externalFunctionSymbol "g_signal_list_ids") (GObjectType.PolyML.cVal &&> GUInt.PolyML.cRef --> GUIntCArrayN.PolyML.cOutPtr)
      val signalLookup_ = call (externalFunctionSymbol "g_signal_lookup") (Utf8.PolyML.cInPtr &&> GObjectType.PolyML.cVal --> GUInt.PolyML.cVal)
      val signalOverrideClassClosure_ =
        call (externalFunctionSymbol "g_signal_override_class_closure")
          (
            GUInt.PolyML.cVal
             &&> GObjectType.PolyML.cVal
             &&> GObjectClosureRecord.PolyML.cPtr
             --> cVoid
          )
      val signalParseName_ =
        call (externalFunctionSymbol "g_signal_parse_name")
          (
            Utf8.PolyML.cInPtr
             &&> GObjectType.PolyML.cVal
             &&> GUInt.PolyML.cRef
             &&> GLibQuark.PolyML.cRef
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val signalTypeCclosureNew_ = call (externalFunctionSymbol "g_signal_type_cclosure_new") (GObjectType.PolyML.cVal &&> GUInt.PolyML.cVal --> GObjectClosureRecord.PolyML.cPtr)
      val typeAddClassPrivate_ = call (externalFunctionSymbol "g_type_add_class_private") (GObjectType.PolyML.cVal &&> GSize.PolyML.cVal --> cVoid)
      val typeAddInstancePrivate_ = call (externalFunctionSymbol "g_type_add_instance_private") (GObjectType.PolyML.cVal &&> GSize.PolyML.cVal --> GInt.PolyML.cVal)
      val typeAddInterfaceDynamic_ =
        call (externalFunctionSymbol "g_type_add_interface_dynamic")
          (
            GObjectType.PolyML.cVal
             &&> GObjectType.PolyML.cVal
             &&> GObjectTypePluginClass.PolyML.cPtr
             --> cVoid
          )
      val typeCheckIsValueType_ = call (externalFunctionSymbol "g_type_check_is_value_type") (GObjectType.PolyML.cVal --> GBool.PolyML.cVal)
      val typeCheckValueHolds_ = call (externalFunctionSymbol "g_type_check_value_holds") (GObjectValueRecord.PolyML.cPtr &&> GObjectType.PolyML.cVal --> GBool.PolyML.cVal)
      val typeChildren_ = call (externalFunctionSymbol "g_type_children") (GObjectType.PolyML.cVal &&> GUInt.PolyML.cRef --> GObjectTypeCArrayN.PolyML.cOutPtr)
      val typeDepth_ = call (externalFunctionSymbol "g_type_depth") (GObjectType.PolyML.cVal --> GUInt.PolyML.cVal)
      val typeEnsure_ = call (externalFunctionSymbol "g_type_ensure") (GObjectType.PolyML.cVal --> cVoid)
      val typeFromName_ = call (externalFunctionSymbol "g_type_from_name") (Utf8.PolyML.cInPtr --> GObjectType.PolyML.cVal)
      val typeFundamental_ = call (externalFunctionSymbol "g_type_fundamental") (GObjectType.PolyML.cVal --> GObjectType.PolyML.cVal)
      val typeFundamentalNext_ = call (externalFunctionSymbol "g_type_fundamental_next") (cVoid --> GObjectType.PolyML.cVal)
      val typeGetInstanceCount_ = call (externalFunctionSymbol "g_type_get_instance_count") (GObjectType.PolyML.cVal --> GInt.PolyML.cVal)
      val typeGetPlugin_ = call (externalFunctionSymbol "g_type_get_plugin") (GObjectType.PolyML.cVal --> GObjectTypePluginClass.PolyML.cPtr)
      val typeGetTypeRegistrationSerial_ = call (externalFunctionSymbol "g_type_get_type_registration_serial") (cVoid --> GUInt.PolyML.cVal)
      val typeInit_ = call (externalFunctionSymbol "g_type_init") (cVoid --> cVoid)
      val typeInitWithDebugFlags_ = call (externalFunctionSymbol "g_type_init_with_debug_flags") (GObjectTypeDebugFlags.PolyML.cVal --> cVoid)
      val typeInterfaces_ = call (externalFunctionSymbol "g_type_interfaces") (GObjectType.PolyML.cVal &&> GUInt.PolyML.cRef --> GObjectTypeCArrayN.PolyML.cOutPtr)
      val typeIsA_ = call (externalFunctionSymbol "g_type_is_a") (GObjectType.PolyML.cVal &&> GObjectType.PolyML.cVal --> GBool.PolyML.cVal)
      val typeName_ = call (externalFunctionSymbol "g_type_name") (GObjectType.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val typeNextBase_ = call (externalFunctionSymbol "g_type_next_base") (GObjectType.PolyML.cVal &&> GObjectType.PolyML.cVal --> GObjectType.PolyML.cVal)
      val typeParent_ = call (externalFunctionSymbol "g_type_parent") (GObjectType.PolyML.cVal --> GObjectType.PolyML.cVal)
      val typeQname_ = call (externalFunctionSymbol "g_type_qname") (GObjectType.PolyML.cVal --> GLibQuark.PolyML.cVal)
      val typeRegisterDynamic_ =
        call (externalFunctionSymbol "g_type_register_dynamic")
          (
            GObjectType.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GObjectTypePluginClass.PolyML.cPtr
             &&> GObjectTypeFlags.PolyML.cVal
             --> GObjectType.PolyML.cVal
          )
      val typeTestFlags_ = call (externalFunctionSymbol "g_type_test_flags") (GObjectType.PolyML.cVal &&> GUInt.PolyML.cVal --> GBool.PolyML.cVal)
    end
    type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
    type 'a signal_t = 'a Signal.t
    type ('object_class, 'get, 'set, 'init) property_t = ('object_class, 'get, 'set, 'init) Property.t
    type 'object_class property_init_t = 'object_class Property.init_t
    structure Type = GObjectType
    structure ConnectFlags = GObjectConnectFlags
    structure ParamFlags = GObjectParamFlags
    structure SignalFlags = GObjectSignalFlags
    structure SignalInvocationHintRecord = GObjectSignalInvocationHintRecord
    structure SignalMatchType = GObjectSignalMatchType
    structure TypeDebugFlags = GObjectTypeDebugFlags
    structure TypeFlags = GObjectTypeFlags
    structure TypeFundamentalFlags = GObjectTypeFundamentalFlags
    structure ValueArrayRecord = GObjectValueArrayRecord
    structure BindingFlags = GObjectBindingFlags
    structure SignalInvocationHint = GObjectSignalInvocationHint
    structure ValueRecord = GObjectValueRecord
    structure TypeCArrayN = GObjectTypeCArrayN
    structure ValueRecordCArrayN = GObjectValueRecordCArrayN
    structure Value = GObjectValue
    structure ValueArray = GObjectValueArray
    structure ClosureRecord = GObjectClosureRecord
    structure ObjectClass = GObjectObjectClass
    structure ParamSpecClass = GObjectParamSpecClass
    structure BindingClass = GObjectBindingClass
    structure InitiallyUnownedClass = GObjectInitiallyUnownedClass
    structure ParamSpec = GObjectParamSpec
    structure ParamSpecBooleanClass = GObjectParamSpecBooleanClass
    structure ParamSpecBoxedClass = GObjectParamSpecBoxedClass
    structure ParamSpecCharClass = GObjectParamSpecCharClass
    structure ParamSpecDoubleClass = GObjectParamSpecDoubleClass
    structure ParamSpecEnumClass = GObjectParamSpecEnumClass
    structure ParamSpecFlagsClass = GObjectParamSpecFlagsClass
    structure ParamSpecFloatClass = GObjectParamSpecFloatClass
    structure ParamSpecGTypeClass = GObjectParamSpecGTypeClass
    structure ParamSpecIntClass = GObjectParamSpecIntClass
    structure ParamSpecInt64Class = GObjectParamSpecInt64Class
    structure ParamSpecLongClass = GObjectParamSpecLongClass
    structure ParamSpecObjectClass = GObjectParamSpecObjectClass
    structure ParamSpecOverrideClass = GObjectParamSpecOverrideClass
    structure ParamSpecParamClass = GObjectParamSpecParamClass
    structure ParamSpecPointerClass = GObjectParamSpecPointerClass
    structure ParamSpecStringClass = GObjectParamSpecStringClass
    structure ParamSpecUCharClass = GObjectParamSpecUCharClass
    structure ParamSpecUIntClass = GObjectParamSpecUIntClass
    structure ParamSpecUInt64Class = GObjectParamSpecUInt64Class
    structure ParamSpecULongClass = GObjectParamSpecULongClass
    structure ParamSpecUnicharClass = GObjectParamSpecUnicharClass
    structure ParamSpecValueArrayClass = GObjectParamSpecValueArrayClass
    structure ParamSpecVariantClass = GObjectParamSpecVariantClass
    structure TypeModuleClass = GObjectTypeModuleClass
    structure TypePluginClass = GObjectTypePluginClass
    structure Closure = GObjectClosure
    structure InitiallyUnowned = GObjectInitiallyUnowned
    structure ParamSpecBoolean = GObjectParamSpecBoolean
    structure ParamSpecBoxed = GObjectParamSpecBoxed
    structure ParamSpecChar = GObjectParamSpecChar
    structure ParamSpecDouble = GObjectParamSpecDouble
    structure ParamSpecEnum = GObjectParamSpecEnum
    structure ParamSpecFlags = GObjectParamSpecFlags
    structure ParamSpecFloat = GObjectParamSpecFloat
    structure ParamSpecGType = GObjectParamSpecGType
    structure ParamSpecInt = GObjectParamSpecInt
    structure ParamSpecInt64 = GObjectParamSpecInt64
    structure ParamSpecLong = GObjectParamSpecLong
    structure ParamSpecObject = GObjectParamSpecObject
    structure ParamSpecOverride = GObjectParamSpecOverride
    structure ParamSpecParam = GObjectParamSpecParam
    structure ParamSpecPointer = GObjectParamSpecPointer
    structure ParamSpecString = GObjectParamSpecString
    structure ParamSpecUChar = GObjectParamSpecUChar
    structure ParamSpecUInt = GObjectParamSpecUInt
    structure ParamSpecUInt64 = GObjectParamSpecUInt64
    structure ParamSpecULong = GObjectParamSpecULong
    structure ParamSpecUnichar = GObjectParamSpecUnichar
    structure ParamSpecValueArray = GObjectParamSpecValueArray
    structure ParamSpecVariant = GObjectParamSpecVariant
    structure TypeModule = GObjectTypeModule
    structure TypePlugin = GObjectTypePlugin
    structure Binding = GObjectBinding
    structure Object = GObjectObject
    val PARAM_MASK = 255
    val PARAM_STATIC_STRINGS = 224
    val PARAM_USER_SHIFT = 8
    val SIGNAL_FLAGS_MASK = 511
    val SIGNAL_MATCH_MASK = 63
    val TYPE_FUNDAMENTAL_MAX = 255
    val TYPE_FUNDAMENTAL_SHIFT = 2
    val TYPE_RESERVED_BSE_FIRST = 32
    val TYPE_RESERVED_BSE_LAST = 48
    val TYPE_RESERVED_GLIB_FIRST = 22
    val TYPE_RESERVED_GLIB_LAST = 31
    val TYPE_RESERVED_USER_FIRST = 49
    val VALUE_INTERNED_STRING = 268435456
    val VALUE_NOCOPY_CONTENTS = 134217728
    local
      val call = GObjectType.FFI.withVal &&&> GInt.FFI.withVal ---> Utf8.FFI.fromPtr ~1
    in
      fun enumToString (gEnumType, value) = call enumToString_ (gEnumType & value)
    end
    local
      val call = GObjectType.FFI.withVal &&&> GUInt.FFI.withVal ---> Utf8.FFI.fromPtr ~1
    in
      fun flagsToString (flagsType, value) = call flagsToString_ (flagsType & value)
    end
    local
      val call = I ---> GObjectType.FFI.fromVal
    in
      fun gtypeGetType () = call gtypeGetType_ ()
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GBool.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecBoolean
        (
          name,
          nick,
          blurb,
          defaultValue,
          flags
        ) =
        call paramSpecBoolean_
          (
            name
             & nick
             & blurb
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecBoxed
        (
          name,
          nick,
          blurb,
          boxedType,
          flags
        ) =
        call paramSpecBoxed_
          (
            name
             & nick
             & blurb
             & boxedType
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt8.FFI.withVal
         &&&> GInt8.FFI.withVal
         &&&> GInt8.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecChar
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecChar_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecDouble
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecDouble_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecEnum
        (
          name,
          nick,
          blurb,
          enumType,
          defaultValue,
          flags
        ) =
        call paramSpecEnum_
          (
            name
             & nick
             & blurb
             & enumType
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecFlags
        (
          name,
          nick,
          blurb,
          flagsType,
          defaultValue,
          flags
        ) =
        call paramSpecFlags_
          (
            name
             & nick
             & blurb
             & flagsType
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecFloat
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecFloat_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecGtype
        (
          name,
          nick,
          blurb,
          isAType,
          flags
        ) =
        call paramSpecGtype_
          (
            name
             & nick
             & blurb
             & isAType
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecInt
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecInt_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt64.FFI.withVal
         &&&> GInt64.FFI.withVal
         &&&> GInt64.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecInt64
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecInt64_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GLong.FFI.withVal
         &&&> GLong.FFI.withVal
         &&&> GLong.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecLong
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecLong_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecObject
        (
          name,
          nick,
          blurb,
          objectType,
          flags
        ) =
        call paramSpecObject_
          (
            name
             & nick
             & blurb
             & objectType
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecParam
        (
          name,
          nick,
          blurb,
          paramType,
          flags
        ) =
        call paramSpecParam_
          (
            name
             & nick
             & blurb
             & paramType
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecPointer
        (
          name,
          nick,
          blurb,
          flags
        ) =
        call paramSpecPointer_
          (
            name
             & nick
             & blurb
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecString
        (
          name,
          nick,
          blurb,
          defaultValue,
          flags
        ) =
        call paramSpecString_
          (
            name
             & nick
             & blurb
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt8.FFI.withVal
         &&&> GUInt8.FFI.withVal
         &&&> GUInt8.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecUchar
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecUchar_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecUint
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecUint_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt64.FFI.withVal
         &&&> GUInt64.FFI.withVal
         &&&> GUInt64.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecUint64
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecUint64_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GULong.FFI.withVal
         &&&> GULong.FFI.withVal
         &&&> GULong.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecUlong
        (
          name,
          nick,
          blurb,
          minimum,
          maximum,
          defaultValue,
          flags
        ) =
        call paramSpecUlong_
          (
            name
             & nick
             & blurb
             & minimum
             & maximum
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GChar.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecUnichar
        (
          name,
          nick,
          blurb,
          defaultValue,
          flags
        ) =
        call paramSpecUnichar_
          (
            name
             & nick
             & blurb
             & defaultValue
             & flags
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantTypeRecord.FFI.withPtr false
         &&&> GLibVariantRecord.FFI.withOptPtr true
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
    in
      fun paramSpecVariant
        (
          name,
          nick,
          blurb,
          type',
          defaultValue,
          flags
        ) =
        call paramSpecVariant_
          (
            name
             & nick
             & blurb
             & type'
             & defaultValue
             & flags
          )
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> GObjectType.FFI.fromVal
    in
      fun pointerTypeRegisterStatic name = call pointerTypeRegisterStatic_ name
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal
    in
      fun signalIsValidName name = call signalIsValidName_ name
    end
    local
      val call = GObjectType.FFI.withVal &&&> GUInt.FFI.withRefVal ---> GUInt.FFI.fromVal && GUIntCArrayN.FFI.fromPtr ~1
    in
      fun signalListIds itype =
        let
          val nIds & retVal = call signalListIds_ (itype & GUInt.null)
        in
          retVal (LargeInt.toInt nIds)
        end
    end
    local
      val call = Utf8.FFI.withPtr 0 &&&> GObjectType.FFI.withVal ---> GUInt.FFI.fromVal
    in
      fun signalLookup (name, itype) = call signalLookup_ (name & itype)
    end
    local
      val call =
        GUInt.FFI.withVal
         &&&> GObjectType.FFI.withVal
         &&&> GObjectClosureRecord.FFI.withPtr false
         ---> I
    in
      fun signalOverrideClassClosure
        (
          signalId,
          instanceType,
          classClosure
        ) =
        call signalOverrideClassClosure_
          (
            signalId
             & instanceType
             & classClosure
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GUInt.FFI.withRefVal
         &&&> GLibQuark.FFI.withRefVal
         &&&> GBool.FFI.withVal
         ---> GUInt.FFI.fromVal
               && GLibQuark.FFI.fromVal
               && GBool.FFI.fromVal
    in
      fun signalParseName
        (
          detailedSignal,
          itype,
          forceDetailQuark
        ) =
        let
          val signalIdP
           & detailP
           & retVal =
            call signalParseName_
              (
                detailedSignal
                 & itype
                 & GUInt.null
                 & GLibQuark.null
                 & forceDetailQuark
              )
        in
          if retVal then SOME (signalIdP, detailP) else NONE
        end
    end
    local
      val call = GObjectType.FFI.withVal &&&> GUInt.FFI.withVal ---> GObjectClosureRecord.FFI.fromPtr false
    in
      fun signalTypeCclosureNew (itype, structOffset) = call signalTypeCclosureNew_ (itype & structOffset)
    end
    local
      val call = GObjectType.FFI.withVal &&&> GSize.FFI.withVal ---> I
    in
      fun typeAddClassPrivate (classType, privateSize) = call typeAddClassPrivate_ (classType & privateSize)
    end
    local
      val call = GObjectType.FFI.withVal &&&> GSize.FFI.withVal ---> GInt.FFI.fromVal
    in
      fun typeAddInstancePrivate (classType, privateSize) = call typeAddInstancePrivate_ (classType & privateSize)
    end
    local
      val call =
        GObjectType.FFI.withVal
         &&&> GObjectType.FFI.withVal
         &&&> GObjectTypePluginClass.FFI.withPtr false
         ---> I
    in
      fun typeAddInterfaceDynamic
        (
          instanceType,
          interfaceType,
          plugin
        ) =
        call typeAddInterfaceDynamic_
          (
            instanceType
             & interfaceType
             & GObjectTypePluginClass.toBase plugin
          )
    end
    local
      val call = GObjectType.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun typeCheckIsValueType type' = call typeCheckIsValueType_ type'
    end
    local
      val call = GObjectValueRecord.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun typeCheckValueHolds (value, type') = call typeCheckValueHolds_ (value & type')
    end
    local
      val call = GObjectType.FFI.withVal &&&> GUInt.FFI.withRefVal ---> GUInt.FFI.fromVal && GObjectTypeCArrayN.FFI.fromPtr ~1
    in
      fun typeChildren type' =
        let
          val nChildren & retVal = call typeChildren_ (type' & GUInt.null)
        in
          retVal (LargeInt.toInt nChildren)
        end
    end
    local
      val call = GObjectType.FFI.withVal ---> GUInt.FFI.fromVal
    in
      fun typeDepth type' = call typeDepth_ type'
    end
    local
      val call = GObjectType.FFI.withVal ---> I
    in
      fun typeEnsure type' = call typeEnsure_ type'
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> GObjectType.FFI.fromVal
    in
      fun typeFromName name = call typeFromName_ name
    end
    local
      val call = GObjectType.FFI.withVal ---> GObjectType.FFI.fromVal
    in
      fun typeFundamental typeId = call typeFundamental_ typeId
    end
    local
      val call = I ---> GObjectType.FFI.fromVal
    in
      fun typeFundamentalNext () = call typeFundamentalNext_ ()
    end
    local
      val call = GObjectType.FFI.withVal ---> GInt.FFI.fromVal
    in
      fun typeGetInstanceCount type' = call typeGetInstanceCount_ type'
    end
    local
      val call = GObjectType.FFI.withVal ---> GObjectTypePluginClass.FFI.fromPtr false
    in
      fun typeGetPlugin type' = call typeGetPlugin_ type'
    end
    local
      val call = I ---> GUInt.FFI.fromVal
    in
      fun typeGetTypeRegistrationSerial () = call typeGetTypeRegistrationSerial_ ()
    end
    local
      val call = I ---> I
    in
      fun typeInit () = call typeInit_ ()
    end
    local
      val call = GObjectTypeDebugFlags.FFI.withVal ---> I
    in
      fun typeInitWithDebugFlags debugFlags = call typeInitWithDebugFlags_ debugFlags
    end
    local
      val call = GObjectType.FFI.withVal &&&> GUInt.FFI.withRefVal ---> GUInt.FFI.fromVal && GObjectTypeCArrayN.FFI.fromPtr ~1
    in
      fun typeInterfaces type' =
        let
          val nInterfaces & retVal = call typeInterfaces_ (type' & GUInt.null)
        in
          retVal (LargeInt.toInt nInterfaces)
        end
    end
    local
      val call = GObjectType.FFI.withVal &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun typeIsA (type', isAType) = call typeIsA_ (type' & isAType)
    end
    local
      val call = GObjectType.FFI.withVal ---> Utf8.FFI.fromPtr 0
    in
      fun typeName type' = call typeName_ type'
    end
    local
      val call = GObjectType.FFI.withVal &&&> GObjectType.FFI.withVal ---> GObjectType.FFI.fromVal
    in
      fun typeNextBase (leafType, rootType) = call typeNextBase_ (leafType & rootType)
    end
    local
      val call = GObjectType.FFI.withVal ---> GObjectType.FFI.fromVal
    in
      fun typeParent type' = call typeParent_ type'
    end
    local
      val call = GObjectType.FFI.withVal ---> GLibQuark.FFI.fromVal
    in
      fun typeQname type' = call typeQname_ type'
    end
    local
      val call =
        GObjectType.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectTypePluginClass.FFI.withPtr false
         &&&> GObjectTypeFlags.FFI.withVal
         ---> GObjectType.FFI.fromVal
    in
      fun typeRegisterDynamic
        (
          parentType,
          typeName,
          plugin,
          flags
        ) =
        call typeRegisterDynamic_
          (
            parentType
             & typeName
             & GObjectTypePluginClass.toBase plugin
             & flags
          )
    end
    local
      val call = GObjectType.FFI.withVal &&&> GUInt.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun typeTestFlags (type', flags) = call typeTestFlags_ (type' & flags)
    end
  end
