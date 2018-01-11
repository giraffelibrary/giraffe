structure GObject :
  G_OBJECT
    where type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
    where type 'a signal_t = 'a Signal.t
    where type ('object, 'a) property_readonly = ('object, 'a) Property.readonly
    where type ('object, 'a) property_writeonly = ('object, 'a) Property.writeonly
    where type ('object, 'a, 'b) property_readwrite = ('object, 'a, 'b) Property.readwrite =
  struct
    local
      open PolyMLFFI
    in
      val enumGetValue_ = call (getSymbol "g_enum_get_value") (GObjectEnumClassRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GObjectEnumValueRecord.PolyML.cPtr)
      val enumGetValueByName_ = call (getSymbol "g_enum_get_value_by_name") (GObjectEnumClassRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectEnumValueRecord.PolyML.cPtr)
      val enumGetValueByNick_ = call (getSymbol "g_enum_get_value_by_nick") (GObjectEnumClassRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectEnumValueRecord.PolyML.cPtr)
      val flagsGetFirstValue_ = call (getSymbol "g_flags_get_first_value") (GObjectFlagsClassRecord.PolyML.cPtr &&> GUInt.PolyML.cVal --> GObjectFlagsValueRecord.PolyML.cPtr)
      val flagsGetValueByName_ = call (getSymbol "g_flags_get_value_by_name") (GObjectFlagsClassRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectFlagsValueRecord.PolyML.cPtr)
      val flagsGetValueByNick_ = call (getSymbol "g_flags_get_value_by_nick") (GObjectFlagsClassRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectFlagsValueRecord.PolyML.cPtr)
      val paramSpecBoolean_ =
        call (getSymbol "g_param_spec_boolean")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecChar_ =
        call (getSymbol "g_param_spec_char")
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
        call (getSymbol "g_param_spec_double")
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
      val paramSpecFloat_ =
        call (getSymbol "g_param_spec_float")
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
      val paramSpecInt_ =
        call (getSymbol "g_param_spec_int")
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
        call (getSymbol "g_param_spec_int64")
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
        call (getSymbol "g_param_spec_long")
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
      val paramSpecPointer_ =
        call (getSymbol "g_param_spec_pointer")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecString_ =
        call (getSymbol "g_param_spec_string")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val paramSpecUchar_ =
        call (getSymbol "g_param_spec_uchar")
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
        call (getSymbol "g_param_spec_uint")
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
        call (getSymbol "g_param_spec_uint64")
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
        call (getSymbol "g_param_spec_ulong")
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
        call (getSymbol "g_param_spec_unichar")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GChar.PolyML.cVal
             &&> GObjectParamFlags.PolyML.cVal
             --> GObjectParamSpecClass.PolyML.cPtr
          )
      val typeGetTypeRegistrationSerial_ = call (getSymbol "g_type_get_type_registration_serial") (cVoid --> GUInt.PolyML.cVal)
      val typeInit_ = call (getSymbol "g_type_init") (cVoid --> cVoid)
      val typeInitWithDebugFlags_ = call (getSymbol "g_type_init_with_debug_flags") (GObjectTypeDebugFlags.PolyML.cVal --> cVoid)
    end
    type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
    type 'a signal_t = 'a Signal.t
    type ('object, 'a) property_readonly = ('object, 'a) Property.readonly
    type ('object, 'a) property_writeonly = ('object, 'a) Property.writeonly
    type ('object, 'a, 'b) property_readwrite = ('object, 'a, 'b) Property.readwrite
    structure Type = GObjectType
    structure ConnectFlags = GObjectConnectFlags
    structure EnumClassRecord = GObjectEnumClassRecord
    structure EnumValueRecord = GObjectEnumValueRecord
    structure FlagsClassRecord = GObjectFlagsClassRecord
    structure FlagsValueRecord = GObjectFlagsValueRecord
    structure ParamFlags = GObjectParamFlags
    structure ParameterRecord = GObjectParameterRecord
    structure SignalFlags = GObjectSignalFlags
    structure SignalInvocationHintRecord = GObjectSignalInvocationHintRecord
    structure SignalMatchType = GObjectSignalMatchType
    structure SignalQueryRecord = GObjectSignalQueryRecord
    structure TypeDebugFlags = GObjectTypeDebugFlags
    structure TypeFlags = GObjectTypeFlags
    structure TypeFundamentalFlags = GObjectTypeFundamentalFlags
    structure TypeQueryRecord = GObjectTypeQueryRecord
    structure ValueArrayRecord = GObjectValueArrayRecord
    structure ValueRecord = GObjectValueRecord
    structure BindingFlags = GObjectBindingFlags
    structure EnumClass = GObjectEnumClass
    structure EnumValue = GObjectEnumValue
    structure FlagsClass = GObjectFlagsClass
    structure FlagsValue = GObjectFlagsValue
    structure Parameter = GObjectParameter
    structure SignalInvocationHint = GObjectSignalInvocationHint
    structure SignalQuery = GObjectSignalQuery
    structure TypeQuery = GObjectTypeQuery
    structure Value = GObjectValue
    structure ValueArray = GObjectValueArray
    structure ClosureRecord = GObjectClosureRecord
    structure ObjectClass = GObjectObjectClass
    structure ParamSpecClass = GObjectParamSpecClass
    structure Closure = GObjectClosure
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
    structure Binding = GObjectBinding
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
    structure Object = GObjectObject
    val PARAM_MASK = 255
    val PARAM_STATIC_STRINGS = 0
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
    val VALUE_COLLECT_FORMAT_MAX_LENGTH = 8
    val VALUE_NOCOPY_CONTENTS = 134217728
    fun enumGetValue (enumClass, value) = (GObjectEnumClassRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GObjectEnumValueRecord.FFI.fromPtr false) enumGetValue_ (enumClass & value)
    fun enumGetValueByName (enumClass, name) = (GObjectEnumClassRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GObjectEnumValueRecord.FFI.fromPtr false) enumGetValueByName_ (enumClass & name)
    fun enumGetValueByNick (enumClass, nick) = (GObjectEnumClassRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GObjectEnumValueRecord.FFI.fromPtr false) enumGetValueByNick_ (enumClass & nick)
    fun flagsGetFirstValue (flagsClass, value) = (GObjectFlagsClassRecord.FFI.withPtr &&&> GUInt.FFI.withVal ---> GObjectFlagsValueRecord.FFI.fromPtr false) flagsGetFirstValue_ (flagsClass & value)
    fun flagsGetValueByName (flagsClass, name) = (GObjectFlagsClassRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GObjectFlagsValueRecord.FFI.fromPtr false) flagsGetValueByName_ (flagsClass & name)
    fun flagsGetValueByNick (flagsClass, nick) = (GObjectFlagsClassRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GObjectFlagsValueRecord.FFI.fromPtr false) flagsGetValueByNick_ (flagsClass & nick)
    fun paramSpecBoolean
      (
        name,
        nick,
        blurb,
        defaultValue,
        flags
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
    fun paramSpecPointer
      (
        name,
        nick,
        blurb,
        flags
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
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
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
    fun typeGetTypeRegistrationSerial () = (I ---> GUInt.FFI.fromVal) typeGetTypeRegistrationSerial_ ()
    fun typeInit () = (I ---> I) typeInit_ ()
    fun typeInitWithDebugFlags debugFlags = (GObjectTypeDebugFlags.FFI.withVal ---> I) typeInitWithDebugFlags_ debugFlags
  end
