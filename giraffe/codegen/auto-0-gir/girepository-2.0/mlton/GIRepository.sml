structure GIRepository : G_I_REPOSITORY =
  struct
    val argInfoGetClosure_ = _import "g_arg_info_get_closure" : GIRepositoryArgInfoRecord.C.notnull GIRepositoryArgInfoRecord.C.p -> FFI.Int.C.val_;
    val argInfoGetDestroy_ = _import "g_arg_info_get_destroy" : GIRepositoryArgInfoRecord.C.notnull GIRepositoryArgInfoRecord.C.p -> FFI.Int.C.val_;
    val argInfoGetDirection_ = _import "g_arg_info_get_direction" : GIRepositoryArgInfoRecord.C.notnull GIRepositoryArgInfoRecord.C.p -> GIRepositoryDirection.C.val_;
    val argInfoGetOwnershipTransfer_ = _import "g_arg_info_get_ownership_transfer" : GIRepositoryArgInfoRecord.C.notnull GIRepositoryArgInfoRecord.C.p -> GIRepositoryTransfer.C.val_;
    val argInfoGetScope_ = _import "g_arg_info_get_scope" : GIRepositoryArgInfoRecord.C.notnull GIRepositoryArgInfoRecord.C.p -> GIRepositoryScopeType.C.val_;
    val argInfoGetType_ = _import "g_arg_info_get_type" : GIRepositoryArgInfoRecord.C.notnull GIRepositoryArgInfoRecord.C.p -> GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p;
    val argInfoIsCallerAllocates_ = _import "g_arg_info_is_caller_allocates" : GIRepositoryArgInfoRecord.C.notnull GIRepositoryArgInfoRecord.C.p -> FFI.Bool.C.val_;
    val argInfoIsOptional_ = _import "g_arg_info_is_optional" : GIRepositoryArgInfoRecord.C.notnull GIRepositoryArgInfoRecord.C.p -> FFI.Bool.C.val_;
    val argInfoIsReturnValue_ = _import "g_arg_info_is_return_value" : GIRepositoryArgInfoRecord.C.notnull GIRepositoryArgInfoRecord.C.p -> FFI.Bool.C.val_;
    val argInfoIsSkip_ = _import "g_arg_info_is_skip" : GIRepositoryArgInfoRecord.C.notnull GIRepositoryArgInfoRecord.C.p -> FFI.Bool.C.val_;
    val argInfoLoadType_ = fn x1 & x2 => (_import "g_arg_info_load_type" : GIRepositoryArgInfoRecord.C.notnull GIRepositoryArgInfoRecord.C.p * GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p -> unit;) (x1, x2)
    val argInfoMayBeNull_ = _import "g_arg_info_may_be_null" : GIRepositoryArgInfoRecord.C.notnull GIRepositoryArgInfoRecord.C.p -> FFI.Bool.C.val_;
    val baseInfoGetType_ = _import "g_base_info_get_type" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryInfoType.C.val_;
    val callableInfoGetArg_ = fn x1 & x2 => (_import "g_callable_info_get_arg" : GIRepositoryCallableInfoRecord.C.notnull GIRepositoryCallableInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryArgInfoRecord.C.notnull GIRepositoryArgInfoRecord.C.p;) (x1, x2)
    val callableInfoGetCallerOwns_ = _import "g_callable_info_get_caller_owns" : GIRepositoryCallableInfoRecord.C.notnull GIRepositoryCallableInfoRecord.C.p -> GIRepositoryTransfer.C.val_;
    val callableInfoGetNArgs_ = _import "g_callable_info_get_n_args" : GIRepositoryCallableInfoRecord.C.notnull GIRepositoryCallableInfoRecord.C.p -> FFI.Int.C.val_;
    val callableInfoGetReturnAttribute_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_callable_info_get_return_attribute" :
              GIRepositoryCallableInfoRecord.C.notnull GIRepositoryCallableInfoRecord.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val callableInfoGetReturnType_ = _import "g_callable_info_get_return_type" : GIRepositoryCallableInfoRecord.C.notnull GIRepositoryCallableInfoRecord.C.p -> GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p;
    val callableInfoIterateReturnAttributes_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_callable_info_iterate_return_attributes" :
              GIRepositoryCallableInfoRecord.C.notnull GIRepositoryCallableInfoRecord.C.p
               * GIRepositoryAttributeIterRecord.C.notnull GIRepositoryAttributeIterRecord.C.p
               * GCharVec.MLton.r1
               * (unit, GCharVec.C.notnull) GCharVec.MLton.r2
               * GCharVec.MLton.r1
               * (unit, GCharVec.C.notnull) GCharVec.MLton.r2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val callableInfoLoadArg_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_callable_info_load_arg" :
              GIRepositoryCallableInfoRecord.C.notnull GIRepositoryCallableInfoRecord.C.p
               * FFI.Int.C.val_
               * GIRepositoryArgInfoRecord.C.notnull GIRepositoryArgInfoRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val callableInfoLoadReturnType_ = fn x1 & x2 => (_import "g_callable_info_load_return_type" : GIRepositoryCallableInfoRecord.C.notnull GIRepositoryCallableInfoRecord.C.p * GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p -> unit;) (x1, x2)
    val callableInfoMayReturnNull_ = _import "g_callable_info_may_return_null" : GIRepositoryCallableInfoRecord.C.notnull GIRepositoryCallableInfoRecord.C.p -> FFI.Bool.C.val_;
    val callableInfoSkipReturn_ = _import "g_callable_info_skip_return" : GIRepositoryCallableInfoRecord.C.notnull GIRepositoryCallableInfoRecord.C.p -> FFI.Bool.C.val_;
    val constantInfoGetType_ = _import "g_constant_info_get_type" : GIRepositoryConstantInfoRecord.C.notnull GIRepositoryConstantInfoRecord.C.p -> GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p;
    val enumInfoGetErrorDomain_ = _import "g_enum_info_get_error_domain" : GIRepositoryEnumInfoRecord.C.notnull GIRepositoryEnumInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val enumInfoGetMethod_ = fn x1 & x2 => (_import "g_enum_info_get_method" : GIRepositoryEnumInfoRecord.C.notnull GIRepositoryEnumInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryFunctionInfoRecord.C.notnull GIRepositoryFunctionInfoRecord.C.p;) (x1, x2)
    val enumInfoGetNMethods_ = _import "g_enum_info_get_n_methods" : GIRepositoryEnumInfoRecord.C.notnull GIRepositoryEnumInfoRecord.C.p -> FFI.Int.C.val_;
    val enumInfoGetNValues_ = _import "g_enum_info_get_n_values" : GIRepositoryEnumInfoRecord.C.notnull GIRepositoryEnumInfoRecord.C.p -> FFI.Int.C.val_;
    val enumInfoGetStorageType_ = _import "g_enum_info_get_storage_type" : GIRepositoryEnumInfoRecord.C.notnull GIRepositoryEnumInfoRecord.C.p -> GIRepositoryTypeTag.C.val_;
    val enumInfoGetValue_ = fn x1 & x2 => (_import "g_enum_info_get_value" : GIRepositoryEnumInfoRecord.C.notnull GIRepositoryEnumInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryValueInfoRecord.C.notnull GIRepositoryValueInfoRecord.C.p;) (x1, x2)
    val fieldInfoGetFlags_ = _import "g_field_info_get_flags" : GIRepositoryFieldInfoRecord.C.notnull GIRepositoryFieldInfoRecord.C.p -> GIRepositoryFieldInfoFlags.C.val_;
    val fieldInfoGetOffset_ = _import "g_field_info_get_offset" : GIRepositoryFieldInfoRecord.C.notnull GIRepositoryFieldInfoRecord.C.p -> FFI.Int.C.val_;
    val fieldInfoGetSize_ = _import "g_field_info_get_size" : GIRepositoryFieldInfoRecord.C.notnull GIRepositoryFieldInfoRecord.C.p -> FFI.Int.C.val_;
    val fieldInfoGetType_ = _import "g_field_info_get_type" : GIRepositoryFieldInfoRecord.C.notnull GIRepositoryFieldInfoRecord.C.p -> GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p;
    val functionInfoGetFlags_ = _import "g_function_info_get_flags" : GIRepositoryFunctionInfoRecord.C.notnull GIRepositoryFunctionInfoRecord.C.p -> GIRepositoryFunctionInfoFlags.C.val_;
    val functionInfoGetProperty_ = _import "g_function_info_get_property" : GIRepositoryFunctionInfoRecord.C.notnull GIRepositoryFunctionInfoRecord.C.p -> GIRepositoryPropertyInfoRecord.C.notnull GIRepositoryPropertyInfoRecord.C.p;
    val functionInfoGetSymbol_ = _import "g_function_info_get_symbol" : GIRepositoryFunctionInfoRecord.C.notnull GIRepositoryFunctionInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val functionInfoGetVfunc_ = _import "g_function_info_get_vfunc" : GIRepositoryFunctionInfoRecord.C.notnull GIRepositoryFunctionInfoRecord.C.p -> GIRepositoryVFuncInfoRecord.C.notnull GIRepositoryVFuncInfoRecord.C.p;
    val infoNew_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_info_new" :
              GIRepositoryInfoType.C.val_
               * GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p
               * GIRepositoryTypelibRecord.C.notnull GIRepositoryTypelibRecord.C.p
               * FFI.UInt32.C.val_
               -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val infoTypeToString_ = _import "g_info_type_to_string" : GIRepositoryInfoType.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val interfaceInfoFindMethod_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_interface_info_find_method" :
              GIRepositoryInterfaceInfoRecord.C.notnull GIRepositoryInterfaceInfoRecord.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> GIRepositoryFunctionInfoRecord.C.notnull GIRepositoryFunctionInfoRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val interfaceInfoFindVfunc_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_interface_info_find_vfunc" :
              GIRepositoryInterfaceInfoRecord.C.notnull GIRepositoryInterfaceInfoRecord.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> GIRepositoryVFuncInfoRecord.C.notnull GIRepositoryVFuncInfoRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val interfaceInfoGetConstant_ = fn x1 & x2 => (_import "g_interface_info_get_constant" : GIRepositoryInterfaceInfoRecord.C.notnull GIRepositoryInterfaceInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryConstantInfoRecord.C.notnull GIRepositoryConstantInfoRecord.C.p;) (x1, x2)
    val interfaceInfoGetIfaceStruct_ = _import "g_interface_info_get_iface_struct" : GIRepositoryInterfaceInfoRecord.C.notnull GIRepositoryInterfaceInfoRecord.C.p -> GIRepositoryStructInfoRecord.C.notnull GIRepositoryStructInfoRecord.C.p;
    val interfaceInfoGetMethod_ = fn x1 & x2 => (_import "g_interface_info_get_method" : GIRepositoryInterfaceInfoRecord.C.notnull GIRepositoryInterfaceInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryFunctionInfoRecord.C.notnull GIRepositoryFunctionInfoRecord.C.p;) (x1, x2)
    val interfaceInfoGetNConstants_ = _import "g_interface_info_get_n_constants" : GIRepositoryInterfaceInfoRecord.C.notnull GIRepositoryInterfaceInfoRecord.C.p -> FFI.Int.C.val_;
    val interfaceInfoGetNMethods_ = _import "g_interface_info_get_n_methods" : GIRepositoryInterfaceInfoRecord.C.notnull GIRepositoryInterfaceInfoRecord.C.p -> FFI.Int.C.val_;
    val interfaceInfoGetNPrerequisites_ = _import "g_interface_info_get_n_prerequisites" : GIRepositoryInterfaceInfoRecord.C.notnull GIRepositoryInterfaceInfoRecord.C.p -> FFI.Int.C.val_;
    val interfaceInfoGetNProperties_ = _import "g_interface_info_get_n_properties" : GIRepositoryInterfaceInfoRecord.C.notnull GIRepositoryInterfaceInfoRecord.C.p -> FFI.Int.C.val_;
    val interfaceInfoGetNSignals_ = _import "g_interface_info_get_n_signals" : GIRepositoryInterfaceInfoRecord.C.notnull GIRepositoryInterfaceInfoRecord.C.p -> FFI.Int.C.val_;
    val interfaceInfoGetNVfuncs_ = _import "g_interface_info_get_n_vfuncs" : GIRepositoryInterfaceInfoRecord.C.notnull GIRepositoryInterfaceInfoRecord.C.p -> FFI.Int.C.val_;
    val interfaceInfoGetPrerequisite_ = fn x1 & x2 => (_import "g_interface_info_get_prerequisite" : GIRepositoryInterfaceInfoRecord.C.notnull GIRepositoryInterfaceInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val interfaceInfoGetProperty_ = fn x1 & x2 => (_import "g_interface_info_get_property" : GIRepositoryInterfaceInfoRecord.C.notnull GIRepositoryInterfaceInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryPropertyInfoRecord.C.notnull GIRepositoryPropertyInfoRecord.C.p;) (x1, x2)
    val interfaceInfoGetSignal_ = fn x1 & x2 => (_import "g_interface_info_get_signal" : GIRepositoryInterfaceInfoRecord.C.notnull GIRepositoryInterfaceInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositorySignalInfoRecord.C.notnull GIRepositorySignalInfoRecord.C.p;) (x1, x2)
    val interfaceInfoGetVfunc_ = fn x1 & x2 => (_import "g_interface_info_get_vfunc" : GIRepositoryInterfaceInfoRecord.C.notnull GIRepositoryInterfaceInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryVFuncInfoRecord.C.notnull GIRepositoryVFuncInfoRecord.C.p;) (x1, x2)
    val invokeErrorQuark_ = _import "g_invoke_error_quark" : unit -> GLibQuark.C.val_;
    val objectInfoFindMethod_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_object_info_find_method" :
              GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> GIRepositoryFunctionInfoRecord.C.notnull GIRepositoryFunctionInfoRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val objectInfoFindMethodUsingInterfaces_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_info_find_method_using_interfaces" :
              GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * (unit, GIRepositoryObjectInfoRecord.C.notnull) GIRepositoryObjectInfoRecord.C.r
               -> GIRepositoryFunctionInfoRecord.C.notnull GIRepositoryFunctionInfoRecord.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val objectInfoFindVfunc_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_object_info_find_vfunc" :
              GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> GIRepositoryVFuncInfoRecord.C.notnull GIRepositoryVFuncInfoRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val objectInfoGetAbstract_ = _import "g_object_info_get_abstract" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> FFI.Bool.C.val_;
    val objectInfoGetClassStruct_ = _import "g_object_info_get_class_struct" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> GIRepositoryStructInfoRecord.C.notnull GIRepositoryStructInfoRecord.C.p;
    val objectInfoGetConstant_ = fn x1 & x2 => (_import "g_object_info_get_constant" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryConstantInfoRecord.C.notnull GIRepositoryConstantInfoRecord.C.p;) (x1, x2)
    val objectInfoGetField_ = fn x1 & x2 => (_import "g_object_info_get_field" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryFieldInfoRecord.C.notnull GIRepositoryFieldInfoRecord.C.p;) (x1, x2)
    val objectInfoGetFundamental_ = _import "g_object_info_get_fundamental" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> FFI.Bool.C.val_;
    val objectInfoGetGetValueFunction_ = _import "g_object_info_get_get_value_function" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val objectInfoGetInterface_ = fn x1 & x2 => (_import "g_object_info_get_interface" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryInterfaceInfoRecord.C.notnull GIRepositoryInterfaceInfoRecord.C.p;) (x1, x2)
    val objectInfoGetMethod_ = fn x1 & x2 => (_import "g_object_info_get_method" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryFunctionInfoRecord.C.notnull GIRepositoryFunctionInfoRecord.C.p;) (x1, x2)
    val objectInfoGetNConstants_ = _import "g_object_info_get_n_constants" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> FFI.Int.C.val_;
    val objectInfoGetNFields_ = _import "g_object_info_get_n_fields" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> FFI.Int.C.val_;
    val objectInfoGetNInterfaces_ = _import "g_object_info_get_n_interfaces" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> FFI.Int.C.val_;
    val objectInfoGetNMethods_ = _import "g_object_info_get_n_methods" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> FFI.Int.C.val_;
    val objectInfoGetNProperties_ = _import "g_object_info_get_n_properties" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> FFI.Int.C.val_;
    val objectInfoGetNSignals_ = _import "g_object_info_get_n_signals" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> FFI.Int.C.val_;
    val objectInfoGetNVfuncs_ = _import "g_object_info_get_n_vfuncs" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> FFI.Int.C.val_;
    val objectInfoGetParent_ = _import "g_object_info_get_parent" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p;
    val objectInfoGetProperty_ = fn x1 & x2 => (_import "g_object_info_get_property" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryPropertyInfoRecord.C.notnull GIRepositoryPropertyInfoRecord.C.p;) (x1, x2)
    val objectInfoGetRefFunction_ = _import "g_object_info_get_ref_function" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val objectInfoGetSetValueFunction_ = _import "g_object_info_get_set_value_function" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val objectInfoGetSignal_ = fn x1 & x2 => (_import "g_object_info_get_signal" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositorySignalInfoRecord.C.notnull GIRepositorySignalInfoRecord.C.p;) (x1, x2)
    val objectInfoGetTypeInit_ = _import "g_object_info_get_type_init" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val objectInfoGetTypeName_ = _import "g_object_info_get_type_name" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val objectInfoGetUnrefFunction_ = _import "g_object_info_get_unref_function" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val objectInfoGetVfunc_ = fn x1 & x2 => (_import "g_object_info_get_vfunc" : GIRepositoryObjectInfoRecord.C.notnull GIRepositoryObjectInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryVFuncInfoRecord.C.notnull GIRepositoryVFuncInfoRecord.C.p;) (x1, x2)
    val propertyInfoGetFlags_ = _import "g_property_info_get_flags" : GIRepositoryPropertyInfoRecord.C.notnull GIRepositoryPropertyInfoRecord.C.p -> GObjectParamFlags.C.val_;
    val propertyInfoGetOwnershipTransfer_ = _import "g_property_info_get_ownership_transfer" : GIRepositoryPropertyInfoRecord.C.notnull GIRepositoryPropertyInfoRecord.C.p -> GIRepositoryTransfer.C.val_;
    val propertyInfoGetType_ = _import "g_property_info_get_type" : GIRepositoryPropertyInfoRecord.C.notnull GIRepositoryPropertyInfoRecord.C.p -> GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p;
    val registeredTypeInfoGetTypeInit_ = _import "g_registered_type_info_get_type_init" : GIRepositoryRegisteredTypeInfoRecord.C.notnull GIRepositoryRegisteredTypeInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val registeredTypeInfoGetTypeName_ = _import "g_registered_type_info_get_type_name" : GIRepositoryRegisteredTypeInfoRecord.C.notnull GIRepositoryRegisteredTypeInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val signalInfoGetClassClosure_ = _import "g_signal_info_get_class_closure" : GIRepositorySignalInfoRecord.C.notnull GIRepositorySignalInfoRecord.C.p -> GIRepositoryVFuncInfoRecord.C.notnull GIRepositoryVFuncInfoRecord.C.p;
    val signalInfoGetFlags_ = _import "g_signal_info_get_flags" : GIRepositorySignalInfoRecord.C.notnull GIRepositorySignalInfoRecord.C.p -> GObjectSignalFlags.C.val_;
    val signalInfoTrueStopsEmit_ = _import "g_signal_info_true_stops_emit" : GIRepositorySignalInfoRecord.C.notnull GIRepositorySignalInfoRecord.C.p -> FFI.Bool.C.val_;
    val structInfoFindMethod_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_struct_info_find_method" :
              GIRepositoryStructInfoRecord.C.notnull GIRepositoryStructInfoRecord.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> GIRepositoryFunctionInfoRecord.C.notnull GIRepositoryFunctionInfoRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val structInfoGetAlignment_ = _import "g_struct_info_get_alignment" : GIRepositoryStructInfoRecord.C.notnull GIRepositoryStructInfoRecord.C.p -> FFI.Size.C.val_;
    val structInfoGetField_ = fn x1 & x2 => (_import "g_struct_info_get_field" : GIRepositoryStructInfoRecord.C.notnull GIRepositoryStructInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryFieldInfoRecord.C.notnull GIRepositoryFieldInfoRecord.C.p;) (x1, x2)
    val structInfoGetMethod_ = fn x1 & x2 => (_import "g_struct_info_get_method" : GIRepositoryStructInfoRecord.C.notnull GIRepositoryStructInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryFunctionInfoRecord.C.notnull GIRepositoryFunctionInfoRecord.C.p;) (x1, x2)
    val structInfoGetNFields_ = _import "g_struct_info_get_n_fields" : GIRepositoryStructInfoRecord.C.notnull GIRepositoryStructInfoRecord.C.p -> FFI.Int.C.val_;
    val structInfoGetNMethods_ = _import "g_struct_info_get_n_methods" : GIRepositoryStructInfoRecord.C.notnull GIRepositoryStructInfoRecord.C.p -> FFI.Int.C.val_;
    val structInfoGetSize_ = _import "g_struct_info_get_size" : GIRepositoryStructInfoRecord.C.notnull GIRepositoryStructInfoRecord.C.p -> FFI.Size.C.val_;
    val structInfoIsForeign_ = _import "g_struct_info_is_foreign" : GIRepositoryStructInfoRecord.C.notnull GIRepositoryStructInfoRecord.C.p -> FFI.Bool.C.val_;
    val structInfoIsGtypeStruct_ = _import "g_struct_info_is_gtype_struct" : GIRepositoryStructInfoRecord.C.notnull GIRepositoryStructInfoRecord.C.p -> FFI.Bool.C.val_;
    val typeInfoGetArrayFixedSize_ = _import "g_type_info_get_array_fixed_size" : GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p -> FFI.Int.C.val_;
    val typeInfoGetArrayLength_ = _import "g_type_info_get_array_length" : GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p -> FFI.Int.C.val_;
    val typeInfoGetArrayType_ = _import "g_type_info_get_array_type" : GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p -> GIRepositoryArrayType.C.val_;
    val typeInfoGetInterface_ = _import "g_type_info_get_interface" : GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
    val typeInfoGetParamType_ = fn x1 & x2 => (_import "g_type_info_get_param_type" : GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p;) (x1, x2)
    val typeInfoGetTag_ = _import "g_type_info_get_tag" : GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p -> GIRepositoryTypeTag.C.val_;
    val typeInfoIsPointer_ = _import "g_type_info_is_pointer" : GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p -> FFI.Bool.C.val_;
    val typeInfoIsZeroTerminated_ = _import "g_type_info_is_zero_terminated" : GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p -> FFI.Bool.C.val_;
    val typeTagToString_ = _import "g_type_tag_to_string" : GIRepositoryTypeTag.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val unionInfoFindMethod_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_union_info_find_method" :
              GIRepositoryUnionInfoRecord.C.notnull GIRepositoryUnionInfoRecord.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> GIRepositoryFunctionInfoRecord.C.notnull GIRepositoryFunctionInfoRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val unionInfoGetAlignment_ = _import "g_union_info_get_alignment" : GIRepositoryUnionInfoRecord.C.notnull GIRepositoryUnionInfoRecord.C.p -> FFI.Size.C.val_;
    val unionInfoGetDiscriminator_ = fn x1 & x2 => (_import "g_union_info_get_discriminator" : GIRepositoryUnionInfoRecord.C.notnull GIRepositoryUnionInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryConstantInfoRecord.C.notnull GIRepositoryConstantInfoRecord.C.p;) (x1, x2)
    val unionInfoGetDiscriminatorOffset_ = _import "g_union_info_get_discriminator_offset" : GIRepositoryUnionInfoRecord.C.notnull GIRepositoryUnionInfoRecord.C.p -> FFI.Int.C.val_;
    val unionInfoGetDiscriminatorType_ = _import "g_union_info_get_discriminator_type" : GIRepositoryUnionInfoRecord.C.notnull GIRepositoryUnionInfoRecord.C.p -> GIRepositoryTypeInfoRecord.C.notnull GIRepositoryTypeInfoRecord.C.p;
    val unionInfoGetField_ = fn x1 & x2 => (_import "g_union_info_get_field" : GIRepositoryUnionInfoRecord.C.notnull GIRepositoryUnionInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryFieldInfoRecord.C.notnull GIRepositoryFieldInfoRecord.C.p;) (x1, x2)
    val unionInfoGetMethod_ = fn x1 & x2 => (_import "g_union_info_get_method" : GIRepositoryUnionInfoRecord.C.notnull GIRepositoryUnionInfoRecord.C.p * FFI.Int.C.val_ -> GIRepositoryFunctionInfoRecord.C.notnull GIRepositoryFunctionInfoRecord.C.p;) (x1, x2)
    val unionInfoGetNFields_ = _import "g_union_info_get_n_fields" : GIRepositoryUnionInfoRecord.C.notnull GIRepositoryUnionInfoRecord.C.p -> FFI.Int.C.val_;
    val unionInfoGetNMethods_ = _import "g_union_info_get_n_methods" : GIRepositoryUnionInfoRecord.C.notnull GIRepositoryUnionInfoRecord.C.p -> FFI.Int.C.val_;
    val unionInfoGetSize_ = _import "g_union_info_get_size" : GIRepositoryUnionInfoRecord.C.notnull GIRepositoryUnionInfoRecord.C.p -> FFI.Size.C.val_;
    val unionInfoIsDiscriminated_ = _import "g_union_info_is_discriminated" : GIRepositoryUnionInfoRecord.C.notnull GIRepositoryUnionInfoRecord.C.p -> FFI.Bool.C.val_;
    val valueInfoGetValue_ = _import "g_value_info_get_value" : GIRepositoryValueInfoRecord.C.notnull GIRepositoryValueInfoRecord.C.p -> FFI.Int64.C.val_;
    val vfuncInfoGetFlags_ = _import "g_vfunc_info_get_flags" : GIRepositoryVFuncInfoRecord.C.notnull GIRepositoryVFuncInfoRecord.C.p -> GIRepositoryVFuncInfoFlags.C.val_;
    val vfuncInfoGetInvoker_ = _import "g_vfunc_info_get_invoker" : GIRepositoryVFuncInfoRecord.C.notnull GIRepositoryVFuncInfoRecord.C.p -> GIRepositoryFunctionInfoRecord.C.notnull GIRepositoryFunctionInfoRecord.C.p;
    val vfuncInfoGetOffset_ = _import "g_vfunc_info_get_offset" : GIRepositoryVFuncInfoRecord.C.notnull GIRepositoryVFuncInfoRecord.C.p -> FFI.Int.C.val_;
    val vfuncInfoGetSignal_ = _import "g_vfunc_info_get_signal" : GIRepositoryVFuncInfoRecord.C.notnull GIRepositoryVFuncInfoRecord.C.p -> GIRepositorySignalInfoRecord.C.notnull GIRepositorySignalInfoRecord.C.p;
    structure BaseInfoRecord = GIRepositoryBaseInfoRecord
    structure TypelibRecord = GIRepositoryTypelibRecord
    structure ArrayType = GIRepositoryArrayType
    structure Direction = GIRepositoryDirection
    structure FieldInfoFlags = GIRepositoryFieldInfoFlags
    structure FunctionInfoFlags = GIRepositoryFunctionInfoFlags
    structure InfoType = GIRepositoryInfoType
    structure RepositoryClass = GIRepositoryRepositoryClass
    structure RepositoryError = GIRepositoryRepositoryError
    structure RepositoryLoadFlags = GIRepositoryRepositoryLoadFlags
    structure ScopeType = GIRepositoryScopeType
    structure Transfer = GIRepositoryTransfer
    structure TypeTag = GIRepositoryTypeTag
    structure VFuncInfoFlags = GIRepositoryVFuncInfoFlags
    structure NvokeError = GIRepositoryNvokeError
    exception NvokeError = GIRepositoryNvokeError
    structure ArgInfoRecord = GIRepositoryArgInfoRecord
    structure CallableInfoRecord = GIRepositoryCallableInfoRecord
    structure CallbackInfoRecord = GIRepositoryCallbackInfoRecord
    structure ConstantInfoRecord = GIRepositoryConstantInfoRecord
    structure EnumInfoRecord = GIRepositoryEnumInfoRecord
    structure FieldInfoRecord = GIRepositoryFieldInfoRecord
    structure FunctionInfoRecord = GIRepositoryFunctionInfoRecord
    structure InterfaceInfoRecord = GIRepositoryInterfaceInfoRecord
    structure ObjectInfoRecord = GIRepositoryObjectInfoRecord
    structure PropertyInfoRecord = GIRepositoryPropertyInfoRecord
    structure RegisteredTypeInfoRecord = GIRepositoryRegisteredTypeInfoRecord
    structure SignalInfoRecord = GIRepositorySignalInfoRecord
    structure StructInfoRecord = GIRepositoryStructInfoRecord
    structure TypeInfoRecord = GIRepositoryTypeInfoRecord
    structure UnionInfoRecord = GIRepositoryUnionInfoRecord
    structure VFuncInfoRecord = GIRepositoryVFuncInfoRecord
    structure ValueInfoRecord = GIRepositoryValueInfoRecord
    structure Repository = GIRepositoryRepository
    fun argInfoGetClosure info = (GIRepositoryArgInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) argInfoGetClosure_ info
    fun argInfoGetDestroy info = (GIRepositoryArgInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) argInfoGetDestroy_ info
    fun argInfoGetDirection info = (GIRepositoryArgInfoRecord.C.withPtr ---> GIRepositoryDirection.C.fromVal) argInfoGetDirection_ info
    fun argInfoGetOwnershipTransfer info = (GIRepositoryArgInfoRecord.C.withPtr ---> GIRepositoryTransfer.C.fromVal) argInfoGetOwnershipTransfer_ info
    fun argInfoGetScope info = (GIRepositoryArgInfoRecord.C.withPtr ---> GIRepositoryScopeType.C.fromVal) argInfoGetScope_ info
    fun argInfoGetType info = (GIRepositoryArgInfoRecord.C.withPtr ---> GIRepositoryTypeInfoRecord.C.fromPtr true) argInfoGetType_ info
    fun argInfoIsCallerAllocates info = (GIRepositoryArgInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) argInfoIsCallerAllocates_ info
    fun argInfoIsOptional info = (GIRepositoryArgInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) argInfoIsOptional_ info
    fun argInfoIsReturnValue info = (GIRepositoryArgInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) argInfoIsReturnValue_ info
    fun argInfoIsSkip info = (GIRepositoryArgInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) argInfoIsSkip_ info
    fun argInfoLoadType info =
      let
        val type' & () = (GIRepositoryArgInfoRecord.C.withPtr &&&> GIRepositoryTypeInfoRecord.C.withNewPtr ---> GIRepositoryTypeInfoRecord.C.fromPtr true && I) argInfoLoadType_ (info & ())
      in
        type'
      end
    fun argInfoMayBeNull info = (GIRepositoryArgInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) argInfoMayBeNull_ info
    fun baseInfoGetType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryInfoType.C.fromVal) baseInfoGetType_ info
    fun callableInfoGetArg info n = (GIRepositoryCallableInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryArgInfoRecord.C.fromPtr true) callableInfoGetArg_ (info & n)
    fun callableInfoGetCallerOwns info = (GIRepositoryCallableInfoRecord.C.withPtr ---> GIRepositoryTransfer.C.fromVal) callableInfoGetCallerOwns_ info
    fun callableInfoGetNArgs info = (GIRepositoryCallableInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) callableInfoGetNArgs_ info
    fun callableInfoGetReturnAttribute info name = (GIRepositoryCallableInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) callableInfoGetReturnAttribute_ (info & name)
    fun callableInfoGetReturnType info = (GIRepositoryCallableInfoRecord.C.withPtr ---> GIRepositoryTypeInfoRecord.C.fromPtr true) callableInfoGetReturnType_ info
    fun callableInfoIterateReturnAttributes info iterator =
      let
        val name
         & value
         & retVal =
          (
            GIRepositoryCallableInfoRecord.C.withPtr
             &&&> GIRepositoryAttributeIterRecord.C.withPtr
             &&&> FFI.String.C.withRefConstOptPtr
             &&&> FFI.String.C.withRefConstOptPtr
             ---> FFI.String.C.fromPtr false
                   && FFI.String.C.fromPtr false
                   && FFI.Bool.C.fromVal
          )
            callableInfoIterateReturnAttributes_
            (
              info
               & iterator
               & NONE
               & NONE
            )
      in
        if retVal then SOME (name, value) else NONE
      end
    fun callableInfoLoadArg info n =
      let
        val arg & () =
          (
            GIRepositoryCallableInfoRecord.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> GIRepositoryArgInfoRecord.C.withNewPtr
             ---> GIRepositoryArgInfoRecord.C.fromPtr true && I
          )
            callableInfoLoadArg_
            (
              info
               & n
               & ()
            )
      in
        arg
      end
    fun callableInfoLoadReturnType info =
      let
        val type' & () = (GIRepositoryCallableInfoRecord.C.withPtr &&&> GIRepositoryTypeInfoRecord.C.withNewPtr ---> GIRepositoryTypeInfoRecord.C.fromPtr true && I) callableInfoLoadReturnType_ (info & ())
      in
        type'
      end
    fun callableInfoMayReturnNull info = (GIRepositoryCallableInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) callableInfoMayReturnNull_ info
    fun callableInfoSkipReturn info = (GIRepositoryCallableInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) callableInfoSkipReturn_ info
    fun constantInfoGetType info = (GIRepositoryConstantInfoRecord.C.withPtr ---> GIRepositoryTypeInfoRecord.C.fromPtr true) constantInfoGetType_ info
    fun enumInfoGetErrorDomain info = (GIRepositoryEnumInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) enumInfoGetErrorDomain_ info
    fun enumInfoGetMethod info n = (GIRepositoryEnumInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryFunctionInfoRecord.C.fromPtr true) enumInfoGetMethod_ (info & n)
    fun enumInfoGetNMethods info = (GIRepositoryEnumInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) enumInfoGetNMethods_ info
    fun enumInfoGetNValues info = (GIRepositoryEnumInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) enumInfoGetNValues_ info
    fun enumInfoGetStorageType info = (GIRepositoryEnumInfoRecord.C.withPtr ---> GIRepositoryTypeTag.C.fromVal) enumInfoGetStorageType_ info
    fun enumInfoGetValue info n = (GIRepositoryEnumInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryValueInfoRecord.C.fromPtr true) enumInfoGetValue_ (info & n)
    fun fieldInfoGetFlags info = (GIRepositoryFieldInfoRecord.C.withPtr ---> GIRepositoryFieldInfoFlags.C.fromVal) fieldInfoGetFlags_ info
    fun fieldInfoGetOffset info = (GIRepositoryFieldInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) fieldInfoGetOffset_ info
    fun fieldInfoGetSize info = (GIRepositoryFieldInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) fieldInfoGetSize_ info
    fun fieldInfoGetType info = (GIRepositoryFieldInfoRecord.C.withPtr ---> GIRepositoryTypeInfoRecord.C.fromPtr true) fieldInfoGetType_ info
    fun functionInfoGetFlags info = (GIRepositoryFunctionInfoRecord.C.withPtr ---> GIRepositoryFunctionInfoFlags.C.fromVal) functionInfoGetFlags_ info
    fun functionInfoGetProperty info = (GIRepositoryFunctionInfoRecord.C.withPtr ---> GIRepositoryPropertyInfoRecord.C.fromPtr true) functionInfoGetProperty_ info
    fun functionInfoGetSymbol info = (GIRepositoryFunctionInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) functionInfoGetSymbol_ info
    fun functionInfoGetVfunc info = (GIRepositoryFunctionInfoRecord.C.withPtr ---> GIRepositoryVFuncInfoRecord.C.fromPtr true) functionInfoGetVfunc_ info
    fun infoNew type' container typelib offset =
      (
        GIRepositoryInfoType.C.withVal
         &&&> GIRepositoryBaseInfoRecord.C.withPtr
         &&&> GIRepositoryTypelibRecord.C.withPtr
         &&&> FFI.UInt32.C.withVal
         ---> GIRepositoryBaseInfoRecord.C.fromPtr true
      )
        infoNew_
        (
          type'
           & container
           & typelib
           & offset
        )
    fun infoTypeToString type' = (GIRepositoryInfoType.C.withVal ---> FFI.String.C.fromPtr false) infoTypeToString_ type'
    fun interfaceInfoFindMethod info name = (GIRepositoryInterfaceInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> GIRepositoryFunctionInfoRecord.C.fromPtr true) interfaceInfoFindMethod_ (info & name)
    fun interfaceInfoFindVfunc info name = (GIRepositoryInterfaceInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> GIRepositoryVFuncInfoRecord.C.fromPtr true) interfaceInfoFindVfunc_ (info & name)
    fun interfaceInfoGetConstant info n = (GIRepositoryInterfaceInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryConstantInfoRecord.C.fromPtr true) interfaceInfoGetConstant_ (info & n)
    fun interfaceInfoGetIfaceStruct info = (GIRepositoryInterfaceInfoRecord.C.withPtr ---> GIRepositoryStructInfoRecord.C.fromPtr true) interfaceInfoGetIfaceStruct_ info
    fun interfaceInfoGetMethod info n = (GIRepositoryInterfaceInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryFunctionInfoRecord.C.fromPtr true) interfaceInfoGetMethod_ (info & n)
    fun interfaceInfoGetNConstants info = (GIRepositoryInterfaceInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) interfaceInfoGetNConstants_ info
    fun interfaceInfoGetNMethods info = (GIRepositoryInterfaceInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) interfaceInfoGetNMethods_ info
    fun interfaceInfoGetNPrerequisites info = (GIRepositoryInterfaceInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) interfaceInfoGetNPrerequisites_ info
    fun interfaceInfoGetNProperties info = (GIRepositoryInterfaceInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) interfaceInfoGetNProperties_ info
    fun interfaceInfoGetNSignals info = (GIRepositoryInterfaceInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) interfaceInfoGetNSignals_ info
    fun interfaceInfoGetNVfuncs info = (GIRepositoryInterfaceInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) interfaceInfoGetNVfuncs_ info
    fun interfaceInfoGetPrerequisite info n = (GIRepositoryInterfaceInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoGetPrerequisite_ (info & n)
    fun interfaceInfoGetProperty info n = (GIRepositoryInterfaceInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryPropertyInfoRecord.C.fromPtr true) interfaceInfoGetProperty_ (info & n)
    fun interfaceInfoGetSignal info n = (GIRepositoryInterfaceInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositorySignalInfoRecord.C.fromPtr true) interfaceInfoGetSignal_ (info & n)
    fun interfaceInfoGetVfunc info n = (GIRepositoryInterfaceInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryVFuncInfoRecord.C.fromPtr true) interfaceInfoGetVfunc_ (info & n)
    fun invokeErrorQuark () = (I ---> GLibQuark.C.fromVal) invokeErrorQuark_ ()
    fun objectInfoFindMethod info name = (GIRepositoryObjectInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> GIRepositoryFunctionInfoRecord.C.fromPtr true) objectInfoFindMethod_ (info & name)
    fun objectInfoFindMethodUsingInterfaces info name =
      let
        val implementor & retVal =
          (
            GIRepositoryObjectInfoRecord.C.withPtr
             &&&> FFI.String.C.withConstPtr
             &&&> GIRepositoryObjectInfoRecord.C.withRefOptPtr
             ---> GIRepositoryObjectInfoRecord.C.fromPtr true && GIRepositoryFunctionInfoRecord.C.fromPtr true
          )
            objectInfoFindMethodUsingInterfaces_
            (
              info
               & name
               & NONE
            )
      in
        (retVal, implementor)
      end
    fun objectInfoFindVfunc info name = (GIRepositoryObjectInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> GIRepositoryVFuncInfoRecord.C.fromPtr true) objectInfoFindVfunc_ (info & name)
    fun objectInfoGetAbstract info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) objectInfoGetAbstract_ info
    fun objectInfoGetClassStruct info = (GIRepositoryObjectInfoRecord.C.withPtr ---> GIRepositoryStructInfoRecord.C.fromPtr true) objectInfoGetClassStruct_ info
    fun objectInfoGetConstant info n = (GIRepositoryObjectInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryConstantInfoRecord.C.fromPtr true) objectInfoGetConstant_ (info & n)
    fun objectInfoGetField info n = (GIRepositoryObjectInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryFieldInfoRecord.C.fromPtr true) objectInfoGetField_ (info & n)
    fun objectInfoGetFundamental info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) objectInfoGetFundamental_ info
    fun objectInfoGetGetValueFunction info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) objectInfoGetGetValueFunction_ info
    fun objectInfoGetInterface info n = (GIRepositoryObjectInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryInterfaceInfoRecord.C.fromPtr true) objectInfoGetInterface_ (info & n)
    fun objectInfoGetMethod info n = (GIRepositoryObjectInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryFunctionInfoRecord.C.fromPtr true) objectInfoGetMethod_ (info & n)
    fun objectInfoGetNConstants info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) objectInfoGetNConstants_ info
    fun objectInfoGetNFields info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) objectInfoGetNFields_ info
    fun objectInfoGetNInterfaces info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) objectInfoGetNInterfaces_ info
    fun objectInfoGetNMethods info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) objectInfoGetNMethods_ info
    fun objectInfoGetNProperties info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) objectInfoGetNProperties_ info
    fun objectInfoGetNSignals info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) objectInfoGetNSignals_ info
    fun objectInfoGetNVfuncs info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) objectInfoGetNVfuncs_ info
    fun objectInfoGetParent info = (GIRepositoryObjectInfoRecord.C.withPtr ---> GIRepositoryObjectInfoRecord.C.fromPtr true) objectInfoGetParent_ info
    fun objectInfoGetProperty info n = (GIRepositoryObjectInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryPropertyInfoRecord.C.fromPtr true) objectInfoGetProperty_ (info & n)
    fun objectInfoGetRefFunction info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) objectInfoGetRefFunction_ info
    fun objectInfoGetSetValueFunction info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) objectInfoGetSetValueFunction_ info
    fun objectInfoGetSignal info n = (GIRepositoryObjectInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositorySignalInfoRecord.C.fromPtr true) objectInfoGetSignal_ (info & n)
    fun objectInfoGetTypeInit info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) objectInfoGetTypeInit_ info
    fun objectInfoGetTypeName info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) objectInfoGetTypeName_ info
    fun objectInfoGetUnrefFunction info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) objectInfoGetUnrefFunction_ info
    fun objectInfoGetVfunc info n = (GIRepositoryObjectInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryVFuncInfoRecord.C.fromPtr true) objectInfoGetVfunc_ (info & n)
    fun propertyInfoGetFlags info = (GIRepositoryPropertyInfoRecord.C.withPtr ---> GObjectParamFlags.C.fromVal) propertyInfoGetFlags_ info
    fun propertyInfoGetOwnershipTransfer info = (GIRepositoryPropertyInfoRecord.C.withPtr ---> GIRepositoryTransfer.C.fromVal) propertyInfoGetOwnershipTransfer_ info
    fun propertyInfoGetType info = (GIRepositoryPropertyInfoRecord.C.withPtr ---> GIRepositoryTypeInfoRecord.C.fromPtr true) propertyInfoGetType_ info
    fun registeredTypeInfoGetTypeInit info = (GIRepositoryRegisteredTypeInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) registeredTypeInfoGetTypeInit_ info
    fun registeredTypeInfoGetTypeName info = (GIRepositoryRegisteredTypeInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) registeredTypeInfoGetTypeName_ info
    fun signalInfoGetClassClosure info = (GIRepositorySignalInfoRecord.C.withPtr ---> GIRepositoryVFuncInfoRecord.C.fromPtr true) signalInfoGetClassClosure_ info
    fun signalInfoGetFlags info = (GIRepositorySignalInfoRecord.C.withPtr ---> GObjectSignalFlags.C.fromVal) signalInfoGetFlags_ info
    fun signalInfoTrueStopsEmit info = (GIRepositorySignalInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) signalInfoTrueStopsEmit_ info
    fun structInfoFindMethod info name = (GIRepositoryStructInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> GIRepositoryFunctionInfoRecord.C.fromPtr true) structInfoFindMethod_ (info & name)
    fun structInfoGetAlignment info = (GIRepositoryStructInfoRecord.C.withPtr ---> FFI.Size.C.fromVal) structInfoGetAlignment_ info
    fun structInfoGetField info n = (GIRepositoryStructInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryFieldInfoRecord.C.fromPtr true) structInfoGetField_ (info & n)
    fun structInfoGetMethod info n = (GIRepositoryStructInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryFunctionInfoRecord.C.fromPtr true) structInfoGetMethod_ (info & n)
    fun structInfoGetNFields info = (GIRepositoryStructInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) structInfoGetNFields_ info
    fun structInfoGetNMethods info = (GIRepositoryStructInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) structInfoGetNMethods_ info
    fun structInfoGetSize info = (GIRepositoryStructInfoRecord.C.withPtr ---> FFI.Size.C.fromVal) structInfoGetSize_ info
    fun structInfoIsForeign info = (GIRepositoryStructInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) structInfoIsForeign_ info
    fun structInfoIsGtypeStruct info = (GIRepositoryStructInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) structInfoIsGtypeStruct_ info
    fun typeInfoGetArrayFixedSize info = (GIRepositoryTypeInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) typeInfoGetArrayFixedSize_ info
    fun typeInfoGetArrayLength info = (GIRepositoryTypeInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) typeInfoGetArrayLength_ info
    fun typeInfoGetArrayType info = (GIRepositoryTypeInfoRecord.C.withPtr ---> GIRepositoryArrayType.C.fromVal) typeInfoGetArrayType_ info
    fun typeInfoGetInterface info = (GIRepositoryTypeInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) typeInfoGetInterface_ info
    fun typeInfoGetParamType info n = (GIRepositoryTypeInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryTypeInfoRecord.C.fromPtr true) typeInfoGetParamType_ (info & n)
    fun typeInfoGetTag info = (GIRepositoryTypeInfoRecord.C.withPtr ---> GIRepositoryTypeTag.C.fromVal) typeInfoGetTag_ info
    fun typeInfoIsPointer info = (GIRepositoryTypeInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) typeInfoIsPointer_ info
    fun typeInfoIsZeroTerminated info = (GIRepositoryTypeInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) typeInfoIsZeroTerminated_ info
    fun typeTagToString type' = (GIRepositoryTypeTag.C.withVal ---> FFI.String.C.fromPtr false) typeTagToString_ type'
    fun unionInfoFindMethod info name = (GIRepositoryUnionInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> GIRepositoryFunctionInfoRecord.C.fromPtr true) unionInfoFindMethod_ (info & name)
    fun unionInfoGetAlignment info = (GIRepositoryUnionInfoRecord.C.withPtr ---> FFI.Size.C.fromVal) unionInfoGetAlignment_ info
    fun unionInfoGetDiscriminator info n = (GIRepositoryUnionInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryConstantInfoRecord.C.fromPtr true) unionInfoGetDiscriminator_ (info & n)
    fun unionInfoGetDiscriminatorOffset info = (GIRepositoryUnionInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) unionInfoGetDiscriminatorOffset_ info
    fun unionInfoGetDiscriminatorType info = (GIRepositoryUnionInfoRecord.C.withPtr ---> GIRepositoryTypeInfoRecord.C.fromPtr true) unionInfoGetDiscriminatorType_ info
    fun unionInfoGetField info n = (GIRepositoryUnionInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryFieldInfoRecord.C.fromPtr true) unionInfoGetField_ (info & n)
    fun unionInfoGetMethod info n = (GIRepositoryUnionInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryFunctionInfoRecord.C.fromPtr true) unionInfoGetMethod_ (info & n)
    fun unionInfoGetNFields info = (GIRepositoryUnionInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) unionInfoGetNFields_ info
    fun unionInfoGetNMethods info = (GIRepositoryUnionInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) unionInfoGetNMethods_ info
    fun unionInfoGetSize info = (GIRepositoryUnionInfoRecord.C.withPtr ---> FFI.Size.C.fromVal) unionInfoGetSize_ info
    fun unionInfoIsDiscriminated info = (GIRepositoryUnionInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) unionInfoIsDiscriminated_ info
    fun valueInfoGetValue info = (GIRepositoryValueInfoRecord.C.withPtr ---> FFI.Int64.C.fromVal) valueInfoGetValue_ info
    fun vfuncInfoGetFlags info = (GIRepositoryVFuncInfoRecord.C.withPtr ---> GIRepositoryVFuncInfoFlags.C.fromVal) vfuncInfoGetFlags_ info
    fun vfuncInfoGetInvoker info = (GIRepositoryVFuncInfoRecord.C.withPtr ---> GIRepositoryFunctionInfoRecord.C.fromPtr true) vfuncInfoGetInvoker_ info
    fun vfuncInfoGetOffset info = (GIRepositoryVFuncInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) vfuncInfoGetOffset_ info
    fun vfuncInfoGetSignal info = (GIRepositoryVFuncInfoRecord.C.withPtr ---> GIRepositorySignalInfoRecord.C.fromPtr true) vfuncInfoGetSignal_ info
  end
