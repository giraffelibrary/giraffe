structure GIRepository : G_I_REPOSITORY =
  struct
    val argInfoGetClosure_ = _import "g_arg_info_get_closure" : GIRepositoryArgInfoRecord.FFI.non_opt GIRepositoryArgInfoRecord.FFI.p -> GInt.FFI.val_;
    val argInfoGetDestroy_ = _import "g_arg_info_get_destroy" : GIRepositoryArgInfoRecord.FFI.non_opt GIRepositoryArgInfoRecord.FFI.p -> GInt.FFI.val_;
    val argInfoGetDirection_ = _import "g_arg_info_get_direction" : GIRepositoryArgInfoRecord.FFI.non_opt GIRepositoryArgInfoRecord.FFI.p -> GIRepositoryDirection.FFI.val_;
    val argInfoGetOwnershipTransfer_ = _import "g_arg_info_get_ownership_transfer" : GIRepositoryArgInfoRecord.FFI.non_opt GIRepositoryArgInfoRecord.FFI.p -> GIRepositoryTransfer.FFI.val_;
    val argInfoGetScope_ = _import "g_arg_info_get_scope" : GIRepositoryArgInfoRecord.FFI.non_opt GIRepositoryArgInfoRecord.FFI.p -> GIRepositoryScopeType.FFI.val_;
    val argInfoGetType_ = _import "g_arg_info_get_type" : GIRepositoryArgInfoRecord.FFI.non_opt GIRepositoryArgInfoRecord.FFI.p -> GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p;
    val argInfoIsCallerAllocates_ = _import "g_arg_info_is_caller_allocates" : GIRepositoryArgInfoRecord.FFI.non_opt GIRepositoryArgInfoRecord.FFI.p -> GBool.FFI.val_;
    val argInfoIsOptional_ = _import "g_arg_info_is_optional" : GIRepositoryArgInfoRecord.FFI.non_opt GIRepositoryArgInfoRecord.FFI.p -> GBool.FFI.val_;
    val argInfoIsReturnValue_ = _import "g_arg_info_is_return_value" : GIRepositoryArgInfoRecord.FFI.non_opt GIRepositoryArgInfoRecord.FFI.p -> GBool.FFI.val_;
    val argInfoIsSkip_ = _import "g_arg_info_is_skip" : GIRepositoryArgInfoRecord.FFI.non_opt GIRepositoryArgInfoRecord.FFI.p -> GBool.FFI.val_;
    val argInfoLoadType_ = fn x1 & x2 => (_import "g_arg_info_load_type" : GIRepositoryArgInfoRecord.FFI.non_opt GIRepositoryArgInfoRecord.FFI.p * GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p -> unit;) (x1, x2)
    val argInfoMayBeNull_ = _import "g_arg_info_may_be_null" : GIRepositoryArgInfoRecord.FFI.non_opt GIRepositoryArgInfoRecord.FFI.p -> GBool.FFI.val_;
    val callableInfoCanThrowGerror_ = _import "g_callable_info_can_throw_gerror" : GIRepositoryCallableInfoRecord.FFI.non_opt GIRepositoryCallableInfoRecord.FFI.p -> GBool.FFI.val_;
    val callableInfoGetArg_ = fn x1 & x2 => (_import "g_callable_info_get_arg" : GIRepositoryCallableInfoRecord.FFI.non_opt GIRepositoryCallableInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryArgInfoRecord.FFI.non_opt GIRepositoryArgInfoRecord.FFI.p;) (x1, x2)
    val callableInfoGetCallerOwns_ = _import "g_callable_info_get_caller_owns" : GIRepositoryCallableInfoRecord.FFI.non_opt GIRepositoryCallableInfoRecord.FFI.p -> GIRepositoryTransfer.FFI.val_;
    val callableInfoGetInstanceOwnershipTransfer_ = _import "g_callable_info_get_instance_ownership_transfer" : GIRepositoryCallableInfoRecord.FFI.non_opt GIRepositoryCallableInfoRecord.FFI.p -> GIRepositoryTransfer.FFI.val_;
    val callableInfoGetNArgs_ = _import "g_callable_info_get_n_args" : GIRepositoryCallableInfoRecord.FFI.non_opt GIRepositoryCallableInfoRecord.FFI.p -> GInt.FFI.val_;
    val callableInfoGetReturnAttribute_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_callable_info_get_return_attribute" :
              GIRepositoryCallableInfoRecord.FFI.non_opt GIRepositoryCallableInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val callableInfoGetReturnType_ = _import "g_callable_info_get_return_type" : GIRepositoryCallableInfoRecord.FFI.non_opt GIRepositoryCallableInfoRecord.FFI.p -> GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p;
    val callableInfoIsMethod_ = _import "g_callable_info_is_method" : GIRepositoryCallableInfoRecord.FFI.non_opt GIRepositoryCallableInfoRecord.FFI.p -> GBool.FFI.val_;
    val callableInfoLoadArg_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_callable_info_load_arg" :
              GIRepositoryCallableInfoRecord.FFI.non_opt GIRepositoryCallableInfoRecord.FFI.p
               * GInt.FFI.val_
               * GIRepositoryArgInfoRecord.FFI.non_opt GIRepositoryArgInfoRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val callableInfoLoadReturnType_ = fn x1 & x2 => (_import "g_callable_info_load_return_type" : GIRepositoryCallableInfoRecord.FFI.non_opt GIRepositoryCallableInfoRecord.FFI.p * GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p -> unit;) (x1, x2)
    val callableInfoMayReturnNull_ = _import "g_callable_info_may_return_null" : GIRepositoryCallableInfoRecord.FFI.non_opt GIRepositoryCallableInfoRecord.FFI.p -> GBool.FFI.val_;
    val callableInfoSkipReturn_ = _import "g_callable_info_skip_return" : GIRepositoryCallableInfoRecord.FFI.non_opt GIRepositoryCallableInfoRecord.FFI.p -> GBool.FFI.val_;
    val constantInfoGetType_ = _import "g_constant_info_get_type" : GIRepositoryConstantInfoRecord.FFI.non_opt GIRepositoryConstantInfoRecord.FFI.p -> GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p;
    val enumInfoGetErrorDomain_ = _import "g_enum_info_get_error_domain" : GIRepositoryEnumInfoRecord.FFI.non_opt GIRepositoryEnumInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val enumInfoGetMethod_ = fn x1 & x2 => (_import "g_enum_info_get_method" : GIRepositoryEnumInfoRecord.FFI.non_opt GIRepositoryEnumInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryFunctionInfoRecord.FFI.non_opt GIRepositoryFunctionInfoRecord.FFI.p;) (x1, x2)
    val enumInfoGetNMethods_ = _import "g_enum_info_get_n_methods" : GIRepositoryEnumInfoRecord.FFI.non_opt GIRepositoryEnumInfoRecord.FFI.p -> GInt.FFI.val_;
    val enumInfoGetNValues_ = _import "g_enum_info_get_n_values" : GIRepositoryEnumInfoRecord.FFI.non_opt GIRepositoryEnumInfoRecord.FFI.p -> GInt.FFI.val_;
    val enumInfoGetStorageType_ = _import "g_enum_info_get_storage_type" : GIRepositoryEnumInfoRecord.FFI.non_opt GIRepositoryEnumInfoRecord.FFI.p -> GIRepositoryTypeTag.FFI.val_;
    val enumInfoGetValue_ = fn x1 & x2 => (_import "g_enum_info_get_value" : GIRepositoryEnumInfoRecord.FFI.non_opt GIRepositoryEnumInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryValueInfoRecord.FFI.non_opt GIRepositoryValueInfoRecord.FFI.p;) (x1, x2)
    val fieldInfoGetFlags_ = _import "g_field_info_get_flags" : GIRepositoryFieldInfoRecord.FFI.non_opt GIRepositoryFieldInfoRecord.FFI.p -> GIRepositoryFieldInfoFlags.FFI.val_;
    val fieldInfoGetOffset_ = _import "g_field_info_get_offset" : GIRepositoryFieldInfoRecord.FFI.non_opt GIRepositoryFieldInfoRecord.FFI.p -> GInt.FFI.val_;
    val fieldInfoGetSize_ = _import "g_field_info_get_size" : GIRepositoryFieldInfoRecord.FFI.non_opt GIRepositoryFieldInfoRecord.FFI.p -> GInt.FFI.val_;
    val fieldInfoGetType_ = _import "g_field_info_get_type" : GIRepositoryFieldInfoRecord.FFI.non_opt GIRepositoryFieldInfoRecord.FFI.p -> GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p;
    val functionInfoGetFlags_ = _import "g_function_info_get_flags" : GIRepositoryFunctionInfoRecord.FFI.non_opt GIRepositoryFunctionInfoRecord.FFI.p -> GIRepositoryFunctionInfoFlags.FFI.val_;
    val functionInfoGetProperty_ = _import "g_function_info_get_property" : GIRepositoryFunctionInfoRecord.FFI.non_opt GIRepositoryFunctionInfoRecord.FFI.p -> GIRepositoryPropertyInfoRecord.FFI.non_opt GIRepositoryPropertyInfoRecord.FFI.p;
    val functionInfoGetSymbol_ = _import "g_function_info_get_symbol" : GIRepositoryFunctionInfoRecord.FFI.non_opt GIRepositoryFunctionInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val functionInfoGetVfunc_ = _import "g_function_info_get_vfunc" : GIRepositoryFunctionInfoRecord.FFI.non_opt GIRepositoryFunctionInfoRecord.FFI.p -> GIRepositoryVFuncInfoRecord.FFI.non_opt GIRepositoryVFuncInfoRecord.FFI.p;
    val infoTypeToString_ = _import "g_info_type_to_string" : GIRepositoryInfoType.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val interfaceInfoFindMethod_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_interface_info_find_method" :
              GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryFunctionInfoRecord.FFI.non_opt GIRepositoryFunctionInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val interfaceInfoFindSignal_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_interface_info_find_signal" :
              GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositorySignalInfoRecord.FFI.non_opt GIRepositorySignalInfoRecord.FFI.p;
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
              GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryVFuncInfoRecord.FFI.non_opt GIRepositoryVFuncInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val interfaceInfoGetConstant_ = fn x1 & x2 => (_import "g_interface_info_get_constant" : GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryConstantInfoRecord.FFI.non_opt GIRepositoryConstantInfoRecord.FFI.p;) (x1, x2)
    val interfaceInfoGetIfaceStruct_ = _import "g_interface_info_get_iface_struct" : GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p -> GIRepositoryStructInfoRecord.FFI.non_opt GIRepositoryStructInfoRecord.FFI.p;
    val interfaceInfoGetMethod_ = fn x1 & x2 => (_import "g_interface_info_get_method" : GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryFunctionInfoRecord.FFI.non_opt GIRepositoryFunctionInfoRecord.FFI.p;) (x1, x2)
    val interfaceInfoGetNConstants_ = _import "g_interface_info_get_n_constants" : GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p -> GInt.FFI.val_;
    val interfaceInfoGetNMethods_ = _import "g_interface_info_get_n_methods" : GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p -> GInt.FFI.val_;
    val interfaceInfoGetNPrerequisites_ = _import "g_interface_info_get_n_prerequisites" : GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p -> GInt.FFI.val_;
    val interfaceInfoGetNProperties_ = _import "g_interface_info_get_n_properties" : GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p -> GInt.FFI.val_;
    val interfaceInfoGetNSignals_ = _import "g_interface_info_get_n_signals" : GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p -> GInt.FFI.val_;
    val interfaceInfoGetNVfuncs_ = _import "g_interface_info_get_n_vfuncs" : GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p -> GInt.FFI.val_;
    val interfaceInfoGetPrerequisite_ = fn x1 & x2 => (_import "g_interface_info_get_prerequisite" : GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val interfaceInfoGetProperty_ = fn x1 & x2 => (_import "g_interface_info_get_property" : GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryPropertyInfoRecord.FFI.non_opt GIRepositoryPropertyInfoRecord.FFI.p;) (x1, x2)
    val interfaceInfoGetSignal_ = fn x1 & x2 => (_import "g_interface_info_get_signal" : GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositorySignalInfoRecord.FFI.non_opt GIRepositorySignalInfoRecord.FFI.p;) (x1, x2)
    val interfaceInfoGetVfunc_ = fn x1 & x2 => (_import "g_interface_info_get_vfunc" : GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryVFuncInfoRecord.FFI.non_opt GIRepositoryVFuncInfoRecord.FFI.p;) (x1, x2)
    val invokeErrorQuark_ = _import "g_invoke_error_quark" : unit -> GLibQuark.FFI.val_;
    val objectInfoFindMethod_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_object_info_find_method" :
              GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryFunctionInfoRecord.FFI.non_opt GIRepositoryFunctionInfoRecord.FFI.p;
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
              GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GIRepositoryObjectInfoRecord.FFI.opt, GIRepositoryObjectInfoRecord.FFI.non_opt) GIRepositoryObjectInfoRecord.FFI.r
               -> GIRepositoryFunctionInfoRecord.FFI.non_opt GIRepositoryFunctionInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val objectInfoFindSignal_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_object_info_find_signal" :
              GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositorySignalInfoRecord.FFI.non_opt GIRepositorySignalInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val objectInfoFindVfunc_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_object_info_find_vfunc" :
              GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryVFuncInfoRecord.FFI.non_opt GIRepositoryVFuncInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val objectInfoFindVfuncUsingInterfaces_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_info_find_vfunc_using_interfaces" :
              GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GIRepositoryObjectInfoRecord.FFI.opt, GIRepositoryObjectInfoRecord.FFI.non_opt) GIRepositoryObjectInfoRecord.FFI.r
               -> GIRepositoryVFuncInfoRecord.FFI.non_opt GIRepositoryVFuncInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val objectInfoGetAbstract_ = _import "g_object_info_get_abstract" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> GBool.FFI.val_;
    val objectInfoGetClassStruct_ = _import "g_object_info_get_class_struct" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> GIRepositoryStructInfoRecord.FFI.non_opt GIRepositoryStructInfoRecord.FFI.p;
    val objectInfoGetConstant_ = fn x1 & x2 => (_import "g_object_info_get_constant" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryConstantInfoRecord.FFI.non_opt GIRepositoryConstantInfoRecord.FFI.p;) (x1, x2)
    val objectInfoGetField_ = fn x1 & x2 => (_import "g_object_info_get_field" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryFieldInfoRecord.FFI.non_opt GIRepositoryFieldInfoRecord.FFI.p;) (x1, x2)
    val objectInfoGetFundamental_ = _import "g_object_info_get_fundamental" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> GBool.FFI.val_;
    val objectInfoGetGetValueFunction_ = _import "g_object_info_get_get_value_function" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val objectInfoGetInterface_ = fn x1 & x2 => (_import "g_object_info_get_interface" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryInterfaceInfoRecord.FFI.non_opt GIRepositoryInterfaceInfoRecord.FFI.p;) (x1, x2)
    val objectInfoGetMethod_ = fn x1 & x2 => (_import "g_object_info_get_method" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryFunctionInfoRecord.FFI.non_opt GIRepositoryFunctionInfoRecord.FFI.p;) (x1, x2)
    val objectInfoGetNConstants_ = _import "g_object_info_get_n_constants" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> GInt.FFI.val_;
    val objectInfoGetNFields_ = _import "g_object_info_get_n_fields" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> GInt.FFI.val_;
    val objectInfoGetNInterfaces_ = _import "g_object_info_get_n_interfaces" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> GInt.FFI.val_;
    val objectInfoGetNMethods_ = _import "g_object_info_get_n_methods" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> GInt.FFI.val_;
    val objectInfoGetNProperties_ = _import "g_object_info_get_n_properties" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> GInt.FFI.val_;
    val objectInfoGetNSignals_ = _import "g_object_info_get_n_signals" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> GInt.FFI.val_;
    val objectInfoGetNVfuncs_ = _import "g_object_info_get_n_vfuncs" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> GInt.FFI.val_;
    val objectInfoGetParent_ = _import "g_object_info_get_parent" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p;
    val objectInfoGetProperty_ = fn x1 & x2 => (_import "g_object_info_get_property" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryPropertyInfoRecord.FFI.non_opt GIRepositoryPropertyInfoRecord.FFI.p;) (x1, x2)
    val objectInfoGetRefFunction_ = _import "g_object_info_get_ref_function" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val objectInfoGetSetValueFunction_ = _import "g_object_info_get_set_value_function" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val objectInfoGetSignal_ = fn x1 & x2 => (_import "g_object_info_get_signal" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositorySignalInfoRecord.FFI.non_opt GIRepositorySignalInfoRecord.FFI.p;) (x1, x2)
    val objectInfoGetTypeInit_ = _import "g_object_info_get_type_init" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val objectInfoGetTypeName_ = _import "g_object_info_get_type_name" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val objectInfoGetUnrefFunction_ = _import "g_object_info_get_unref_function" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val objectInfoGetVfunc_ = fn x1 & x2 => (_import "g_object_info_get_vfunc" : GIRepositoryObjectInfoRecord.FFI.non_opt GIRepositoryObjectInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryVFuncInfoRecord.FFI.non_opt GIRepositoryVFuncInfoRecord.FFI.p;) (x1, x2)
    val propertyInfoGetFlags_ = _import "g_property_info_get_flags" : GIRepositoryPropertyInfoRecord.FFI.non_opt GIRepositoryPropertyInfoRecord.FFI.p -> GObjectParamFlags.FFI.val_;
    val propertyInfoGetOwnershipTransfer_ = _import "g_property_info_get_ownership_transfer" : GIRepositoryPropertyInfoRecord.FFI.non_opt GIRepositoryPropertyInfoRecord.FFI.p -> GIRepositoryTransfer.FFI.val_;
    val propertyInfoGetType_ = _import "g_property_info_get_type" : GIRepositoryPropertyInfoRecord.FFI.non_opt GIRepositoryPropertyInfoRecord.FFI.p -> GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p;
    val registeredTypeInfoGetGType_ = _import "g_registered_type_info_get_g_type" : GIRepositoryRegisteredTypeInfoRecord.FFI.non_opt GIRepositoryRegisteredTypeInfoRecord.FFI.p -> GObjectType.FFI.val_;
    val registeredTypeInfoGetTypeInit_ = _import "g_registered_type_info_get_type_init" : GIRepositoryRegisteredTypeInfoRecord.FFI.non_opt GIRepositoryRegisteredTypeInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val registeredTypeInfoGetTypeName_ = _import "g_registered_type_info_get_type_name" : GIRepositoryRegisteredTypeInfoRecord.FFI.non_opt GIRepositoryRegisteredTypeInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val signalInfoGetClassClosure_ = _import "g_signal_info_get_class_closure" : GIRepositorySignalInfoRecord.FFI.non_opt GIRepositorySignalInfoRecord.FFI.p -> GIRepositoryVFuncInfoRecord.FFI.non_opt GIRepositoryVFuncInfoRecord.FFI.p;
    val signalInfoGetFlags_ = _import "g_signal_info_get_flags" : GIRepositorySignalInfoRecord.FFI.non_opt GIRepositorySignalInfoRecord.FFI.p -> GObjectSignalFlags.FFI.val_;
    val signalInfoTrueStopsEmit_ = _import "g_signal_info_true_stops_emit" : GIRepositorySignalInfoRecord.FFI.non_opt GIRepositorySignalInfoRecord.FFI.p -> GBool.FFI.val_;
    val structInfoFindField_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_struct_info_find_field" :
              GIRepositoryStructInfoRecord.FFI.non_opt GIRepositoryStructInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryFieldInfoRecord.FFI.non_opt GIRepositoryFieldInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val structInfoFindMethod_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_struct_info_find_method" :
              GIRepositoryStructInfoRecord.FFI.non_opt GIRepositoryStructInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryFunctionInfoRecord.FFI.non_opt GIRepositoryFunctionInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val structInfoGetAlignment_ = _import "g_struct_info_get_alignment" : GIRepositoryStructInfoRecord.FFI.non_opt GIRepositoryStructInfoRecord.FFI.p -> GSize.FFI.val_;
    val structInfoGetField_ = fn x1 & x2 => (_import "g_struct_info_get_field" : GIRepositoryStructInfoRecord.FFI.non_opt GIRepositoryStructInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryFieldInfoRecord.FFI.non_opt GIRepositoryFieldInfoRecord.FFI.p;) (x1, x2)
    val structInfoGetMethod_ = fn x1 & x2 => (_import "g_struct_info_get_method" : GIRepositoryStructInfoRecord.FFI.non_opt GIRepositoryStructInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryFunctionInfoRecord.FFI.non_opt GIRepositoryFunctionInfoRecord.FFI.p;) (x1, x2)
    val structInfoGetNFields_ = _import "g_struct_info_get_n_fields" : GIRepositoryStructInfoRecord.FFI.non_opt GIRepositoryStructInfoRecord.FFI.p -> GInt.FFI.val_;
    val structInfoGetNMethods_ = _import "g_struct_info_get_n_methods" : GIRepositoryStructInfoRecord.FFI.non_opt GIRepositoryStructInfoRecord.FFI.p -> GInt.FFI.val_;
    val structInfoGetSize_ = _import "g_struct_info_get_size" : GIRepositoryStructInfoRecord.FFI.non_opt GIRepositoryStructInfoRecord.FFI.p -> GSize.FFI.val_;
    val structInfoIsForeign_ = _import "g_struct_info_is_foreign" : GIRepositoryStructInfoRecord.FFI.non_opt GIRepositoryStructInfoRecord.FFI.p -> GBool.FFI.val_;
    val structInfoIsGtypeStruct_ = _import "g_struct_info_is_gtype_struct" : GIRepositoryStructInfoRecord.FFI.non_opt GIRepositoryStructInfoRecord.FFI.p -> GBool.FFI.val_;
    val typeInfoGetArrayFixedSize_ = _import "g_type_info_get_array_fixed_size" : GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p -> GInt.FFI.val_;
    val typeInfoGetArrayLength_ = _import "g_type_info_get_array_length" : GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p -> GInt.FFI.val_;
    val typeInfoGetArrayType_ = _import "g_type_info_get_array_type" : GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p -> GIRepositoryArrayType.FFI.val_;
    val typeInfoGetInterface_ = _import "g_type_info_get_interface" : GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
    val typeInfoGetParamType_ = fn x1 & x2 => (_import "g_type_info_get_param_type" : GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p;) (x1, x2)
    val typeInfoGetTag_ = _import "g_type_info_get_tag" : GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p -> GIRepositoryTypeTag.FFI.val_;
    val typeInfoIsPointer_ = _import "g_type_info_is_pointer" : GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p -> GBool.FFI.val_;
    val typeInfoIsZeroTerminated_ = _import "g_type_info_is_zero_terminated" : GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p -> GBool.FFI.val_;
    val typeTagToString_ = _import "g_type_tag_to_string" : GIRepositoryTypeTag.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val unionInfoFindMethod_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_union_info_find_method" :
              GIRepositoryUnionInfoRecord.FFI.non_opt GIRepositoryUnionInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryFunctionInfoRecord.FFI.non_opt GIRepositoryFunctionInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val unionInfoGetAlignment_ = _import "g_union_info_get_alignment" : GIRepositoryUnionInfoRecord.FFI.non_opt GIRepositoryUnionInfoRecord.FFI.p -> GSize.FFI.val_;
    val unionInfoGetDiscriminator_ = fn x1 & x2 => (_import "g_union_info_get_discriminator" : GIRepositoryUnionInfoRecord.FFI.non_opt GIRepositoryUnionInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryConstantInfoRecord.FFI.non_opt GIRepositoryConstantInfoRecord.FFI.p;) (x1, x2)
    val unionInfoGetDiscriminatorOffset_ = _import "g_union_info_get_discriminator_offset" : GIRepositoryUnionInfoRecord.FFI.non_opt GIRepositoryUnionInfoRecord.FFI.p -> GInt.FFI.val_;
    val unionInfoGetDiscriminatorType_ = _import "g_union_info_get_discriminator_type" : GIRepositoryUnionInfoRecord.FFI.non_opt GIRepositoryUnionInfoRecord.FFI.p -> GIRepositoryTypeInfoRecord.FFI.non_opt GIRepositoryTypeInfoRecord.FFI.p;
    val unionInfoGetField_ = fn x1 & x2 => (_import "g_union_info_get_field" : GIRepositoryUnionInfoRecord.FFI.non_opt GIRepositoryUnionInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryFieldInfoRecord.FFI.non_opt GIRepositoryFieldInfoRecord.FFI.p;) (x1, x2)
    val unionInfoGetMethod_ = fn x1 & x2 => (_import "g_union_info_get_method" : GIRepositoryUnionInfoRecord.FFI.non_opt GIRepositoryUnionInfoRecord.FFI.p * GInt.FFI.val_ -> GIRepositoryFunctionInfoRecord.FFI.non_opt GIRepositoryFunctionInfoRecord.FFI.p;) (x1, x2)
    val unionInfoGetNFields_ = _import "g_union_info_get_n_fields" : GIRepositoryUnionInfoRecord.FFI.non_opt GIRepositoryUnionInfoRecord.FFI.p -> GInt.FFI.val_;
    val unionInfoGetNMethods_ = _import "g_union_info_get_n_methods" : GIRepositoryUnionInfoRecord.FFI.non_opt GIRepositoryUnionInfoRecord.FFI.p -> GInt.FFI.val_;
    val unionInfoGetSize_ = _import "g_union_info_get_size" : GIRepositoryUnionInfoRecord.FFI.non_opt GIRepositoryUnionInfoRecord.FFI.p -> GSize.FFI.val_;
    val unionInfoIsDiscriminated_ = _import "g_union_info_is_discriminated" : GIRepositoryUnionInfoRecord.FFI.non_opt GIRepositoryUnionInfoRecord.FFI.p -> GBool.FFI.val_;
    val valueInfoGetValue_ = _import "g_value_info_get_value" : GIRepositoryValueInfoRecord.FFI.non_opt GIRepositoryValueInfoRecord.FFI.p -> GInt64.FFI.val_;
    val vfuncInfoGetFlags_ = _import "g_vfunc_info_get_flags" : GIRepositoryVFuncInfoRecord.FFI.non_opt GIRepositoryVFuncInfoRecord.FFI.p -> GIRepositoryVFuncInfoFlags.FFI.val_;
    val vfuncInfoGetInvoker_ = _import "g_vfunc_info_get_invoker" : GIRepositoryVFuncInfoRecord.FFI.non_opt GIRepositoryVFuncInfoRecord.FFI.p -> GIRepositoryFunctionInfoRecord.FFI.non_opt GIRepositoryFunctionInfoRecord.FFI.p;
    val vfuncInfoGetOffset_ = _import "g_vfunc_info_get_offset" : GIRepositoryVFuncInfoRecord.FFI.non_opt GIRepositoryVFuncInfoRecord.FFI.p -> GInt.FFI.val_;
    val vfuncInfoGetSignal_ = _import "g_vfunc_info_get_signal" : GIRepositoryVFuncInfoRecord.FFI.non_opt GIRepositoryVFuncInfoRecord.FFI.p -> GIRepositorySignalInfoRecord.FFI.non_opt GIRepositorySignalInfoRecord.FFI.p;
    structure TypelibRecord = GIRepositoryTypelibRecord
    structure ArrayType = GIRepositoryArrayType
    structure BaseInfoRecord = GIRepositoryBaseInfoRecord
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
    structure BaseInfo = GIRepositoryBaseInfo
    structure Repository = GIRepositoryRepository
    fun argInfoGetClosure info = (GIRepositoryArgInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) argInfoGetClosure_ info
    fun argInfoGetDestroy info = (GIRepositoryArgInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) argInfoGetDestroy_ info
    fun argInfoGetDirection info = (GIRepositoryArgInfoRecord.FFI.withPtr false ---> GIRepositoryDirection.FFI.fromVal) argInfoGetDirection_ info
    fun argInfoGetOwnershipTransfer info = (GIRepositoryArgInfoRecord.FFI.withPtr false ---> GIRepositoryTransfer.FFI.fromVal) argInfoGetOwnershipTransfer_ info
    fun argInfoGetScope info = (GIRepositoryArgInfoRecord.FFI.withPtr false ---> GIRepositoryScopeType.FFI.fromVal) argInfoGetScope_ info
    fun argInfoGetType info = (GIRepositoryArgInfoRecord.FFI.withPtr false ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true) argInfoGetType_ info
    fun argInfoIsCallerAllocates info = (GIRepositoryArgInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) argInfoIsCallerAllocates_ info
    fun argInfoIsOptional info = (GIRepositoryArgInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) argInfoIsOptional_ info
    fun argInfoIsReturnValue info = (GIRepositoryArgInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) argInfoIsReturnValue_ info
    fun argInfoIsSkip info = (GIRepositoryArgInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) argInfoIsSkip_ info
    fun argInfoLoadType info =
      let
        val type' & () = (GIRepositoryArgInfoRecord.FFI.withPtr false &&&> GIRepositoryTypeInfoRecord.FFI.withNewPtr ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true && I) argInfoLoadType_ (info & ())
      in
        type'
      end
    fun argInfoMayBeNull info = (GIRepositoryArgInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) argInfoMayBeNull_ info
    fun callableInfoCanThrowGerror info = (GIRepositoryCallableInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) callableInfoCanThrowGerror_ info
    fun callableInfoGetArg (info, n) = (GIRepositoryCallableInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryArgInfoRecord.FFI.fromPtr true) callableInfoGetArg_ (info & n)
    fun callableInfoGetCallerOwns info = (GIRepositoryCallableInfoRecord.FFI.withPtr false ---> GIRepositoryTransfer.FFI.fromVal) callableInfoGetCallerOwns_ info
    fun callableInfoGetInstanceOwnershipTransfer info = (GIRepositoryCallableInfoRecord.FFI.withPtr false ---> GIRepositoryTransfer.FFI.fromVal) callableInfoGetInstanceOwnershipTransfer_ info
    fun callableInfoGetNArgs info = (GIRepositoryCallableInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) callableInfoGetNArgs_ info
    fun callableInfoGetReturnAttribute (info, name) = (GIRepositoryCallableInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) callableInfoGetReturnAttribute_ (info & name) before GIRepositoryCallableInfoRecord.FFI.touchPtr info before Utf8.FFI.touchPtr name
    fun callableInfoGetReturnType info = (GIRepositoryCallableInfoRecord.FFI.withPtr false ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true) callableInfoGetReturnType_ info
    fun callableInfoIsMethod info = (GIRepositoryCallableInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) callableInfoIsMethod_ info
    fun callableInfoLoadArg (info, n) =
      let
        val arg & () =
          (
            GIRepositoryCallableInfoRecord.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> GIRepositoryArgInfoRecord.FFI.withNewPtr
             ---> GIRepositoryArgInfoRecord.FFI.fromPtr true && I
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
        val type' & () = (GIRepositoryCallableInfoRecord.FFI.withPtr false &&&> GIRepositoryTypeInfoRecord.FFI.withNewPtr ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true && I) callableInfoLoadReturnType_ (info & ())
      in
        type'
      end
    fun callableInfoMayReturnNull info = (GIRepositoryCallableInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) callableInfoMayReturnNull_ info
    fun callableInfoSkipReturn info = (GIRepositoryCallableInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) callableInfoSkipReturn_ info
    fun constantInfoGetType info = (GIRepositoryConstantInfoRecord.FFI.withPtr false ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true) constantInfoGetType_ info
    fun enumInfoGetErrorDomain info = (GIRepositoryEnumInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) enumInfoGetErrorDomain_ info before GIRepositoryEnumInfoRecord.FFI.touchPtr info
    fun enumInfoGetMethod (info, n) = (GIRepositoryEnumInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) enumInfoGetMethod_ (info & n)
    fun enumInfoGetNMethods info = (GIRepositoryEnumInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) enumInfoGetNMethods_ info
    fun enumInfoGetNValues info = (GIRepositoryEnumInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) enumInfoGetNValues_ info
    fun enumInfoGetStorageType info = (GIRepositoryEnumInfoRecord.FFI.withPtr false ---> GIRepositoryTypeTag.FFI.fromVal) enumInfoGetStorageType_ info
    fun enumInfoGetValue (info, n) = (GIRepositoryEnumInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryValueInfoRecord.FFI.fromPtr true) enumInfoGetValue_ (info & n)
    fun fieldInfoGetFlags info = (GIRepositoryFieldInfoRecord.FFI.withPtr false ---> GIRepositoryFieldInfoFlags.FFI.fromVal) fieldInfoGetFlags_ info
    fun fieldInfoGetOffset info = (GIRepositoryFieldInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) fieldInfoGetOffset_ info
    fun fieldInfoGetSize info = (GIRepositoryFieldInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) fieldInfoGetSize_ info
    fun fieldInfoGetType info = (GIRepositoryFieldInfoRecord.FFI.withPtr false ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true) fieldInfoGetType_ info
    fun functionInfoGetFlags info = (GIRepositoryFunctionInfoRecord.FFI.withPtr false ---> GIRepositoryFunctionInfoFlags.FFI.fromVal) functionInfoGetFlags_ info
    fun functionInfoGetProperty info = (GIRepositoryFunctionInfoRecord.FFI.withPtr false ---> GIRepositoryPropertyInfoRecord.FFI.fromPtr true) functionInfoGetProperty_ info
    fun functionInfoGetSymbol info = (GIRepositoryFunctionInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) functionInfoGetSymbol_ info before GIRepositoryFunctionInfoRecord.FFI.touchPtr info
    fun functionInfoGetVfunc info = (GIRepositoryFunctionInfoRecord.FFI.withPtr false ---> GIRepositoryVFuncInfoRecord.FFI.fromPtr true) functionInfoGetVfunc_ info
    fun infoTypeToString type' = (GIRepositoryInfoType.FFI.withVal ---> Utf8.FFI.fromPtr 0) infoTypeToString_ type'
    fun interfaceInfoFindMethod (info, name) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) interfaceInfoFindMethod_ (info & name)
    fun interfaceInfoFindSignal (info, name) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GIRepositorySignalInfoRecord.FFI.fromPtr true) interfaceInfoFindSignal_ (info & name)
    fun interfaceInfoFindVfunc (info, name) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GIRepositoryVFuncInfoRecord.FFI.fromPtr true) interfaceInfoFindVfunc_ (info & name)
    fun interfaceInfoGetConstant (info, n) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryConstantInfoRecord.FFI.fromPtr true) interfaceInfoGetConstant_ (info & n)
    fun interfaceInfoGetIfaceStruct info = (GIRepositoryInterfaceInfoRecord.FFI.withPtr false ---> GIRepositoryStructInfoRecord.FFI.fromPtr true) interfaceInfoGetIfaceStruct_ info
    fun interfaceInfoGetMethod (info, n) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) interfaceInfoGetMethod_ (info & n)
    fun interfaceInfoGetNConstants info = (GIRepositoryInterfaceInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) interfaceInfoGetNConstants_ info
    fun interfaceInfoGetNMethods info = (GIRepositoryInterfaceInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) interfaceInfoGetNMethods_ info
    fun interfaceInfoGetNPrerequisites info = (GIRepositoryInterfaceInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) interfaceInfoGetNPrerequisites_ info
    fun interfaceInfoGetNProperties info = (GIRepositoryInterfaceInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) interfaceInfoGetNProperties_ info
    fun interfaceInfoGetNSignals info = (GIRepositoryInterfaceInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) interfaceInfoGetNSignals_ info
    fun interfaceInfoGetNVfuncs info = (GIRepositoryInterfaceInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) interfaceInfoGetNVfuncs_ info
    fun interfaceInfoGetPrerequisite (info, n) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoGetPrerequisite_ (info & n)
    fun interfaceInfoGetProperty (info, n) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryPropertyInfoRecord.FFI.fromPtr true) interfaceInfoGetProperty_ (info & n)
    fun interfaceInfoGetSignal (info, n) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositorySignalInfoRecord.FFI.fromPtr true) interfaceInfoGetSignal_ (info & n)
    fun interfaceInfoGetVfunc (info, n) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryVFuncInfoRecord.FFI.fromPtr true) interfaceInfoGetVfunc_ (info & n)
    fun invokeErrorQuark () = (I ---> GLibQuark.FFI.fromVal) invokeErrorQuark_ ()
    fun objectInfoFindMethod (info, name) = (GIRepositoryObjectInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) objectInfoFindMethod_ (info & name)
    fun objectInfoFindMethodUsingInterfaces (info, name) =
      let
        val implementor & retVal =
          (
            GIRepositoryObjectInfoRecord.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GIRepositoryObjectInfoRecord.FFI.withRefOptPtr true
             ---> GIRepositoryObjectInfoRecord.FFI.fromPtr true && GIRepositoryFunctionInfoRecord.FFI.fromPtr true
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
    fun objectInfoFindSignal (info, name) = (GIRepositoryObjectInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GIRepositorySignalInfoRecord.FFI.fromPtr true) objectInfoFindSignal_ (info & name)
    fun objectInfoFindVfunc (info, name) = (GIRepositoryObjectInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GIRepositoryVFuncInfoRecord.FFI.fromPtr true) objectInfoFindVfunc_ (info & name)
    fun objectInfoFindVfuncUsingInterfaces (info, name) =
      let
        val implementor & retVal =
          (
            GIRepositoryObjectInfoRecord.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GIRepositoryObjectInfoRecord.FFI.withRefOptPtr true
             ---> GIRepositoryObjectInfoRecord.FFI.fromPtr true && GIRepositoryVFuncInfoRecord.FFI.fromPtr true
          )
            objectInfoFindVfuncUsingInterfaces_
            (
              info
               & name
               & NONE
            )
      in
        (retVal, implementor)
      end
    fun objectInfoGetAbstract info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) objectInfoGetAbstract_ info
    fun objectInfoGetClassStruct info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> GIRepositoryStructInfoRecord.FFI.fromPtr true) objectInfoGetClassStruct_ info
    fun objectInfoGetConstant (info, n) = (GIRepositoryObjectInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryConstantInfoRecord.FFI.fromPtr true) objectInfoGetConstant_ (info & n)
    fun objectInfoGetField (info, n) = (GIRepositoryObjectInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryFieldInfoRecord.FFI.fromPtr true) objectInfoGetField_ (info & n)
    fun objectInfoGetFundamental info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) objectInfoGetFundamental_ info
    fun objectInfoGetGetValueFunction info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) objectInfoGetGetValueFunction_ info before GIRepositoryObjectInfoRecord.FFI.touchPtr info
    fun objectInfoGetInterface (info, n) = (GIRepositoryObjectInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryInterfaceInfoRecord.FFI.fromPtr true) objectInfoGetInterface_ (info & n)
    fun objectInfoGetMethod (info, n) = (GIRepositoryObjectInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) objectInfoGetMethod_ (info & n)
    fun objectInfoGetNConstants info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) objectInfoGetNConstants_ info
    fun objectInfoGetNFields info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) objectInfoGetNFields_ info
    fun objectInfoGetNInterfaces info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) objectInfoGetNInterfaces_ info
    fun objectInfoGetNMethods info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) objectInfoGetNMethods_ info
    fun objectInfoGetNProperties info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) objectInfoGetNProperties_ info
    fun objectInfoGetNSignals info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) objectInfoGetNSignals_ info
    fun objectInfoGetNVfuncs info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) objectInfoGetNVfuncs_ info
    fun objectInfoGetParent info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> GIRepositoryObjectInfoRecord.FFI.fromPtr true) objectInfoGetParent_ info
    fun objectInfoGetProperty (info, n) = (GIRepositoryObjectInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryPropertyInfoRecord.FFI.fromPtr true) objectInfoGetProperty_ (info & n)
    fun objectInfoGetRefFunction info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) objectInfoGetRefFunction_ info before GIRepositoryObjectInfoRecord.FFI.touchPtr info
    fun objectInfoGetSetValueFunction info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) objectInfoGetSetValueFunction_ info before GIRepositoryObjectInfoRecord.FFI.touchPtr info
    fun objectInfoGetSignal (info, n) = (GIRepositoryObjectInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositorySignalInfoRecord.FFI.fromPtr true) objectInfoGetSignal_ (info & n)
    fun objectInfoGetTypeInit info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) objectInfoGetTypeInit_ info before GIRepositoryObjectInfoRecord.FFI.touchPtr info
    fun objectInfoGetTypeName info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) objectInfoGetTypeName_ info before GIRepositoryObjectInfoRecord.FFI.touchPtr info
    fun objectInfoGetUnrefFunction info = (GIRepositoryObjectInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) objectInfoGetUnrefFunction_ info before GIRepositoryObjectInfoRecord.FFI.touchPtr info
    fun objectInfoGetVfunc (info, n) = (GIRepositoryObjectInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryVFuncInfoRecord.FFI.fromPtr true) objectInfoGetVfunc_ (info & n)
    fun propertyInfoGetFlags info = (GIRepositoryPropertyInfoRecord.FFI.withPtr false ---> GObjectParamFlags.FFI.fromVal) propertyInfoGetFlags_ info
    fun propertyInfoGetOwnershipTransfer info = (GIRepositoryPropertyInfoRecord.FFI.withPtr false ---> GIRepositoryTransfer.FFI.fromVal) propertyInfoGetOwnershipTransfer_ info
    fun propertyInfoGetType info = (GIRepositoryPropertyInfoRecord.FFI.withPtr false ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true) propertyInfoGetType_ info
    fun registeredTypeInfoGetGType info = (GIRepositoryRegisteredTypeInfoRecord.FFI.withPtr false ---> GObjectType.FFI.fromVal) registeredTypeInfoGetGType_ info
    fun registeredTypeInfoGetTypeInit info = (GIRepositoryRegisteredTypeInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) registeredTypeInfoGetTypeInit_ info before GIRepositoryRegisteredTypeInfoRecord.FFI.touchPtr info
    fun registeredTypeInfoGetTypeName info = (GIRepositoryRegisteredTypeInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) registeredTypeInfoGetTypeName_ info before GIRepositoryRegisteredTypeInfoRecord.FFI.touchPtr info
    fun signalInfoGetClassClosure info = (GIRepositorySignalInfoRecord.FFI.withPtr false ---> GIRepositoryVFuncInfoRecord.FFI.fromPtr true) signalInfoGetClassClosure_ info
    fun signalInfoGetFlags info = (GIRepositorySignalInfoRecord.FFI.withPtr false ---> GObjectSignalFlags.FFI.fromVal) signalInfoGetFlags_ info
    fun signalInfoTrueStopsEmit info = (GIRepositorySignalInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) signalInfoTrueStopsEmit_ info
    fun structInfoFindField (info, name) = (GIRepositoryStructInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GIRepositoryFieldInfoRecord.FFI.fromPtr true) structInfoFindField_ (info & name)
    fun structInfoFindMethod (info, name) = (GIRepositoryStructInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) structInfoFindMethod_ (info & name)
    fun structInfoGetAlignment info = (GIRepositoryStructInfoRecord.FFI.withPtr false ---> GSize.FFI.fromVal) structInfoGetAlignment_ info
    fun structInfoGetField (info, n) = (GIRepositoryStructInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryFieldInfoRecord.FFI.fromPtr true) structInfoGetField_ (info & n)
    fun structInfoGetMethod (info, n) = (GIRepositoryStructInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) structInfoGetMethod_ (info & n)
    fun structInfoGetNFields info = (GIRepositoryStructInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) structInfoGetNFields_ info
    fun structInfoGetNMethods info = (GIRepositoryStructInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) structInfoGetNMethods_ info
    fun structInfoGetSize info = (GIRepositoryStructInfoRecord.FFI.withPtr false ---> GSize.FFI.fromVal) structInfoGetSize_ info
    fun structInfoIsForeign info = (GIRepositoryStructInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) structInfoIsForeign_ info
    fun structInfoIsGtypeStruct info = (GIRepositoryStructInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) structInfoIsGtypeStruct_ info
    fun typeInfoGetArrayFixedSize info = (GIRepositoryTypeInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) typeInfoGetArrayFixedSize_ info
    fun typeInfoGetArrayLength info = (GIRepositoryTypeInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) typeInfoGetArrayLength_ info
    fun typeInfoGetArrayType info = (GIRepositoryTypeInfoRecord.FFI.withPtr false ---> GIRepositoryArrayType.FFI.fromVal) typeInfoGetArrayType_ info
    fun typeInfoGetInterface info = (GIRepositoryTypeInfoRecord.FFI.withPtr false ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) typeInfoGetInterface_ info
    fun typeInfoGetParamType (info, n) = (GIRepositoryTypeInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true) typeInfoGetParamType_ (info & n)
    fun typeInfoGetTag info = (GIRepositoryTypeInfoRecord.FFI.withPtr false ---> GIRepositoryTypeTag.FFI.fromVal) typeInfoGetTag_ info
    fun typeInfoIsPointer info = (GIRepositoryTypeInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) typeInfoIsPointer_ info
    fun typeInfoIsZeroTerminated info = (GIRepositoryTypeInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) typeInfoIsZeroTerminated_ info
    fun typeTagToString type' = (GIRepositoryTypeTag.FFI.withVal ---> Utf8.FFI.fromPtr 0) typeTagToString_ type'
    fun unionInfoFindMethod (info, name) = (GIRepositoryUnionInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) unionInfoFindMethod_ (info & name)
    fun unionInfoGetAlignment info = (GIRepositoryUnionInfoRecord.FFI.withPtr false ---> GSize.FFI.fromVal) unionInfoGetAlignment_ info
    fun unionInfoGetDiscriminator (info, n) = (GIRepositoryUnionInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryConstantInfoRecord.FFI.fromPtr true) unionInfoGetDiscriminator_ (info & n)
    fun unionInfoGetDiscriminatorOffset info = (GIRepositoryUnionInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) unionInfoGetDiscriminatorOffset_ info
    fun unionInfoGetDiscriminatorType info = (GIRepositoryUnionInfoRecord.FFI.withPtr false ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true) unionInfoGetDiscriminatorType_ info
    fun unionInfoGetField (info, n) = (GIRepositoryUnionInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryFieldInfoRecord.FFI.fromPtr true) unionInfoGetField_ (info & n)
    fun unionInfoGetMethod (info, n) = (GIRepositoryUnionInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) unionInfoGetMethod_ (info & n)
    fun unionInfoGetNFields info = (GIRepositoryUnionInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) unionInfoGetNFields_ info
    fun unionInfoGetNMethods info = (GIRepositoryUnionInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) unionInfoGetNMethods_ info
    fun unionInfoGetSize info = (GIRepositoryUnionInfoRecord.FFI.withPtr false ---> GSize.FFI.fromVal) unionInfoGetSize_ info
    fun unionInfoIsDiscriminated info = (GIRepositoryUnionInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) unionInfoIsDiscriminated_ info
    fun valueInfoGetValue info = (GIRepositoryValueInfoRecord.FFI.withPtr false ---> GInt64.FFI.fromVal) valueInfoGetValue_ info
    fun vfuncInfoGetFlags info = (GIRepositoryVFuncInfoRecord.FFI.withPtr false ---> GIRepositoryVFuncInfoFlags.FFI.fromVal) vfuncInfoGetFlags_ info
    fun vfuncInfoGetInvoker info = (GIRepositoryVFuncInfoRecord.FFI.withPtr false ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) vfuncInfoGetInvoker_ info
    fun vfuncInfoGetOffset info = (GIRepositoryVFuncInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) vfuncInfoGetOffset_ info
    fun vfuncInfoGetSignal info = (GIRepositoryVFuncInfoRecord.FFI.withPtr false ---> GIRepositorySignalInfoRecord.FFI.fromPtr true) vfuncInfoGetSignal_ info
  end
