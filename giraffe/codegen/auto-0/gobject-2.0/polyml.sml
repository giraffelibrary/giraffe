use "CLOSURE_MARSHAL.sml";
use "SIGNAL.sml";
use "PROPERTY.sml";
use "G_OBJECT_TYPE.sml";
use "G_OBJECT_VALUE_RECORD.sml";
use "G_OBJECT_VALUE.sml";
use "G_OBJECT_BINDING_CLASS.sml";
use "G_OBJECT_BINDING.sml";
use "G_OBJECT_BINDING_FLAGS.sml";
use "G_OBJECT_CLOSURE_RECORD.sml";
use "G_OBJECT_CLOSURE.sml";
use "G_OBJECT_CONNECT_FLAGS.sml";
use "G_OBJECT_INITIALLY_UNOWNED_CLASS.sml";
use "G_OBJECT_INITIALLY_UNOWNED.sml";
use "G_OBJECT_OBJECT_CLASS.sml";
use "G_OBJECT_OBJECT.sml";
use "G_OBJECT_PARAM_FLAGS.sml";
use "G_OBJECT_PARAM_SPEC_CLASS.sml";
use "G_OBJECT_PARAM_SPEC.sml";
use "G_OBJECT_PARAM_SPEC_BOOLEAN_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_BOOLEAN.sml";
use "G_OBJECT_PARAM_SPEC_BOXED_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_BOXED.sml";
use "G_OBJECT_PARAM_SPEC_CHAR_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_CHAR.sml";
use "G_OBJECT_PARAM_SPEC_DOUBLE_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_DOUBLE.sml";
use "G_OBJECT_PARAM_SPEC_ENUM_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_ENUM.sml";
use "G_OBJECT_PARAM_SPEC_FLAGS_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_FLAGS.sml";
use "G_OBJECT_PARAM_SPEC_FLOAT_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_FLOAT.sml";
use "G_OBJECT_PARAM_SPEC_G_TYPE_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_G_TYPE.sml";
use "G_OBJECT_PARAM_SPEC_INT_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_INT.sml";
use "G_OBJECT_PARAM_SPEC_INT_64_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_INT_64.sml";
use "G_OBJECT_PARAM_SPEC_LONG_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_LONG.sml";
use "G_OBJECT_PARAM_SPEC_OBJECT_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_OBJECT.sml";
use "G_OBJECT_PARAM_SPEC_OVERRIDE_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_OVERRIDE.sml";
use "G_OBJECT_PARAM_SPEC_PARAM_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_PARAM.sml";
use "G_OBJECT_PARAM_SPEC_POINTER_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_POINTER.sml";
use "G_OBJECT_PARAM_SPEC_STRING_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_STRING.sml";
use "G_OBJECT_PARAM_SPEC_U_CHAR_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_U_CHAR.sml";
use "G_OBJECT_PARAM_SPEC_U_INT_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_U_INT.sml";
use "G_OBJECT_PARAM_SPEC_U_INT_64_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_U_INT_64.sml";
use "G_OBJECT_PARAM_SPEC_U_LONG_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_U_LONG.sml";
use "G_OBJECT_PARAM_SPEC_UNICHAR_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_UNICHAR.sml";
use "G_OBJECT_PARAM_SPEC_VALUE_ARRAY_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_VALUE_ARRAY.sml";
use "G_OBJECT_PARAM_SPEC_VARIANT_CLASS.sml";
use "G_OBJECT_PARAM_SPEC_VARIANT.sml";
use "G_OBJECT_SIGNAL_FLAGS.sml";
use "G_OBJECT_SIGNAL_MATCH_TYPE.sml";
use "G_OBJECT_TYPE_DEBUG_FLAGS.sml";
use "G_OBJECT_TYPE_FLAGS.sml";
use "G_OBJECT_TYPE_FUNDAMENTAL_FLAGS.sml";
use "G_OBJECT_TYPE_MODULE_CLASS.sml";
use "G_OBJECT_TYPE_MODULE.sml";
use "G_OBJECT_TYPE_PLUGIN_CLASS.sml";
use "G_OBJECT_TYPE_PLUGIN.sml";
use "G_OBJECT.sml";
use "polyml/GObjectType.sml";
use "polyml/GObjectValueRecord.sml";
use "polyml/GObjectConnectFlags.sml";
use "polyml/GObjectParamFlags.sml";
use "polyml/GObjectSignalFlags.sml";
use "polyml/GObjectSignalMatchType.sml";
use "polyml/GObjectTypeDebugFlags.sml";
use "polyml/GObjectTypeFlags.sml";
use "polyml/GObjectTypeFundamentalFlags.sml";
use "polyml/GObjectValue.sml";
use "polyml/GObjectBindingFlags.sml";
use "polyml/ClosureMarshal.sml";
use "polyml/GObjectClosureRecord.sml";
use "polyml/GObjectObjectClass.sml";
use "polyml/GObjectParamSpecClass.sml";
use "polyml/Property.sml";
use "polyml/GObjectClosure.sml";
use "polyml/GObjectBindingClass.sml";
use "polyml/GObjectInitiallyUnownedClass.sml";
use "polyml/GObjectParamSpec.sml";
use "polyml/GObjectParamSpecBooleanClass.sml";
use "polyml/GObjectParamSpecBoxedClass.sml";
use "polyml/GObjectParamSpecCharClass.sml";
use "polyml/GObjectParamSpecDoubleClass.sml";
use "polyml/GObjectParamSpecEnumClass.sml";
use "polyml/GObjectParamSpecFlagsClass.sml";
use "polyml/GObjectParamSpecFloatClass.sml";
use "polyml/GObjectParamSpecGTypeClass.sml";
use "polyml/GObjectParamSpecIntClass.sml";
use "polyml/GObjectParamSpecInt64Class.sml";
use "polyml/GObjectParamSpecLongClass.sml";
use "polyml/GObjectParamSpecObjectClass.sml";
use "polyml/GObjectParamSpecOverrideClass.sml";
use "polyml/GObjectParamSpecParamClass.sml";
use "polyml/GObjectParamSpecPointerClass.sml";
use "polyml/GObjectParamSpecStringClass.sml";
use "polyml/GObjectParamSpecUCharClass.sml";
use "polyml/GObjectParamSpecUIntClass.sml";
use "polyml/GObjectParamSpecUInt64Class.sml";
use "polyml/GObjectParamSpecULongClass.sml";
use "polyml/GObjectParamSpecUnicharClass.sml";
use "polyml/GObjectParamSpecValueArrayClass.sml";
use "polyml/GObjectParamSpecVariantClass.sml";
use "polyml/GObjectTypeModuleClass.sml";
use "polyml/GObjectTypePluginClass.sml";
use "polyml/Signal.sml";
use "polyml/GObjectBinding.sml";
use "polyml/GObjectInitiallyUnowned.sml";
use "polyml/GObjectObject.sml";
use "polyml/GObjectParamSpecBoolean.sml";
use "polyml/GObjectParamSpecBoxed.sml";
use "polyml/GObjectParamSpecChar.sml";
use "polyml/GObjectParamSpecDouble.sml";
use "polyml/GObjectParamSpecEnum.sml";
use "polyml/GObjectParamSpecFlags.sml";
use "polyml/GObjectParamSpecFloat.sml";
use "polyml/GObjectParamSpecGType.sml";
use "polyml/GObjectParamSpecInt.sml";
use "polyml/GObjectParamSpecInt64.sml";
use "polyml/GObjectParamSpecLong.sml";
use "polyml/GObjectParamSpecObject.sml";
use "polyml/GObjectParamSpecOverride.sml";
use "polyml/GObjectParamSpecParam.sml";
use "polyml/GObjectParamSpecPointer.sml";
use "polyml/GObjectParamSpecString.sml";
use "polyml/GObjectParamSpecUChar.sml";
use "polyml/GObjectParamSpecUInt.sml";
use "polyml/GObjectParamSpecUInt64.sml";
use "polyml/GObjectParamSpecULong.sml";
use "polyml/GObjectParamSpecUnichar.sml";
use "polyml/GObjectParamSpecValueArray.sml";
use "polyml/GObjectParamSpecVariant.sml";
use "polyml/GObjectTypeModule.sml";
use "polyml/GObjectTypePlugin.sml";
use "polyml/GObject.sml";
