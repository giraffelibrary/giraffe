structure GIRepository : G_I_REPOSITORY =
  struct
    local
      open PolyMLFFI
    in
      val argInfoGetClosure_ = call (getSymbol "g_arg_info_get_closure") (GIRepositoryArgInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val argInfoGetDestroy_ = call (getSymbol "g_arg_info_get_destroy") (GIRepositoryArgInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val argInfoGetDirection_ = call (getSymbol "g_arg_info_get_direction") (GIRepositoryArgInfoRecord.PolyML.cPtr --> GIRepositoryDirection.PolyML.cVal)
      val argInfoGetOwnershipTransfer_ = call (getSymbol "g_arg_info_get_ownership_transfer") (GIRepositoryArgInfoRecord.PolyML.cPtr --> GIRepositoryTransfer.PolyML.cVal)
      val argInfoGetScope_ = call (getSymbol "g_arg_info_get_scope") (GIRepositoryArgInfoRecord.PolyML.cPtr --> GIRepositoryScopeType.PolyML.cVal)
      val argInfoGetType_ = call (getSymbol "g_arg_info_get_type") (GIRepositoryArgInfoRecord.PolyML.cPtr --> GIRepositoryTypeInfoRecord.PolyML.cPtr)
      val argInfoIsCallerAllocates_ = call (getSymbol "g_arg_info_is_caller_allocates") (GIRepositoryArgInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val argInfoIsOptional_ = call (getSymbol "g_arg_info_is_optional") (GIRepositoryArgInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val argInfoIsReturnValue_ = call (getSymbol "g_arg_info_is_return_value") (GIRepositoryArgInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val argInfoIsSkip_ = call (getSymbol "g_arg_info_is_skip") (GIRepositoryArgInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val argInfoLoadType_ = call (getSymbol "g_arg_info_load_type") (GIRepositoryArgInfoRecord.PolyML.cPtr &&> GIRepositoryTypeInfoRecord.PolyML.cPtr --> cVoid)
      val argInfoMayBeNull_ = call (getSymbol "g_arg_info_may_be_null") (GIRepositoryArgInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val callableInfoCanThrowGerror_ = call (getSymbol "g_callable_info_can_throw_gerror") (GIRepositoryCallableInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val callableInfoGetArg_ = call (getSymbol "g_callable_info_get_arg") (GIRepositoryCallableInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryArgInfoRecord.PolyML.cPtr)
      val callableInfoGetCallerOwns_ = call (getSymbol "g_callable_info_get_caller_owns") (GIRepositoryCallableInfoRecord.PolyML.cPtr --> GIRepositoryTransfer.PolyML.cVal)
      val callableInfoGetInstanceOwnershipTransfer_ = call (getSymbol "g_callable_info_get_instance_ownership_transfer") (GIRepositoryCallableInfoRecord.PolyML.cPtr --> GIRepositoryTransfer.PolyML.cVal)
      val callableInfoGetNArgs_ = call (getSymbol "g_callable_info_get_n_args") (GIRepositoryCallableInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val callableInfoGetReturnAttribute_ = call (getSymbol "g_callable_info_get_return_attribute") (GIRepositoryCallableInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val callableInfoGetReturnType_ = call (getSymbol "g_callable_info_get_return_type") (GIRepositoryCallableInfoRecord.PolyML.cPtr --> GIRepositoryTypeInfoRecord.PolyML.cPtr)
      val callableInfoIsMethod_ = call (getSymbol "g_callable_info_is_method") (GIRepositoryCallableInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val callableInfoIterateReturnAttributes_ =
        call (getSymbol "g_callable_info_iterate_return_attributes")
          (
            GIRepositoryCallableInfoRecord.PolyML.cPtr
             &&> GIRepositoryAttributeIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cOutRef
             &&> Utf8.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
      val callableInfoLoadArg_ =
        call (getSymbol "g_callable_info_load_arg")
          (
            GIRepositoryCallableInfoRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GIRepositoryArgInfoRecord.PolyML.cPtr
             --> cVoid
          )
      val callableInfoLoadReturnType_ = call (getSymbol "g_callable_info_load_return_type") (GIRepositoryCallableInfoRecord.PolyML.cPtr &&> GIRepositoryTypeInfoRecord.PolyML.cPtr --> cVoid)
      val callableInfoMayReturnNull_ = call (getSymbol "g_callable_info_may_return_null") (GIRepositoryCallableInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val callableInfoSkipReturn_ = call (getSymbol "g_callable_info_skip_return") (GIRepositoryCallableInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val constantInfoGetType_ = call (getSymbol "g_constant_info_get_type") (GIRepositoryConstantInfoRecord.PolyML.cPtr --> GIRepositoryTypeInfoRecord.PolyML.cPtr)
      val enumInfoGetErrorDomain_ = call (getSymbol "g_enum_info_get_error_domain") (GIRepositoryEnumInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val enumInfoGetMethod_ = call (getSymbol "g_enum_info_get_method") (GIRepositoryEnumInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryFunctionInfoRecord.PolyML.cPtr)
      val enumInfoGetNMethods_ = call (getSymbol "g_enum_info_get_n_methods") (GIRepositoryEnumInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val enumInfoGetNValues_ = call (getSymbol "g_enum_info_get_n_values") (GIRepositoryEnumInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val enumInfoGetStorageType_ = call (getSymbol "g_enum_info_get_storage_type") (GIRepositoryEnumInfoRecord.PolyML.cPtr --> GIRepositoryTypeTag.PolyML.cVal)
      val enumInfoGetValue_ = call (getSymbol "g_enum_info_get_value") (GIRepositoryEnumInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryValueInfoRecord.PolyML.cPtr)
      val fieldInfoGetFlags_ = call (getSymbol "g_field_info_get_flags") (GIRepositoryFieldInfoRecord.PolyML.cPtr --> GIRepositoryFieldInfoFlags.PolyML.cVal)
      val fieldInfoGetOffset_ = call (getSymbol "g_field_info_get_offset") (GIRepositoryFieldInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val fieldInfoGetSize_ = call (getSymbol "g_field_info_get_size") (GIRepositoryFieldInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val fieldInfoGetType_ = call (getSymbol "g_field_info_get_type") (GIRepositoryFieldInfoRecord.PolyML.cPtr --> GIRepositoryTypeInfoRecord.PolyML.cPtr)
      val functionInfoGetFlags_ = call (getSymbol "g_function_info_get_flags") (GIRepositoryFunctionInfoRecord.PolyML.cPtr --> GIRepositoryFunctionInfoFlags.PolyML.cVal)
      val functionInfoGetProperty_ = call (getSymbol "g_function_info_get_property") (GIRepositoryFunctionInfoRecord.PolyML.cPtr --> GIRepositoryPropertyInfoRecord.PolyML.cPtr)
      val functionInfoGetSymbol_ = call (getSymbol "g_function_info_get_symbol") (GIRepositoryFunctionInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val functionInfoGetVfunc_ = call (getSymbol "g_function_info_get_vfunc") (GIRepositoryFunctionInfoRecord.PolyML.cPtr --> GIRepositoryVFuncInfoRecord.PolyML.cPtr)
      val infoNew_ =
        call (getSymbol "g_info_new")
          (
            GIRepositoryInfoType.PolyML.cVal
             &&> GIRepositoryBaseInfoRecord.PolyML.cPtr
             &&> GIRepositoryTypelibRecord.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             --> GIRepositoryBaseInfoRecord.PolyML.cPtr
          )
      val infoTypeToString_ = call (getSymbol "g_info_type_to_string") (GIRepositoryInfoType.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val interfaceInfoFindMethod_ = call (getSymbol "g_interface_info_find_method") (GIRepositoryInterfaceInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GIRepositoryFunctionInfoRecord.PolyML.cPtr)
      val interfaceInfoFindSignal_ = call (getSymbol "g_interface_info_find_signal") (GIRepositoryInterfaceInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GIRepositorySignalInfoRecord.PolyML.cPtr)
      val interfaceInfoFindVfunc_ = call (getSymbol "g_interface_info_find_vfunc") (GIRepositoryInterfaceInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GIRepositoryVFuncInfoRecord.PolyML.cPtr)
      val interfaceInfoGetConstant_ = call (getSymbol "g_interface_info_get_constant") (GIRepositoryInterfaceInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryConstantInfoRecord.PolyML.cPtr)
      val interfaceInfoGetIfaceStruct_ = call (getSymbol "g_interface_info_get_iface_struct") (GIRepositoryInterfaceInfoRecord.PolyML.cPtr --> GIRepositoryStructInfoRecord.PolyML.cPtr)
      val interfaceInfoGetMethod_ = call (getSymbol "g_interface_info_get_method") (GIRepositoryInterfaceInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryFunctionInfoRecord.PolyML.cPtr)
      val interfaceInfoGetNConstants_ = call (getSymbol "g_interface_info_get_n_constants") (GIRepositoryInterfaceInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val interfaceInfoGetNMethods_ = call (getSymbol "g_interface_info_get_n_methods") (GIRepositoryInterfaceInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val interfaceInfoGetNPrerequisites_ = call (getSymbol "g_interface_info_get_n_prerequisites") (GIRepositoryInterfaceInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val interfaceInfoGetNProperties_ = call (getSymbol "g_interface_info_get_n_properties") (GIRepositoryInterfaceInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val interfaceInfoGetNSignals_ = call (getSymbol "g_interface_info_get_n_signals") (GIRepositoryInterfaceInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val interfaceInfoGetNVfuncs_ = call (getSymbol "g_interface_info_get_n_vfuncs") (GIRepositoryInterfaceInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val interfaceInfoGetPrerequisite_ = call (getSymbol "g_interface_info_get_prerequisite") (GIRepositoryInterfaceInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val interfaceInfoGetProperty_ = call (getSymbol "g_interface_info_get_property") (GIRepositoryInterfaceInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryPropertyInfoRecord.PolyML.cPtr)
      val interfaceInfoGetSignal_ = call (getSymbol "g_interface_info_get_signal") (GIRepositoryInterfaceInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositorySignalInfoRecord.PolyML.cPtr)
      val interfaceInfoGetVfunc_ = call (getSymbol "g_interface_info_get_vfunc") (GIRepositoryInterfaceInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryVFuncInfoRecord.PolyML.cPtr)
      val invokeErrorQuark_ = call (getSymbol "g_invoke_error_quark") (cVoid --> GLibQuark.PolyML.cVal)
      val objectInfoFindMethod_ = call (getSymbol "g_object_info_find_method") (GIRepositoryObjectInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GIRepositoryFunctionInfoRecord.PolyML.cPtr)
      val objectInfoFindMethodUsingInterfaces_ =
        call (getSymbol "g_object_info_find_method_using_interfaces")
          (
            GIRepositoryObjectInfoRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GIRepositoryObjectInfoRecord.PolyML.cOutRef
             --> GIRepositoryFunctionInfoRecord.PolyML.cPtr
          )
      val objectInfoFindSignal_ = call (getSymbol "g_object_info_find_signal") (GIRepositoryObjectInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GIRepositorySignalInfoRecord.PolyML.cPtr)
      val objectInfoFindVfunc_ = call (getSymbol "g_object_info_find_vfunc") (GIRepositoryObjectInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GIRepositoryVFuncInfoRecord.PolyML.cPtr)
      val objectInfoFindVfuncUsingInterfaces_ =
        call (getSymbol "g_object_info_find_vfunc_using_interfaces")
          (
            GIRepositoryObjectInfoRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GIRepositoryObjectInfoRecord.PolyML.cOutRef
             --> GIRepositoryVFuncInfoRecord.PolyML.cPtr
          )
      val objectInfoGetAbstract_ = call (getSymbol "g_object_info_get_abstract") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val objectInfoGetClassStruct_ = call (getSymbol "g_object_info_get_class_struct") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> GIRepositoryStructInfoRecord.PolyML.cPtr)
      val objectInfoGetConstant_ = call (getSymbol "g_object_info_get_constant") (GIRepositoryObjectInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryConstantInfoRecord.PolyML.cPtr)
      val objectInfoGetField_ = call (getSymbol "g_object_info_get_field") (GIRepositoryObjectInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryFieldInfoRecord.PolyML.cPtr)
      val objectInfoGetFundamental_ = call (getSymbol "g_object_info_get_fundamental") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val objectInfoGetGetValueFunction_ = call (getSymbol "g_object_info_get_get_value_function") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val objectInfoGetInterface_ = call (getSymbol "g_object_info_get_interface") (GIRepositoryObjectInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryInterfaceInfoRecord.PolyML.cPtr)
      val objectInfoGetMethod_ = call (getSymbol "g_object_info_get_method") (GIRepositoryObjectInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryFunctionInfoRecord.PolyML.cPtr)
      val objectInfoGetNConstants_ = call (getSymbol "g_object_info_get_n_constants") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val objectInfoGetNFields_ = call (getSymbol "g_object_info_get_n_fields") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val objectInfoGetNInterfaces_ = call (getSymbol "g_object_info_get_n_interfaces") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val objectInfoGetNMethods_ = call (getSymbol "g_object_info_get_n_methods") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val objectInfoGetNProperties_ = call (getSymbol "g_object_info_get_n_properties") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val objectInfoGetNSignals_ = call (getSymbol "g_object_info_get_n_signals") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val objectInfoGetNVfuncs_ = call (getSymbol "g_object_info_get_n_vfuncs") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val objectInfoGetParent_ = call (getSymbol "g_object_info_get_parent") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> GIRepositoryObjectInfoRecord.PolyML.cPtr)
      val objectInfoGetProperty_ = call (getSymbol "g_object_info_get_property") (GIRepositoryObjectInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryPropertyInfoRecord.PolyML.cPtr)
      val objectInfoGetRefFunction_ = call (getSymbol "g_object_info_get_ref_function") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val objectInfoGetSetValueFunction_ = call (getSymbol "g_object_info_get_set_value_function") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val objectInfoGetSignal_ = call (getSymbol "g_object_info_get_signal") (GIRepositoryObjectInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositorySignalInfoRecord.PolyML.cPtr)
      val objectInfoGetTypeInit_ = call (getSymbol "g_object_info_get_type_init") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val objectInfoGetTypeName_ = call (getSymbol "g_object_info_get_type_name") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val objectInfoGetUnrefFunction_ = call (getSymbol "g_object_info_get_unref_function") (GIRepositoryObjectInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val objectInfoGetVfunc_ = call (getSymbol "g_object_info_get_vfunc") (GIRepositoryObjectInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryVFuncInfoRecord.PolyML.cPtr)
      val propertyInfoGetFlags_ = call (getSymbol "g_property_info_get_flags") (GIRepositoryPropertyInfoRecord.PolyML.cPtr --> GObjectParamFlags.PolyML.cVal)
      val propertyInfoGetOwnershipTransfer_ = call (getSymbol "g_property_info_get_ownership_transfer") (GIRepositoryPropertyInfoRecord.PolyML.cPtr --> GIRepositoryTransfer.PolyML.cVal)
      val propertyInfoGetType_ = call (getSymbol "g_property_info_get_type") (GIRepositoryPropertyInfoRecord.PolyML.cPtr --> GIRepositoryTypeInfoRecord.PolyML.cPtr)
      val registeredTypeInfoGetGType_ = call (getSymbol "g_registered_type_info_get_g_type") (GIRepositoryRegisteredTypeInfoRecord.PolyML.cPtr --> GObjectType.PolyML.cVal)
      val registeredTypeInfoGetTypeInit_ = call (getSymbol "g_registered_type_info_get_type_init") (GIRepositoryRegisteredTypeInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val registeredTypeInfoGetTypeName_ = call (getSymbol "g_registered_type_info_get_type_name") (GIRepositoryRegisteredTypeInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val signalInfoGetClassClosure_ = call (getSymbol "g_signal_info_get_class_closure") (GIRepositorySignalInfoRecord.PolyML.cPtr --> GIRepositoryVFuncInfoRecord.PolyML.cPtr)
      val signalInfoGetFlags_ = call (getSymbol "g_signal_info_get_flags") (GIRepositorySignalInfoRecord.PolyML.cPtr --> GObjectSignalFlags.PolyML.cVal)
      val signalInfoTrueStopsEmit_ = call (getSymbol "g_signal_info_true_stops_emit") (GIRepositorySignalInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val structInfoFindField_ = call (getSymbol "g_struct_info_find_field") (GIRepositoryStructInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GIRepositoryFieldInfoRecord.PolyML.cPtr)
      val structInfoFindMethod_ = call (getSymbol "g_struct_info_find_method") (GIRepositoryStructInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GIRepositoryFunctionInfoRecord.PolyML.cPtr)
      val structInfoGetAlignment_ = call (getSymbol "g_struct_info_get_alignment") (GIRepositoryStructInfoRecord.PolyML.cPtr --> GSize.PolyML.cVal)
      val structInfoGetField_ = call (getSymbol "g_struct_info_get_field") (GIRepositoryStructInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryFieldInfoRecord.PolyML.cPtr)
      val structInfoGetMethod_ = call (getSymbol "g_struct_info_get_method") (GIRepositoryStructInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryFunctionInfoRecord.PolyML.cPtr)
      val structInfoGetNFields_ = call (getSymbol "g_struct_info_get_n_fields") (GIRepositoryStructInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val structInfoGetNMethods_ = call (getSymbol "g_struct_info_get_n_methods") (GIRepositoryStructInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val structInfoGetSize_ = call (getSymbol "g_struct_info_get_size") (GIRepositoryStructInfoRecord.PolyML.cPtr --> GSize.PolyML.cVal)
      val structInfoIsForeign_ = call (getSymbol "g_struct_info_is_foreign") (GIRepositoryStructInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val structInfoIsGtypeStruct_ = call (getSymbol "g_struct_info_is_gtype_struct") (GIRepositoryStructInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val typeInfoGetArrayFixedSize_ = call (getSymbol "g_type_info_get_array_fixed_size") (GIRepositoryTypeInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val typeInfoGetArrayLength_ = call (getSymbol "g_type_info_get_array_length") (GIRepositoryTypeInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val typeInfoGetArrayType_ = call (getSymbol "g_type_info_get_array_type") (GIRepositoryTypeInfoRecord.PolyML.cPtr --> GIRepositoryArrayType.PolyML.cVal)
      val typeInfoGetInterface_ = call (getSymbol "g_type_info_get_interface") (GIRepositoryTypeInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val typeInfoGetParamType_ = call (getSymbol "g_type_info_get_param_type") (GIRepositoryTypeInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryTypeInfoRecord.PolyML.cPtr)
      val typeInfoGetTag_ = call (getSymbol "g_type_info_get_tag") (GIRepositoryTypeInfoRecord.PolyML.cPtr --> GIRepositoryTypeTag.PolyML.cVal)
      val typeInfoIsPointer_ = call (getSymbol "g_type_info_is_pointer") (GIRepositoryTypeInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val typeInfoIsZeroTerminated_ = call (getSymbol "g_type_info_is_zero_terminated") (GIRepositoryTypeInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val typeTagToString_ = call (getSymbol "g_type_tag_to_string") (GIRepositoryTypeTag.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val unionInfoFindMethod_ = call (getSymbol "g_union_info_find_method") (GIRepositoryUnionInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GIRepositoryFunctionInfoRecord.PolyML.cPtr)
      val unionInfoGetAlignment_ = call (getSymbol "g_union_info_get_alignment") (GIRepositoryUnionInfoRecord.PolyML.cPtr --> GSize.PolyML.cVal)
      val unionInfoGetDiscriminator_ = call (getSymbol "g_union_info_get_discriminator") (GIRepositoryUnionInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryConstantInfoRecord.PolyML.cPtr)
      val unionInfoGetDiscriminatorOffset_ = call (getSymbol "g_union_info_get_discriminator_offset") (GIRepositoryUnionInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val unionInfoGetDiscriminatorType_ = call (getSymbol "g_union_info_get_discriminator_type") (GIRepositoryUnionInfoRecord.PolyML.cPtr --> GIRepositoryTypeInfoRecord.PolyML.cPtr)
      val unionInfoGetField_ = call (getSymbol "g_union_info_get_field") (GIRepositoryUnionInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryFieldInfoRecord.PolyML.cPtr)
      val unionInfoGetMethod_ = call (getSymbol "g_union_info_get_method") (GIRepositoryUnionInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GIRepositoryFunctionInfoRecord.PolyML.cPtr)
      val unionInfoGetNFields_ = call (getSymbol "g_union_info_get_n_fields") (GIRepositoryUnionInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val unionInfoGetNMethods_ = call (getSymbol "g_union_info_get_n_methods") (GIRepositoryUnionInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val unionInfoGetSize_ = call (getSymbol "g_union_info_get_size") (GIRepositoryUnionInfoRecord.PolyML.cPtr --> GSize.PolyML.cVal)
      val unionInfoIsDiscriminated_ = call (getSymbol "g_union_info_is_discriminated") (GIRepositoryUnionInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val valueInfoGetValue_ = call (getSymbol "g_value_info_get_value") (GIRepositoryValueInfoRecord.PolyML.cPtr --> GInt64.PolyML.cVal)
      val vfuncInfoGetFlags_ = call (getSymbol "g_vfunc_info_get_flags") (GIRepositoryVFuncInfoRecord.PolyML.cPtr --> GIRepositoryVFuncInfoFlags.PolyML.cVal)
      val vfuncInfoGetInvoker_ = call (getSymbol "g_vfunc_info_get_invoker") (GIRepositoryVFuncInfoRecord.PolyML.cPtr --> GIRepositoryFunctionInfoRecord.PolyML.cPtr)
      val vfuncInfoGetOffset_ = call (getSymbol "g_vfunc_info_get_offset") (GIRepositoryVFuncInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val vfuncInfoGetSignal_ = call (getSymbol "g_vfunc_info_get_signal") (GIRepositoryVFuncInfoRecord.PolyML.cPtr --> GIRepositorySignalInfoRecord.PolyML.cPtr)
    end
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
    fun argInfoGetClosure info = (GIRepositoryArgInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) argInfoGetClosure_ info
    fun argInfoGetDestroy info = (GIRepositoryArgInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) argInfoGetDestroy_ info
    fun argInfoGetDirection info = (GIRepositoryArgInfoRecord.FFI.withPtr ---> GIRepositoryDirection.FFI.fromVal) argInfoGetDirection_ info
    fun argInfoGetOwnershipTransfer info = (GIRepositoryArgInfoRecord.FFI.withPtr ---> GIRepositoryTransfer.FFI.fromVal) argInfoGetOwnershipTransfer_ info
    fun argInfoGetScope info = (GIRepositoryArgInfoRecord.FFI.withPtr ---> GIRepositoryScopeType.FFI.fromVal) argInfoGetScope_ info
    fun argInfoGetType info = (GIRepositoryArgInfoRecord.FFI.withPtr ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true) argInfoGetType_ info
    fun argInfoIsCallerAllocates info = (GIRepositoryArgInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) argInfoIsCallerAllocates_ info
    fun argInfoIsOptional info = (GIRepositoryArgInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) argInfoIsOptional_ info
    fun argInfoIsReturnValue info = (GIRepositoryArgInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) argInfoIsReturnValue_ info
    fun argInfoIsSkip info = (GIRepositoryArgInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) argInfoIsSkip_ info
    fun argInfoLoadType info =
      let
        val type' & () = (GIRepositoryArgInfoRecord.FFI.withPtr &&&> GIRepositoryTypeInfoRecord.FFI.withNewPtr ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true && I) argInfoLoadType_ (info & ())
      in
        type'
      end
    fun argInfoMayBeNull info = (GIRepositoryArgInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) argInfoMayBeNull_ info
    fun callableInfoCanThrowGerror info = (GIRepositoryCallableInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) callableInfoCanThrowGerror_ info
    fun callableInfoGetArg (info, n) = (GIRepositoryCallableInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryArgInfoRecord.FFI.fromPtr true) callableInfoGetArg_ (info & n)
    fun callableInfoGetCallerOwns info = (GIRepositoryCallableInfoRecord.FFI.withPtr ---> GIRepositoryTransfer.FFI.fromVal) callableInfoGetCallerOwns_ info
    fun callableInfoGetInstanceOwnershipTransfer info = (GIRepositoryCallableInfoRecord.FFI.withPtr ---> GIRepositoryTransfer.FFI.fromVal) callableInfoGetInstanceOwnershipTransfer_ info
    fun callableInfoGetNArgs info = (GIRepositoryCallableInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) callableInfoGetNArgs_ info
    fun callableInfoGetReturnAttribute (info, name) = (GIRepositoryCallableInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) callableInfoGetReturnAttribute_ (info & name)
    fun callableInfoGetReturnType info = (GIRepositoryCallableInfoRecord.FFI.withPtr ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true) callableInfoGetReturnType_ info
    fun callableInfoIsMethod info = (GIRepositoryCallableInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) callableInfoIsMethod_ info
    fun callableInfoIterateReturnAttributes (info, iterator) =
      let
        val iterator
         & name
         & value
         & retVal =
          (
            GIRepositoryCallableInfoRecord.FFI.withPtr
             &&&> GIRepositoryAttributeIterRecord.FFI.withNewDupPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> Utf8.FFI.withRefOptPtr
             ---> GIRepositoryAttributeIterRecord.FFI.fromPtr true
                   && Utf8.FFI.fromPtr 0
                   && Utf8.FFI.fromPtr 0
                   && GBool.FFI.fromVal
          )
            callableInfoIterateReturnAttributes_
            (
              info
               & iterator
               & NONE
               & NONE
            )
      in
        (if retVal then SOME (name, value) else NONE, iterator)
      end
    fun callableInfoLoadArg (info, n) =
      let
        val arg & () =
          (
            GIRepositoryCallableInfoRecord.FFI.withPtr
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
        val type' & () = (GIRepositoryCallableInfoRecord.FFI.withPtr &&&> GIRepositoryTypeInfoRecord.FFI.withNewPtr ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true && I) callableInfoLoadReturnType_ (info & ())
      in
        type'
      end
    fun callableInfoMayReturnNull info = (GIRepositoryCallableInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) callableInfoMayReturnNull_ info
    fun callableInfoSkipReturn info = (GIRepositoryCallableInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) callableInfoSkipReturn_ info
    fun constantInfoGetType info = (GIRepositoryConstantInfoRecord.FFI.withPtr ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true) constantInfoGetType_ info
    fun enumInfoGetErrorDomain info = (GIRepositoryEnumInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) enumInfoGetErrorDomain_ info
    fun enumInfoGetMethod (info, n) = (GIRepositoryEnumInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) enumInfoGetMethod_ (info & n)
    fun enumInfoGetNMethods info = (GIRepositoryEnumInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) enumInfoGetNMethods_ info
    fun enumInfoGetNValues info = (GIRepositoryEnumInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) enumInfoGetNValues_ info
    fun enumInfoGetStorageType info = (GIRepositoryEnumInfoRecord.FFI.withPtr ---> GIRepositoryTypeTag.FFI.fromVal) enumInfoGetStorageType_ info
    fun enumInfoGetValue (info, n) = (GIRepositoryEnumInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryValueInfoRecord.FFI.fromPtr true) enumInfoGetValue_ (info & n)
    fun fieldInfoGetFlags info = (GIRepositoryFieldInfoRecord.FFI.withPtr ---> GIRepositoryFieldInfoFlags.FFI.fromVal) fieldInfoGetFlags_ info
    fun fieldInfoGetOffset info = (GIRepositoryFieldInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) fieldInfoGetOffset_ info
    fun fieldInfoGetSize info = (GIRepositoryFieldInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) fieldInfoGetSize_ info
    fun fieldInfoGetType info = (GIRepositoryFieldInfoRecord.FFI.withPtr ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true) fieldInfoGetType_ info
    fun functionInfoGetFlags info = (GIRepositoryFunctionInfoRecord.FFI.withPtr ---> GIRepositoryFunctionInfoFlags.FFI.fromVal) functionInfoGetFlags_ info
    fun functionInfoGetProperty info = (GIRepositoryFunctionInfoRecord.FFI.withPtr ---> GIRepositoryPropertyInfoRecord.FFI.fromPtr true) functionInfoGetProperty_ info
    fun functionInfoGetSymbol info = (GIRepositoryFunctionInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) functionInfoGetSymbol_ info
    fun functionInfoGetVfunc info = (GIRepositoryFunctionInfoRecord.FFI.withPtr ---> GIRepositoryVFuncInfoRecord.FFI.fromPtr true) functionInfoGetVfunc_ info
    fun infoNew
      (
        type',
        container,
        typelib,
        offset
      ) =
      (
        GIRepositoryInfoType.FFI.withVal
         &&&> GIRepositoryBaseInfoRecord.FFI.withPtr
         &&&> GIRepositoryTypelibRecord.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true
      )
        infoNew_
        (
          type'
           & container
           & typelib
           & offset
        )
    fun infoTypeToString type' = (GIRepositoryInfoType.FFI.withVal ---> Utf8.FFI.fromPtr 0) infoTypeToString_ type'
    fun interfaceInfoFindMethod (info, name) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) interfaceInfoFindMethod_ (info & name)
    fun interfaceInfoFindSignal (info, name) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositorySignalInfoRecord.FFI.fromPtr true) interfaceInfoFindSignal_ (info & name)
    fun interfaceInfoFindVfunc (info, name) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryVFuncInfoRecord.FFI.fromPtr true) interfaceInfoFindVfunc_ (info & name)
    fun interfaceInfoGetConstant (info, n) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryConstantInfoRecord.FFI.fromPtr true) interfaceInfoGetConstant_ (info & n)
    fun interfaceInfoGetIfaceStruct info = (GIRepositoryInterfaceInfoRecord.FFI.withPtr ---> GIRepositoryStructInfoRecord.FFI.fromPtr true) interfaceInfoGetIfaceStruct_ info
    fun interfaceInfoGetMethod (info, n) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) interfaceInfoGetMethod_ (info & n)
    fun interfaceInfoGetNConstants info = (GIRepositoryInterfaceInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) interfaceInfoGetNConstants_ info
    fun interfaceInfoGetNMethods info = (GIRepositoryInterfaceInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) interfaceInfoGetNMethods_ info
    fun interfaceInfoGetNPrerequisites info = (GIRepositoryInterfaceInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) interfaceInfoGetNPrerequisites_ info
    fun interfaceInfoGetNProperties info = (GIRepositoryInterfaceInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) interfaceInfoGetNProperties_ info
    fun interfaceInfoGetNSignals info = (GIRepositoryInterfaceInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) interfaceInfoGetNSignals_ info
    fun interfaceInfoGetNVfuncs info = (GIRepositoryInterfaceInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) interfaceInfoGetNVfuncs_ info
    fun interfaceInfoGetPrerequisite (info, n) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoGetPrerequisite_ (info & n)
    fun interfaceInfoGetProperty (info, n) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryPropertyInfoRecord.FFI.fromPtr true) interfaceInfoGetProperty_ (info & n)
    fun interfaceInfoGetSignal (info, n) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositorySignalInfoRecord.FFI.fromPtr true) interfaceInfoGetSignal_ (info & n)
    fun interfaceInfoGetVfunc (info, n) = (GIRepositoryInterfaceInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryVFuncInfoRecord.FFI.fromPtr true) interfaceInfoGetVfunc_ (info & n)
    fun invokeErrorQuark () = (I ---> GLibQuark.FFI.fromVal) invokeErrorQuark_ ()
    fun objectInfoFindMethod (info, name) = (GIRepositoryObjectInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) objectInfoFindMethod_ (info & name)
    fun objectInfoFindMethodUsingInterfaces (info, name) =
      let
        val implementor & retVal =
          (
            GIRepositoryObjectInfoRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GIRepositoryObjectInfoRecord.FFI.withRefOptPtr
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
    fun objectInfoFindSignal (info, name) = (GIRepositoryObjectInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositorySignalInfoRecord.FFI.fromPtr true) objectInfoFindSignal_ (info & name)
    fun objectInfoFindVfunc (info, name) = (GIRepositoryObjectInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryVFuncInfoRecord.FFI.fromPtr true) objectInfoFindVfunc_ (info & name)
    fun objectInfoFindVfuncUsingInterfaces (info, name) =
      let
        val implementor & retVal =
          (
            GIRepositoryObjectInfoRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GIRepositoryObjectInfoRecord.FFI.withRefOptPtr
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
    fun objectInfoGetAbstract info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) objectInfoGetAbstract_ info
    fun objectInfoGetClassStruct info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> GIRepositoryStructInfoRecord.FFI.fromPtr true) objectInfoGetClassStruct_ info
    fun objectInfoGetConstant (info, n) = (GIRepositoryObjectInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryConstantInfoRecord.FFI.fromPtr true) objectInfoGetConstant_ (info & n)
    fun objectInfoGetField (info, n) = (GIRepositoryObjectInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryFieldInfoRecord.FFI.fromPtr true) objectInfoGetField_ (info & n)
    fun objectInfoGetFundamental info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) objectInfoGetFundamental_ info
    fun objectInfoGetGetValueFunction info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetGetValueFunction_ info
    fun objectInfoGetInterface (info, n) = (GIRepositoryObjectInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryInterfaceInfoRecord.FFI.fromPtr true) objectInfoGetInterface_ (info & n)
    fun objectInfoGetMethod (info, n) = (GIRepositoryObjectInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) objectInfoGetMethod_ (info & n)
    fun objectInfoGetNConstants info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) objectInfoGetNConstants_ info
    fun objectInfoGetNFields info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) objectInfoGetNFields_ info
    fun objectInfoGetNInterfaces info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) objectInfoGetNInterfaces_ info
    fun objectInfoGetNMethods info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) objectInfoGetNMethods_ info
    fun objectInfoGetNProperties info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) objectInfoGetNProperties_ info
    fun objectInfoGetNSignals info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) objectInfoGetNSignals_ info
    fun objectInfoGetNVfuncs info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) objectInfoGetNVfuncs_ info
    fun objectInfoGetParent info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> GIRepositoryObjectInfoRecord.FFI.fromPtr true) objectInfoGetParent_ info
    fun objectInfoGetProperty (info, n) = (GIRepositoryObjectInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryPropertyInfoRecord.FFI.fromPtr true) objectInfoGetProperty_ (info & n)
    fun objectInfoGetRefFunction info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetRefFunction_ info
    fun objectInfoGetSetValueFunction info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetSetValueFunction_ info
    fun objectInfoGetSignal (info, n) = (GIRepositoryObjectInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositorySignalInfoRecord.FFI.fromPtr true) objectInfoGetSignal_ (info & n)
    fun objectInfoGetTypeInit info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetTypeInit_ info
    fun objectInfoGetTypeName info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetTypeName_ info
    fun objectInfoGetUnrefFunction info = (GIRepositoryObjectInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetUnrefFunction_ info
    fun objectInfoGetVfunc (info, n) = (GIRepositoryObjectInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryVFuncInfoRecord.FFI.fromPtr true) objectInfoGetVfunc_ (info & n)
    fun propertyInfoGetFlags info = (GIRepositoryPropertyInfoRecord.FFI.withPtr ---> GObjectParamFlags.FFI.fromVal) propertyInfoGetFlags_ info
    fun propertyInfoGetOwnershipTransfer info = (GIRepositoryPropertyInfoRecord.FFI.withPtr ---> GIRepositoryTransfer.FFI.fromVal) propertyInfoGetOwnershipTransfer_ info
    fun propertyInfoGetType info = (GIRepositoryPropertyInfoRecord.FFI.withPtr ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true) propertyInfoGetType_ info
    fun registeredTypeInfoGetGType info = (GIRepositoryRegisteredTypeInfoRecord.FFI.withPtr ---> GObjectType.FFI.fromVal) registeredTypeInfoGetGType_ info
    fun registeredTypeInfoGetTypeInit info = (GIRepositoryRegisteredTypeInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) registeredTypeInfoGetTypeInit_ info
    fun registeredTypeInfoGetTypeName info = (GIRepositoryRegisteredTypeInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) registeredTypeInfoGetTypeName_ info
    fun signalInfoGetClassClosure info = (GIRepositorySignalInfoRecord.FFI.withPtr ---> GIRepositoryVFuncInfoRecord.FFI.fromPtr true) signalInfoGetClassClosure_ info
    fun signalInfoGetFlags info = (GIRepositorySignalInfoRecord.FFI.withPtr ---> GObjectSignalFlags.FFI.fromVal) signalInfoGetFlags_ info
    fun signalInfoTrueStopsEmit info = (GIRepositorySignalInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) signalInfoTrueStopsEmit_ info
    fun structInfoFindField (info, name) = (GIRepositoryStructInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryFieldInfoRecord.FFI.fromPtr true) structInfoFindField_ (info & name)
    fun structInfoFindMethod (info, name) = (GIRepositoryStructInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) structInfoFindMethod_ (info & name)
    fun structInfoGetAlignment info = (GIRepositoryStructInfoRecord.FFI.withPtr ---> GSize.FFI.fromVal) structInfoGetAlignment_ info
    fun structInfoGetField (info, n) = (GIRepositoryStructInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryFieldInfoRecord.FFI.fromPtr true) structInfoGetField_ (info & n)
    fun structInfoGetMethod (info, n) = (GIRepositoryStructInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) structInfoGetMethod_ (info & n)
    fun structInfoGetNFields info = (GIRepositoryStructInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) structInfoGetNFields_ info
    fun structInfoGetNMethods info = (GIRepositoryStructInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) structInfoGetNMethods_ info
    fun structInfoGetSize info = (GIRepositoryStructInfoRecord.FFI.withPtr ---> GSize.FFI.fromVal) structInfoGetSize_ info
    fun structInfoIsForeign info = (GIRepositoryStructInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) structInfoIsForeign_ info
    fun structInfoIsGtypeStruct info = (GIRepositoryStructInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) structInfoIsGtypeStruct_ info
    fun typeInfoGetArrayFixedSize info = (GIRepositoryTypeInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) typeInfoGetArrayFixedSize_ info
    fun typeInfoGetArrayLength info = (GIRepositoryTypeInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) typeInfoGetArrayLength_ info
    fun typeInfoGetArrayType info = (GIRepositoryTypeInfoRecord.FFI.withPtr ---> GIRepositoryArrayType.FFI.fromVal) typeInfoGetArrayType_ info
    fun typeInfoGetInterface info = (GIRepositoryTypeInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) typeInfoGetInterface_ info
    fun typeInfoGetParamType (info, n) = (GIRepositoryTypeInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true) typeInfoGetParamType_ (info & n)
    fun typeInfoGetTag info = (GIRepositoryTypeInfoRecord.FFI.withPtr ---> GIRepositoryTypeTag.FFI.fromVal) typeInfoGetTag_ info
    fun typeInfoIsPointer info = (GIRepositoryTypeInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) typeInfoIsPointer_ info
    fun typeInfoIsZeroTerminated info = (GIRepositoryTypeInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) typeInfoIsZeroTerminated_ info
    fun typeTagToString type' = (GIRepositoryTypeTag.FFI.withVal ---> Utf8.FFI.fromPtr 0) typeTagToString_ type'
    fun unionInfoFindMethod (info, name) = (GIRepositoryUnionInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) unionInfoFindMethod_ (info & name)
    fun unionInfoGetAlignment info = (GIRepositoryUnionInfoRecord.FFI.withPtr ---> GSize.FFI.fromVal) unionInfoGetAlignment_ info
    fun unionInfoGetDiscriminator (info, n) = (GIRepositoryUnionInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryConstantInfoRecord.FFI.fromPtr true) unionInfoGetDiscriminator_ (info & n)
    fun unionInfoGetDiscriminatorOffset info = (GIRepositoryUnionInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) unionInfoGetDiscriminatorOffset_ info
    fun unionInfoGetDiscriminatorType info = (GIRepositoryUnionInfoRecord.FFI.withPtr ---> GIRepositoryTypeInfoRecord.FFI.fromPtr true) unionInfoGetDiscriminatorType_ info
    fun unionInfoGetField (info, n) = (GIRepositoryUnionInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryFieldInfoRecord.FFI.fromPtr true) unionInfoGetField_ (info & n)
    fun unionInfoGetMethod (info, n) = (GIRepositoryUnionInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) unionInfoGetMethod_ (info & n)
    fun unionInfoGetNFields info = (GIRepositoryUnionInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) unionInfoGetNFields_ info
    fun unionInfoGetNMethods info = (GIRepositoryUnionInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) unionInfoGetNMethods_ info
    fun unionInfoGetSize info = (GIRepositoryUnionInfoRecord.FFI.withPtr ---> GSize.FFI.fromVal) unionInfoGetSize_ info
    fun unionInfoIsDiscriminated info = (GIRepositoryUnionInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) unionInfoIsDiscriminated_ info
    fun valueInfoGetValue info = (GIRepositoryValueInfoRecord.FFI.withPtr ---> GInt64.FFI.fromVal) valueInfoGetValue_ info
    fun vfuncInfoGetFlags info = (GIRepositoryVFuncInfoRecord.FFI.withPtr ---> GIRepositoryVFuncInfoFlags.FFI.fromVal) vfuncInfoGetFlags_ info
    fun vfuncInfoGetInvoker info = (GIRepositoryVFuncInfoRecord.FFI.withPtr ---> GIRepositoryFunctionInfoRecord.FFI.fromPtr true) vfuncInfoGetInvoker_ info
    fun vfuncInfoGetOffset info = (GIRepositoryVFuncInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) vfuncInfoGetOffset_ info
    fun vfuncInfoGetSignal info = (GIRepositoryVFuncInfoRecord.FFI.withPtr ---> GIRepositorySignalInfoRecord.FFI.fromPtr true) vfuncInfoGetSignal_ info
  end
