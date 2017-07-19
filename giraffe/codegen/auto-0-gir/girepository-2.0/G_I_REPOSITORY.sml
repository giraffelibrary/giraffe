signature G_I_REPOSITORY =
  sig
    structure BaseInfoRecord : G_I_REPOSITORY_BASE_INFO_RECORD
    structure TypelibRecord : G_I_REPOSITORY_TYPELIB_RECORD
    structure ArrayType : G_I_REPOSITORY_ARRAY_TYPE
    structure Direction : G_I_REPOSITORY_DIRECTION
    structure FieldInfoFlags : G_I_REPOSITORY_FIELD_INFO_FLAGS
    structure FunctionInfoFlags : G_I_REPOSITORY_FUNCTION_INFO_FLAGS
    structure InfoType : G_I_REPOSITORY_INFO_TYPE
    structure RepositoryClass : G_I_REPOSITORY_REPOSITORY_CLASS
    structure RepositoryError : G_I_REPOSITORY_REPOSITORY_ERROR
    structure RepositoryLoadFlags : G_I_REPOSITORY_REPOSITORY_LOAD_FLAGS
    structure ScopeType : G_I_REPOSITORY_SCOPE_TYPE
    structure Transfer : G_I_REPOSITORY_TRANSFER
    structure TypeTag : G_I_REPOSITORY_TYPE_TAG
    structure VFuncInfoFlags : G_I_REPOSITORY_V_FUNC_INFO_FLAGS
    structure NvokeError : G_I_REPOSITORY_NVOKE_ERROR
    exception NvokeError of NvokeError.t
    structure ArgInfoRecord : G_I_REPOSITORY_ARG_INFO_RECORD
    structure CallableInfoRecord : G_I_REPOSITORY_CALLABLE_INFO_RECORD
    structure CallbackInfoRecord : G_I_REPOSITORY_CALLBACK_INFO_RECORD
    structure ConstantInfoRecord : G_I_REPOSITORY_CONSTANT_INFO_RECORD
    structure EnumInfoRecord : G_I_REPOSITORY_ENUM_INFO_RECORD
    structure FieldInfoRecord : G_I_REPOSITORY_FIELD_INFO_RECORD
    structure FunctionInfoRecord : G_I_REPOSITORY_FUNCTION_INFO_RECORD
    structure InterfaceInfoRecord : G_I_REPOSITORY_INTERFACE_INFO_RECORD
    structure ObjectInfoRecord : G_I_REPOSITORY_OBJECT_INFO_RECORD
    structure PropertyInfoRecord : G_I_REPOSITORY_PROPERTY_INFO_RECORD
    structure RegisteredTypeInfoRecord : G_I_REPOSITORY_REGISTERED_TYPE_INFO_RECORD
    structure SignalInfoRecord : G_I_REPOSITORY_SIGNAL_INFO_RECORD
    structure StructInfoRecord : G_I_REPOSITORY_STRUCT_INFO_RECORD
    structure TypeInfoRecord : G_I_REPOSITORY_TYPE_INFO_RECORD
    structure UnionInfoRecord : G_I_REPOSITORY_UNION_INFO_RECORD
    structure VFuncInfoRecord : G_I_REPOSITORY_V_FUNC_INFO_RECORD
    structure ValueInfoRecord : G_I_REPOSITORY_VALUE_INFO_RECORD
    structure Repository :
      G_I_REPOSITORY_REPOSITORY
        where type 'a class = 'a RepositoryClass.class
        where type enum_info_t = EnumInfoRecord.t
        where type base_info_t = BaseInfoRecord.t
        where type typelib_t = TypelibRecord.t
        where type repository_load_flags_t = RepositoryLoadFlags.t
    val argInfoGetClosure : ArgInfoRecord.t -> LargeInt.int
    val argInfoGetDestroy : ArgInfoRecord.t -> LargeInt.int
    val argInfoGetDirection : ArgInfoRecord.t -> Direction.t
    val argInfoGetOwnershipTransfer : ArgInfoRecord.t -> Transfer.t
    val argInfoGetScope : ArgInfoRecord.t -> ScopeType.t
    val argInfoGetType : ArgInfoRecord.t -> TypeInfoRecord.t
    val argInfoIsCallerAllocates : ArgInfoRecord.t -> bool
    val argInfoIsOptional : ArgInfoRecord.t -> bool
    val argInfoIsReturnValue : ArgInfoRecord.t -> bool
    val argInfoIsSkip : ArgInfoRecord.t -> bool
    val argInfoLoadType : ArgInfoRecord.t -> TypeInfoRecord.t
    val argInfoMayBeNull : ArgInfoRecord.t -> bool
    val baseInfoGetType : BaseInfoRecord.t -> InfoType.t
    val callableInfoGetArg : CallableInfoRecord.t * LargeInt.int -> ArgInfoRecord.t
    val callableInfoGetCallerOwns : CallableInfoRecord.t -> Transfer.t
    val callableInfoGetNArgs : CallableInfoRecord.t -> LargeInt.int
    val callableInfoGetReturnAttribute : CallableInfoRecord.t * string -> string
    val callableInfoGetReturnType : CallableInfoRecord.t -> TypeInfoRecord.t
    val callableInfoIterateReturnAttributes : CallableInfoRecord.t * AttributeIterRecord.t -> (string * string) option
    val callableInfoLoadArg : CallableInfoRecord.t * LargeInt.int -> ArgInfoRecord.t
    val callableInfoLoadReturnType : CallableInfoRecord.t -> TypeInfoRecord.t
    val callableInfoMayReturnNull : CallableInfoRecord.t -> bool
    val callableInfoSkipReturn : CallableInfoRecord.t -> bool
    val constantInfoGetType : ConstantInfoRecord.t -> TypeInfoRecord.t
    val enumInfoGetErrorDomain : EnumInfoRecord.t -> string
    val enumInfoGetMethod : EnumInfoRecord.t * LargeInt.int -> FunctionInfoRecord.t
    val enumInfoGetNMethods : EnumInfoRecord.t -> LargeInt.int
    val enumInfoGetNValues : EnumInfoRecord.t -> LargeInt.int
    val enumInfoGetStorageType : EnumInfoRecord.t -> TypeTag.t
    val enumInfoGetValue : EnumInfoRecord.t * LargeInt.int -> ValueInfoRecord.t
    val fieldInfoGetFlags : FieldInfoRecord.t -> FieldInfoFlags.t
    val fieldInfoGetOffset : FieldInfoRecord.t -> LargeInt.int
    val fieldInfoGetSize : FieldInfoRecord.t -> LargeInt.int
    val fieldInfoGetType : FieldInfoRecord.t -> TypeInfoRecord.t
    val functionInfoGetFlags : FunctionInfoRecord.t -> FunctionInfoFlags.t
    val functionInfoGetProperty : FunctionInfoRecord.t -> PropertyInfoRecord.t
    val functionInfoGetSymbol : FunctionInfoRecord.t -> string
    val functionInfoGetVfunc : FunctionInfoRecord.t -> VFuncInfoRecord.t
    val infoNew :
      InfoType.t
       * BaseInfoRecord.t
       * TypelibRecord.t
       * LargeInt.int
       -> BaseInfoRecord.t
    val infoTypeToString : InfoType.t -> string
    val interfaceInfoFindMethod : InterfaceInfoRecord.t * string -> FunctionInfoRecord.t
    val interfaceInfoFindVfunc : InterfaceInfoRecord.t * string -> VFuncInfoRecord.t
    val interfaceInfoGetConstant : InterfaceInfoRecord.t * LargeInt.int -> ConstantInfoRecord.t
    val interfaceInfoGetIfaceStruct : InterfaceInfoRecord.t -> StructInfoRecord.t
    val interfaceInfoGetMethod : InterfaceInfoRecord.t * LargeInt.int -> FunctionInfoRecord.t
    val interfaceInfoGetNConstants : InterfaceInfoRecord.t -> LargeInt.int
    val interfaceInfoGetNMethods : InterfaceInfoRecord.t -> LargeInt.int
    val interfaceInfoGetNPrerequisites : InterfaceInfoRecord.t -> LargeInt.int
    val interfaceInfoGetNProperties : InterfaceInfoRecord.t -> LargeInt.int
    val interfaceInfoGetNSignals : InterfaceInfoRecord.t -> LargeInt.int
    val interfaceInfoGetNVfuncs : InterfaceInfoRecord.t -> LargeInt.int
    val interfaceInfoGetPrerequisite : InterfaceInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val interfaceInfoGetProperty : InterfaceInfoRecord.t * LargeInt.int -> PropertyInfoRecord.t
    val interfaceInfoGetSignal : InterfaceInfoRecord.t * LargeInt.int -> SignalInfoRecord.t
    val interfaceInfoGetVfunc : InterfaceInfoRecord.t * LargeInt.int -> VFuncInfoRecord.t
    val invokeErrorQuark : unit -> GLib.Quark.t
    val objectInfoFindMethod : ObjectInfoRecord.t * string -> FunctionInfoRecord.t
    val objectInfoFindMethodUsingInterfaces : ObjectInfoRecord.t * string -> FunctionInfoRecord.t * ObjectInfoRecord.t
    val objectInfoFindVfunc : ObjectInfoRecord.t * string -> VFuncInfoRecord.t
    val objectInfoGetAbstract : ObjectInfoRecord.t -> bool
    val objectInfoGetClassStruct : ObjectInfoRecord.t -> StructInfoRecord.t
    val objectInfoGetConstant : ObjectInfoRecord.t * LargeInt.int -> ConstantInfoRecord.t
    val objectInfoGetField : ObjectInfoRecord.t * LargeInt.int -> FieldInfoRecord.t
    val objectInfoGetFundamental : ObjectInfoRecord.t -> bool
    val objectInfoGetGetValueFunction : ObjectInfoRecord.t -> string
    val objectInfoGetInterface : ObjectInfoRecord.t * LargeInt.int -> InterfaceInfoRecord.t
    val objectInfoGetMethod : ObjectInfoRecord.t * LargeInt.int -> FunctionInfoRecord.t
    val objectInfoGetNConstants : ObjectInfoRecord.t -> LargeInt.int
    val objectInfoGetNFields : ObjectInfoRecord.t -> LargeInt.int
    val objectInfoGetNInterfaces : ObjectInfoRecord.t -> LargeInt.int
    val objectInfoGetNMethods : ObjectInfoRecord.t -> LargeInt.int
    val objectInfoGetNProperties : ObjectInfoRecord.t -> LargeInt.int
    val objectInfoGetNSignals : ObjectInfoRecord.t -> LargeInt.int
    val objectInfoGetNVfuncs : ObjectInfoRecord.t -> LargeInt.int
    val objectInfoGetParent : ObjectInfoRecord.t -> ObjectInfoRecord.t
    val objectInfoGetProperty : ObjectInfoRecord.t * LargeInt.int -> PropertyInfoRecord.t
    val objectInfoGetRefFunction : ObjectInfoRecord.t -> string
    val objectInfoGetSetValueFunction : ObjectInfoRecord.t -> string
    val objectInfoGetSignal : ObjectInfoRecord.t * LargeInt.int -> SignalInfoRecord.t
    val objectInfoGetTypeInit : ObjectInfoRecord.t -> string
    val objectInfoGetTypeName : ObjectInfoRecord.t -> string
    val objectInfoGetUnrefFunction : ObjectInfoRecord.t -> string
    val objectInfoGetVfunc : ObjectInfoRecord.t * LargeInt.int -> VFuncInfoRecord.t
    val propertyInfoGetFlags : PropertyInfoRecord.t -> GObject.ParamFlags.t
    val propertyInfoGetOwnershipTransfer : PropertyInfoRecord.t -> Transfer.t
    val propertyInfoGetType : PropertyInfoRecord.t -> TypeInfoRecord.t
    val registeredTypeInfoGetTypeInit : RegisteredTypeInfoRecord.t -> string
    val registeredTypeInfoGetTypeName : RegisteredTypeInfoRecord.t -> string
    val signalInfoGetClassClosure : SignalInfoRecord.t -> VFuncInfoRecord.t
    val signalInfoGetFlags : SignalInfoRecord.t -> GObject.SignalFlags.t
    val signalInfoTrueStopsEmit : SignalInfoRecord.t -> bool
    val structInfoFindMethod : StructInfoRecord.t * string -> FunctionInfoRecord.t
    val structInfoGetAlignment : StructInfoRecord.t -> LargeInt.int
    val structInfoGetField : StructInfoRecord.t * LargeInt.int -> FieldInfoRecord.t
    val structInfoGetMethod : StructInfoRecord.t * LargeInt.int -> FunctionInfoRecord.t
    val structInfoGetNFields : StructInfoRecord.t -> LargeInt.int
    val structInfoGetNMethods : StructInfoRecord.t -> LargeInt.int
    val structInfoGetSize : StructInfoRecord.t -> LargeInt.int
    val structInfoIsForeign : StructInfoRecord.t -> bool
    val structInfoIsGtypeStruct : StructInfoRecord.t -> bool
    val typeInfoGetArrayFixedSize : TypeInfoRecord.t -> LargeInt.int
    val typeInfoGetArrayLength : TypeInfoRecord.t -> LargeInt.int
    val typeInfoGetArrayType : TypeInfoRecord.t -> ArrayType.t
    val typeInfoGetInterface : TypeInfoRecord.t -> BaseInfoRecord.t
    val typeInfoGetParamType : TypeInfoRecord.t * LargeInt.int -> TypeInfoRecord.t
    val typeInfoGetTag : TypeInfoRecord.t -> TypeTag.t
    val typeInfoIsPointer : TypeInfoRecord.t -> bool
    val typeInfoIsZeroTerminated : TypeInfoRecord.t -> bool
    val typeTagToString : TypeTag.t -> string
    val unionInfoFindMethod : UnionInfoRecord.t * string -> FunctionInfoRecord.t
    val unionInfoGetAlignment : UnionInfoRecord.t -> LargeInt.int
    val unionInfoGetDiscriminator : UnionInfoRecord.t * LargeInt.int -> ConstantInfoRecord.t
    val unionInfoGetDiscriminatorOffset : UnionInfoRecord.t -> LargeInt.int
    val unionInfoGetDiscriminatorType : UnionInfoRecord.t -> TypeInfoRecord.t
    val unionInfoGetField : UnionInfoRecord.t * LargeInt.int -> FieldInfoRecord.t
    val unionInfoGetMethod : UnionInfoRecord.t * LargeInt.int -> FunctionInfoRecord.t
    val unionInfoGetNFields : UnionInfoRecord.t -> LargeInt.int
    val unionInfoGetNMethods : UnionInfoRecord.t -> LargeInt.int
    val unionInfoGetSize : UnionInfoRecord.t -> LargeInt.int
    val unionInfoIsDiscriminated : UnionInfoRecord.t -> bool
    val valueInfoGetValue : ValueInfoRecord.t -> LargeInt.int
    val vfuncInfoGetFlags : VFuncInfoRecord.t -> VFuncInfoFlags.t
    val vfuncInfoGetInvoker : VFuncInfoRecord.t -> FunctionInfoRecord.t
    val vfuncInfoGetOffset : VFuncInfoRecord.t -> LargeInt.int
    val vfuncInfoGetSignal : VFuncInfoRecord.t -> SignalInfoRecord.t
  end
