structure GIRepository : G_I_REPOSITORY =
  struct
    local
      open PolyMLFFI
    in
      val argInfoGetClosure_ = call (getSymbol "g_arg_info_get_closure") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val argInfoGetDestroy_ = call (getSymbol "g_arg_info_get_destroy") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val argInfoGetDirection_ = call (getSymbol "g_arg_info_get_direction") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryDirection.PolyML.cVal)
      val argInfoGetOwnershipTransfer_ = call (getSymbol "g_arg_info_get_ownership_transfer") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryTransfer.PolyML.cVal)
      val argInfoGetScope_ = call (getSymbol "g_arg_info_get_scope") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryScopeType.PolyML.cVal)
      val argInfoGetType_ = call (getSymbol "g_arg_info_get_type") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val argInfoIsCallerAllocates_ = call (getSymbol "g_arg_info_is_caller_allocates") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val argInfoIsOptional_ = call (getSymbol "g_arg_info_is_optional") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val argInfoIsReturnValue_ = call (getSymbol "g_arg_info_is_return_value") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val argInfoIsSkip_ = call (getSymbol "g_arg_info_is_skip") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val argInfoLoadType_ = call (getSymbol "g_arg_info_load_type") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GIRepositoryBaseInfoRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val argInfoMayBeNull_ = call (getSymbol "g_arg_info_may_be_null") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val baseInfoGetType_ = call (getSymbol "g_base_info_get_type") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryInfoType.PolyML.cVal)
      val callableInfoGetArg_ = call (getSymbol "g_callable_info_get_arg") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val callableInfoGetCallerOwns_ = call (getSymbol "g_callable_info_get_caller_owns") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryTransfer.PolyML.cVal)
      val callableInfoGetNArgs_ = call (getSymbol "g_callable_info_get_n_args") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val callableInfoGetReturnAttribute_ = call (getSymbol "g_callable_info_get_return_attribute") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val callableInfoGetReturnType_ = call (getSymbol "g_callable_info_get_return_type") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val callableInfoIterateReturnAttributes_ =
        call (getSymbol "g_callable_info_iterate_return_attributes")
          (
            GIRepositoryBaseInfoRecord.PolyML.cPtr
             &&> GIRepositoryAttributeIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cOutRef
             &&> Utf8.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
      val callableInfoLoadArg_ =
        call (getSymbol "g_callable_info_load_arg")
          (
            GIRepositoryBaseInfoRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GIRepositoryBaseInfoRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val callableInfoLoadReturnType_ = call (getSymbol "g_callable_info_load_return_type") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GIRepositoryBaseInfoRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val callableInfoMayReturnNull_ = call (getSymbol "g_callable_info_may_return_null") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val callableInfoSkipReturn_ = call (getSymbol "g_callable_info_skip_return") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val constantInfoGetType_ = call (getSymbol "g_constant_info_get_type") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val enumInfoGetErrorDomain_ = call (getSymbol "g_enum_info_get_error_domain") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val enumInfoGetMethod_ = call (getSymbol "g_enum_info_get_method") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val enumInfoGetNMethods_ = call (getSymbol "g_enum_info_get_n_methods") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val enumInfoGetNValues_ = call (getSymbol "g_enum_info_get_n_values") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val enumInfoGetStorageType_ = call (getSymbol "g_enum_info_get_storage_type") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryTypeTag.PolyML.cVal)
      val enumInfoGetValue_ = call (getSymbol "g_enum_info_get_value") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val fieldInfoGetFlags_ = call (getSymbol "g_field_info_get_flags") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryFieldInfoFlags.PolyML.cVal)
      val fieldInfoGetOffset_ = call (getSymbol "g_field_info_get_offset") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val fieldInfoGetSize_ = call (getSymbol "g_field_info_get_size") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val fieldInfoGetType_ = call (getSymbol "g_field_info_get_type") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val functionInfoGetFlags_ = call (getSymbol "g_function_info_get_flags") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryFunctionInfoFlags.PolyML.cVal)
      val functionInfoGetProperty_ = call (getSymbol "g_function_info_get_property") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val functionInfoGetSymbol_ = call (getSymbol "g_function_info_get_symbol") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val functionInfoGetVfunc_ = call (getSymbol "g_function_info_get_vfunc") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
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
      val interfaceInfoFindMethod_ = call (getSymbol "g_interface_info_find_method") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val interfaceInfoFindVfunc_ = call (getSymbol "g_interface_info_find_vfunc") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val interfaceInfoGetConstant_ = call (getSymbol "g_interface_info_get_constant") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val interfaceInfoGetIfaceStruct_ = call (getSymbol "g_interface_info_get_iface_struct") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val interfaceInfoGetMethod_ = call (getSymbol "g_interface_info_get_method") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val interfaceInfoGetNConstants_ = call (getSymbol "g_interface_info_get_n_constants") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val interfaceInfoGetNMethods_ = call (getSymbol "g_interface_info_get_n_methods") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val interfaceInfoGetNPrerequisites_ = call (getSymbol "g_interface_info_get_n_prerequisites") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val interfaceInfoGetNProperties_ = call (getSymbol "g_interface_info_get_n_properties") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val interfaceInfoGetNSignals_ = call (getSymbol "g_interface_info_get_n_signals") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val interfaceInfoGetNVfuncs_ = call (getSymbol "g_interface_info_get_n_vfuncs") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val interfaceInfoGetPrerequisite_ = call (getSymbol "g_interface_info_get_prerequisite") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val interfaceInfoGetProperty_ = call (getSymbol "g_interface_info_get_property") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val interfaceInfoGetSignal_ = call (getSymbol "g_interface_info_get_signal") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val interfaceInfoGetVfunc_ = call (getSymbol "g_interface_info_get_vfunc") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val invokeErrorQuark_ = call (getSymbol "g_invoke_error_quark") (PolyMLFFI.cVoid --> GUInt32.PolyML.cVal)
      val objectInfoFindMethod_ = call (getSymbol "g_object_info_find_method") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val objectInfoFindMethodUsingInterfaces_ =
        call (getSymbol "g_object_info_find_method_using_interfaces")
          (
            GIRepositoryBaseInfoRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GIRepositoryBaseInfoRecord.PolyML.cOutRef
             --> GIRepositoryBaseInfoRecord.PolyML.cPtr
          )
      val objectInfoFindVfunc_ = call (getSymbol "g_object_info_find_vfunc") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val objectInfoGetAbstract_ = call (getSymbol "g_object_info_get_abstract") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val objectInfoGetClassStruct_ = call (getSymbol "g_object_info_get_class_struct") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val objectInfoGetConstant_ = call (getSymbol "g_object_info_get_constant") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val objectInfoGetField_ = call (getSymbol "g_object_info_get_field") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val objectInfoGetFundamental_ = call (getSymbol "g_object_info_get_fundamental") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val objectInfoGetGetValueFunction_ = call (getSymbol "g_object_info_get_get_value_function") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val objectInfoGetInterface_ = call (getSymbol "g_object_info_get_interface") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val objectInfoGetMethod_ = call (getSymbol "g_object_info_get_method") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val objectInfoGetNConstants_ = call (getSymbol "g_object_info_get_n_constants") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val objectInfoGetNFields_ = call (getSymbol "g_object_info_get_n_fields") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val objectInfoGetNInterfaces_ = call (getSymbol "g_object_info_get_n_interfaces") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val objectInfoGetNMethods_ = call (getSymbol "g_object_info_get_n_methods") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val objectInfoGetNProperties_ = call (getSymbol "g_object_info_get_n_properties") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val objectInfoGetNSignals_ = call (getSymbol "g_object_info_get_n_signals") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val objectInfoGetNVfuncs_ = call (getSymbol "g_object_info_get_n_vfuncs") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val objectInfoGetParent_ = call (getSymbol "g_object_info_get_parent") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val objectInfoGetProperty_ = call (getSymbol "g_object_info_get_property") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val objectInfoGetRefFunction_ = call (getSymbol "g_object_info_get_ref_function") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val objectInfoGetSetValueFunction_ = call (getSymbol "g_object_info_get_set_value_function") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val objectInfoGetSignal_ = call (getSymbol "g_object_info_get_signal") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val objectInfoGetTypeInit_ = call (getSymbol "g_object_info_get_type_init") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val objectInfoGetTypeName_ = call (getSymbol "g_object_info_get_type_name") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val objectInfoGetUnrefFunction_ = call (getSymbol "g_object_info_get_unref_function") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val objectInfoGetVfunc_ = call (getSymbol "g_object_info_get_vfunc") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val propertyInfoGetFlags_ = call (getSymbol "g_property_info_get_flags") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GObjectParamFlags.PolyML.cVal)
      val propertyInfoGetOwnershipTransfer_ = call (getSymbol "g_property_info_get_ownership_transfer") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryTransfer.PolyML.cVal)
      val propertyInfoGetType_ = call (getSymbol "g_property_info_get_type") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val registeredTypeInfoGetTypeInit_ = call (getSymbol "g_registered_type_info_get_type_init") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val registeredTypeInfoGetTypeName_ = call (getSymbol "g_registered_type_info_get_type_name") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val signalInfoGetClassClosure_ = call (getSymbol "g_signal_info_get_class_closure") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val signalInfoGetFlags_ = call (getSymbol "g_signal_info_get_flags") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GObjectSignalFlags.PolyML.cVal)
      val signalInfoTrueStopsEmit_ = call (getSymbol "g_signal_info_true_stops_emit") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val structInfoFindMethod_ = call (getSymbol "g_struct_info_find_method") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val structInfoGetAlignment_ = call (getSymbol "g_struct_info_get_alignment") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val structInfoGetField_ = call (getSymbol "g_struct_info_get_field") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val structInfoGetMethod_ = call (getSymbol "g_struct_info_get_method") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val structInfoGetNFields_ = call (getSymbol "g_struct_info_get_n_fields") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val structInfoGetNMethods_ = call (getSymbol "g_struct_info_get_n_methods") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val structInfoGetSize_ = call (getSymbol "g_struct_info_get_size") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val structInfoIsForeign_ = call (getSymbol "g_struct_info_is_foreign") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val structInfoIsGtypeStruct_ = call (getSymbol "g_struct_info_is_gtype_struct") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val typeInfoGetArrayFixedSize_ = call (getSymbol "g_type_info_get_array_fixed_size") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val typeInfoGetArrayLength_ = call (getSymbol "g_type_info_get_array_length") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val typeInfoGetArrayType_ = call (getSymbol "g_type_info_get_array_type") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryArrayType.PolyML.cVal)
      val typeInfoGetInterface_ = call (getSymbol "g_type_info_get_interface") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val typeInfoGetParamType_ = call (getSymbol "g_type_info_get_param_type") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val typeInfoGetTag_ = call (getSymbol "g_type_info_get_tag") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryTypeTag.PolyML.cVal)
      val typeInfoIsPointer_ = call (getSymbol "g_type_info_is_pointer") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val typeInfoIsZeroTerminated_ = call (getSymbol "g_type_info_is_zero_terminated") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val typeTagToString_ = call (getSymbol "g_type_tag_to_string") (GIRepositoryTypeTag.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val unionInfoFindMethod_ = call (getSymbol "g_union_info_find_method") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val unionInfoGetAlignment_ = call (getSymbol "g_union_info_get_alignment") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val unionInfoGetDiscriminator_ = call (getSymbol "g_union_info_get_discriminator") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val unionInfoGetDiscriminatorOffset_ = call (getSymbol "g_union_info_get_discriminator_offset") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val unionInfoGetDiscriminatorType_ = call (getSymbol "g_union_info_get_discriminator_type") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val unionInfoGetField_ = call (getSymbol "g_union_info_get_field") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val unionInfoGetMethod_ = call (getSymbol "g_union_info_get_method") (GIRepositoryBaseInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val unionInfoGetNFields_ = call (getSymbol "g_union_info_get_n_fields") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val unionInfoGetNMethods_ = call (getSymbol "g_union_info_get_n_methods") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val unionInfoGetSize_ = call (getSymbol "g_union_info_get_size") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val unionInfoIsDiscriminated_ = call (getSymbol "g_union_info_is_discriminated") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val valueInfoGetValue_ = call (getSymbol "g_value_info_get_value") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt64.PolyML.cVal)
      val vfuncInfoGetFlags_ = call (getSymbol "g_vfunc_info_get_flags") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryVFuncInfoFlags.PolyML.cVal)
      val vfuncInfoGetInvoker_ = call (getSymbol "g_vfunc_info_get_invoker") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
      val vfuncInfoGetOffset_ = call (getSymbol "g_vfunc_info_get_offset") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val vfuncInfoGetSignal_ = call (getSymbol "g_vfunc_info_get_signal") (GIRepositoryBaseInfoRecord.PolyML.cPtr --> GIRepositoryBaseInfoRecord.PolyML.cPtr)
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
    structure Repository = GIRepositoryRepository
    fun argInfoGetClosure info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) argInfoGetClosure_ info
    fun argInfoGetDestroy info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) argInfoGetDestroy_ info
    fun argInfoGetDirection info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryDirection.FFI.fromVal) argInfoGetDirection_ info
    fun argInfoGetOwnershipTransfer info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryTransfer.FFI.fromVal) argInfoGetOwnershipTransfer_ info
    fun argInfoGetScope info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryScopeType.FFI.fromVal) argInfoGetScope_ info
    fun argInfoGetType info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) argInfoGetType_ info
    fun argInfoIsCallerAllocates info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) argInfoIsCallerAllocates_ info
    fun argInfoIsOptional info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) argInfoIsOptional_ info
    fun argInfoIsReturnValue info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) argInfoIsReturnValue_ info
    fun argInfoIsSkip info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) argInfoIsSkip_ info
    fun argInfoLoadType info =
      let
        val type' & () = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GIRepositoryBaseInfoRecord.FFI.withNewPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true && I) argInfoLoadType_ (info & ())
      in
        type'
      end
    fun argInfoMayBeNull info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) argInfoMayBeNull_ info
    fun baseInfoGetType info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryInfoType.FFI.fromVal) baseInfoGetType_ info
    fun callableInfoGetArg info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) callableInfoGetArg_ (info & n)
    fun callableInfoGetCallerOwns info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryTransfer.FFI.fromVal) callableInfoGetCallerOwns_ info
    fun callableInfoGetNArgs info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) callableInfoGetNArgs_ info
    fun callableInfoGetReturnAttribute info name = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) callableInfoGetReturnAttribute_ (info & name)
    fun callableInfoGetReturnType info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) callableInfoGetReturnType_ info
    fun callableInfoIterateReturnAttributes info iterator =
      let
        val name
         & value
         & retVal =
          (
            GIRepositoryBaseInfoRecord.FFI.withPtr
             &&&> GIRepositoryAttributeIterRecord.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> Utf8.FFI.withRefOptPtr
             ---> Utf8.FFI.fromPtr 0
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
        if retVal then SOME (name, value) else NONE
      end
    fun callableInfoLoadArg info n =
      let
        val arg & () =
          (
            GIRepositoryBaseInfoRecord.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GIRepositoryBaseInfoRecord.FFI.withNewPtr
             ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true && I
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
        val type' & () = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GIRepositoryBaseInfoRecord.FFI.withNewPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true && I) callableInfoLoadReturnType_ (info & ())
      in
        type'
      end
    fun callableInfoMayReturnNull info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) callableInfoMayReturnNull_ info
    fun callableInfoSkipReturn info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) callableInfoSkipReturn_ info
    fun constantInfoGetType info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) constantInfoGetType_ info
    fun enumInfoGetErrorDomain info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) enumInfoGetErrorDomain_ info
    fun enumInfoGetMethod info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) enumInfoGetMethod_ (info & n)
    fun enumInfoGetNMethods info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) enumInfoGetNMethods_ info
    fun enumInfoGetNValues info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) enumInfoGetNValues_ info
    fun enumInfoGetStorageType info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryTypeTag.FFI.fromVal) enumInfoGetStorageType_ info
    fun enumInfoGetValue info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) enumInfoGetValue_ (info & n)
    fun fieldInfoGetFlags info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryFieldInfoFlags.FFI.fromVal) fieldInfoGetFlags_ info
    fun fieldInfoGetOffset info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) fieldInfoGetOffset_ info
    fun fieldInfoGetSize info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) fieldInfoGetSize_ info
    fun fieldInfoGetType info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) fieldInfoGetType_ info
    fun functionInfoGetFlags info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryFunctionInfoFlags.FFI.fromVal) functionInfoGetFlags_ info
    fun functionInfoGetProperty info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) functionInfoGetProperty_ info
    fun functionInfoGetSymbol info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) functionInfoGetSymbol_ info
    fun functionInfoGetVfunc info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) functionInfoGetVfunc_ info
    fun infoNew type' container typelib offset =
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
    fun interfaceInfoFindMethod info name = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoFindMethod_ (info & name)
    fun interfaceInfoFindVfunc info name = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoFindVfunc_ (info & name)
    fun interfaceInfoGetConstant info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoGetConstant_ (info & n)
    fun interfaceInfoGetIfaceStruct info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoGetIfaceStruct_ info
    fun interfaceInfoGetMethod info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoGetMethod_ (info & n)
    fun interfaceInfoGetNConstants info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) interfaceInfoGetNConstants_ info
    fun interfaceInfoGetNMethods info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) interfaceInfoGetNMethods_ info
    fun interfaceInfoGetNPrerequisites info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) interfaceInfoGetNPrerequisites_ info
    fun interfaceInfoGetNProperties info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) interfaceInfoGetNProperties_ info
    fun interfaceInfoGetNSignals info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) interfaceInfoGetNSignals_ info
    fun interfaceInfoGetNVfuncs info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) interfaceInfoGetNVfuncs_ info
    fun interfaceInfoGetPrerequisite info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoGetPrerequisite_ (info & n)
    fun interfaceInfoGetProperty info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoGetProperty_ (info & n)
    fun interfaceInfoGetSignal info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoGetSignal_ (info & n)
    fun interfaceInfoGetVfunc info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoGetVfunc_ (info & n)
    fun invokeErrorQuark () = (I ---> GUInt32.FFI.fromVal) invokeErrorQuark_ ()
    fun objectInfoFindMethod info name = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoFindMethod_ (info & name)
    fun objectInfoFindMethodUsingInterfaces info name =
      let
        val implementor & retVal =
          (
            GIRepositoryBaseInfoRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GIRepositoryBaseInfoRecord.FFI.withRefOptPtr
             ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true && GIRepositoryBaseInfoRecord.FFI.fromPtr true
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
    fun objectInfoFindVfunc info name = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoFindVfunc_ (info & name)
    fun objectInfoGetAbstract info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) objectInfoGetAbstract_ info
    fun objectInfoGetClassStruct info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetClassStruct_ info
    fun objectInfoGetConstant info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetConstant_ (info & n)
    fun objectInfoGetField info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetField_ (info & n)
    fun objectInfoGetFundamental info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) objectInfoGetFundamental_ info
    fun objectInfoGetGetValueFunction info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetGetValueFunction_ info
    fun objectInfoGetInterface info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetInterface_ (info & n)
    fun objectInfoGetMethod info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetMethod_ (info & n)
    fun objectInfoGetNConstants info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) objectInfoGetNConstants_ info
    fun objectInfoGetNFields info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) objectInfoGetNFields_ info
    fun objectInfoGetNInterfaces info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) objectInfoGetNInterfaces_ info
    fun objectInfoGetNMethods info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) objectInfoGetNMethods_ info
    fun objectInfoGetNProperties info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) objectInfoGetNProperties_ info
    fun objectInfoGetNSignals info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) objectInfoGetNSignals_ info
    fun objectInfoGetNVfuncs info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) objectInfoGetNVfuncs_ info
    fun objectInfoGetParent info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetParent_ info
    fun objectInfoGetProperty info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetProperty_ (info & n)
    fun objectInfoGetRefFunction info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetRefFunction_ info
    fun objectInfoGetSetValueFunction info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetSetValueFunction_ info
    fun objectInfoGetSignal info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetSignal_ (info & n)
    fun objectInfoGetTypeInit info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetTypeInit_ info
    fun objectInfoGetTypeName info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetTypeName_ info
    fun objectInfoGetUnrefFunction info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetUnrefFunction_ info
    fun objectInfoGetVfunc info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetVfunc_ (info & n)
    fun propertyInfoGetFlags info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GObjectParamFlags.FFI.fromVal) propertyInfoGetFlags_ info
    fun propertyInfoGetOwnershipTransfer info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryTransfer.FFI.fromVal) propertyInfoGetOwnershipTransfer_ info
    fun propertyInfoGetType info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) propertyInfoGetType_ info
    fun registeredTypeInfoGetTypeInit info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) registeredTypeInfoGetTypeInit_ info
    fun registeredTypeInfoGetTypeName info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) registeredTypeInfoGetTypeName_ info
    fun signalInfoGetClassClosure info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) signalInfoGetClassClosure_ info
    fun signalInfoGetFlags info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GObjectSignalFlags.FFI.fromVal) signalInfoGetFlags_ info
    fun signalInfoTrueStopsEmit info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) signalInfoTrueStopsEmit_ info
    fun structInfoFindMethod info name = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) structInfoFindMethod_ (info & name)
    fun structInfoGetAlignment info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) structInfoGetAlignment_ info
    fun structInfoGetField info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) structInfoGetField_ (info & n)
    fun structInfoGetMethod info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) structInfoGetMethod_ (info & n)
    fun structInfoGetNFields info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) structInfoGetNFields_ info
    fun structInfoGetNMethods info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) structInfoGetNMethods_ info
    fun structInfoGetSize info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) structInfoGetSize_ info
    fun structInfoIsForeign info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) structInfoIsForeign_ info
    fun structInfoIsGtypeStruct info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) structInfoIsGtypeStruct_ info
    fun typeInfoGetArrayFixedSize info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) typeInfoGetArrayFixedSize_ info
    fun typeInfoGetArrayLength info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) typeInfoGetArrayLength_ info
    fun typeInfoGetArrayType info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryArrayType.FFI.fromVal) typeInfoGetArrayType_ info
    fun typeInfoGetInterface info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) typeInfoGetInterface_ info
    fun typeInfoGetParamType info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) typeInfoGetParamType_ (info & n)
    fun typeInfoGetTag info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryTypeTag.FFI.fromVal) typeInfoGetTag_ info
    fun typeInfoIsPointer info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) typeInfoIsPointer_ info
    fun typeInfoIsZeroTerminated info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) typeInfoIsZeroTerminated_ info
    fun typeTagToString type' = (GIRepositoryTypeTag.FFI.withVal ---> Utf8.FFI.fromPtr 0) typeTagToString_ type'
    fun unionInfoFindMethod info name = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) unionInfoFindMethod_ (info & name)
    fun unionInfoGetAlignment info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) unionInfoGetAlignment_ info
    fun unionInfoGetDiscriminator info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) unionInfoGetDiscriminator_ (info & n)
    fun unionInfoGetDiscriminatorOffset info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) unionInfoGetDiscriminatorOffset_ info
    fun unionInfoGetDiscriminatorType info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) unionInfoGetDiscriminatorType_ info
    fun unionInfoGetField info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) unionInfoGetField_ (info & n)
    fun unionInfoGetMethod info n = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) unionInfoGetMethod_ (info & n)
    fun unionInfoGetNFields info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) unionInfoGetNFields_ info
    fun unionInfoGetNMethods info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) unionInfoGetNMethods_ info
    fun unionInfoGetSize info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) unionInfoGetSize_ info
    fun unionInfoIsDiscriminated info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) unionInfoIsDiscriminated_ info
    fun valueInfoGetValue info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt64.FFI.fromVal) valueInfoGetValue_ info
    fun vfuncInfoGetFlags info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryVFuncInfoFlags.FFI.fromVal) vfuncInfoGetFlags_ info
    fun vfuncInfoGetInvoker info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) vfuncInfoGetInvoker_ info
    fun vfuncInfoGetOffset info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) vfuncInfoGetOffset_ info
    fun vfuncInfoGetSignal info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) vfuncInfoGetSignal_ info
  end
