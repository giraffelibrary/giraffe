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
    fun enumToString (gEnumType, value) = (GObjectType.FFI.withVal &&&> GInt.FFI.withVal ---> Utf8.FFI.fromPtr ~1) enumToString_ (gEnumType & value)
    fun flagsToString (flagsType, value) = (GObjectType.FFI.withVal &&&> GUInt.FFI.withVal ---> Utf8.FFI.fromPtr ~1) flagsToString_ (flagsType & value)
    fun gtypeGetType () = (I ---> GObjectType.FFI.fromVal) gtypeGetType_ ()
    fun paramSpecBoolean
      (
        name,
        nick,
        blurb,
        defaultValue,
        flags
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GBool.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecBoolean_
        (
          name
           & nick
           & blurb
           & defaultValue
           & flags
        )
    fun paramSpecBoxed
      (
        name,
        nick,
        blurb,
        boxedType,
        flags
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecBoxed_
        (
          name
           & nick
           & blurb
           & boxedType
           & flags
        )
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
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt8.FFI.withVal
         &&&> GInt8.FFI.withVal
         &&&> GInt8.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecChar_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
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
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecDouble_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
    fun paramSpecEnum
      (
        name,
        nick,
        blurb,
        enumType,
        defaultValue,
        flags
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecEnum_
        (
          name
           & nick
           & blurb
           & enumType
           & defaultValue
           & flags
        )
    fun paramSpecFlags
      (
        name,
        nick,
        blurb,
        flagsType,
        defaultValue,
        flags
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecFlags_
        (
          name
           & nick
           & blurb
           & flagsType
           & defaultValue
           & flags
        )
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
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecFloat_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
    fun paramSpecGtype
      (
        name,
        nick,
        blurb,
        isAType,
        flags
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecGtype_
        (
          name
           & nick
           & blurb
           & isAType
           & flags
        )
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
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecInt_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
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
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt64.FFI.withVal
         &&&> GInt64.FFI.withVal
         &&&> GInt64.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecInt64_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
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
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GLong.FFI.withVal
         &&&> GLong.FFI.withVal
         &&&> GLong.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecLong_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
    fun paramSpecObject
      (
        name,
        nick,
        blurb,
        objectType,
        flags
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecObject_
        (
          name
           & nick
           & blurb
           & objectType
           & flags
        )
    fun paramSpecParam
      (
        name,
        nick,
        blurb,
        paramType,
        flags
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecParam_
        (
          name
           & nick
           & blurb
           & paramType
           & flags
        )
    fun paramSpecPointer
      (
        name,
        nick,
        blurb,
        flags
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecPointer_
        (
          name
           & nick
           & blurb
           & flags
        )
    fun paramSpecString
      (
        name,
        nick,
        blurb,
        defaultValue,
        flags
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecString_
        (
          name
           & nick
           & blurb
           & defaultValue
           & flags
        )
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
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt8.FFI.withVal
         &&&> GUInt8.FFI.withVal
         &&&> GUInt8.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecUchar_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
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
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecUint_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
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
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt64.FFI.withVal
         &&&> GUInt64.FFI.withVal
         &&&> GUInt64.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecUint64_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
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
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GULong.FFI.withVal
         &&&> GULong.FFI.withVal
         &&&> GULong.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecUlong_
        (
          name
           & nick
           & blurb
           & minimum
           & maximum
           & defaultValue
           & flags
        )
    fun paramSpecUnichar
      (
        name,
        nick,
        blurb,
        defaultValue,
        flags
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GChar.FFI.withVal
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecUnichar_
        (
          name
           & nick
           & blurb
           & defaultValue
           & flags
        )
    fun paramSpecVariant
      (
        name,
        nick,
        blurb,
        type',
        defaultValue,
        flags
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantTypeRecord.FFI.withPtr false
         &&&> GLibVariantRecord.FFI.withOptPtr true
         &&&> GObjectParamFlags.FFI.withVal
         ---> GObjectParamSpecClass.FFI.fromPtr true
      )
        paramSpecVariant_
        (
          name
           & nick
           & blurb
           & type'
           & defaultValue
           & flags
        )
    fun pointerTypeRegisterStatic name = (Utf8.FFI.withPtr 0 ---> GObjectType.FFI.fromVal) pointerTypeRegisterStatic_ name
    fun signalIsValidName name = (Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) signalIsValidName_ name
    fun signalListIds itype =
      let
        val nIds & retVal = (GObjectType.FFI.withVal &&&> GUInt.FFI.withRefVal ---> GUInt.FFI.fromVal && GUIntCArrayN.FFI.fromPtr ~1) signalListIds_ (itype & GUInt.null)
      in
        retVal (LargeInt.toInt nIds)
      end
    fun signalLookup (name, itype) = (Utf8.FFI.withPtr 0 &&&> GObjectType.FFI.withVal ---> GUInt.FFI.fromVal) signalLookup_ (name & itype)
    fun signalOverrideClassClosure
      (
        signalId,
        instanceType,
        classClosure
      ) =
      (
        GUInt.FFI.withVal
         &&&> GObjectType.FFI.withVal
         &&&> GObjectClosureRecord.FFI.withPtr false
         ---> I
      )
        signalOverrideClassClosure_
        (
          signalId
           & instanceType
           & classClosure
        )
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
          (
            Utf8.FFI.withPtr 0
             &&&> GObjectType.FFI.withVal
             &&&> GUInt.FFI.withRefVal
             &&&> GLibQuark.FFI.withRefVal
             &&&> GBool.FFI.withVal
             ---> GUInt.FFI.fromVal
                   && GLibQuark.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            signalParseName_
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
    fun signalTypeCclosureNew (itype, structOffset) = (GObjectType.FFI.withVal &&&> GUInt.FFI.withVal ---> GObjectClosureRecord.FFI.fromPtr false) signalTypeCclosureNew_ (itype & structOffset)
    fun typeAddClassPrivate (classType, privateSize) = (GObjectType.FFI.withVal &&&> GSize.FFI.withVal ---> I) typeAddClassPrivate_ (classType & privateSize)
    fun typeAddInstancePrivate (classType, privateSize) = (GObjectType.FFI.withVal &&&> GSize.FFI.withVal ---> GInt.FFI.fromVal) typeAddInstancePrivate_ (classType & privateSize)
    fun typeAddInterfaceDynamic
      (
        instanceType,
        interfaceType,
        plugin
      ) =
      (
        GObjectType.FFI.withVal
         &&&> GObjectType.FFI.withVal
         &&&> GObjectTypePluginClass.FFI.withPtr false
         ---> I
      )
        typeAddInterfaceDynamic_
        (
          instanceType
           & interfaceType
           & plugin
        )
    fun typeCheckIsValueType type' = (GObjectType.FFI.withVal ---> GBool.FFI.fromVal) typeCheckIsValueType_ type'
    fun typeCheckValueHolds (value, type') = (GObjectValueRecord.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal) typeCheckValueHolds_ (value & type')
    fun typeChildren type' =
      let
        val nChildren & retVal = (GObjectType.FFI.withVal &&&> GUInt.FFI.withRefVal ---> GUInt.FFI.fromVal && GObjectTypeCArrayN.FFI.fromPtr ~1) typeChildren_ (type' & GUInt.null)
      in
        retVal (LargeInt.toInt nChildren)
      end
    fun typeDepth type' = (GObjectType.FFI.withVal ---> GUInt.FFI.fromVal) typeDepth_ type'
    fun typeEnsure type' = (GObjectType.FFI.withVal ---> I) typeEnsure_ type'
    fun typeFromName name = (Utf8.FFI.withPtr 0 ---> GObjectType.FFI.fromVal) typeFromName_ name
    fun typeFundamental typeId = (GObjectType.FFI.withVal ---> GObjectType.FFI.fromVal) typeFundamental_ typeId
    fun typeFundamentalNext () = (I ---> GObjectType.FFI.fromVal) typeFundamentalNext_ ()
    fun typeGetInstanceCount type' = (GObjectType.FFI.withVal ---> GInt.FFI.fromVal) typeGetInstanceCount_ type'
    fun typeGetPlugin type' = (GObjectType.FFI.withVal ---> GObjectTypePluginClass.FFI.fromPtr false) typeGetPlugin_ type'
    fun typeGetTypeRegistrationSerial () = (I ---> GUInt.FFI.fromVal) typeGetTypeRegistrationSerial_ ()
    fun typeInit () = (I ---> I) typeInit_ ()
    fun typeInitWithDebugFlags debugFlags = (GObjectTypeDebugFlags.FFI.withVal ---> I) typeInitWithDebugFlags_ debugFlags
    fun typeInterfaces type' =
      let
        val nInterfaces & retVal = (GObjectType.FFI.withVal &&&> GUInt.FFI.withRefVal ---> GUInt.FFI.fromVal && GObjectTypeCArrayN.FFI.fromPtr ~1) typeInterfaces_ (type' & GUInt.null)
      in
        retVal (LargeInt.toInt nInterfaces)
      end
    fun typeIsA (type', isAType) = (GObjectType.FFI.withVal &&&> GObjectType.FFI.withVal ---> GBool.FFI.fromVal) typeIsA_ (type' & isAType)
    fun typeName type' = (GObjectType.FFI.withVal ---> Utf8.FFI.fromPtr 0) typeName_ type'
    fun typeNextBase (leafType, rootType) = (GObjectType.FFI.withVal &&&> GObjectType.FFI.withVal ---> GObjectType.FFI.fromVal) typeNextBase_ (leafType & rootType)
    fun typeParent type' = (GObjectType.FFI.withVal ---> GObjectType.FFI.fromVal) typeParent_ type'
    fun typeQname type' = (GObjectType.FFI.withVal ---> GLibQuark.FFI.fromVal) typeQname_ type'
    fun typeRegisterDynamic
      (
        parentType,
        typeName,
        plugin,
        flags
      ) =
      (
        GObjectType.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectTypePluginClass.FFI.withPtr false
         &&&> GObjectTypeFlags.FFI.withVal
         ---> GObjectType.FFI.fromVal
      )
        typeRegisterDynamic_
        (
          parentType
           & typeName
           & plugin
           & flags
        )
    fun typeTestFlags (type', flags) = (GObjectType.FFI.withVal &&&> GUInt.FFI.withVal ---> GBool.FFI.fromVal) typeTestFlags_ (type' & flags)
  end
