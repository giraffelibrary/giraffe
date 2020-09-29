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
    structure AliasInfoClass : G_I_REPOSITORY_ALIAS_INFO_CLASS
    structure ConstantInfoClass : G_I_REPOSITORY_CONSTANT_INFO_CLASS
    structure FieldInfoClass : G_I_REPOSITORY_FIELD_INFO_CLASS
    structure PropertyInfoClass : G_I_REPOSITORY_PROPERTY_INFO_CLASS
    structure TypeInfoClass : G_I_REPOSITORY_TYPE_INFO_CLASS
    structure ValueInfoClass : G_I_REPOSITORY_VALUE_INFO_CLASS
    structure TypeTag : G_I_REPOSITORY_TYPE_TAG
    structure ArrayType : G_I_REPOSITORY_ARRAY_TYPE
    structure BaseInfo :
      G_I_REPOSITORY_BASE_INFO
        where type 'a class = 'a BaseInfoClass.class
    structure TypeInfo :
      G_I_REPOSITORY_TYPE_INFO
        where type 'a class = 'a TypeInfoClass.class
        where type typetag_t = TypeTag.t
        where type arraytype_t = ArrayType.t
        where type 'a baseinfo_class = 'a BaseInfoClass.class
    structure Argument :
      G_I_REPOSITORY_ARGUMENT
        where type typetag_t = TypeTag.t
    structure AliasInfo :
      G_I_REPOSITORY_ALIAS_INFO
        where type 'a class = 'a AliasInfoClass.class
        where type 'a typeinfo_class = 'a TypeInfoClass.class
    structure ConstantInfo :
      G_I_REPOSITORY_CONSTANT_INFO
        where type 'a class = 'a ConstantInfoClass.class
        where type 'a typeinfo_class = 'a TypeInfoClass.class
        where type argument_t = Argument.t
    structure RegisteredTypeInfo :
      G_I_REPOSITORY_REGISTERED_TYPE_INFO
        where type 'a class = 'a RegisteredTypeInfoClass.class
    structure ValueInfo :
      G_I_REPOSITORY_VALUE_INFO
        where type 'a class = 'a ValueInfoClass.class
    structure Direction : G_I_REPOSITORY_DIRECTION
    structure ScopeType : G_I_REPOSITORY_SCOPE_TYPE
    structure Transfer : G_I_REPOSITORY_TRANSFER
    structure ArgInfo :
      G_I_REPOSITORY_ARG_INFO
        where type 'a class = 'a ArgInfoClass.class
        where type 'a typeinfo_class = 'a TypeInfoClass.class
        where type direction_t = Direction.t
        where type scopetype_t = ScopeType.t
        where type transfer_t = Transfer.t
    structure CallableInfo :
      G_I_REPOSITORY_CALLABLE_INFO
        where type 'a class = 'a CallableInfoClass.class
        where type 'a typeinfo_class = 'a TypeInfoClass.class
        where type transfer_t = Transfer.t
        where type 'a arginfo_class = 'a ArgInfoClass.class
    structure PropertyInfo :
      G_I_REPOSITORY_PROPERTY_INFO
        where type 'a class = 'a PropertyInfoClass.class
        where type 'a typeinfo_class = 'a TypeInfoClass.class
        where type transfer_t = Transfer.t
    structure FunctionInfo :
      G_I_REPOSITORY_FUNCTION_INFO
        where type 'a class = 'a FunctionInfoClass.class
        where type 'a propertyinfo_class = 'a PropertyInfoClass.class
        where type 'a vfuncinfo_class = 'a VFuncInfoClass.class
        where type functioninfoflags_t = FunctionInfoFlags.flags
    structure SignalInfo :
      G_I_REPOSITORY_SIGNAL_INFO
        where type 'a class = 'a SignalInfoClass.class
        where type 'a vfuncinfo_class = 'a VFuncInfoClass.class
    structure VFuncInfo :
      G_I_REPOSITORY_V_FUNC_INFO
        where type 'a class = 'a VFuncInfoClass.class
        where type 'a functioninfo_class = 'a FunctionInfoClass.class
        where type 'a signalinfo_class = 'a SignalInfoClass.class
        where type vfuncinfoflags_t = VFuncInfoFlags.flags
    structure FieldInfo :
      G_I_REPOSITORY_FIELD_INFO
        where type 'a class = 'a FieldInfoClass.class
        where type 'a typeinfo_class = 'a TypeInfoClass.class
        where type fieldinfoflags_t = FieldInfoFlags.flags
    structure StructInfo :
      G_I_REPOSITORY_STRUCT_INFO
        where type 'a class = 'a StructInfoClass.class
        where type 'a fieldinfo_class = 'a FieldInfoClass.class
        where type 'a functioninfo_class = 'a FunctionInfoClass.class
    structure UnionInfo :
      G_I_REPOSITORY_UNION_INFO
        where type 'a class = 'a UnionInfoClass.class
        where type 'a fieldinfo_class = 'a FieldInfoClass.class
        where type 'a functioninfo_class = 'a FunctionInfoClass.class
    structure EnumInfo :
      G_I_REPOSITORY_ENUM_INFO
        where type 'a class = 'a EnumInfoClass.class
        where type 'a valueinfo_class = 'a ValueInfoClass.class
        where type 'a functioninfo_class = 'a FunctionInfoClass.class
        where type typetag_t = TypeTag.t
    structure InterfaceInfo :
      G_I_REPOSITORY_INTERFACE_INFO
        where type 'a class = 'a InterfaceInfoClass.class
        where type 'a baseinfo_class = 'a BaseInfoClass.class
        where type 'a propertyinfo_class = 'a PropertyInfoClass.class
        where type 'a functioninfo_class = 'a FunctionInfoClass.class
        where type 'a signalinfo_class = 'a SignalInfoClass.class
        where type 'a vfuncinfo_class = 'a VFuncInfoClass.class
        where type 'a constantinfo_class = 'a ConstantInfoClass.class
        where type 'a structinfo_class = 'a StructInfoClass.class
    structure ObjectInfo :
      G_I_REPOSITORY_OBJECT_INFO
        where type 'a class = 'a ObjectInfoClass.class
        where type 'a baseinfo_class = 'a BaseInfoClass.class
        where type 'a interfaceinfo_class = 'a InterfaceInfoClass.class
        where type 'a fieldinfo_class = 'a FieldInfoClass.class
        where type 'a propertyinfo_class = 'a PropertyInfoClass.class
        where type 'a functioninfo_class = 'a FunctionInfoClass.class
        where type 'a signalinfo_class = 'a SignalInfoClass.class
        where type 'a vfuncinfo_class = 'a VFuncInfoClass.class
        where type 'a constantinfo_class = 'a ConstantInfoClass.class
        where type 'a structinfo_class = 'a StructInfoClass.class
    structure InfoType :
      G_I_REPOSITORY_INFO_TYPE
        where type 'a baseinfo_class = 'a BaseInfoClass.class
        where type 'a registeredtypeinfo_class = 'a RegisteredTypeInfoClass.class
        where type 'a callableinfo_class = 'a CallableInfoClass.class
        where type 'a functioninfo_class = 'a FunctionInfoClass.class
        where type 'a structinfo_class = 'a StructInfoClass.class
        where type 'a enuminfo_class = 'a EnumInfoClass.class
        where type 'a objectinfo_class = 'a ObjectInfoClass.class
        where type 'a interfaceinfo_class = 'a InterfaceInfoClass.class
        where type 'a constantinfo_class = 'a ConstantInfoClass.class
        where type 'a unioninfo_class = 'a UnionInfoClass.class
        where type 'a valueinfo_class = 'a ValueInfoClass.class
        where type 'a signalinfo_class = 'a SignalInfoClass.class
        where type 'a vfuncinfo_class = 'a VFuncInfoClass.class
        where type 'a propertyinfo_class = 'a PropertyInfoClass.class
        where type 'a fieldinfo_class = 'a FieldInfoClass.class
        where type 'a arginfo_class = 'a ArgInfoClass.class
        where type 'a typeinfo_class = 'a TypeInfoClass.class
    structure RepositoryLoadFlags : G_I_REPOSITORY_REPOSITORY_LOAD_FLAGS
    structure RepositoryClass : G_I_REPOSITORY_REPOSITORY_CLASS
    structure TypelibType : G_I_REPOSITORY_TYPELIB_TYPE
    structure Typelib :
      G_I_REPOSITORY_TYPELIB
        where type typelibtype_t = TypelibType.t
    structure Repository :
      G_I_REPOSITORY_REPOSITORY
        where type 'a class = 'a RepositoryClass.class
        where type 'a baseinfo_class = 'a BaseInfoClass.class
        where type loadflags_t = RepositoryLoadFlags.flags
        where type typelibtype_t = TypelibType.t
  end
