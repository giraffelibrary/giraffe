structure GIRepository : G_I_REPOSITORY =
  struct
    val argInfoGetClosure_ = _import "g_arg_info_get_closure" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val argInfoGetDestroy_ = _import "g_arg_info_get_destroy" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val argInfoGetDirection_ = _import "g_arg_info_get_direction" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryDirection.C.val_;
    val argInfoGetOwnershipTransfer_ = _import "g_arg_info_get_ownership_transfer" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryTransfer.C.val_;
    val argInfoGetScope_ = _import "g_arg_info_get_scope" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryScopeType.C.val_;
    val argInfoGetType_ = _import "g_arg_info_get_type" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
    val argInfoIsCallerAllocates_ = _import "g_arg_info_is_caller_allocates" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Bool.C.val_;
    val argInfoIsOptional_ = _import "g_arg_info_is_optional" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Bool.C.val_;
    val argInfoIsReturnValue_ = _import "g_arg_info_is_return_value" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Bool.C.val_;
    val argInfoIsSkip_ = _import "g_arg_info_is_skip" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Bool.C.val_;
    val argInfoLoadType_ = fn x1 & x2 => (_import "g_arg_info_load_type" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> unit;) (x1, x2)
    val argInfoMayBeNull_ = _import "g_arg_info_may_be_null" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Bool.C.val_;
    val baseInfoGetType_ = _import "g_base_info_get_type" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryInfoType.C.val_;
    val callableInfoGetArg_ = fn x1 & x2 => (_import "g_callable_info_get_arg" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val callableInfoGetCallerOwns_ = _import "g_callable_info_get_caller_owns" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryTransfer.C.val_;
    val callableInfoGetNArgs_ = _import "g_callable_info_get_n_args" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val callableInfoGetReturnAttribute_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_callable_info_get_return_attribute" :
              GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p
               * cstring
               * unit CPointer.t
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val callableInfoGetReturnType_ = _import "g_callable_info_get_return_type" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
    val callableInfoIterateReturnAttributes_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_callable_info_iterate_return_attributes" :
              GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p
               * GIRepositoryAttributeIterRecord.C.notnull GIRepositoryAttributeIterRecord.C.p
               * cstring
               * unit CPointer.t ref
               * cstring
               * unit CPointer.t ref
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
              GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p
               * FFI.Int32.C.val_
               * GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val callableInfoLoadReturnType_ = fn x1 & x2 => (_import "g_callable_info_load_return_type" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> unit;) (x1, x2)
    val callableInfoMayReturnNull_ = _import "g_callable_info_may_return_null" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Bool.C.val_;
    val callableInfoSkipReturn_ = _import "g_callable_info_skip_return" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Bool.C.val_;
    val constantInfoGetType_ = _import "g_constant_info_get_type" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
    val enumInfoGetErrorDomain_ = _import "g_enum_info_get_error_domain" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val enumInfoGetMethod_ = fn x1 & x2 => (_import "g_enum_info_get_method" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val enumInfoGetNMethods_ = _import "g_enum_info_get_n_methods" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val enumInfoGetNValues_ = _import "g_enum_info_get_n_values" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val enumInfoGetStorageType_ = _import "g_enum_info_get_storage_type" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryTypeTag.C.val_;
    val enumInfoGetValue_ = fn x1 & x2 => (_import "g_enum_info_get_value" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val fieldInfoGetFlags_ = _import "g_field_info_get_flags" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryFieldInfoFlags.C.val_;
    val fieldInfoGetOffset_ = _import "g_field_info_get_offset" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val fieldInfoGetSize_ = _import "g_field_info_get_size" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val fieldInfoGetType_ = _import "g_field_info_get_type" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
    val functionInfoGetFlags_ = _import "g_function_info_get_flags" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryFunctionInfoFlags.C.val_;
    val functionInfoGetProperty_ = _import "g_function_info_get_property" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
    val functionInfoGetSymbol_ = _import "g_function_info_get_symbol" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val functionInfoGetVfunc_ = _import "g_function_info_get_vfunc" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
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
              GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p
               * cstring
               * unit CPointer.t
               -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
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
              GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p
               * cstring
               * unit CPointer.t
               -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val interfaceInfoGetConstant_ = fn x1 & x2 => (_import "g_interface_info_get_constant" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val interfaceInfoGetIfaceStruct_ = _import "g_interface_info_get_iface_struct" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
    val interfaceInfoGetMethod_ = fn x1 & x2 => (_import "g_interface_info_get_method" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val interfaceInfoGetNConstants_ = _import "g_interface_info_get_n_constants" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val interfaceInfoGetNMethods_ = _import "g_interface_info_get_n_methods" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val interfaceInfoGetNPrerequisites_ = _import "g_interface_info_get_n_prerequisites" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val interfaceInfoGetNProperties_ = _import "g_interface_info_get_n_properties" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val interfaceInfoGetNSignals_ = _import "g_interface_info_get_n_signals" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val interfaceInfoGetNVfuncs_ = _import "g_interface_info_get_n_vfuncs" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val interfaceInfoGetPrerequisite_ = fn x1 & x2 => (_import "g_interface_info_get_prerequisite" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val interfaceInfoGetProperty_ = fn x1 & x2 => (_import "g_interface_info_get_property" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val interfaceInfoGetSignal_ = fn x1 & x2 => (_import "g_interface_info_get_signal" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val interfaceInfoGetVfunc_ = fn x1 & x2 => (_import "g_interface_info_get_vfunc" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val invokeErrorQuark_ = _import "g_invoke_error_quark" : unit -> FFI.UInt32.C.val_;
    val objectInfoFindMethod_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_object_info_find_method" :
              GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p
               * cstring
               * unit CPointer.t
               -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
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
              GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p
               * cstring
               * unit CPointer.t
               * (unit, GIRepositoryBaseInfoRecord.C.notnull) GIRepositoryBaseInfoRecord.C.r
               -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
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
              GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p
               * cstring
               * unit CPointer.t
               -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val objectInfoGetAbstract_ = _import "g_object_info_get_abstract" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Bool.C.val_;
    val objectInfoGetClassStruct_ = _import "g_object_info_get_class_struct" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
    val objectInfoGetConstant_ = fn x1 & x2 => (_import "g_object_info_get_constant" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val objectInfoGetField_ = fn x1 & x2 => (_import "g_object_info_get_field" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val objectInfoGetFundamental_ = _import "g_object_info_get_fundamental" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Bool.C.val_;
    val objectInfoGetGetValueFunction_ = _import "g_object_info_get_get_value_function" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val objectInfoGetInterface_ = fn x1 & x2 => (_import "g_object_info_get_interface" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val objectInfoGetMethod_ = fn x1 & x2 => (_import "g_object_info_get_method" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val objectInfoGetNConstants_ = _import "g_object_info_get_n_constants" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val objectInfoGetNFields_ = _import "g_object_info_get_n_fields" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val objectInfoGetNInterfaces_ = _import "g_object_info_get_n_interfaces" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val objectInfoGetNMethods_ = _import "g_object_info_get_n_methods" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val objectInfoGetNProperties_ = _import "g_object_info_get_n_properties" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val objectInfoGetNSignals_ = _import "g_object_info_get_n_signals" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val objectInfoGetNVfuncs_ = _import "g_object_info_get_n_vfuncs" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val objectInfoGetParent_ = _import "g_object_info_get_parent" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
    val objectInfoGetProperty_ = fn x1 & x2 => (_import "g_object_info_get_property" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val objectInfoGetRefFunction_ = _import "g_object_info_get_ref_function" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val objectInfoGetSetValueFunction_ = _import "g_object_info_get_set_value_function" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val objectInfoGetSignal_ = fn x1 & x2 => (_import "g_object_info_get_signal" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val objectInfoGetTypeInit_ = _import "g_object_info_get_type_init" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val objectInfoGetTypeName_ = _import "g_object_info_get_type_name" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val objectInfoGetUnrefFunction_ = _import "g_object_info_get_unref_function" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val objectInfoGetVfunc_ = fn x1 & x2 => (_import "g_object_info_get_vfunc" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val propertyInfoGetFlags_ = _import "g_property_info_get_flags" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GObjectParamFlags.C.val_;
    val propertyInfoGetOwnershipTransfer_ = _import "g_property_info_get_ownership_transfer" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryTransfer.C.val_;
    val propertyInfoGetType_ = _import "g_property_info_get_type" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
    val registeredTypeInfoGetTypeInit_ = _import "g_registered_type_info_get_type_init" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val registeredTypeInfoGetTypeName_ = _import "g_registered_type_info_get_type_name" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val signalInfoGetClassClosure_ = _import "g_signal_info_get_class_closure" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
    val signalInfoGetFlags_ = _import "g_signal_info_get_flags" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GObjectSignalFlags.C.val_;
    val signalInfoTrueStopsEmit_ = _import "g_signal_info_true_stops_emit" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Bool.C.val_;
    val structInfoFindMethod_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_struct_info_find_method" :
              GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p
               * cstring
               * unit CPointer.t
               -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val structInfoGetAlignment_ = _import "g_struct_info_get_alignment" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.UInt64.C.val_;
    val structInfoGetField_ = fn x1 & x2 => (_import "g_struct_info_get_field" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val structInfoGetMethod_ = fn x1 & x2 => (_import "g_struct_info_get_method" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val structInfoGetNFields_ = _import "g_struct_info_get_n_fields" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val structInfoGetNMethods_ = _import "g_struct_info_get_n_methods" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val structInfoGetSize_ = _import "g_struct_info_get_size" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.UInt64.C.val_;
    val structInfoIsForeign_ = _import "g_struct_info_is_foreign" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Bool.C.val_;
    val structInfoIsGtypeStruct_ = _import "g_struct_info_is_gtype_struct" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Bool.C.val_;
    val typeInfoGetArrayFixedSize_ = _import "g_type_info_get_array_fixed_size" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val typeInfoGetArrayLength_ = _import "g_type_info_get_array_length" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val typeInfoGetArrayType_ = _import "g_type_info_get_array_type" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryArrayType.C.val_;
    val typeInfoGetInterface_ = _import "g_type_info_get_interface" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
    val typeInfoGetParamType_ = fn x1 & x2 => (_import "g_type_info_get_param_type" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val typeInfoGetTag_ = _import "g_type_info_get_tag" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryTypeTag.C.val_;
    val typeInfoIsPointer_ = _import "g_type_info_is_pointer" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Bool.C.val_;
    val typeInfoIsZeroTerminated_ = _import "g_type_info_is_zero_terminated" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Bool.C.val_;
    val typeTagToString_ = _import "g_type_tag_to_string" : GIRepositoryTypeTag.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val unionInfoFindMethod_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_union_info_find_method" :
              GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p
               * cstring
               * unit CPointer.t
               -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val unionInfoGetAlignment_ = _import "g_union_info_get_alignment" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.UInt64.C.val_;
    val unionInfoGetDiscriminator_ = fn x1 & x2 => (_import "g_union_info_get_discriminator" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val unionInfoGetDiscriminatorOffset_ = _import "g_union_info_get_discriminator_offset" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val unionInfoGetDiscriminatorType_ = _import "g_union_info_get_discriminator_type" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
    val unionInfoGetField_ = fn x1 & x2 => (_import "g_union_info_get_field" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val unionInfoGetMethod_ = fn x1 & x2 => (_import "g_union_info_get_method" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p * FFI.Int32.C.val_ -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;) (x1, x2)
    val unionInfoGetNFields_ = _import "g_union_info_get_n_fields" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val unionInfoGetNMethods_ = _import "g_union_info_get_n_methods" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val unionInfoGetSize_ = _import "g_union_info_get_size" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.UInt64.C.val_;
    val unionInfoIsDiscriminated_ = _import "g_union_info_is_discriminated" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Bool.C.val_;
    val valueInfoGetValue_ = _import "g_value_info_get_value" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int64.C.val_;
    val vfuncInfoGetFlags_ = _import "g_vfunc_info_get_flags" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryVFuncInfoFlags.C.val_;
    val vfuncInfoGetInvoker_ = _import "g_vfunc_info_get_invoker" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
    val vfuncInfoGetOffset_ = _import "g_vfunc_info_get_offset" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> FFI.Int32.C.val_;
    val vfuncInfoGetSignal_ = _import "g_vfunc_info_get_signal" : GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p -> GIRepositoryBaseInfoRecord.C.notnull GIRepositoryBaseInfoRecord.C.p;
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
    fun argInfoGetClosure info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) argInfoGetClosure_ info
    fun argInfoGetDestroy info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) argInfoGetDestroy_ info
    fun argInfoGetDirection info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryDirection.C.fromVal) argInfoGetDirection_ info
    fun argInfoGetOwnershipTransfer info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryTransfer.C.fromVal) argInfoGetOwnershipTransfer_ info
    fun argInfoGetScope info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryScopeType.C.fromVal) argInfoGetScope_ info
    fun argInfoGetType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) argInfoGetType_ info
    fun argInfoIsCallerAllocates info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) argInfoIsCallerAllocates_ info
    fun argInfoIsOptional info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) argInfoIsOptional_ info
    fun argInfoIsReturnValue info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) argInfoIsReturnValue_ info
    fun argInfoIsSkip info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) argInfoIsSkip_ info
    fun argInfoLoadType info =
      let
        val type' & () = (GIRepositoryBaseInfoRecord.C.withPtr &&&> GIRepositoryBaseInfoRecord.C.withNewPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true && I) argInfoLoadType_ (info & ())
      in
        type'
      end
    fun argInfoMayBeNull info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) argInfoMayBeNull_ info
    fun baseInfoGetType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryInfoType.C.fromVal) baseInfoGetType_ info
    fun callableInfoGetArg info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) callableInfoGetArg_ (info & n)
    fun callableInfoGetCallerOwns info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryTransfer.C.fromVal) callableInfoGetCallerOwns_ info
    fun callableInfoGetNArgs info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) callableInfoGetNArgs_ info
    fun callableInfoGetReturnAttribute info name = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) callableInfoGetReturnAttribute_ (info & name)
    fun callableInfoGetReturnType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) callableInfoGetReturnType_ info
    fun callableInfoIterateReturnAttributes info iterator =
      let
        val name
         & value
         & retVal =
          (
            GIRepositoryBaseInfoRecord.C.withPtr
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
            GIRepositoryBaseInfoRecord.C.withPtr
             &&&> FFI.Int32.C.withVal
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
    fun callableInfoMayReturnNull info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) callableInfoMayReturnNull_ info
    fun callableInfoSkipReturn info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) callableInfoSkipReturn_ info
    fun constantInfoGetType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) constantInfoGetType_ info
    fun enumInfoGetErrorDomain info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) enumInfoGetErrorDomain_ info
    fun enumInfoGetMethod info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) enumInfoGetMethod_ (info & n)
    fun enumInfoGetNMethods info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) enumInfoGetNMethods_ info
    fun enumInfoGetNValues info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) enumInfoGetNValues_ info
    fun enumInfoGetStorageType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryTypeTag.C.fromVal) enumInfoGetStorageType_ info
    fun enumInfoGetValue info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) enumInfoGetValue_ (info & n)
    fun fieldInfoGetFlags info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryFieldInfoFlags.C.fromVal) fieldInfoGetFlags_ info
    fun fieldInfoGetOffset info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) fieldInfoGetOffset_ info
    fun fieldInfoGetSize info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) fieldInfoGetSize_ info
    fun fieldInfoGetType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) fieldInfoGetType_ info
    fun functionInfoGetFlags info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryFunctionInfoFlags.C.fromVal) functionInfoGetFlags_ info
    fun functionInfoGetProperty info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) functionInfoGetProperty_ info
    fun functionInfoGetSymbol info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) functionInfoGetSymbol_ info
    fun functionInfoGetVfunc info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) functionInfoGetVfunc_ info
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
    fun interfaceInfoFindMethod info name = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoFindMethod_ (info & name)
    fun interfaceInfoFindVfunc info name = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoFindVfunc_ (info & name)
    fun interfaceInfoGetConstant info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoGetConstant_ (info & n)
    fun interfaceInfoGetIfaceStruct info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoGetIfaceStruct_ info
    fun interfaceInfoGetMethod info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoGetMethod_ (info & n)
    fun interfaceInfoGetNConstants info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) interfaceInfoGetNConstants_ info
    fun interfaceInfoGetNMethods info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) interfaceInfoGetNMethods_ info
    fun interfaceInfoGetNPrerequisites info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) interfaceInfoGetNPrerequisites_ info
    fun interfaceInfoGetNProperties info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) interfaceInfoGetNProperties_ info
    fun interfaceInfoGetNSignals info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) interfaceInfoGetNSignals_ info
    fun interfaceInfoGetNVfuncs info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) interfaceInfoGetNVfuncs_ info
    fun interfaceInfoGetPrerequisite info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoGetPrerequisite_ (info & n)
    fun interfaceInfoGetProperty info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoGetProperty_ (info & n)
    fun interfaceInfoGetSignal info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoGetSignal_ (info & n)
    fun interfaceInfoGetVfunc info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) interfaceInfoGetVfunc_ (info & n)
    fun invokeErrorQuark () = (I ---> FFI.UInt32.C.fromVal) invokeErrorQuark_ ()
    fun objectInfoFindMethod info name = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoFindMethod_ (info & name)
    fun objectInfoFindMethodUsingInterfaces info name =
      let
        val implementor & retVal =
          (
            GIRepositoryBaseInfoRecord.C.withPtr
             &&&> FFI.String.C.withConstPtr
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
    fun objectInfoFindVfunc info name = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoFindVfunc_ (info & name)
    fun objectInfoGetAbstract info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) objectInfoGetAbstract_ info
    fun objectInfoGetClassStruct info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetClassStruct_ info
    fun objectInfoGetConstant info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetConstant_ (info & n)
    fun objectInfoGetField info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetField_ (info & n)
    fun objectInfoGetFundamental info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) objectInfoGetFundamental_ info
    fun objectInfoGetGetValueFunction info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) objectInfoGetGetValueFunction_ info
    fun objectInfoGetInterface info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetInterface_ (info & n)
    fun objectInfoGetMethod info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetMethod_ (info & n)
    fun objectInfoGetNConstants info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) objectInfoGetNConstants_ info
    fun objectInfoGetNFields info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) objectInfoGetNFields_ info
    fun objectInfoGetNInterfaces info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) objectInfoGetNInterfaces_ info
    fun objectInfoGetNMethods info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) objectInfoGetNMethods_ info
    fun objectInfoGetNProperties info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) objectInfoGetNProperties_ info
    fun objectInfoGetNSignals info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) objectInfoGetNSignals_ info
    fun objectInfoGetNVfuncs info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) objectInfoGetNVfuncs_ info
    fun objectInfoGetParent info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetParent_ info
    fun objectInfoGetProperty info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetProperty_ (info & n)
    fun objectInfoGetRefFunction info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) objectInfoGetRefFunction_ info
    fun objectInfoGetSetValueFunction info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) objectInfoGetSetValueFunction_ info
    fun objectInfoGetSignal info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetSignal_ (info & n)
    fun objectInfoGetTypeInit info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) objectInfoGetTypeInit_ info
    fun objectInfoGetTypeName info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) objectInfoGetTypeName_ info
    fun objectInfoGetUnrefFunction info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) objectInfoGetUnrefFunction_ info
    fun objectInfoGetVfunc info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) objectInfoGetVfunc_ (info & n)
    fun propertyInfoGetFlags info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GObjectParamFlags.C.fromVal) propertyInfoGetFlags_ info
    fun propertyInfoGetOwnershipTransfer info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryTransfer.C.fromVal) propertyInfoGetOwnershipTransfer_ info
    fun propertyInfoGetType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) propertyInfoGetType_ info
    fun registeredTypeInfoGetTypeInit info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) registeredTypeInfoGetTypeInit_ info
    fun registeredTypeInfoGetTypeName info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) registeredTypeInfoGetTypeName_ info
    fun signalInfoGetClassClosure info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) signalInfoGetClassClosure_ info
    fun signalInfoGetFlags info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GObjectSignalFlags.C.fromVal) signalInfoGetFlags_ info
    fun signalInfoTrueStopsEmit info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) signalInfoTrueStopsEmit_ info
    fun structInfoFindMethod info name = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) structInfoFindMethod_ (info & name)
    fun structInfoGetAlignment info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.UInt64.C.fromVal) structInfoGetAlignment_ info
    fun structInfoGetField info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) structInfoGetField_ (info & n)
    fun structInfoGetMethod info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) structInfoGetMethod_ (info & n)
    fun structInfoGetNFields info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) structInfoGetNFields_ info
    fun structInfoGetNMethods info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) structInfoGetNMethods_ info
    fun structInfoGetSize info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.UInt64.C.fromVal) structInfoGetSize_ info
    fun structInfoIsForeign info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) structInfoIsForeign_ info
    fun structInfoIsGtypeStruct info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) structInfoIsGtypeStruct_ info
    fun typeInfoGetArrayFixedSize info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) typeInfoGetArrayFixedSize_ info
    fun typeInfoGetArrayLength info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) typeInfoGetArrayLength_ info
    fun typeInfoGetArrayType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryArrayType.C.fromVal) typeInfoGetArrayType_ info
    fun typeInfoGetInterface info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) typeInfoGetInterface_ info
    fun typeInfoGetParamType info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) typeInfoGetParamType_ (info & n)
    fun typeInfoGetTag info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryTypeTag.C.fromVal) typeInfoGetTag_ info
    fun typeInfoIsPointer info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) typeInfoIsPointer_ info
    fun typeInfoIsZeroTerminated info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) typeInfoIsZeroTerminated_ info
    fun typeTagToString type' = (GIRepositoryTypeTag.C.withVal ---> FFI.String.C.fromPtr false) typeTagToString_ type'
    fun unionInfoFindMethod info name = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) unionInfoFindMethod_ (info & name)
    fun unionInfoGetAlignment info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.UInt64.C.fromVal) unionInfoGetAlignment_ info
    fun unionInfoGetDiscriminator info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) unionInfoGetDiscriminator_ (info & n)
    fun unionInfoGetDiscriminatorOffset info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) unionInfoGetDiscriminatorOffset_ info
    fun unionInfoGetDiscriminatorType info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) unionInfoGetDiscriminatorType_ info
    fun unionInfoGetField info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) unionInfoGetField_ (info & n)
    fun unionInfoGetMethod info n = (GIRepositoryBaseInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GIRepositoryBaseInfoRecord.C.fromPtr true) unionInfoGetMethod_ (info & n)
    fun unionInfoGetNFields info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) unionInfoGetNFields_ info
    fun unionInfoGetNMethods info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) unionInfoGetNMethods_ info
    fun unionInfoGetSize info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.UInt64.C.fromVal) unionInfoGetSize_ info
    fun unionInfoIsDiscriminated info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) unionInfoIsDiscriminated_ info
    fun valueInfoGetValue info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int64.C.fromVal) valueInfoGetValue_ info
    fun vfuncInfoGetFlags info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryVFuncInfoFlags.C.fromVal) vfuncInfoGetFlags_ info
    fun vfuncInfoGetInvoker info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) vfuncInfoGetInvoker_ info
    fun vfuncInfoGetOffset info = (GIRepositoryBaseInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) vfuncInfoGetOffset_ info
    fun vfuncInfoGetSignal info = (GIRepositoryBaseInfoRecord.C.withPtr ---> GIRepositoryBaseInfoRecord.C.fromPtr true) vfuncInfoGetSignal_ info
  end
