structure GIRepository : G_I_REPOSITORY =
  struct
    local
      open PolyMLFFI
    in
      val argInfoGetClosure_ = call (load_sym libgirepository "g_arg_info_get_closure") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val argInfoGetDestroy_ = call (load_sym libgirepository "g_arg_info_get_destroy") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val argInfoGetDirection_ = call (load_sym libgirepository "g_arg_info_get_direction") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryDirection.PolyML.VAL)
      val argInfoGetOwnershipTransfer_ = call (load_sym libgirepository "g_arg_info_get_ownership_transfer") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryTransfer.PolyML.VAL)
      val argInfoGetScope_ = call (load_sym libgirepository "g_arg_info_get_scope") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryScopeType.PolyML.VAL)
      val argInfoGetType_ = call (load_sym libgirepository "g_arg_info_get_type") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val argInfoIsCallerAllocates_ = call (load_sym libgirepository "g_arg_info_is_caller_allocates") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val argInfoIsOptional_ = call (load_sym libgirepository "g_arg_info_is_optional") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val argInfoIsReturnValue_ = call (load_sym libgirepository "g_arg_info_is_return_value") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val argInfoIsSkip_ = call (load_sym libgirepository "g_arg_info_is_skip") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val argInfoLoadType_ = call (load_sym libgirepository "g_arg_info_load_type") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val argInfoMayBeNull_ = call (load_sym libgirepository "g_arg_info_may_be_null") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val baseInfoGetType_ = call (load_sym libgirepository "g_base_info_get_type") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryInfoType.PolyML.VAL)
      val callableInfoGetArg_ = call (load_sym libgirepository "g_callable_info_get_arg") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val callableInfoGetCallerOwns_ = call (load_sym libgirepository "g_callable_info_get_caller_owns") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryTransfer.PolyML.VAL)
      val callableInfoGetNArgs_ = call (load_sym libgirepository "g_callable_info_get_n_args") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val callableInfoGetReturnAttribute_ = call (load_sym libgirepository "g_callable_info_get_return_attribute") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val callableInfoGetReturnType_ = call (load_sym libgirepository "g_callable_info_get_return_type") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val callableInfoIterateReturnAttributes_ =
        call (load_sym libgirepository "g_callable_info_iterate_return_attributes")
          (
            GIRepositoryBaseInfoRecord.PolyML.PTR
             &&> GIRepositoryAttributeIterRecord.PolyML.PTR
             &&> FFI.PolyML.String.OUTREF
             &&> FFI.PolyML.String.OUTREF
             --> FFI.PolyML.Bool.VAL
          )
      val callableInfoLoadArg_ =
        call (load_sym libgirepository "g_callable_info_load_arg")
          (
            GIRepositoryBaseInfoRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> GIRepositoryBaseInfoRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val callableInfoLoadReturnType_ = call (load_sym libgirepository "g_callable_info_load_return_type") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val callableInfoMayReturnNull_ = call (load_sym libgirepository "g_callable_info_may_return_null") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val callableInfoSkipReturn_ = call (load_sym libgirepository "g_callable_info_skip_return") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val constantInfoGetType_ = call (load_sym libgirepository "g_constant_info_get_type") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val enumInfoGetErrorDomain_ = call (load_sym libgirepository "g_enum_info_get_error_domain") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val enumInfoGetMethod_ = call (load_sym libgirepository "g_enum_info_get_method") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val enumInfoGetNMethods_ = call (load_sym libgirepository "g_enum_info_get_n_methods") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val enumInfoGetNValues_ = call (load_sym libgirepository "g_enum_info_get_n_values") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val enumInfoGetStorageType_ = call (load_sym libgirepository "g_enum_info_get_storage_type") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryTypeTag.PolyML.VAL)
      val enumInfoGetValue_ = call (load_sym libgirepository "g_enum_info_get_value") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val fieldInfoGetFlags_ = call (load_sym libgirepository "g_field_info_get_flags") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryFieldInfoFlags.PolyML.VAL)
      val fieldInfoGetOffset_ = call (load_sym libgirepository "g_field_info_get_offset") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val fieldInfoGetSize_ = call (load_sym libgirepository "g_field_info_get_size") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val fieldInfoGetType_ = call (load_sym libgirepository "g_field_info_get_type") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val functionInfoGetFlags_ = call (load_sym libgirepository "g_function_info_get_flags") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryFunctionInfoFlags.PolyML.VAL)
      val functionInfoGetProperty_ = call (load_sym libgirepository "g_function_info_get_property") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val functionInfoGetSymbol_ = call (load_sym libgirepository "g_function_info_get_symbol") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val functionInfoGetVfunc_ = call (load_sym libgirepository "g_function_info_get_vfunc") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val infoNew_ =
        call (load_sym libgirepository "g_info_new")
          (
            GIRepositoryInfoType.PolyML.VAL
             &&> GIRepositoryBaseInfoRecord.PolyML.PTR
             &&> GIRepositoryTypelibRecord.PolyML.PTR
             &&> FFI.PolyML.UInt32.VAL
             --> GIRepositoryBaseInfoRecord.PolyML.PTR
          )
      val infoTypeToString_ = call (load_sym libgirepository "g_info_type_to_string") (GIRepositoryInfoType.PolyML.VAL --> FFI.PolyML.String.RETPTR)
      val interfaceInfoFindMethod_ = call (load_sym libgirepository "g_interface_info_find_method") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.String.INPTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val interfaceInfoFindVfunc_ = call (load_sym libgirepository "g_interface_info_find_vfunc") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.String.INPTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val interfaceInfoGetConstant_ = call (load_sym libgirepository "g_interface_info_get_constant") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val interfaceInfoGetIfaceStruct_ = call (load_sym libgirepository "g_interface_info_get_iface_struct") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val interfaceInfoGetMethod_ = call (load_sym libgirepository "g_interface_info_get_method") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val interfaceInfoGetNConstants_ = call (load_sym libgirepository "g_interface_info_get_n_constants") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val interfaceInfoGetNMethods_ = call (load_sym libgirepository "g_interface_info_get_n_methods") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val interfaceInfoGetNPrerequisites_ = call (load_sym libgirepository "g_interface_info_get_n_prerequisites") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val interfaceInfoGetNProperties_ = call (load_sym libgirepository "g_interface_info_get_n_properties") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val interfaceInfoGetNSignals_ = call (load_sym libgirepository "g_interface_info_get_n_signals") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val interfaceInfoGetNVfuncs_ = call (load_sym libgirepository "g_interface_info_get_n_vfuncs") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val interfaceInfoGetPrerequisite_ = call (load_sym libgirepository "g_interface_info_get_prerequisite") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val interfaceInfoGetProperty_ = call (load_sym libgirepository "g_interface_info_get_property") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val interfaceInfoGetSignal_ = call (load_sym libgirepository "g_interface_info_get_signal") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val interfaceInfoGetVfunc_ = call (load_sym libgirepository "g_interface_info_get_vfunc") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val invokeErrorQuark_ = call (load_sym libgirepository "g_invoke_error_quark") (FFI.PolyML.VOID --> FFI.PolyML.UInt32.VAL)
      val objectInfoFindMethod_ = call (load_sym libgirepository "g_object_info_find_method") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.String.INPTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val objectInfoFindMethodUsingInterfaces_ =
        call (load_sym libgirepository "g_object_info_find_method_using_interfaces")
          (
            GIRepositoryBaseInfoRecord.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GIRepositoryBaseInfoRecord.PolyML.OUTREF
             --> GIRepositoryBaseInfoRecord.PolyML.PTR
          )
      val objectInfoFindVfunc_ = call (load_sym libgirepository "g_object_info_find_vfunc") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.String.INPTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val objectInfoGetAbstract_ = call (load_sym libgirepository "g_object_info_get_abstract") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val objectInfoGetClassStruct_ = call (load_sym libgirepository "g_object_info_get_class_struct") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val objectInfoGetConstant_ = call (load_sym libgirepository "g_object_info_get_constant") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val objectInfoGetField_ = call (load_sym libgirepository "g_object_info_get_field") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val objectInfoGetFundamental_ = call (load_sym libgirepository "g_object_info_get_fundamental") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val objectInfoGetGetValueFunction_ = call (load_sym libgirepository "g_object_info_get_get_value_function") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val objectInfoGetInterface_ = call (load_sym libgirepository "g_object_info_get_interface") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val objectInfoGetMethod_ = call (load_sym libgirepository "g_object_info_get_method") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val objectInfoGetNConstants_ = call (load_sym libgirepository "g_object_info_get_n_constants") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val objectInfoGetNFields_ = call (load_sym libgirepository "g_object_info_get_n_fields") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val objectInfoGetNInterfaces_ = call (load_sym libgirepository "g_object_info_get_n_interfaces") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val objectInfoGetNMethods_ = call (load_sym libgirepository "g_object_info_get_n_methods") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val objectInfoGetNProperties_ = call (load_sym libgirepository "g_object_info_get_n_properties") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val objectInfoGetNSignals_ = call (load_sym libgirepository "g_object_info_get_n_signals") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val objectInfoGetNVfuncs_ = call (load_sym libgirepository "g_object_info_get_n_vfuncs") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val objectInfoGetParent_ = call (load_sym libgirepository "g_object_info_get_parent") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val objectInfoGetProperty_ = call (load_sym libgirepository "g_object_info_get_property") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val objectInfoGetRefFunction_ = call (load_sym libgirepository "g_object_info_get_ref_function") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val objectInfoGetSetValueFunction_ = call (load_sym libgirepository "g_object_info_get_set_value_function") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val objectInfoGetSignal_ = call (load_sym libgirepository "g_object_info_get_signal") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val objectInfoGetTypeInit_ = call (load_sym libgirepository "g_object_info_get_type_init") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val objectInfoGetTypeName_ = call (load_sym libgirepository "g_object_info_get_type_name") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val objectInfoGetUnrefFunction_ = call (load_sym libgirepository "g_object_info_get_unref_function") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val objectInfoGetVfunc_ = call (load_sym libgirepository "g_object_info_get_vfunc") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val propertyInfoGetFlags_ = call (load_sym libgirepository "g_property_info_get_flags") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GObjectParamFlags.PolyML.VAL)
      val propertyInfoGetOwnershipTransfer_ = call (load_sym libgirepository "g_property_info_get_ownership_transfer") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryTransfer.PolyML.VAL)
      val propertyInfoGetType_ = call (load_sym libgirepository "g_property_info_get_type") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val registeredTypeInfoGetTypeInit_ = call (load_sym libgirepository "g_registered_type_info_get_type_init") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val registeredTypeInfoGetTypeName_ = call (load_sym libgirepository "g_registered_type_info_get_type_name") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val signalInfoGetClassClosure_ = call (load_sym libgirepository "g_signal_info_get_class_closure") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val signalInfoGetFlags_ = call (load_sym libgirepository "g_signal_info_get_flags") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GObjectSignalFlags.PolyML.VAL)
      val signalInfoTrueStopsEmit_ = call (load_sym libgirepository "g_signal_info_true_stops_emit") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val structInfoFindMethod_ = call (load_sym libgirepository "g_struct_info_find_method") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.String.INPTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val structInfoGetAlignment_ = call (load_sym libgirepository "g_struct_info_get_alignment") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.UInt64.VAL)
      val structInfoGetField_ = call (load_sym libgirepository "g_struct_info_get_field") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val structInfoGetMethod_ = call (load_sym libgirepository "g_struct_info_get_method") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val structInfoGetNFields_ = call (load_sym libgirepository "g_struct_info_get_n_fields") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val structInfoGetNMethods_ = call (load_sym libgirepository "g_struct_info_get_n_methods") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val structInfoGetSize_ = call (load_sym libgirepository "g_struct_info_get_size") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.UInt64.VAL)
      val structInfoIsForeign_ = call (load_sym libgirepository "g_struct_info_is_foreign") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val structInfoIsGtypeStruct_ = call (load_sym libgirepository "g_struct_info_is_gtype_struct") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val typeInfoGetArrayFixedSize_ = call (load_sym libgirepository "g_type_info_get_array_fixed_size") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val typeInfoGetArrayLength_ = call (load_sym libgirepository "g_type_info_get_array_length") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val typeInfoGetArrayType_ = call (load_sym libgirepository "g_type_info_get_array_type") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryArrayType.PolyML.VAL)
      val typeInfoGetInterface_ = call (load_sym libgirepository "g_type_info_get_interface") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val typeInfoGetParamType_ = call (load_sym libgirepository "g_type_info_get_param_type") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val typeInfoGetTag_ = call (load_sym libgirepository "g_type_info_get_tag") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryTypeTag.PolyML.VAL)
      val typeInfoIsPointer_ = call (load_sym libgirepository "g_type_info_is_pointer") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val typeInfoIsZeroTerminated_ = call (load_sym libgirepository "g_type_info_is_zero_terminated") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val typeTagToString_ = call (load_sym libgirepository "g_type_tag_to_string") (GIRepositoryTypeTag.PolyML.VAL --> FFI.PolyML.String.RETPTR)
      val unionInfoFindMethod_ = call (load_sym libgirepository "g_union_info_find_method") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.String.INPTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val unionInfoGetAlignment_ = call (load_sym libgirepository "g_union_info_get_alignment") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.UInt64.VAL)
      val unionInfoGetDiscriminator_ = call (load_sym libgirepository "g_union_info_get_discriminator") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val unionInfoGetDiscriminatorOffset_ = call (load_sym libgirepository "g_union_info_get_discriminator_offset") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val unionInfoGetDiscriminatorType_ = call (load_sym libgirepository "g_union_info_get_discriminator_type") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val unionInfoGetField_ = call (load_sym libgirepository "g_union_info_get_field") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val unionInfoGetMethod_ = call (load_sym libgirepository "g_union_info_get_method") (GIRepositoryBaseInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val unionInfoGetNFields_ = call (load_sym libgirepository "g_union_info_get_n_fields") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val unionInfoGetNMethods_ = call (load_sym libgirepository "g_union_info_get_n_methods") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val unionInfoGetSize_ = call (load_sym libgirepository "g_union_info_get_size") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.UInt64.VAL)
      val unionInfoIsDiscriminated_ = call (load_sym libgirepository "g_union_info_is_discriminated") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val valueInfoGetValue_ = call (load_sym libgirepository "g_value_info_get_value") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int64.VAL)
      val vfuncInfoGetFlags_ = call (load_sym libgirepository "g_vfunc_info_get_flags") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryVFuncInfoFlags.PolyML.VAL)
      val vfuncInfoGetInvoker_ = call (load_sym libgirepository "g_vfunc_info_get_invoker") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
      val vfuncInfoGetOffset_ = call (load_sym libgirepository "g_vfunc_info_get_offset") (GIRepositoryBaseInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val vfuncInfoGetSignal_ = call (load_sym libgirepository "g_vfunc_info_get_signal") (GIRepositoryBaseInfoRecord.PolyML.PTR --> GIRepositoryBaseInfoRecord.PolyML.PTR)
    end
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
    fun argInfoGetClosure info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) argInfoGetClosure_ info
    fun argInfoGetDestroy info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) argInfoGetDestroy_ info
    fun argInfoGetDirection info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryDirection.C.fromVal) argInfoGetDirection_ info
    fun argInfoGetOwnershipTransfer info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryTransfer.C.fromVal) argInfoGetOwnershipTransfer_ info
    fun argInfoGetScope info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryScopeType.C.fromVal) argInfoGetScope_ info
    fun argInfoGetType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) argInfoGetType_ info
    fun argInfoIsCallerAllocates info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.fromVal) argInfoIsCallerAllocates_ info
    fun argInfoIsOptional info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.fromVal) argInfoIsOptional_ info
    fun argInfoIsReturnValue info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.fromVal) argInfoIsReturnValue_ info
    fun argInfoIsSkip info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.fromVal) argInfoIsSkip_ info
    fun argInfoLoadType info =
      let
        val type' & () = (GIRepositoryBaseInfoRecord.C.withPtr &&&> GIRepositoryBaseInfoRecord.C.withNewPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true && I) argInfoLoadType_ (info & ())
      in
        type'
      end
    fun argInfoMayBeNull info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.fromVal) argInfoMayBeNull_ info
    fun baseInfoGetType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryInfoType.C.fromVal) baseInfoGetType_ info
    fun callableInfoGetArg info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) callableInfoGetArg_ (info & n)
    fun callableInfoGetCallerOwns info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryTransfer.C.fromVal) callableInfoGetCallerOwns_ info
    fun callableInfoGetNArgs info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) callableInfoGetNArgs_ info
    fun callableInfoGetReturnAttribute info name = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr false) callableInfoGetReturnAttribute_ (info & name)
    fun callableInfoGetReturnType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) callableInfoGetReturnType_ info
    fun callableInfoIterateReturnAttributes info iterator =
      let
        val name
         & value
         & retVal =
          (
            GIRepositoryBaseInfoRecord.C.withPtr
             &&&> GIRepositoryAttributeIterRecord.C.withPtr
             &&&> FFI.String.withRefConstOptPtr
             &&&> FFI.String.withRefConstOptPtr
             ---> FFI.String.fromPtr false
                   && FFI.String.fromPtr false
                   && FFI.Bool.fromVal
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
            GIRepositoryBaseInfoRecord.C.withPtr
             &&&> FFI.Int32.withVal
             &&&> GIRepositoryBaseInfoRecord.C.withNewPtr
             ---> GIRepositoryBaseInfoRecord.C.fromPtr true && I
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
        val type' & () = (GIRepositoryBaseInfoRecord.C.withPtr &&&> GIRepositoryBaseInfoRecord.C.withNewPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true && I) callableInfoLoadReturnType_ (info & ())
      in
        type'
      end
    fun callableInfoMayReturnNull info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.fromVal) callableInfoMayReturnNull_ info
    fun callableInfoSkipReturn info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.fromVal) callableInfoSkipReturn_ info
    fun constantInfoGetType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) constantInfoGetType_ info
    fun enumInfoGetErrorDomain info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.fromPtr false) enumInfoGetErrorDomain_ info
    fun enumInfoGetMethod info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) enumInfoGetMethod_ (info & n)
    fun enumInfoGetNMethods info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) enumInfoGetNMethods_ info
    fun enumInfoGetNValues info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) enumInfoGetNValues_ info
    fun enumInfoGetStorageType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryTypeTag.C.fromVal) enumInfoGetStorageType_ info
    fun enumInfoGetValue info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) enumInfoGetValue_ (info & n)
    fun fieldInfoGetFlags info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryFieldInfoFlags.C.fromVal) fieldInfoGetFlags_ info
    fun fieldInfoGetOffset info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) fieldInfoGetOffset_ info
    fun fieldInfoGetSize info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) fieldInfoGetSize_ info
    fun fieldInfoGetType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) fieldInfoGetType_ info
    fun functionInfoGetFlags info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryFunctionInfoFlags.C.fromVal) functionInfoGetFlags_ info
    fun functionInfoGetProperty info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) functionInfoGetProperty_ info
    fun functionInfoGetSymbol info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.fromPtr false) functionInfoGetSymbol_ info
    fun functionInfoGetVfunc info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) functionInfoGetVfunc_ info
    fun infoNew type' container typelib offset =
      (
        GIRepositoryInfoType.C.withVal
         &&&> GIRepositoryBaseInfoRecord.C.withPtr
         &&&> GIRepositoryTypelibRecord.C.withPtr
         &&&> FFI.UInt32.withVal
         ---> GIRepositoryBaseInfoRecord.C.fromPtr true
      )
        infoNew_
        (
          type'
           & container
           & typelib
           & offset
        )
    fun infoTypeToString type' = (GIRepositoryInfoType.C.withVal ---> FFI.String.fromPtr false) infoTypeToString_ type'
    fun interfaceInfoFindMethod info name = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.String.withConstPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoFindMethod_ (info & name)
    fun interfaceInfoFindVfunc info name = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.String.withConstPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoFindVfunc_ (info & name)
    fun interfaceInfoGetConstant info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoGetConstant_ (info & n)
    fun interfaceInfoGetIfaceStruct info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoGetIfaceStruct_ info
    fun interfaceInfoGetMethod info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoGetMethod_ (info & n)
    fun interfaceInfoGetNConstants info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) interfaceInfoGetNConstants_ info
    fun interfaceInfoGetNMethods info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) interfaceInfoGetNMethods_ info
    fun interfaceInfoGetNPrerequisites info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) interfaceInfoGetNPrerequisites_ info
    fun interfaceInfoGetNProperties info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) interfaceInfoGetNProperties_ info
    fun interfaceInfoGetNSignals info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) interfaceInfoGetNSignals_ info
    fun interfaceInfoGetNVfuncs info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) interfaceInfoGetNVfuncs_ info
    fun interfaceInfoGetPrerequisite info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoGetPrerequisite_ (info & n)
    fun interfaceInfoGetProperty info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoGetProperty_ (info & n)
    fun interfaceInfoGetSignal info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoGetSignal_ (info & n)
    fun interfaceInfoGetVfunc info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoGetVfunc_ (info & n)
    fun invokeErrorQuark () = (I ---> FFI.UInt32.fromVal) invokeErrorQuark_ ()
    fun objectInfoFindMethod info name = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.String.withConstPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoFindMethod_ (info & name)
    fun objectInfoFindMethodUsingInterfaces info name =
      let
        val implementor & retVal =
          (
            GIRepositoryBaseInfoRecord.C.withPtr
             &&&> FFI.String.withConstPtr
             &&&> GIRepositoryBaseInfoRecord.C.withRefOptPtr
             ---> GIRepositoryBaseInfoRecord.C.fromPtr true && GIRepositoryBaseInfoRecord.C.fromPtr true
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
    fun objectInfoFindVfunc info name = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.String.withConstPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoFindVfunc_ (info & name)
    fun objectInfoGetAbstract info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.fromVal) objectInfoGetAbstract_ info
    fun objectInfoGetClassStruct info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetClassStruct_ info
    fun objectInfoGetConstant info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetConstant_ (info & n)
    fun objectInfoGetField info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetField_ (info & n)
    fun objectInfoGetFundamental info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.fromVal) objectInfoGetFundamental_ info
    fun objectInfoGetGetValueFunction info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.fromPtr false) objectInfoGetGetValueFunction_ info
    fun objectInfoGetInterface info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetInterface_ (info & n)
    fun objectInfoGetMethod info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetMethod_ (info & n)
    fun objectInfoGetNConstants info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) objectInfoGetNConstants_ info
    fun objectInfoGetNFields info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) objectInfoGetNFields_ info
    fun objectInfoGetNInterfaces info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) objectInfoGetNInterfaces_ info
    fun objectInfoGetNMethods info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) objectInfoGetNMethods_ info
    fun objectInfoGetNProperties info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) objectInfoGetNProperties_ info
    fun objectInfoGetNSignals info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) objectInfoGetNSignals_ info
    fun objectInfoGetNVfuncs info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) objectInfoGetNVfuncs_ info
    fun objectInfoGetParent info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetParent_ info
    fun objectInfoGetProperty info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetProperty_ (info & n)
    fun objectInfoGetRefFunction info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.fromPtr false) objectInfoGetRefFunction_ info
    fun objectInfoGetSetValueFunction info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.fromPtr false) objectInfoGetSetValueFunction_ info
    fun objectInfoGetSignal info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetSignal_ (info & n)
    fun objectInfoGetTypeInit info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.fromPtr false) objectInfoGetTypeInit_ info
    fun objectInfoGetTypeName info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.fromPtr false) objectInfoGetTypeName_ info
    fun objectInfoGetUnrefFunction info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.fromPtr false) objectInfoGetUnrefFunction_ info
    fun objectInfoGetVfunc info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetVfunc_ (info & n)
    fun propertyInfoGetFlags info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GObjectParamFlags.C.fromVal) propertyInfoGetFlags_ info
    fun propertyInfoGetOwnershipTransfer info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryTransfer.C.fromVal) propertyInfoGetOwnershipTransfer_ info
    fun propertyInfoGetType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) propertyInfoGetType_ info
    fun registeredTypeInfoGetTypeInit info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.fromPtr false) registeredTypeInfoGetTypeInit_ info
    fun registeredTypeInfoGetTypeName info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.fromPtr false) registeredTypeInfoGetTypeName_ info
    fun signalInfoGetClassClosure info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) signalInfoGetClassClosure_ info
    fun signalInfoGetFlags info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GObjectSignalFlags.C.fromVal) signalInfoGetFlags_ info
    fun signalInfoTrueStopsEmit info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.fromVal) signalInfoTrueStopsEmit_ info
    fun structInfoFindMethod info name = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.String.withConstPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) structInfoFindMethod_ (info & name)
    fun structInfoGetAlignment info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.UInt64.fromVal) structInfoGetAlignment_ info
    fun structInfoGetField info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) structInfoGetField_ (info & n)
    fun structInfoGetMethod info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) structInfoGetMethod_ (info & n)
    fun structInfoGetNFields info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) structInfoGetNFields_ info
    fun structInfoGetNMethods info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) structInfoGetNMethods_ info
    fun structInfoGetSize info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.UInt64.fromVal) structInfoGetSize_ info
    fun structInfoIsForeign info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.fromVal) structInfoIsForeign_ info
    fun structInfoIsGtypeStruct info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.fromVal) structInfoIsGtypeStruct_ info
    fun typeInfoGetArrayFixedSize info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) typeInfoGetArrayFixedSize_ info
    fun typeInfoGetArrayLength info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) typeInfoGetArrayLength_ info
    fun typeInfoGetArrayType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryArrayType.C.fromVal) typeInfoGetArrayType_ info
    fun typeInfoGetInterface info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) typeInfoGetInterface_ info
    fun typeInfoGetParamType info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) typeInfoGetParamType_ (info & n)
    fun typeInfoGetTag info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryTypeTag.C.fromVal) typeInfoGetTag_ info
    fun typeInfoIsPointer info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.fromVal) typeInfoIsPointer_ info
    fun typeInfoIsZeroTerminated info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.fromVal) typeInfoIsZeroTerminated_ info
    fun typeTagToString type' = (GIRepositoryTypeTag.C.withVal ---> FFI.String.fromPtr false) typeTagToString_ type'
    fun unionInfoFindMethod info name = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.String.withConstPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) unionInfoFindMethod_ (info & name)
    fun unionInfoGetAlignment info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.UInt64.fromVal) unionInfoGetAlignment_ info
    fun unionInfoGetDiscriminator info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) unionInfoGetDiscriminator_ (info & n)
    fun unionInfoGetDiscriminatorOffset info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) unionInfoGetDiscriminatorOffset_ info
    fun unionInfoGetDiscriminatorType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) unionInfoGetDiscriminatorType_ info
    fun unionInfoGetField info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) unionInfoGetField_ (info & n)
    fun unionInfoGetMethod info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) unionInfoGetMethod_ (info & n)
    fun unionInfoGetNFields info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) unionInfoGetNFields_ info
    fun unionInfoGetNMethods info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) unionInfoGetNMethods_ info
    fun unionInfoGetSize info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.UInt64.fromVal) unionInfoGetSize_ info
    fun unionInfoIsDiscriminated info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.fromVal) unionInfoIsDiscriminated_ info
    fun valueInfoGetValue info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int64.fromVal) valueInfoGetValue_ info
    fun vfuncInfoGetFlags info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryVFuncInfoFlags.C.fromVal) vfuncInfoGetFlags_ info
    fun vfuncInfoGetInvoker info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) vfuncInfoGetInvoker_ info
    fun vfuncInfoGetOffset info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.fromVal) vfuncInfoGetOffset_ info
    fun vfuncInfoGetSignal info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) vfuncInfoGetSignal_ info
  end
