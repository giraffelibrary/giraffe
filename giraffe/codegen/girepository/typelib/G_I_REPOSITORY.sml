signature G_I_REPOSITORY =
  sig
    structure FieldInfoFlags : G_I_REPOSITORY_FIELD_INFO_FLAGS
    structure FunctionInfoFlags : G_I_REPOSITORY_FUNCTION_INFO_FLAGS
    structure VFuncInfoFlags : G_I_REPOSITORY_V_FUNC_INFO_FLAGS
    structure BaseInfoClass : G_I_REPOSITORY_BASE_INFO_CLASS
    structure CallableInfoClass : G_I_REPOSITORY_CALLABLE_INFO_CLASS
    structure FunctionInfoClass : G_I_REPOSITORY_FUNCTION_INFO_CLASS
    structure SignalInfoClass : G_I_REPOSITORY_SIGNAL_INFO_CLASS
    structure VFuncInfoClass : G_I_REPOSITORY_V_FUNC_INFO_CLASS
    structure RegisteredTypeInfoClass : G_I_REPOSITORY_REGISTERED_TYPE_INFO_CLASS
    structure EnumInfoClass : G_I_REPOSITORY_ENUM_INFO_CLASS
    structure InterfaceInfoClass : G_I_REPOSITORY_INTERFACE_INFO_CLASS
    structure ObjectInfoClass : G_I_REPOSITORY_OBJECT_INFO_CLASS
    structure StructInfoClass : G_I_REPOSITORY_STRUCT_INFO_CLASS
    structure UnionInfoClass : G_I_REPOSITORY_UNION_INFO_CLASS
    structure ArgInfoClass : G_I_REPOSITORY_ARG_INFO_CLASS
    structure ConstantInfoClass : G_I_REPOSITORY_CONSTANT_INFO_CLASS
    structure FieldInfoClass : G_I_REPOSITORY_FIELD_INFO_CLASS
    structure PropertyInfoClass : G_I_REPOSITORY_PROPERTY_INFO_CLASS
    structure TypeInfoClass : G_I_REPOSITORY_TYPE_INFO_CLASS
    structure ValueInfoClass : G_I_REPOSITORY_VALUE_INFO_CLASS
    structure TypeTag : G_I_REPOSITORY_TYPE_TAG
    structure ArrayType : G_I_REPOSITORY_ARRAY_TYPE
    structure BaseInfo :
      G_I_REPOSITORY_BASE_INFO
        where type 'a class_t = 'a BaseInfoClass.t
    structure TypeInfo :
      G_I_REPOSITORY_TYPE_INFO
        where type 'a class_t = 'a TypeInfoClass.t
        where type typetag_t = TypeTag.t
        where type arraytype_t = ArrayType.t
        where type 'a baseinfoclass_t = 'a BaseInfoClass.t
    structure Argument :
      G_I_REPOSITORY_ARGUMENT
        where type typetag_t = TypeTag.t
    structure ConstantInfo :
      G_I_REPOSITORY_CONSTANT_INFO
        where type 'a class_t = 'a ConstantInfoClass.t
        where type 'a typeinfoclass_t = 'a TypeInfoClass.t
        where type argument_t = Argument.t
    structure RegisteredTypeInfo :
      G_I_REPOSITORY_REGISTERED_TYPE_INFO
        where type 'a class_t = 'a RegisteredTypeInfoClass.t
    structure ValueInfo :
      G_I_REPOSITORY_VALUE_INFO
        where type 'a class_t = 'a ValueInfoClass.t
    structure Direction : G_I_REPOSITORY_DIRECTION
    structure ScopeType : G_I_REPOSITORY_SCOPE_TYPE
    structure Transfer : G_I_REPOSITORY_TRANSFER
    structure ArgInfo :
      G_I_REPOSITORY_ARG_INFO
        where type 'a class_t = 'a ArgInfoClass.t
        where type 'a typeinfoclass_t = 'a TypeInfoClass.t
        where type direction_t = Direction.t
        where type scopetype_t = ScopeType.t
        where type transfer_t = Transfer.t
    structure CallableInfo :
      G_I_REPOSITORY_CALLABLE_INFO
        where type 'a class_t = 'a CallableInfoClass.t
        where type 'a typeinfoclass_t = 'a TypeInfoClass.t
        where type transfer_t = Transfer.t
        where type 'a arginfoclass_t = 'a ArgInfoClass.t
    structure PropertyInfo :
      G_I_REPOSITORY_PROPERTY_INFO
        where type 'a class_t = 'a PropertyInfoClass.t
        where type 'a typeinfoclass_t = 'a TypeInfoClass.t
        where type transfer_t = Transfer.t
    structure FunctionInfo :
      G_I_REPOSITORY_FUNCTION_INFO
        where type 'a class_t = 'a FunctionInfoClass.t
        where type 'a propertyinfoclass_t = 'a PropertyInfoClass.t
        where type 'a vfuncinfoclass_t = 'a VFuncInfoClass.t
        where type functioninfoflags_t = FunctionInfoFlags.flags
    structure SignalInfo :
      G_I_REPOSITORY_SIGNAL_INFO
        where type 'a class_t = 'a SignalInfoClass.t
        where type 'a vfuncinfoclass_t = 'a VFuncInfoClass.t
    structure VFuncInfo :
      G_I_REPOSITORY_V_FUNC_INFO
        where type 'a class_t = 'a VFuncInfoClass.t
        where type 'a functioninfoclass_t = 'a FunctionInfoClass.t
        where type 'a signalinfoclass_t = 'a SignalInfoClass.t
        where type vfuncinfoflags_t = VFuncInfoFlags.flags
    structure FieldInfo :
      G_I_REPOSITORY_FIELD_INFO
        where type 'a class_t = 'a FieldInfoClass.t
        where type 'a typeinfoclass_t = 'a TypeInfoClass.t
        where type fieldinfoflags_t = FieldInfoFlags.flags
    structure StructInfo :
      G_I_REPOSITORY_STRUCT_INFO
        where type 'a class_t = 'a StructInfoClass.t
        where type 'a fieldinfoclass_t = 'a FieldInfoClass.t
        where type 'a functioninfoclass_t = 'a FunctionInfoClass.t
    structure UnionInfo :
      G_I_REPOSITORY_UNION_INFO
        where type 'a class_t = 'a UnionInfoClass.t
        where type 'a fieldinfoclass_t = 'a FieldInfoClass.t
        where type 'a functioninfoclass_t = 'a FunctionInfoClass.t
    structure EnumInfo :
      G_I_REPOSITORY_ENUM_INFO
        where type 'a class_t = 'a EnumInfoClass.t
        where type 'a valueinfoclass_t = 'a ValueInfoClass.t
        where type 'a functioninfoclass_t = 'a FunctionInfoClass.t
        where type typetag_t = TypeTag.t
    structure InterfaceInfo :
      G_I_REPOSITORY_INTERFACE_INFO
        where type 'a class_t = 'a InterfaceInfoClass.t
        where type 'a baseinfoclass_t = 'a BaseInfoClass.t
        where type 'a propertyinfoclass_t = 'a PropertyInfoClass.t
        where type 'a functioninfoclass_t = 'a FunctionInfoClass.t
        where type 'a signalinfoclass_t = 'a SignalInfoClass.t
        where type 'a vfuncinfoclass_t = 'a VFuncInfoClass.t
        where type 'a constantinfoclass_t = 'a ConstantInfoClass.t
        where type 'a structinfoclass_t = 'a StructInfoClass.t
    structure ObjectInfo :
      G_I_REPOSITORY_OBJECT_INFO
        where type 'a class_t = 'a ObjectInfoClass.t
        where type 'a baseinfoclass_t = 'a BaseInfoClass.t
        where type 'a interfaceinfoclass_t = 'a InterfaceInfoClass.t
        where type 'a fieldinfoclass_t = 'a FieldInfoClass.t
        where type 'a propertyinfoclass_t = 'a PropertyInfoClass.t
        where type 'a functioninfoclass_t = 'a FunctionInfoClass.t
        where type 'a signalinfoclass_t = 'a SignalInfoClass.t
        where type 'a vfuncinfoclass_t = 'a VFuncInfoClass.t
        where type 'a constantinfoclass_t = 'a ConstantInfoClass.t
        where type 'a structinfoclass_t = 'a StructInfoClass.t
    structure InfoType :
      G_I_REPOSITORY_INFO_TYPE
        where type 'a baseinfoclass_t = 'a BaseInfoClass.t
        where type 'a registeredtypeinfoclass_t = 'a RegisteredTypeInfoClass.t
        where type 'a callableinfoclass_t = 'a CallableInfoClass.t
        where type 'a functioninfoclass_t = 'a FunctionInfoClass.t
        where type 'a structinfoclass_t = 'a StructInfoClass.t
        where type 'a enuminfoclass_t = 'a EnumInfoClass.t
        where type 'a objectinfoclass_t = 'a ObjectInfoClass.t
        where type 'a interfaceinfoclass_t = 'a InterfaceInfoClass.t
        where type 'a constantinfoclass_t = 'a ConstantInfoClass.t
        where type 'a unioninfoclass_t = 'a UnionInfoClass.t
        where type 'a valueinfoclass_t = 'a ValueInfoClass.t
        where type 'a signalinfoclass_t = 'a SignalInfoClass.t
        where type 'a vfuncinfoclass_t = 'a VFuncInfoClass.t
        where type 'a propertyinfoclass_t = 'a PropertyInfoClass.t
        where type 'a fieldinfoclass_t = 'a FieldInfoClass.t
        where type 'a arginfoclass_t = 'a ArgInfoClass.t
        where type 'a typeinfoclass_t = 'a TypeInfoClass.t
    structure RepositoryLoadFlags : G_I_REPOSITORY_REPOSITORY_LOAD_FLAGS
    structure RepositoryClass : G_I_REPOSITORY_REPOSITORY_CLASS
    structure TypelibType : G_I_REPOSITORY_TYPELIB_TYPE
    structure Typelib :
      G_I_REPOSITORY_TYPELIB
        where type typelibtype_t = TypelibType.t
    structure Repository :
      G_I_REPOSITORY_REPOSITORY
        where type 'a class_t = 'a RepositoryClass.t
        where type 'a baseinfoclass_t = 'a BaseInfoClass.t
        where type loadflags_t = RepositoryLoadFlags.flags
        where type typelibtype_t = TypelibType.t
  end
