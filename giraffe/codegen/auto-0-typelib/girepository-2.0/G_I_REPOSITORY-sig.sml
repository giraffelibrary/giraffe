signature G_I_REPOSITORY =
  sig
    structure TypelibRecord : G_I_REPOSITORY_TYPELIB_RECORD
    structure ArrayType : G_I_REPOSITORY_ARRAY_TYPE
    structure BaseInfoRecord : G_I_REPOSITORY_BASE_INFO_RECORD
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
    structure BaseInfo :
      G_I_REPOSITORY_BASE_INFO
        where type t = BaseInfoRecord.t
        where type info_type_t = InfoType.t
    structure Repository :
      G_I_REPOSITORY_REPOSITORY
        where type 'a class = 'a RepositoryClass.class
        where type base_info_t = BaseInfoRecord.t
    val argInfoGetClosure : BaseInfoRecord.t -> LargeInt.int
    val argInfoGetDestroy : BaseInfoRecord.t -> LargeInt.int
    val argInfoGetDirection : BaseInfoRecord.t -> Direction.t
    val argInfoGetOwnershipTransfer : BaseInfoRecord.t -> Transfer.t
    val argInfoGetScope : BaseInfoRecord.t -> ScopeType.t
    val argInfoGetType : BaseInfoRecord.t -> BaseInfoRecord.t
    val argInfoIsCallerAllocates : BaseInfoRecord.t -> bool
    val argInfoIsOptional : BaseInfoRecord.t -> bool
    val argInfoIsReturnValue : BaseInfoRecord.t -> bool
    val argInfoIsSkip : BaseInfoRecord.t -> bool
    val argInfoLoadType : BaseInfoRecord.t -> BaseInfoRecord.t
    val argInfoMayBeNull : BaseInfoRecord.t -> bool
    val callableInfoCanThrowGerror : BaseInfoRecord.t -> bool
    val callableInfoGetArg : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val callableInfoGetCallerOwns : BaseInfoRecord.t -> Transfer.t
    val callableInfoGetInstanceOwnershipTransfer : BaseInfoRecord.t -> Transfer.t
    val callableInfoGetNArgs : BaseInfoRecord.t -> LargeInt.int
    val callableInfoGetReturnAttribute : BaseInfoRecord.t * string -> string
    val callableInfoGetReturnType : BaseInfoRecord.t -> BaseInfoRecord.t
    val callableInfoIsMethod : BaseInfoRecord.t -> bool
    val callableInfoLoadArg : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val callableInfoLoadReturnType : BaseInfoRecord.t -> BaseInfoRecord.t
    val callableInfoMayReturnNull : BaseInfoRecord.t -> bool
    val callableInfoSkipReturn : BaseInfoRecord.t -> bool
    val constantInfoGetType : BaseInfoRecord.t -> BaseInfoRecord.t
    val enumInfoGetErrorDomain : BaseInfoRecord.t -> string
    val enumInfoGetMethod : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val enumInfoGetNMethods : BaseInfoRecord.t -> LargeInt.int
    val enumInfoGetNValues : BaseInfoRecord.t -> LargeInt.int
    val enumInfoGetStorageType : BaseInfoRecord.t -> TypeTag.t
    val enumInfoGetValue : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val fieldInfoGetFlags : BaseInfoRecord.t -> FieldInfoFlags.t
    val fieldInfoGetOffset : BaseInfoRecord.t -> LargeInt.int
    val fieldInfoGetSize : BaseInfoRecord.t -> LargeInt.int
    val fieldInfoGetType : BaseInfoRecord.t -> BaseInfoRecord.t
    val functionInfoGetFlags : BaseInfoRecord.t -> FunctionInfoFlags.t
    val functionInfoGetProperty : BaseInfoRecord.t -> BaseInfoRecord.t
    val functionInfoGetSymbol : BaseInfoRecord.t -> string
    val functionInfoGetVfunc : BaseInfoRecord.t -> BaseInfoRecord.t
    val infoTypeToString : InfoType.t -> string
    val interfaceInfoFindMethod : BaseInfoRecord.t * string -> BaseInfoRecord.t
    val interfaceInfoFindSignal : BaseInfoRecord.t * string -> BaseInfoRecord.t
    val interfaceInfoFindVfunc : BaseInfoRecord.t * string -> BaseInfoRecord.t
    val interfaceInfoGetConstant : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val interfaceInfoGetIfaceStruct : BaseInfoRecord.t -> BaseInfoRecord.t
    val interfaceInfoGetMethod : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val interfaceInfoGetNConstants : BaseInfoRecord.t -> LargeInt.int
    val interfaceInfoGetNMethods : BaseInfoRecord.t -> LargeInt.int
    val interfaceInfoGetNPrerequisites : BaseInfoRecord.t -> LargeInt.int
    val interfaceInfoGetNProperties : BaseInfoRecord.t -> LargeInt.int
    val interfaceInfoGetNSignals : BaseInfoRecord.t -> LargeInt.int
    val interfaceInfoGetNVfuncs : BaseInfoRecord.t -> LargeInt.int
    val interfaceInfoGetPrerequisite : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val interfaceInfoGetProperty : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val interfaceInfoGetSignal : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val interfaceInfoGetVfunc : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val invokeErrorQuark : unit -> LargeInt.int
    val objectInfoFindMethod : BaseInfoRecord.t * string -> BaseInfoRecord.t
    val objectInfoFindMethodUsingInterfaces : BaseInfoRecord.t * string -> BaseInfoRecord.t * BaseInfoRecord.t
    val objectInfoFindSignal : BaseInfoRecord.t * string -> BaseInfoRecord.t
    val objectInfoFindVfunc : BaseInfoRecord.t * string -> BaseInfoRecord.t
    val objectInfoFindVfuncUsingInterfaces : BaseInfoRecord.t * string -> BaseInfoRecord.t * BaseInfoRecord.t
    val objectInfoGetAbstract : BaseInfoRecord.t -> bool
    val objectInfoGetClassStruct : BaseInfoRecord.t -> BaseInfoRecord.t
    val objectInfoGetConstant : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val objectInfoGetField : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val objectInfoGetFundamental : BaseInfoRecord.t -> bool
    val objectInfoGetGetValueFunction : BaseInfoRecord.t -> string
    val objectInfoGetInterface : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val objectInfoGetMethod : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val objectInfoGetNConstants : BaseInfoRecord.t -> LargeInt.int
    val objectInfoGetNFields : BaseInfoRecord.t -> LargeInt.int
    val objectInfoGetNInterfaces : BaseInfoRecord.t -> LargeInt.int
    val objectInfoGetNMethods : BaseInfoRecord.t -> LargeInt.int
    val objectInfoGetNProperties : BaseInfoRecord.t -> LargeInt.int
    val objectInfoGetNSignals : BaseInfoRecord.t -> LargeInt.int
    val objectInfoGetNVfuncs : BaseInfoRecord.t -> LargeInt.int
    val objectInfoGetParent : BaseInfoRecord.t -> BaseInfoRecord.t
    val objectInfoGetProperty : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val objectInfoGetRefFunction : BaseInfoRecord.t -> string
    val objectInfoGetSetValueFunction : BaseInfoRecord.t -> string
    val objectInfoGetSignal : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val objectInfoGetTypeInit : BaseInfoRecord.t -> string
    val objectInfoGetTypeName : BaseInfoRecord.t -> string
    val objectInfoGetUnrefFunction : BaseInfoRecord.t -> string
    val objectInfoGetVfunc : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val propertyInfoGetFlags : BaseInfoRecord.t -> GObject.ParamFlags.t
    val propertyInfoGetOwnershipTransfer : BaseInfoRecord.t -> Transfer.t
    val propertyInfoGetType : BaseInfoRecord.t -> BaseInfoRecord.t
    val registeredTypeInfoGetGType : BaseInfoRecord.t -> GObject.Type.t
    val registeredTypeInfoGetTypeInit : BaseInfoRecord.t -> string
    val registeredTypeInfoGetTypeName : BaseInfoRecord.t -> string
    val signalInfoGetClassClosure : BaseInfoRecord.t -> BaseInfoRecord.t
    val signalInfoGetFlags : BaseInfoRecord.t -> GObject.SignalFlags.t
    val signalInfoTrueStopsEmit : BaseInfoRecord.t -> bool
    val structInfoFindField : BaseInfoRecord.t * string -> BaseInfoRecord.t
    val structInfoFindMethod : BaseInfoRecord.t * string -> BaseInfoRecord.t
    val structInfoGetAlignment : BaseInfoRecord.t -> LargeInt.int
    val structInfoGetField : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val structInfoGetMethod : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val structInfoGetNFields : BaseInfoRecord.t -> LargeInt.int
    val structInfoGetNMethods : BaseInfoRecord.t -> LargeInt.int
    val structInfoGetSize : BaseInfoRecord.t -> LargeInt.int
    val structInfoIsForeign : BaseInfoRecord.t -> bool
    val structInfoIsGtypeStruct : BaseInfoRecord.t -> bool
    val typeInfoGetArrayFixedSize : BaseInfoRecord.t -> LargeInt.int
    val typeInfoGetArrayLength : BaseInfoRecord.t -> LargeInt.int
    val typeInfoGetArrayType : BaseInfoRecord.t -> ArrayType.t
    val typeInfoGetInterface : BaseInfoRecord.t -> BaseInfoRecord.t
    val typeInfoGetParamType : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val typeInfoGetTag : BaseInfoRecord.t -> TypeTag.t
    val typeInfoIsPointer : BaseInfoRecord.t -> bool
    val typeInfoIsZeroTerminated : BaseInfoRecord.t -> bool
    val typeTagToString : TypeTag.t -> string
    val unionInfoFindMethod : BaseInfoRecord.t * string -> BaseInfoRecord.t
    val unionInfoGetAlignment : BaseInfoRecord.t -> LargeInt.int
    val unionInfoGetDiscriminator : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val unionInfoGetDiscriminatorOffset : BaseInfoRecord.t -> LargeInt.int
    val unionInfoGetDiscriminatorType : BaseInfoRecord.t -> BaseInfoRecord.t
    val unionInfoGetField : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val unionInfoGetMethod : BaseInfoRecord.t * LargeInt.int -> BaseInfoRecord.t
    val unionInfoGetNFields : BaseInfoRecord.t -> LargeInt.int
    val unionInfoGetNMethods : BaseInfoRecord.t -> LargeInt.int
    val unionInfoGetSize : BaseInfoRecord.t -> LargeInt.int
    val unionInfoIsDiscriminated : BaseInfoRecord.t -> bool
    val valueInfoGetValue : BaseInfoRecord.t -> LargeInt.int
    val vfuncInfoGetFlags : BaseInfoRecord.t -> VFuncInfoFlags.t
    val vfuncInfoGetInvoker : BaseInfoRecord.t -> BaseInfoRecord.t
    val vfuncInfoGetOffset : BaseInfoRecord.t -> LargeInt.int
    val vfuncInfoGetSignal : BaseInfoRecord.t -> BaseInfoRecord.t
  end
