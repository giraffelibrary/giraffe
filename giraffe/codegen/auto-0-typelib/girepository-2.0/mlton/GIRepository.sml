structure GIRepository : G_I_REPOSITORY =
  struct
    val argInfoGetClosure_ = _import "g_arg_info_get_closure" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val argInfoGetDestroy_ = _import "g_arg_info_get_destroy" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val argInfoGetDirection_ = _import "g_arg_info_get_direction" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryDirection.FFI.val_;
    val argInfoGetOwnershipTransfer_ = _import "g_arg_info_get_ownership_transfer" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryTransfer.FFI.val_;
    val argInfoGetScope_ = _import "g_arg_info_get_scope" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryScopeType.FFI.val_;
    val argInfoGetType_ = _import "g_arg_info_get_type" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
    val argInfoIsCallerAllocates_ = _import "g_arg_info_is_caller_allocates" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val argInfoIsOptional_ = _import "g_arg_info_is_optional" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val argInfoIsReturnValue_ = _import "g_arg_info_is_return_value" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val argInfoIsSkip_ = _import "g_arg_info_is_skip" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val argInfoLoadType_ = fn x1 & x2 => (_import "g_arg_info_load_type" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> unit;) (x1, x2)
    val argInfoMayBeNull_ = _import "g_arg_info_may_be_null" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val callableInfoCanThrowGerror_ = _import "g_callable_info_can_throw_gerror" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val callableInfoGetArg_ = fn x1 & x2 => (_import "g_callable_info_get_arg" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val callableInfoGetCallerOwns_ = _import "g_callable_info_get_caller_owns" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryTransfer.FFI.val_;
    val callableInfoGetInstanceOwnershipTransfer_ = _import "g_callable_info_get_instance_ownership_transfer" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryTransfer.FFI.val_;
    val callableInfoGetNArgs_ = _import "g_callable_info_get_n_args" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val callableInfoGetReturnAttribute_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_callable_info_get_return_attribute" :
              GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val callableInfoGetReturnType_ = _import "g_callable_info_get_return_type" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
    val callableInfoIsMethod_ = _import "g_callable_info_is_method" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val callableInfoIterateReturnAttributes_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_callable_info_iterate_return_attributes" :
              GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               * GIRepositoryAttributeIterRecord.FFI.non_opt GIRepositoryAttributeIterRecord.FFI.p
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               -> GBool.FFI.val_;
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
              GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               * GInt32.FFI.val_
               * GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val callableInfoLoadReturnType_ = fn x1 & x2 => (_import "g_callable_info_load_return_type" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> unit;) (x1, x2)
    val callableInfoMayReturnNull_ = _import "g_callable_info_may_return_null" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val callableInfoSkipReturn_ = _import "g_callable_info_skip_return" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val constantInfoGetType_ = _import "g_constant_info_get_type" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
    val enumInfoGetErrorDomain_ = _import "g_enum_info_get_error_domain" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val enumInfoGetMethod_ = fn x1 & x2 => (_import "g_enum_info_get_method" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val enumInfoGetNMethods_ = _import "g_enum_info_get_n_methods" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val enumInfoGetNValues_ = _import "g_enum_info_get_n_values" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val enumInfoGetStorageType_ = _import "g_enum_info_get_storage_type" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryTypeTag.FFI.val_;
    val enumInfoGetValue_ = fn x1 & x2 => (_import "g_enum_info_get_value" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val fieldInfoGetFlags_ = _import "g_field_info_get_flags" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryFieldInfoFlags.FFI.val_;
    val fieldInfoGetOffset_ = _import "g_field_info_get_offset" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val fieldInfoGetSize_ = _import "g_field_info_get_size" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val fieldInfoGetType_ = _import "g_field_info_get_type" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
    val functionInfoGetFlags_ = _import "g_function_info_get_flags" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryFunctionInfoFlags.FFI.val_;
    val functionInfoGetProperty_ = _import "g_function_info_get_property" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
    val functionInfoGetSymbol_ = _import "g_function_info_get_symbol" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val functionInfoGetVfunc_ = _import "g_function_info_get_vfunc" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
    val infoNew_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_info_new" :
              GIRepositoryInfoType.FFI.val_
               * GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               * GIRepositoryTypelibRecord.FFI.non_opt GIRepositoryTypelibRecord.FFI.p
               * GUInt32.FFI.val_
               -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val infoTypeToString_ = _import "g_info_type_to_string" : GIRepositoryInfoType.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val interfaceInfoFindMethod_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_interface_info_find_method" :
              GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
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
              GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
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
              GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val interfaceInfoGetConstant_ = fn x1 & x2 => (_import "g_interface_info_get_constant" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val interfaceInfoGetIfaceStruct_ = _import "g_interface_info_get_iface_struct" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
    val interfaceInfoGetMethod_ = fn x1 & x2 => (_import "g_interface_info_get_method" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val interfaceInfoGetNConstants_ = _import "g_interface_info_get_n_constants" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val interfaceInfoGetNMethods_ = _import "g_interface_info_get_n_methods" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val interfaceInfoGetNPrerequisites_ = _import "g_interface_info_get_n_prerequisites" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val interfaceInfoGetNProperties_ = _import "g_interface_info_get_n_properties" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val interfaceInfoGetNSignals_ = _import "g_interface_info_get_n_signals" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val interfaceInfoGetNVfuncs_ = _import "g_interface_info_get_n_vfuncs" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val interfaceInfoGetPrerequisite_ = fn x1 & x2 => (_import "g_interface_info_get_prerequisite" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val interfaceInfoGetProperty_ = fn x1 & x2 => (_import "g_interface_info_get_property" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val interfaceInfoGetSignal_ = fn x1 & x2 => (_import "g_interface_info_get_signal" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val interfaceInfoGetVfunc_ = fn x1 & x2 => (_import "g_interface_info_get_vfunc" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val invokeErrorQuark_ = _import "g_invoke_error_quark" : unit -> GUInt32.FFI.val_;
    val objectInfoFindMethod_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_object_info_find_method" :
              GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
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
              GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GIRepositoryBaseInfoRecord.FFI.opt, GIRepositoryBaseInfoRecord.FFI.non_opt) GIRepositoryBaseInfoRecord.FFI.r
               -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
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
              GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
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
              GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
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
              GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GIRepositoryBaseInfoRecord.FFI.opt, GIRepositoryBaseInfoRecord.FFI.non_opt) GIRepositoryBaseInfoRecord.FFI.r
               -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val objectInfoGetAbstract_ = _import "g_object_info_get_abstract" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val objectInfoGetClassStruct_ = _import "g_object_info_get_class_struct" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
    val objectInfoGetConstant_ = fn x1 & x2 => (_import "g_object_info_get_constant" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val objectInfoGetField_ = fn x1 & x2 => (_import "g_object_info_get_field" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val objectInfoGetFundamental_ = _import "g_object_info_get_fundamental" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val objectInfoGetGetValueFunction_ = _import "g_object_info_get_get_value_function" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val objectInfoGetInterface_ = fn x1 & x2 => (_import "g_object_info_get_interface" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val objectInfoGetMethod_ = fn x1 & x2 => (_import "g_object_info_get_method" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val objectInfoGetNConstants_ = _import "g_object_info_get_n_constants" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val objectInfoGetNFields_ = _import "g_object_info_get_n_fields" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val objectInfoGetNInterfaces_ = _import "g_object_info_get_n_interfaces" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val objectInfoGetNMethods_ = _import "g_object_info_get_n_methods" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val objectInfoGetNProperties_ = _import "g_object_info_get_n_properties" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val objectInfoGetNSignals_ = _import "g_object_info_get_n_signals" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val objectInfoGetNVfuncs_ = _import "g_object_info_get_n_vfuncs" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val objectInfoGetParent_ = _import "g_object_info_get_parent" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
    val objectInfoGetProperty_ = fn x1 & x2 => (_import "g_object_info_get_property" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val objectInfoGetRefFunction_ = _import "g_object_info_get_ref_function" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val objectInfoGetSetValueFunction_ = _import "g_object_info_get_set_value_function" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val objectInfoGetSignal_ = fn x1 & x2 => (_import "g_object_info_get_signal" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val objectInfoGetTypeInit_ = _import "g_object_info_get_type_init" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val objectInfoGetTypeName_ = _import "g_object_info_get_type_name" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val objectInfoGetUnrefFunction_ = _import "g_object_info_get_unref_function" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val objectInfoGetVfunc_ = fn x1 & x2 => (_import "g_object_info_get_vfunc" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val propertyInfoGetFlags_ = _import "g_property_info_get_flags" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GObjectParamFlags.FFI.val_;
    val propertyInfoGetOwnershipTransfer_ = _import "g_property_info_get_ownership_transfer" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryTransfer.FFI.val_;
    val propertyInfoGetType_ = _import "g_property_info_get_type" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
    val registeredTypeInfoGetGType_ = _import "g_registered_type_info_get_g_type" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GObjectType.FFI.val_;
    val registeredTypeInfoGetTypeInit_ = _import "g_registered_type_info_get_type_init" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val registeredTypeInfoGetTypeName_ = _import "g_registered_type_info_get_type_name" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val signalInfoGetClassClosure_ = _import "g_signal_info_get_class_closure" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
    val signalInfoGetFlags_ = _import "g_signal_info_get_flags" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GObjectSignalFlags.FFI.val_;
    val signalInfoTrueStopsEmit_ = _import "g_signal_info_true_stops_emit" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val structInfoFindField_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_struct_info_find_field" :
              GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
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
              GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val structInfoGetAlignment_ = _import "g_struct_info_get_alignment" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GUInt64.FFI.val_;
    val structInfoGetField_ = fn x1 & x2 => (_import "g_struct_info_get_field" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val structInfoGetMethod_ = fn x1 & x2 => (_import "g_struct_info_get_method" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val structInfoGetNFields_ = _import "g_struct_info_get_n_fields" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val structInfoGetNMethods_ = _import "g_struct_info_get_n_methods" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val structInfoGetSize_ = _import "g_struct_info_get_size" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GUInt64.FFI.val_;
    val structInfoIsForeign_ = _import "g_struct_info_is_foreign" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val structInfoIsGtypeStruct_ = _import "g_struct_info_is_gtype_struct" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val typeInfoGetArrayFixedSize_ = _import "g_type_info_get_array_fixed_size" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val typeInfoGetArrayLength_ = _import "g_type_info_get_array_length" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val typeInfoGetArrayType_ = _import "g_type_info_get_array_type" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryArrayType.FFI.val_;
    val typeInfoGetInterface_ = _import "g_type_info_get_interface" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
    val typeInfoGetParamType_ = fn x1 & x2 => (_import "g_type_info_get_param_type" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val typeInfoGetTag_ = _import "g_type_info_get_tag" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryTypeTag.FFI.val_;
    val typeInfoIsPointer_ = _import "g_type_info_is_pointer" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val typeInfoIsZeroTerminated_ = _import "g_type_info_is_zero_terminated" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val typeTagToString_ = _import "g_type_tag_to_string" : GIRepositoryTypeTag.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val unionInfoFindMethod_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_union_info_find_method" :
              GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val unionInfoGetAlignment_ = _import "g_union_info_get_alignment" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GUInt64.FFI.val_;
    val unionInfoGetDiscriminator_ = fn x1 & x2 => (_import "g_union_info_get_discriminator" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val unionInfoGetDiscriminatorOffset_ = _import "g_union_info_get_discriminator_offset" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val unionInfoGetDiscriminatorType_ = _import "g_union_info_get_discriminator_type" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
    val unionInfoGetField_ = fn x1 & x2 => (_import "g_union_info_get_field" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val unionInfoGetMethod_ = fn x1 & x2 => (_import "g_union_info_get_method" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p * GInt32.FFI.val_ -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;) (x1, x2)
    val unionInfoGetNFields_ = _import "g_union_info_get_n_fields" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val unionInfoGetNMethods_ = _import "g_union_info_get_n_methods" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val unionInfoGetSize_ = _import "g_union_info_get_size" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GUInt64.FFI.val_;
    val unionInfoIsDiscriminated_ = _import "g_union_info_is_discriminated" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GBool.FFI.val_;
    val valueInfoGetValue_ = _import "g_value_info_get_value" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt64.FFI.val_;
    val vfuncInfoGetFlags_ = _import "g_vfunc_info_get_flags" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryVFuncInfoFlags.FFI.val_;
    val vfuncInfoGetInvoker_ = _import "g_vfunc_info_get_invoker" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
    val vfuncInfoGetOffset_ = _import "g_vfunc_info_get_offset" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GInt32.FFI.val_;
    val vfuncInfoGetSignal_ = _import "g_vfunc_info_get_signal" : GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p -> GIRepositoryBaseInfoRecord.FFI.non_opt GIRepositoryBaseInfoRecord.FFI.p;
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
    fun callableInfoCanThrowGerror info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) callableInfoCanThrowGerror_ info
    fun callableInfoGetArg (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) callableInfoGetArg_ (info & n)
    fun callableInfoGetCallerOwns info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryTransfer.FFI.fromVal) callableInfoGetCallerOwns_ info
    fun callableInfoGetInstanceOwnershipTransfer info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryTransfer.FFI.fromVal) callableInfoGetInstanceOwnershipTransfer_ info
    fun callableInfoGetNArgs info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) callableInfoGetNArgs_ info
    fun callableInfoGetReturnAttribute (info, name) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) callableInfoGetReturnAttribute_ (info & name)
    fun callableInfoGetReturnType info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) callableInfoGetReturnType_ info
    fun callableInfoIsMethod info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) callableInfoIsMethod_ info
    fun callableInfoIterateReturnAttributes (info, iterator) =
      let
        val iterator
         & name
         & value
         & retVal =
          (
            GIRepositoryBaseInfoRecord.FFI.withPtr
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
    fun enumInfoGetMethod (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) enumInfoGetMethod_ (info & n)
    fun enumInfoGetNMethods info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) enumInfoGetNMethods_ info
    fun enumInfoGetNValues info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) enumInfoGetNValues_ info
    fun enumInfoGetStorageType info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryTypeTag.FFI.fromVal) enumInfoGetStorageType_ info
    fun enumInfoGetValue (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) enumInfoGetValue_ (info & n)
    fun fieldInfoGetFlags info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryFieldInfoFlags.FFI.fromVal) fieldInfoGetFlags_ info
    fun fieldInfoGetOffset info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) fieldInfoGetOffset_ info
    fun fieldInfoGetSize info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) fieldInfoGetSize_ info
    fun fieldInfoGetType info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) fieldInfoGetType_ info
    fun functionInfoGetFlags info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryFunctionInfoFlags.FFI.fromVal) functionInfoGetFlags_ info
    fun functionInfoGetProperty info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) functionInfoGetProperty_ info
    fun functionInfoGetSymbol info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) functionInfoGetSymbol_ info
    fun functionInfoGetVfunc info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) functionInfoGetVfunc_ info
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
    fun interfaceInfoFindMethod (info, name) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoFindMethod_ (info & name)
    fun interfaceInfoFindSignal (info, name) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoFindSignal_ (info & name)
    fun interfaceInfoFindVfunc (info, name) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoFindVfunc_ (info & name)
    fun interfaceInfoGetConstant (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoGetConstant_ (info & n)
    fun interfaceInfoGetIfaceStruct info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoGetIfaceStruct_ info
    fun interfaceInfoGetMethod (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoGetMethod_ (info & n)
    fun interfaceInfoGetNConstants info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) interfaceInfoGetNConstants_ info
    fun interfaceInfoGetNMethods info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) interfaceInfoGetNMethods_ info
    fun interfaceInfoGetNPrerequisites info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) interfaceInfoGetNPrerequisites_ info
    fun interfaceInfoGetNProperties info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) interfaceInfoGetNProperties_ info
    fun interfaceInfoGetNSignals info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) interfaceInfoGetNSignals_ info
    fun interfaceInfoGetNVfuncs info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) interfaceInfoGetNVfuncs_ info
    fun interfaceInfoGetPrerequisite (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoGetPrerequisite_ (info & n)
    fun interfaceInfoGetProperty (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoGetProperty_ (info & n)
    fun interfaceInfoGetSignal (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoGetSignal_ (info & n)
    fun interfaceInfoGetVfunc (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) interfaceInfoGetVfunc_ (info & n)
    fun invokeErrorQuark () = (I ---> GUInt32.FFI.fromVal) invokeErrorQuark_ ()
    fun objectInfoFindMethod (info, name) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoFindMethod_ (info & name)
    fun objectInfoFindMethodUsingInterfaces (info, name) =
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
    fun objectInfoFindSignal (info, name) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoFindSignal_ (info & name)
    fun objectInfoFindVfunc (info, name) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoFindVfunc_ (info & name)
    fun objectInfoFindVfuncUsingInterfaces (info, name) =
      let
        val implementor & retVal =
          (
            GIRepositoryBaseInfoRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GIRepositoryBaseInfoRecord.FFI.withRefOptPtr
             ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true && GIRepositoryBaseInfoRecord.FFI.fromPtr true
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
    fun objectInfoGetAbstract info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) objectInfoGetAbstract_ info
    fun objectInfoGetClassStruct info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetClassStruct_ info
    fun objectInfoGetConstant (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetConstant_ (info & n)
    fun objectInfoGetField (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetField_ (info & n)
    fun objectInfoGetFundamental info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) objectInfoGetFundamental_ info
    fun objectInfoGetGetValueFunction info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetGetValueFunction_ info
    fun objectInfoGetInterface (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetInterface_ (info & n)
    fun objectInfoGetMethod (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetMethod_ (info & n)
    fun objectInfoGetNConstants info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) objectInfoGetNConstants_ info
    fun objectInfoGetNFields info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) objectInfoGetNFields_ info
    fun objectInfoGetNInterfaces info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) objectInfoGetNInterfaces_ info
    fun objectInfoGetNMethods info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) objectInfoGetNMethods_ info
    fun objectInfoGetNProperties info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) objectInfoGetNProperties_ info
    fun objectInfoGetNSignals info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) objectInfoGetNSignals_ info
    fun objectInfoGetNVfuncs info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) objectInfoGetNVfuncs_ info
    fun objectInfoGetParent info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetParent_ info
    fun objectInfoGetProperty (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetProperty_ (info & n)
    fun objectInfoGetRefFunction info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetRefFunction_ info
    fun objectInfoGetSetValueFunction info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetSetValueFunction_ info
    fun objectInfoGetSignal (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetSignal_ (info & n)
    fun objectInfoGetTypeInit info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetTypeInit_ info
    fun objectInfoGetTypeName info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetTypeName_ info
    fun objectInfoGetUnrefFunction info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) objectInfoGetUnrefFunction_ info
    fun objectInfoGetVfunc (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) objectInfoGetVfunc_ (info & n)
    fun propertyInfoGetFlags info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GObjectParamFlags.FFI.fromVal) propertyInfoGetFlags_ info
    fun propertyInfoGetOwnershipTransfer info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryTransfer.FFI.fromVal) propertyInfoGetOwnershipTransfer_ info
    fun propertyInfoGetType info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) propertyInfoGetType_ info
    fun registeredTypeInfoGetGType info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GObjectType.FFI.fromVal) registeredTypeInfoGetGType_ info
    fun registeredTypeInfoGetTypeInit info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) registeredTypeInfoGetTypeInit_ info
    fun registeredTypeInfoGetTypeName info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) registeredTypeInfoGetTypeName_ info
    fun signalInfoGetClassClosure info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) signalInfoGetClassClosure_ info
    fun signalInfoGetFlags info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GObjectSignalFlags.FFI.fromVal) signalInfoGetFlags_ info
    fun signalInfoTrueStopsEmit info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) signalInfoTrueStopsEmit_ info
    fun structInfoFindField (info, name) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) structInfoFindField_ (info & name)
    fun structInfoFindMethod (info, name) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) structInfoFindMethod_ (info & name)
    fun structInfoGetAlignment info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) structInfoGetAlignment_ info
    fun structInfoGetField (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) structInfoGetField_ (info & n)
    fun structInfoGetMethod (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) structInfoGetMethod_ (info & n)
    fun structInfoGetNFields info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) structInfoGetNFields_ info
    fun structInfoGetNMethods info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) structInfoGetNMethods_ info
    fun structInfoGetSize info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) structInfoGetSize_ info
    fun structInfoIsForeign info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) structInfoIsForeign_ info
    fun structInfoIsGtypeStruct info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) structInfoIsGtypeStruct_ info
    fun typeInfoGetArrayFixedSize info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) typeInfoGetArrayFixedSize_ info
    fun typeInfoGetArrayLength info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) typeInfoGetArrayLength_ info
    fun typeInfoGetArrayType info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryArrayType.FFI.fromVal) typeInfoGetArrayType_ info
    fun typeInfoGetInterface info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) typeInfoGetInterface_ info
    fun typeInfoGetParamType (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) typeInfoGetParamType_ (info & n)
    fun typeInfoGetTag info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryTypeTag.FFI.fromVal) typeInfoGetTag_ info
    fun typeInfoIsPointer info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) typeInfoIsPointer_ info
    fun typeInfoIsZeroTerminated info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) typeInfoIsZeroTerminated_ info
    fun typeTagToString type' = (GIRepositoryTypeTag.FFI.withVal ---> Utf8.FFI.fromPtr 0) typeTagToString_ type'
    fun unionInfoFindMethod (info, name) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) unionInfoFindMethod_ (info & name)
    fun unionInfoGetAlignment info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GUInt64.FFI.fromVal) unionInfoGetAlignment_ info
    fun unionInfoGetDiscriminator (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) unionInfoGetDiscriminator_ (info & n)
    fun unionInfoGetDiscriminatorOffset info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) unionInfoGetDiscriminatorOffset_ info
    fun unionInfoGetDiscriminatorType info = (GIRepositoryBaseInfoRecord.FFI.withPtr ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) unionInfoGetDiscriminatorType_ info
    fun unionInfoGetField (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) unionInfoGetField_ (info & n)
    fun unionInfoGetMethod (info, n) = (GIRepositoryBaseInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GIRepositoryBaseInfoRecord.FFI.fromPtr true) unionInfoGetMethod_ (info & n)
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
