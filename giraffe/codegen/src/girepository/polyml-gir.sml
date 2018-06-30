use "gir/FLAGS.sml";
use "gir/G_OBJECT_PARAM_FLAGS.sml";
use "gir/G_OBJECT_SIGNAL_FLAGS.sml";
use "gir/polyml/GObjectParamFlags.sml";
use "gir/polyml/GObjectSignalFlags.sml";

use "gir/G_I_REPOSITORY_FIELD_INFO_FLAGS.sml";
use "gir/G_I_REPOSITORY_FUNCTION_INFO_FLAGS.sml";
use "gir/G_I_REPOSITORY_V_FUNC_INFO_FLAGS.sml";
use "gir/G_I_REPOSITORY_DIRECTION.sml";
use "gir/G_I_REPOSITORY_SCOPE_TYPE.sml";
use "gir/G_I_REPOSITORY_TRANSFER.sml";
use "gir/G_I_REPOSITORY_ARRAY_TYPE.sml";
use "gir/G_I_REPOSITORY_TYPE_TAG.sml";
use "gir/G_I_REPOSITORY_ARGUMENT.sml";
use "gir/G_I_REPOSITORY_BASE_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_CALLABLE_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_FUNCTION_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_SIGNAL_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_V_FUNC_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_REGISTERED_TYPE_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_ENUM_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_INTERFACE_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_OBJECT_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_STRUCT_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_UNION_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_ARG_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_ALIAS_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_CONSTANT_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_FIELD_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_PROPERTY_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_TYPE_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_VALUE_INFO_CLASS.sml";
use "gir/G_I_REPOSITORY_BASE_INFO.sml";
use "gir/G_I_REPOSITORY_TYPE_INFO.sml";
use "gir/G_I_REPOSITORY_ALIAS_INFO.sml";
use "gir/G_I_REPOSITORY_CONSTANT_INFO.sml";
use "gir/G_I_REPOSITORY_REGISTERED_TYPE_INFO.sml";
use "gir/G_I_REPOSITORY_VALUE_INFO.sml";
use "gir/G_I_REPOSITORY_ARG_INFO.sml";
use "gir/G_I_REPOSITORY_CALLABLE_INFO.sml";
use "gir/G_I_REPOSITORY_PROPERTY_INFO.sml";
use "gir/G_I_REPOSITORY_FUNCTION_INFO.sml";
use "gir/G_I_REPOSITORY_SIGNAL_INFO.sml";
use "gir/G_I_REPOSITORY_V_FUNC_INFO.sml";
use "gir/G_I_REPOSITORY_FIELD_INFO.sml";
use "gir/G_I_REPOSITORY_STRUCT_INFO.sml";
use "gir/G_I_REPOSITORY_UNION_INFO.sml";
use "gir/G_I_REPOSITORY_ENUM_INFO.sml";
use "gir/G_I_REPOSITORY_INTERFACE_INFO.sml";
use "gir/G_I_REPOSITORY_OBJECT_INFO.sml";
use "gir/G_I_REPOSITORY_REPOSITORY_LOAD_FLAGS.sml";
use "gir/G_I_REPOSITORY_REPOSITORY_CLASS.sml";
use "gir/G_I_REPOSITORY_TYPELIB_TYPE.sml";
use "gir/G_I_REPOSITORY_TYPELIB.sml";
use "gir/G_I_REPOSITORY_REPOSITORY.sml";
use "gir/G_I_REPOSITORY_INFO_TYPE.sml";
use "gir/G_I_REPOSITORY.sml";

use "gir/polyml/GIRepositoryFieldInfoFlags.sml";
use "gir/polyml/GIRepositoryFunctionInfoFlags.sml";
use "gir/polyml/GIRepositoryVFuncInfoFlags.sml";
use "gir/polyml/GIRepositoryDirection.sml";
use "gir/polyml/GIRepositoryScopeType.sml";
use "gir/polyml/GIRepositoryTransfer.sml";

use "gir/polyml/GIRepositoryArrayType.sml";
use "gir/polyml/GIRepositoryTypeTag.sml";
use "gir/polyml/GIRepositoryArgument.sml";
use "gir/polyml/Info.sml";
use "gir/polyml/GirTranslator.sml";

use "gir/polyml/GIRepositoryTypelibType.sml";
use "gir/polyml/GIRepositoryBaseInfoClass.sml";
use "gir/polyml/GIRepositoryCallableInfoClass.sml";
use "gir/polyml/GIRepositoryFunctionInfoClass.sml";
use "gir/polyml/GIRepositorySignalInfoClass.sml";
use "gir/polyml/GIRepositoryVFuncInfoClass.sml";
use "gir/polyml/GIRepositoryRegisteredTypeInfoClass.sml";
use "gir/polyml/GIRepositoryEnumInfoClass.sml";
use "gir/polyml/GIRepositoryInterfaceInfoClass.sml";
use "gir/polyml/GIRepositoryObjectInfoClass.sml";
use "gir/polyml/GIRepositoryStructInfoClass.sml";
use "gir/polyml/GIRepositoryUnionInfoClass.sml";
use "gir/polyml/GIRepositoryArgInfoClass.sml";
use "gir/polyml/GIRepositoryAliasInfoClass.sml";
use "gir/polyml/GIRepositoryConstantInfoClass.sml";
use "gir/polyml/GIRepositoryFieldInfoClass.sml";
use "gir/polyml/GIRepositoryPropertyInfoClass.sml";
use "gir/polyml/GIRepositoryTypeInfoClass.sml";
use "gir/polyml/GIRepositoryValueInfoClass.sml";
use "gir/polyml/GIRepositoryBaseInfo.sml";
use "gir/polyml/GIRepositoryTypeInfo.sml";
use "gir/polyml/GIRepositoryAliasInfo.sml";
use "gir/polyml/GIRepositoryConstantInfo.sml";
use "gir/polyml/GIRepositoryRegisteredTypeInfo.sml";
use "gir/polyml/GIRepositoryValueInfo.sml";
use "gir/polyml/GIRepositoryArgInfo.sml";
use "gir/polyml/GIRepositoryCallableInfo.sml";
use "gir/polyml/GIRepositoryPropertyInfo.sml";
use "gir/polyml/GIRepositoryFunctionInfo.sml";
use "gir/polyml/GIRepositorySignalInfo.sml";
use "gir/polyml/GIRepositoryVFuncInfo.sml";
use "gir/polyml/GIRepositoryFieldInfo.sml";
use "gir/polyml/GIRepositoryStructInfo.sml";
use "gir/polyml/GIRepositoryUnionInfo.sml";
use "gir/polyml/GIRepositoryEnumInfo.sml";
use "gir/polyml/GIRepositoryInterfaceInfo.sml";
use "gir/polyml/GIRepositoryObjectInfo.sml";
use "gir/polyml/GIRepositoryRepositoryLoadFlags.sml";
use "gir/polyml/GIRepositoryRepositoryClass.sml";
use "gir/polyml/GIRepositoryTypelib.sml";
use "gir/polyml/GIRepositoryRepository.sml";
use "gir/polyml/GIRepositoryInfoType.sml";
use "gir/polyml/GIRepository.sml";
