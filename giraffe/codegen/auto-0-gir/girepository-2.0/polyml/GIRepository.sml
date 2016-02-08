structure GIRepository : G_I_REPOSITORY =
  struct
    local
      open PolyMLFFI
    in
      val argInfoGetClosure_ = call (load_sym libgirepository "g_arg_info_get_closure") (GIRepositoryArgInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val argInfoGetDestroy_ = call (load_sym libgirepository "g_arg_info_get_destroy") (GIRepositoryArgInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val argInfoGetDirection_ = call (load_sym libgirepository "g_arg_info_get_direction") (GIRepositoryArgInfoRecord.PolyML.PTR --> GIRepositoryDirection.PolyML.VAL)
      val argInfoGetOwnershipTransfer_ = call (load_sym libgirepository "g_arg_info_get_ownership_transfer") (GIRepositoryArgInfoRecord.PolyML.PTR --> GIRepositoryTransfer.PolyML.VAL)
      val argInfoGetScope_ = call (load_sym libgirepository "g_arg_info_get_scope") (GIRepositoryArgInfoRecord.PolyML.PTR --> GIRepositoryScopeType.PolyML.VAL)
      val argInfoGetType_ = call (load_sym libgirepository "g_arg_info_get_type") (GIRepositoryArgInfoRecord.PolyML.PTR --> GIRepositoryTypeInfoRecord.PolyML.PTR)
      val argInfoIsCallerAllocates_ = call (load_sym libgirepository "g_arg_info_is_caller_allocates") (GIRepositoryArgInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val argInfoIsOptional_ = call (load_sym libgirepository "g_arg_info_is_optional") (GIRepositoryArgInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val argInfoIsReturnValue_ = call (load_sym libgirepository "g_arg_info_is_return_value") (GIRepositoryArgInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val argInfoIsSkip_ = call (load_sym libgirepository "g_arg_info_is_skip") (GIRepositoryArgInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val argInfoLoadType_ = call (load_sym libgirepository "g_arg_info_load_type") (GIRepositoryArgInfoRecord.PolyML.PTR &&> GIRepositoryTypeInfoRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val argInfoMayBeNull_ = call (load_sym libgirepository "g_arg_info_may_be_null") (GIRepositoryArgInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val baseInfoGetType_ = call (load_sym libgirepository "g_base_info_get_type") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryInfoType.PolyML.VAL)
      val callableInfoGetArg_ = call (load_sym libgirepository "g_callable_info_get_arg") (GIRepositoryCallableInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryArgInfoRecord.PolyML.PTR)
      val callableInfoGetCallerOwns_ = call (load_sym libgirepository "g_callable_info_get_caller_owns") (GIRepositoryCallableInfoRecord.PolyML.PTR --> GIRepositoryTransfer.PolyML.VAL)
      val callableInfoGetNArgs_ = call (load_sym libgirepository "g_callable_info_get_n_args") (GIRepositoryCallableInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val callableInfoGetReturnAttribute_ = call (load_sym libgirepository "g_callable_info_get_return_attribute") (GIRepositoryCallableInfoRecord.PolyML.PTR &&> Utf8.PolyML.INPTR --> Utf8.PolyML.RETPTR)
      val callableInfoGetReturnType_ = call (load_sym libgirepository "g_callable_info_get_return_type") (GIRepositoryCallableInfoRecord.PolyML.PTR --> GIRepositoryTypeInfoRecord.PolyML.PTR)
      val callableInfoIterateReturnAttributes_ =
        call (load_sym libgirepository "g_callable_info_iterate_return_attributes")
          (
            GIRepositoryCallableInfoRecord.PolyML.PTR
             &&> GIRepositoryAttributeIterRecord.PolyML.PTR
             &&> Utf8.PolyML.OUTREF
             &&> Utf8.PolyML.OUTREF
             --> FFI.Bool.PolyML.VAL
          )
      val callableInfoLoadArg_ =
        call (load_sym libgirepository "g_callable_info_load_arg")
          (
            GIRepositoryCallableInfoRecord.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> GIRepositoryArgInfoRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val callableInfoLoadReturnType_ = call (load_sym libgirepository "g_callable_info_load_return_type") (GIRepositoryCallableInfoRecord.PolyML.PTR &&> GIRepositoryTypeInfoRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val callableInfoMayReturnNull_ = call (load_sym libgirepository "g_callable_info_may_return_null") (GIRepositoryCallableInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val callableInfoSkipReturn_ = call (load_sym libgirepository "g_callable_info_skip_return") (GIRepositoryCallableInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val constantInfoGetType_ = call (load_sym libgirepository "g_constant_info_get_type") (GIRepositoryConstantInfoRecord.PolyML.PTR --> GIRepositoryTypeInfoRecord.PolyML.PTR)
      val enumInfoGetErrorDomain_ = call (load_sym libgirepository "g_enum_info_get_error_domain") (GIRepositoryEnumInfoRecord.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val enumInfoGetMethod_ = call (load_sym libgirepository "g_enum_info_get_method") (GIRepositoryEnumInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryFunctionInfoRecord.PolyML.PTR)
      val enumInfoGetNMethods_ = call (load_sym libgirepository "g_enum_info_get_n_methods") (GIRepositoryEnumInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val enumInfoGetNValues_ = call (load_sym libgirepository "g_enum_info_get_n_values") (GIRepositoryEnumInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val enumInfoGetStorageType_ = call (load_sym libgirepository "g_enum_info_get_storage_type") (GIRepositoryEnumInfoRecord.PolyML.PTR --> GIRepositoryTypeTag.PolyML.VAL)
      val enumInfoGetValue_ = call (load_sym libgirepository "g_enum_info_get_value") (GIRepositoryEnumInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryValueInfoRecord.PolyML.PTR)
      val fieldInfoGetFlags_ = call (load_sym libgirepository "g_field_info_get_flags") (GIRepositoryFieldInfoRecord.PolyML.PTR --> GIRepositoryFieldInfoFlags.PolyML.VAL)
      val fieldInfoGetOffset_ = call (load_sym libgirepository "g_field_info_get_offset") (GIRepositoryFieldInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val fieldInfoGetSize_ = call (load_sym libgirepository "g_field_info_get_size") (GIRepositoryFieldInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val fieldInfoGetType_ = call (load_sym libgirepository "g_field_info_get_type") (GIRepositoryFieldInfoRecord.PolyML.PTR --> GIRepositoryTypeInfoRecord.PolyML.PTR)
      val functionInfoGetFlags_ = call (load_sym libgirepository "g_function_info_get_flags") (GIRepositoryFunctionInfoRecord.PolyML.PTR --> GIRepositoryFunctionInfoFlags.PolyML.VAL)
      val functionInfoGetProperty_ = call (load_sym libgirepository "g_function_info_get_property") (GIRepositoryFunctionInfoRecord.PolyML.PTR --> GIRepositoryPropertyInfoRecord.PolyML.PTR)
      val functionInfoGetSymbol_ = call (load_sym libgirepository "g_function_info_get_symbol") (GIRepositoryFunctionInfoRecord.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val functionInfoGetVfunc_ = call (load_sym libgirepository "g_function_info_get_vfunc") (GIRepositoryFunctionInfoRecord.PolyML.PTR --> GIRepositoryVFuncInfoRecord.PolyML.PTR)
      val infoNew_ =
        call (load_sym libgirepository "g_info_new")
          (
            GIRepositoryInfoType.PolyML.VAL
             &&> GIRepositoryBaseInfoRecord.PolyML.PTR
             &&> GIRepositoryTypelibRecord.PolyML.PTR
             &&> FFI.UInt32.PolyML.VAL
             --> GIRepositoryBaseInfoRecord.PolyML.PTR
          )
      val infoTypeToString_ = call (load_sym libgirepository "g_info_type_to_string") (GIRepositoryInfoType.PolyML.VAL --> Utf8.PolyML.RETPTR)
      val interfaceInfoFindMethod_ = call (load_sym libgirepository "g_interface_info_find_method") (GIRepositoryInterfaceInfoRecord.PolyML.PTR &&> Utf8.PolyML.INPTR --> GIRepositoryFunctionInfoRecord.PolyML.PTR)
      val interfaceInfoFindVfunc_ = call (load_sym libgirepository "g_interface_info_find_vfunc") (GIRepositoryInterfaceInfoRecord.PolyML.PTR &&> Utf8.PolyML.INPTR --> GIRepositoryVFuncInfoRecord.PolyML.PTR)
      val interfaceInfoGetConstant_ = call (load_sym libgirepository "g_interface_info_get_constant") (GIRepositoryInterfaceInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryConstantInfoRecord.PolyML.PTR)
      val interfaceInfoGetIfaceStruct_ = call (load_sym libgirepository "g_interface_info_get_iface_struct") (GIRepositoryInterfaceInfoRecord.PolyML.PTR --> GIRepositoryStructInfoRecord.PolyML.PTR)
      val interfaceInfoGetMethod_ = call (load_sym libgirepository "g_interface_info_get_method") (GIRepositoryInterfaceInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryFunctionInfoRecord.PolyML.PTR)
      val interfaceInfoGetNConstants_ = call (load_sym libgirepository "g_interface_info_get_n_constants") (GIRepositoryInterfaceInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val interfaceInfoGetNMethods_ = call (load_sym libgirepository "g_interface_info_get_n_methods") (GIRepositoryInterfaceInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val interfaceInfoGetNPrerequisites_ = call (load_sym libgirepository "g_interface_info_get_n_prerequisites") (GIRepositoryInterfaceInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val interfaceInfoGetNProperties_ = call (load_sym libgirepository "g_interface_info_get_n_properties") (GIRepositoryInterfaceInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val interfaceInfoGetNSignals_ = call (load_sym libgirepository "g_interface_info_get_n_signals") (GIRepositoryInterfaceInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val interfaceInfoGetNVfuncs_ = call (load_sym libgirepository "g_interface_info_get_n_vfuncs") (GIRepositoryInterfaceInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val interfaceInfoGetPrerequisite_ = call (load_sym libgirepository "g_interface_info_get_prerequisite") (GIRepositoryInterfaceInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val interfaceInfoGetProperty_ = call (load_sym libgirepository "g_interface_info_get_property") (GIRepositoryInterfaceInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryPropertyInfoRecord.PolyML.PTR)
      val interfaceInfoGetSignal_ = call (load_sym libgirepository "g_interface_info_get_signal") (GIRepositoryInterfaceInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositorySignalInfoRecord.PolyML.PTR)
      val interfaceInfoGetVfunc_ = call (load_sym libgirepository "g_interface_info_get_vfunc") (GIRepositoryInterfaceInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryVFuncInfoRecord.PolyML.PTR)
      val invokeErrorQuark_ = call (load_sym libgirepository "g_invoke_error_quark") (FFI.PolyML.VOID --> GLibQuark.PolyML.VAL)
      val objectInfoFindMethod_ = call (load_sym libgirepository "g_object_info_find_method") (GIRepositoryObjectInfoRecord.PolyML.PTR &&> Utf8.PolyML.INPTR --> GIRepositoryFunctionInfoRecord.PolyML.PTR)
      val objectInfoFindMethodUsingInterfaces_ =
        call (load_sym libgirepository "g_object_info_find_method_using_interfaces")
          (
            GIRepositoryObjectInfoRecord.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GIRepositoryObjectInfoRecord.PolyML.OUTREF
             --> GIRepositoryFunctionInfoRecord.PolyML.PTR
          )
      val objectInfoFindVfunc_ = call (load_sym libgirepository "g_object_info_find_vfunc") (GIRepositoryObjectInfoRecord.PolyML.PTR &&> Utf8.PolyML.INPTR --> GIRepositoryVFuncInfoRecord.PolyML.PTR)
      val objectInfoGetAbstract_ = call (load_sym libgirepository "g_object_info_get_abstract") (GIRepositoryObjectInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val objectInfoGetClassStruct_ = call (load_sym libgirepository "g_object_info_get_class_struct") (GIRepositoryObjectInfoRecord.PolyML.PTR --> GIRepositoryStructInfoRecord.PolyML.PTR)
      val objectInfoGetConstant_ = call (load_sym libgirepository "g_object_info_get_constant") (GIRepositoryObjectInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryConstantInfoRecord.PolyML.PTR)
      val objectInfoGetField_ = call (load_sym libgirepository "g_object_info_get_field") (GIRepositoryObjectInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryFieldInfoRecord.PolyML.PTR)
      val objectInfoGetFundamental_ = call (load_sym libgirepository "g_object_info_get_fundamental") (GIRepositoryObjectInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val objectInfoGetGetValueFunction_ = call (load_sym libgirepository "g_object_info_get_get_value_function") (GIRepositoryObjectInfoRecord.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val objectInfoGetInterface_ = call (load_sym libgirepository "g_object_info_get_interface") (GIRepositoryObjectInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryInterfaceInfoRecord.PolyML.PTR)
      val objectInfoGetMethod_ = call (load_sym libgirepository "g_object_info_get_method") (GIRepositoryObjectInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryFunctionInfoRecord.PolyML.PTR)
      val objectInfoGetNConstants_ = call (load_sym libgirepository "g_object_info_get_n_constants") (GIRepositoryObjectInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val objectInfoGetNFields_ = call (load_sym libgirepository "g_object_info_get_n_fields") (GIRepositoryObjectInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val objectInfoGetNInterfaces_ = call (load_sym libgirepository "g_object_info_get_n_interfaces") (GIRepositoryObjectInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val objectInfoGetNMethods_ = call (load_sym libgirepository "g_object_info_get_n_methods") (GIRepositoryObjectInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val objectInfoGetNProperties_ = call (load_sym libgirepository "g_object_info_get_n_properties") (GIRepositoryObjectInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val objectInfoGetNSignals_ = call (load_sym libgirepository "g_object_info_get_n_signals") (GIRepositoryObjectInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val objectInfoGetNVfuncs_ = call (load_sym libgirepository "g_object_info_get_n_vfuncs") (GIRepositoryObjectInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val objectInfoGetParent_ = call (load_sym libgirepository "g_object_info_get_parent") (GIRepositoryObjectInfoRecord.PolyML.PTR --> GIRepositoryObjectInfoRecord.PolyML.PTR)
      val objectInfoGetProperty_ = call (load_sym libgirepository "g_object_info_get_property") (GIRepositoryObjectInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryPropertyInfoRecord.PolyML.PTR)
      val objectInfoGetRefFunction_ = call (load_sym libgirepository "g_object_info_get_ref_function") (GIRepositoryObjectInfoRecord.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val objectInfoGetSetValueFunction_ = call (load_sym libgirepository "g_object_info_get_set_value_function") (GIRepositoryObjectInfoRecord.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val objectInfoGetSignal_ = call (load_sym libgirepository "g_object_info_get_signal") (GIRepositoryObjectInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositorySignalInfoRecord.PolyML.PTR)
      val objectInfoGetTypeInit_ = call (load_sym libgirepository "g_object_info_get_type_init") (GIRepositoryObjectInfoRecord.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val objectInfoGetTypeName_ = call (load_sym libgirepository "g_object_info_get_type_name") (GIRepositoryObjectInfoRecord.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val objectInfoGetUnrefFunction_ = call (load_sym libgirepository "g_object_info_get_unref_function") (GIRepositoryObjectInfoRecord.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val objectInfoGetVfunc_ = call (load_sym libgirepository "g_object_info_get_vfunc") (GIRepositoryObjectInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryVFuncInfoRecord.PolyML.PTR)
      val propertyInfoGetFlags_ = call (load_sym libgirepository "g_property_info_get_flags") (GIRepositoryPropertyInfoRecord.PolyML.PTR --> GObjectParamFlags.PolyML.VAL)
      val propertyInfoGetOwnershipTransfer_ = call (load_sym libgirepository "g_property_info_get_ownership_transfer") (GIRepositoryPropertyInfoRecord.PolyML.PTR --> GIRepositoryTransfer.PolyML.VAL)
      val propertyInfoGetType_ = call (load_sym libgirepository "g_property_info_get_type") (GIRepositoryPropertyInfoRecord.PolyML.PTR --> GIRepositoryTypeInfoRecord.PolyML.PTR)
      val registeredTypeInfoGetTypeInit_ = call (load_sym libgirepository "g_registered_type_info_get_type_init") (GIRepositoryRegisteredTypeInfoRecord.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val registeredTypeInfoGetTypeName_ = call (load_sym libgirepository "g_registered_type_info_get_type_name") (GIRepositoryRegisteredTypeInfoRecord.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val signalInfoGetClassClosure_ = call (load_sym libgirepository "g_signal_info_get_class_closure") (GIRepositorySignalInfoRecord.PolyML.PTR --> GIRepositoryVFuncInfoRecord.PolyML.PTR)
      val signalInfoGetFlags_ = call (load_sym libgirepository "g_signal_info_get_flags") (GIRepositorySignalInfoRecord.PolyML.PTR --> GObjectSignalFlags.PolyML.VAL)
      val signalInfoTrueStopsEmit_ = call (load_sym libgirepository "g_signal_info_true_stops_emit") (GIRepositorySignalInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val structInfoFindMethod_ = call (load_sym libgirepository "g_struct_info_find_method") (GIRepositoryStructInfoRecord.PolyML.PTR &&> Utf8.PolyML.INPTR --> GIRepositoryFunctionInfoRecord.PolyML.PTR)
      val structInfoGetAlignment_ = call (load_sym libgirepository "g_struct_info_get_alignment") (GIRepositoryStructInfoRecord.PolyML.PTR --> FFI.Size.PolyML.VAL)
      val structInfoGetField_ = call (load_sym libgirepository "g_struct_info_get_field") (GIRepositoryStructInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryFieldInfoRecord.PolyML.PTR)
      val structInfoGetMethod_ = call (load_sym libgirepository "g_struct_info_get_method") (GIRepositoryStructInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryFunctionInfoRecord.PolyML.PTR)
      val structInfoGetNFields_ = call (load_sym libgirepository "g_struct_info_get_n_fields") (GIRepositoryStructInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val structInfoGetNMethods_ = call (load_sym libgirepository "g_struct_info_get_n_methods") (GIRepositoryStructInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val structInfoGetSize_ = call (load_sym libgirepository "g_struct_info_get_size") (GIRepositoryStructInfoRecord.PolyML.PTR --> FFI.Size.PolyML.VAL)
      val structInfoIsForeign_ = call (load_sym libgirepository "g_struct_info_is_foreign") (GIRepositoryStructInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val structInfoIsGtypeStruct_ = call (load_sym libgirepository "g_struct_info_is_gtype_struct") (GIRepositoryStructInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val typeInfoGetArrayFixedSize_ = call (load_sym libgirepository "g_type_info_get_array_fixed_size") (GIRepositoryTypeInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val typeInfoGetArrayLength_ = call (load_sym libgirepository "g_type_info_get_array_length") (GIRepositoryTypeInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val typeInfoGetArrayType_ = call (load_sym libgirepository "g_type_info_get_array_type") (GIRepositoryTypeInfoRecord.PolyML.PTR --> GIRepositoryArrayType.PolyML.VAL)
      val typeInfoGetInterface_ = call (load_sym libgirepository "g_type_info_get_interface") (GIRepositoryTypeInfoRecord.PolyML.PTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val typeInfoGetParamType_ = call (load_sym libgirepository "g_type_info_get_param_type") (GIRepositoryTypeInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryTypeInfoRecord.PolyML.PTR)
      val typeInfoGetTag_ = call (load_sym libgirepository "g_type_info_get_tag") (GIRepositoryTypeInfoRecord.PolyML.PTR --> GIRepositoryTypeTag.PolyML.VAL)
      val typeInfoIsPointer_ = call (load_sym libgirepository "g_type_info_is_pointer") (GIRepositoryTypeInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val typeInfoIsZeroTerminated_ = call (load_sym libgirepository "g_type_info_is_zero_terminated") (GIRepositoryTypeInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val typeTagToString_ = call (load_sym libgirepository "g_type_tag_to_string") (GIRepositoryTypeTag.PolyML.VAL --> Utf8.PolyML.RETPTR)
      val unionInfoFindMethod_ = call (load_sym libgirepository "g_union_info_find_method") (GIRepositoryUnionInfoRecord.PolyML.PTR &&> Utf8.PolyML.INPTR --> GIRepositoryFunctionInfoRecord.PolyML.PTR)
      val unionInfoGetAlignment_ = call (load_sym libgirepository "g_union_info_get_alignment") (GIRepositoryUnionInfoRecord.PolyML.PTR --> FFI.Size.PolyML.VAL)
      val unionInfoGetDiscriminator_ = call (load_sym libgirepository "g_union_info_get_discriminator") (GIRepositoryUnionInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryConstantInfoRecord.PolyML.PTR)
      val unionInfoGetDiscriminatorOffset_ = call (load_sym libgirepository "g_union_info_get_discriminator_offset") (GIRepositoryUnionInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val unionInfoGetDiscriminatorType_ = call (load_sym libgirepository "g_union_info_get_discriminator_type") (GIRepositoryUnionInfoRecord.PolyML.PTR --> GIRepositoryTypeInfoRecord.PolyML.PTR)
      val unionInfoGetField_ = call (load_sym libgirepository "g_union_info_get_field") (GIRepositoryUnionInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryFieldInfoRecord.PolyML.PTR)
      val unionInfoGetMethod_ = call (load_sym libgirepository "g_union_info_get_method") (GIRepositoryUnionInfoRecord.PolyML.PTR &&> FFI.Int.PolyML.VAL --> GIRepositoryFunctionInfoRecord.PolyML.PTR)
      val unionInfoGetNFields_ = call (load_sym libgirepository "g_union_info_get_n_fields") (GIRepositoryUnionInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val unionInfoGetNMethods_ = call (load_sym libgirepository "g_union_info_get_n_methods") (GIRepositoryUnionInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val unionInfoGetSize_ = call (load_sym libgirepository "g_union_info_get_size") (GIRepositoryUnionInfoRecord.PolyML.PTR --> FFI.Size.PolyML.VAL)
      val unionInfoIsDiscriminated_ = call (load_sym libgirepository "g_union_info_is_discriminated") (GIRepositoryUnionInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val valueInfoGetValue_ = call (load_sym libgirepository "g_value_info_get_value") (GIRepositoryValueInfoRecord.PolyML.PTR --> FFI.Int64.PolyML.VAL)
      val vfuncInfoGetFlags_ = call (load_sym libgirepository "g_vfunc_info_get_flags") (GIRepositoryVFuncInfoRecord.PolyML.PTR --> GIRepositoryVFuncInfoFlags.PolyML.VAL)
      val vfuncInfoGetInvoker_ = call (load_sym libgirepository "g_vfunc_info_get_invoker") (GIRepositoryVFuncInfoRecord.PolyML.PTR --> GIRepositoryFunctionInfoRecord.PolyML.PTR)
      val vfuncInfoGetOffset_ = call (load_sym libgirepository "g_vfunc_info_get_offset") (GIRepositoryVFuncInfoRecord.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val vfuncInfoGetSignal_ = call (load_sym libgirepository "g_vfunc_info_get_signal") (GIRepositoryVFuncInfoRecord.PolyML.PTR --> GIRepositorySignalInfoRecord.PolyML.PTR)
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
    fun callableInfoGetReturnAttribute info name = (GIRepositoryCallableInfoRecord.C.withPtr &&&> Utf8.C.withConstPtr ---> Utf8.C.fromPtr false) callableInfoGetReturnAttribute_ (info & name)
    fun callableInfoGetReturnType info = (GIRepositoryCallableInfoRecord.C.withPtr ---> GIRepositoryTypeInfoRecord.C.fromPtr true) callableInfoGetReturnType_ info
    fun callableInfoIterateReturnAttributes info iterator =
      let
        val name
         & value
         & retVal =
          (
            GIRepositoryCallableInfoRecord.C.withPtr
             &&&> GIRepositoryAttributeIterRecord.C.withPtr
             &&&> Utf8.C.withRefConstOptPtr
             &&&> Utf8.C.withRefConstOptPtr
             ---> Utf8.C.fromPtr false
                   && Utf8.C.fromPtr false
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
    fun enumInfoGetErrorDomain info = (GIRepositoryEnumInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) enumInfoGetErrorDomain_ info
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
    fun functionInfoGetSymbol info = (GIRepositoryFunctionInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) functionInfoGetSymbol_ info
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
    fun infoTypeToString type' = (GIRepositoryInfoType.C.withVal ---> Utf8.C.fromPtr false) infoTypeToString_ type'
    fun interfaceInfoFindMethod info name = (GIRepositoryInterfaceInfoRecord.C.withPtr &&&> Utf8.C.withConstPtr ---> GIRepositoryFunctionInfoRecord.C.fromPtr true) interfaceInfoFindMethod_ (info & name)
    fun interfaceInfoFindVfunc info name = (GIRepositoryInterfaceInfoRecord.C.withPtr &&&> Utf8.C.withConstPtr ---> GIRepositoryVFuncInfoRecord.C.fromPtr true) interfaceInfoFindVfunc_ (info & name)
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
    fun objectInfoFindMethod info name = (GIRepositoryObjectInfoRecord.C.withPtr &&&> Utf8.C.withConstPtr ---> GIRepositoryFunctionInfoRecord.C.fromPtr true) objectInfoFindMethod_ (info & name)
    fun objectInfoFindMethodUsingInterfaces info name =
      let
        val implementor & retVal =
          (
            GIRepositoryObjectInfoRecord.C.withPtr
             &&&> Utf8.C.withConstPtr
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
    fun objectInfoFindVfunc info name = (GIRepositoryObjectInfoRecord.C.withPtr &&&> Utf8.C.withConstPtr ---> GIRepositoryVFuncInfoRecord.C.fromPtr true) objectInfoFindVfunc_ (info & name)
    fun objectInfoGetAbstract info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) objectInfoGetAbstract_ info
    fun objectInfoGetClassStruct info = (GIRepositoryObjectInfoRecord.C.withPtr ---> GIRepositoryStructInfoRecord.C.fromPtr true) objectInfoGetClassStruct_ info
    fun objectInfoGetConstant info n = (GIRepositoryObjectInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryConstantInfoRecord.C.fromPtr true) objectInfoGetConstant_ (info & n)
    fun objectInfoGetField info n = (GIRepositoryObjectInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryFieldInfoRecord.C.fromPtr true) objectInfoGetField_ (info & n)
    fun objectInfoGetFundamental info = (GIRepositoryObjectInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) objectInfoGetFundamental_ info
    fun objectInfoGetGetValueFunction info = (GIRepositoryObjectInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) objectInfoGetGetValueFunction_ info
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
    fun objectInfoGetRefFunction info = (GIRepositoryObjectInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) objectInfoGetRefFunction_ info
    fun objectInfoGetSetValueFunction info = (GIRepositoryObjectInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) objectInfoGetSetValueFunction_ info
    fun objectInfoGetSignal info n = (GIRepositoryObjectInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositorySignalInfoRecord.C.fromPtr true) objectInfoGetSignal_ (info & n)
    fun objectInfoGetTypeInit info = (GIRepositoryObjectInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) objectInfoGetTypeInit_ info
    fun objectInfoGetTypeName info = (GIRepositoryObjectInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) objectInfoGetTypeName_ info
    fun objectInfoGetUnrefFunction info = (GIRepositoryObjectInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) objectInfoGetUnrefFunction_ info
    fun objectInfoGetVfunc info n = (GIRepositoryObjectInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GIRepositoryVFuncInfoRecord.C.fromPtr true) objectInfoGetVfunc_ (info & n)
    fun propertyInfoGetFlags info = (GIRepositoryPropertyInfoRecord.C.withPtr ---> GObjectParamFlags.C.fromVal) propertyInfoGetFlags_ info
    fun propertyInfoGetOwnershipTransfer info = (GIRepositoryPropertyInfoRecord.C.withPtr ---> GIRepositoryTransfer.C.fromVal) propertyInfoGetOwnershipTransfer_ info
    fun propertyInfoGetType info = (GIRepositoryPropertyInfoRecord.C.withPtr ---> GIRepositoryTypeInfoRecord.C.fromPtr true) propertyInfoGetType_ info
    fun registeredTypeInfoGetTypeInit info = (GIRepositoryRegisteredTypeInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) registeredTypeInfoGetTypeInit_ info
    fun registeredTypeInfoGetTypeName info = (GIRepositoryRegisteredTypeInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) registeredTypeInfoGetTypeName_ info
    fun signalInfoGetClassClosure info = (GIRepositorySignalInfoRecord.C.withPtr ---> GIRepositoryVFuncInfoRecord.C.fromPtr true) signalInfoGetClassClosure_ info
    fun signalInfoGetFlags info = (GIRepositorySignalInfoRecord.C.withPtr ---> GObjectSignalFlags.C.fromVal) signalInfoGetFlags_ info
    fun signalInfoTrueStopsEmit info = (GIRepositorySignalInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) signalInfoTrueStopsEmit_ info
    fun structInfoFindMethod info name = (GIRepositoryStructInfoRecord.C.withPtr &&&> Utf8.C.withConstPtr ---> GIRepositoryFunctionInfoRecord.C.fromPtr true) structInfoFindMethod_ (info & name)
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
    fun typeTagToString type' = (GIRepositoryTypeTag.C.withVal ---> Utf8.C.fromPtr false) typeTagToString_ type'
    fun unionInfoFindMethod info name = (GIRepositoryUnionInfoRecord.C.withPtr &&&> Utf8.C.withConstPtr ---> GIRepositoryFunctionInfoRecord.C.fromPtr true) unionInfoFindMethod_ (info & name)
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
