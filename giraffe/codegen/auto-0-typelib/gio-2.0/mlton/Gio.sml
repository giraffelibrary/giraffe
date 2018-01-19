structure Gio : GIO =
  struct
    structure GObjectParameterRecordCVectorNType =
      CValueCVectorNType(
        structure CElemType = GObjectParameterRecord.C.ValueType
        structure ElemSequence = CValueVectorSequence(GObjectParameterRecord.C.ValueType)
      )
    structure GObjectParameterRecordCVectorN = CVectorN(GObjectParameterRecordCVectorNType)
    structure GioDBusAnnotationInfoRecordCVectorType =
      CPointerCVectorType(
        structure CElemType = GioDBusAnnotationInfoRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GioDBusAnnotationInfoRecordCVector = CVector(GioDBusAnnotationInfoRecordCVectorType)
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    val actionNameIsValid_ = _import "mlton_g_action_name_is_valid" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val actionParseDetailedName_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_g_action_parse_detailed_name" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
               * (unit, GLibVariantRecord.FFI.notnull) GLibVariantRecord.FFI.r
               * (unit, unit) GLibErrorRecord.FFI.r
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
    val actionPrintDetailedName_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_action_print_detailed_name" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.FFI.p
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val appInfoCreateFromCommandline_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_g_app_info_create_from_commandline" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GioAppInfoCreateFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val appInfoGetDefaultForType_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_app_info_get_default_for_type" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GBool.FFI.val_
               -> GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val appInfoGetDefaultForUriScheme_ = _import "mlton_g_app_info_get_default_for_uri_scheme" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p;
    val appInfoLaunchDefaultForUri_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_app_info_launch_default_for_uri" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GioAppLaunchContextClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val appInfoLaunchDefaultForUriFinish_ = fn x1 & x2 => (_import "g_app_info_launch_default_for_uri_finish" : GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val appInfoResetTypeAssociations_ = _import "mlton_g_app_info_reset_type_associations" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit;
    val busGetFinish_ = fn x1 & x2 => (_import "g_bus_get_finish" : GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p;) (x1, x2)
    val busGetSync_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_bus_get_sync" :
              GioBusType.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val busOwnNameOnConnection_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_bus_own_name_on_connection_with_closures" :
              GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioBusNameOwnerFlags.FFI.val_
               * unit GObjectClosureRecord.FFI.p
               * unit GObjectClosureRecord.FFI.p
               -> GUInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val busOwnName_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_bus_own_name_with_closures" :
              GioBusType.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioBusNameOwnerFlags.FFI.val_
               * unit GObjectClosureRecord.FFI.p
               * unit GObjectClosureRecord.FFI.p
               * unit GObjectClosureRecord.FFI.p
               -> GUInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val busUnownName_ = _import "g_bus_unown_name" : GUInt32.FFI.val_ -> unit;
    val busUnwatchName_ = _import "g_bus_unwatch_name" : GUInt32.FFI.val_ -> unit;
    val busWatchNameOnConnection_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_bus_watch_name_on_connection_with_closures" :
              GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioBusNameWatcherFlags.FFI.val_
               * unit GObjectClosureRecord.FFI.p
               * unit GObjectClosureRecord.FFI.p
               -> GUInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val busWatchName_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_bus_watch_name_with_closures" :
              GioBusType.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioBusNameWatcherFlags.FFI.val_
               * unit GObjectClosureRecord.FFI.p
               * unit GObjectClosureRecord.FFI.p
               -> GUInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val contentTypeCanBeExecutable_ = _import "mlton_g_content_type_can_be_executable" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val contentTypeEquals_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_content_type_equals" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val contentTypeFromMimeType_ = _import "mlton_g_content_type_from_mime_type" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit Utf8.FFI.out_p;
    val contentTypeGetDescription_ = _import "mlton_g_content_type_get_description" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val contentTypeGetGenericIconName_ = _import "mlton_g_content_type_get_generic_icon_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit Utf8.FFI.out_p;
    val contentTypeGetIcon_ = _import "mlton_g_content_type_get_icon" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioIconClass.FFI.notnull GioIconClass.FFI.p;
    val contentTypeGetMimeType_ = _import "mlton_g_content_type_get_mime_type" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit Utf8.FFI.out_p;
    val contentTypeGetSymbolicIcon_ = _import "mlton_g_content_type_get_symbolic_icon" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioIconClass.FFI.notnull GioIconClass.FFI.p;
    val contentTypeGuess_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_g_content_type_guess" :
              Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GUInt8CVectorN.MLton.p1
               * unit GUInt8CVectorN.MLton.p2
               * GUInt64.FFI.val_
               * GBool.FFI.ref_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val contentTypeGuessForTree_ = _import "g_content_type_guess_for_tree" : GioFileClass.FFI.notnull GioFileClass.FFI.p -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val contentTypeIsA_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_content_type_is_a" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val contentTypeIsUnknown_ = _import "mlton_g_content_type_is_unknown" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val dbusAddressEscapeValue_ = _import "mlton_g_dbus_address_escape_value" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val dbusAddressGetForBusSync_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_address_get_for_bus_sync" :
              GioBusType.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val dbusAddressGetStreamFinish_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_dbus_address_get_stream_finish" :
              GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val dbusAddressGetStreamSync_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_g_dbus_address_get_stream_sync" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val dbusAnnotationInfoLookup_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_dbus_annotation_info_lookup" :
              GioDBusAnnotationInfoRecordCVector.MLton.p1
               * unit GioDBusAnnotationInfoRecordCVector.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val dbusErrorQuark_ = _import "g_dbus_error_quark" : unit -> GUInt32.FFI.val_;
    val dbusGenerateGuid_ = _import "g_dbus_generate_guid" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val dbusGvalueToGvariant_ = fn x1 & x2 => (_import "g_dbus_gvalue_to_gvariant" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;) (x1, x2)
    val dbusGvariantToGvalue_ = fn x1 & x2 => (_import "g_dbus_gvariant_to_gvalue" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit;) (x1, x2)
    val dbusIsAddress_ = _import "mlton_g_dbus_is_address" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val dbusIsGuid_ = _import "mlton_g_dbus_is_guid" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val dbusIsInterfaceName_ = _import "mlton_g_dbus_is_interface_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val dbusIsMemberName_ = _import "mlton_g_dbus_is_member_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val dbusIsName_ = _import "mlton_g_dbus_is_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val dbusIsSupportedAddress_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_dbus_is_supported_address" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val dbusIsUniqueName_ = _import "mlton_g_dbus_is_unique_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val dtlsClientConnectionNew_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dtls_client_connection_new" :
              GioDatagramBasedClass.FFI.notnull GioDatagramBasedClass.FFI.p
               * unit GioSocketConnectableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioDtlsClientConnectionClass.FFI.notnull GioDtlsClientConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val dtlsServerConnectionNew_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dtls_server_connection_new" :
              GioDatagramBasedClass.FFI.notnull GioDatagramBasedClass.FFI.p
               * unit GioTlsCertificateClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioDtlsServerConnectionClass.FFI.notnull GioDtlsServerConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val fileNewForCommandlineArg_ = _import "mlton_g_file_new_for_commandline_arg" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
    val fileNewForCommandlineArgAndCwd_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_file_new_for_commandline_arg_and_cwd" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val fileNewForPath_ = _import "mlton_g_file_new_for_path" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
    val fileNewForUri_ = _import "mlton_g_file_new_for_uri" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
    val fileNewTmp_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_file_new_tmp" :
              Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * (unit, GioFileIOStreamClass.FFI.notnull) GioFileIOStreamClass.FFI.r
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val fileParseName_ = _import "mlton_g_file_parse_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
    val iconDeserialize_ = _import "g_icon_deserialize" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GioIconClass.FFI.notnull GioIconClass.FFI.p;
    val iconNewForString_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_icon_new_for_string" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioIconClass.FFI.notnull GioIconClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val initableNewv_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_g_initable_newv" :
              GObjectType.FFI.val_
               * GUInt32.FFI.val_
               * GObjectParameterRecordCVectorN.MLton.p1
               * GObjectParameterRecordCVectorN.FFI.notnull GObjectParameterRecordCVectorN.MLton.p2
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val ioErrorFromErrno_ = _import "g_io_error_from_errno" : GInt32.FFI.val_ -> GioIOErrorEnum.FFI.val_;
    val ioErrorQuark_ = _import "g_io_error_quark" : unit -> GUInt32.FFI.val_;
    val ioExtensionPointImplement_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_io_extension_point_implement" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectType.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.val_
               -> GioIOExtensionRecord.FFI.notnull GioIOExtensionRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val ioExtensionPointLookup_ = _import "mlton_g_io_extension_point_lookup" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioIOExtensionPointRecord.FFI.notnull GioIOExtensionPointRecord.FFI.p;
    val ioExtensionPointRegister_ = _import "mlton_g_io_extension_point_register" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioIOExtensionPointRecord.FFI.notnull GioIOExtensionPointRecord.FFI.p;
    val ioModulesScanAllInDirectory_ = _import "mlton_g_io_modules_scan_all_in_directory" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit;
    val ioModulesScanAllInDirectoryWithScope_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_io_modules_scan_all_in_directory_with_scope" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioIOModuleScopeRecord.FFI.notnull GioIOModuleScopeRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val ioSchedulerCancelAllJobs_ = _import "g_io_scheduler_cancel_all_jobs" : unit -> unit;
    val networkMonitorGetDefault_ = _import "g_network_monitor_get_default" : unit -> GioNetworkMonitorClass.FFI.notnull GioNetworkMonitorClass.FFI.p;
    val networkingInit_ = _import "g_networking_init" : unit -> unit;
    val pollableSourceNew_ = _import "g_pollable_source_new" : GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p -> GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p;
    val pollableSourceNewFull_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_pollable_source_new_full" :
              GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
               * unit GLibSourceRecord.FFI.p
               * unit GioCancellableClass.FFI.p
               -> GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val pollableStreamRead_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_pollable_stream_read" :
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * GUInt8CVectorN.MLton.p1
               * GUInt8CVectorN.FFI.notnull GUInt8CVectorN.MLton.p2
               * GUInt64.FFI.val_
               * GBool.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val pollableStreamWrite_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_pollable_stream_write" :
              GioOutputStreamClass.FFI.notnull GioOutputStreamClass.FFI.p
               * GUInt8CVectorN.MLton.p1
               * GUInt8CVectorN.FFI.notnull GUInt8CVectorN.MLton.p2
               * GUInt64.FFI.val_
               * GBool.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val pollableStreamWriteAll_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "mlton_g_pollable_stream_write_all" :
              GioOutputStreamClass.FFI.notnull GioOutputStreamClass.FFI.p
               * GUInt8CVectorN.MLton.p1
               * GUInt8CVectorN.FFI.notnull GUInt8CVectorN.MLton.p2
               * GUInt64.FFI.val_
               * GBool.FFI.val_
               * GUInt64.FFI.ref_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val proxyGetDefaultForProtocol_ = _import "mlton_g_proxy_get_default_for_protocol" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioProxyClass.FFI.notnull GioProxyClass.FFI.p;
    val proxyResolverGetDefault_ = _import "g_proxy_resolver_get_default" : unit -> GioProxyResolverClass.FFI.notnull GioProxyResolverClass.FFI.p;
    val resolverErrorQuark_ = _import "g_resolver_error_quark" : unit -> GUInt32.FFI.val_;
    val resourceErrorQuark_ = _import "g_resource_error_quark" : unit -> GUInt32.FFI.val_;
    val resourceLoad_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_resource_load" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioResourceRecord.FFI.notnull GioResourceRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val resourcesEnumerateChildren_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_resources_enumerate_children" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioResourceLookupFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val resourcesGetInfo_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_resources_get_info" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioResourceLookupFlags.FFI.val_
               * GUInt64.FFI.ref_
               * GUInt32.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
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
    val resourcesLookupData_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_resources_lookup_data" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioResourceLookupFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GLibBytesRecord.FFI.notnull GLibBytesRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val resourcesOpenStream_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_resources_open_stream" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioResourceLookupFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val resourcesRegister_ = _import "g_resources_register" : GioResourceRecord.FFI.notnull GioResourceRecord.FFI.p -> unit;
    val resourcesUnregister_ = _import "g_resources_unregister" : GioResourceRecord.FFI.notnull GioResourceRecord.FFI.p -> unit;
    val settingsSchemaSourceGetDefault_ = _import "g_settings_schema_source_get_default" : unit -> GioSettingsSchemaSourceRecord.FFI.notnull GioSettingsSchemaSourceRecord.FFI.p;
    val tlsBackendGetDefault_ = _import "g_tls_backend_get_default" : unit -> GioTlsBackendClass.FFI.notnull GioTlsBackendClass.FFI.p;
    val tlsClientConnectionNew_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_client_connection_new" :
              GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p
               * unit GioSocketConnectableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioTlsClientConnectionClass.FFI.notnull GioTlsClientConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val tlsErrorQuark_ = _import "g_tls_error_quark" : unit -> GUInt32.FFI.val_;
    val tlsFileDatabaseNew_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_tls_file_database_new" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioTlsFileDatabaseClass.FFI.notnull GioTlsFileDatabaseClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val tlsServerConnectionNew_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_tls_server_connection_new" :
              GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p
               * unit GioTlsCertificateClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioTlsServerConnectionClass.FFI.notnull GioTlsServerConnectionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val unixIsMountPathSystemInternal_ = _import "mlton_g_unix_is_mount_path_system_internal" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val unixMountCompare_ = fn x1 & x2 => (_import "g_unix_mount_compare" : GioUnixMountEntryRecord.FFI.notnull GioUnixMountEntryRecord.FFI.p * GioUnixMountEntryRecord.FFI.notnull GioUnixMountEntryRecord.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val unixMountFree_ = _import "g_unix_mount_free" : GioUnixMountEntryRecord.FFI.notnull GioUnixMountEntryRecord.FFI.p -> unit;
    val unixMountGetDevicePath_ = _import "g_unix_mount_get_device_path" : GioUnixMountEntryRecord.FFI.notnull GioUnixMountEntryRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val unixMountGetFsType_ = _import "g_unix_mount_get_fs_type" : GioUnixMountEntryRecord.FFI.notnull GioUnixMountEntryRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val unixMountGetMountPath_ = _import "g_unix_mount_get_mount_path" : GioUnixMountEntryRecord.FFI.notnull GioUnixMountEntryRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val unixMountGuessCanEject_ = _import "g_unix_mount_guess_can_eject" : GioUnixMountEntryRecord.FFI.notnull GioUnixMountEntryRecord.FFI.p -> GBool.FFI.val_;
    val unixMountGuessIcon_ = _import "g_unix_mount_guess_icon" : GioUnixMountEntryRecord.FFI.notnull GioUnixMountEntryRecord.FFI.p -> GioIconClass.FFI.notnull GioIconClass.FFI.p;
    val unixMountGuessName_ = _import "g_unix_mount_guess_name" : GioUnixMountEntryRecord.FFI.notnull GioUnixMountEntryRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val unixMountGuessShouldDisplay_ = _import "g_unix_mount_guess_should_display" : GioUnixMountEntryRecord.FFI.notnull GioUnixMountEntryRecord.FFI.p -> GBool.FFI.val_;
    val unixMountGuessSymbolicIcon_ = _import "g_unix_mount_guess_symbolic_icon" : GioUnixMountEntryRecord.FFI.notnull GioUnixMountEntryRecord.FFI.p -> GioIconClass.FFI.notnull GioIconClass.FFI.p;
    val unixMountIsReadonly_ = _import "g_unix_mount_is_readonly" : GioUnixMountEntryRecord.FFI.notnull GioUnixMountEntryRecord.FFI.p -> GBool.FFI.val_;
    val unixMountIsSystemInternal_ = _import "g_unix_mount_is_system_internal" : GioUnixMountEntryRecord.FFI.notnull GioUnixMountEntryRecord.FFI.p -> GBool.FFI.val_;
    val unixMountPointsChangedSince_ = _import "g_unix_mount_points_changed_since" : GUInt64.FFI.val_ -> GBool.FFI.val_;
    val unixMountsChangedSince_ = _import "g_unix_mounts_changed_since" : GUInt64.FFI.val_ -> GBool.FFI.val_;
    structure ActionClass = GioActionClass
    structure ActionGroupClass = GioActionGroupClass
    structure ActionMapClass = GioActionMapClass
    structure AppInfoClass = GioAppInfoClass
    structure AppInfoCreateFlags = GioAppInfoCreateFlags
    structure AppInfoMonitorClass = GioAppInfoMonitorClass
    structure AppLaunchContextClass = GioAppLaunchContextClass
    structure ApplicationClass = GioApplicationClass
    structure ApplicationCommandLineClass = GioApplicationCommandLineClass
    structure ApplicationFlags = GioApplicationFlags
    structure AskPasswordFlags = GioAskPasswordFlags
    structure AsyncInitableClass = GioAsyncInitableClass
    structure AsyncResultClass = GioAsyncResultClass
    structure BusNameOwnerFlags = GioBusNameOwnerFlags
    structure BusNameWatcherFlags = GioBusNameWatcherFlags
    structure BusType = GioBusType
    structure BytesIconClass = GioBytesIconClass
    structure CancellableClass = GioCancellableClass
    structure CharsetConverterClass = GioCharsetConverterClass
    structure ConverterClass = GioConverterClass
    structure ConverterFlags = GioConverterFlags
    structure ConverterResult = GioConverterResult
    structure CredentialsClass = GioCredentialsClass
    structure CredentialsType = GioCredentialsType
    structure DBusActionGroupClass = GioDBusActionGroupClass
    structure DBusAnnotationInfoRecord = GioDBusAnnotationInfoRecord
    structure DBusArgInfoRecord = GioDBusArgInfoRecord
    structure DBusAuthObserverClass = GioDBusAuthObserverClass
    structure DBusCallFlags = GioDBusCallFlags
    structure DBusCapabilityFlags = GioDBusCapabilityFlags
    structure DBusConnectionClass = GioDBusConnectionClass
    structure DBusConnectionFlags = GioDBusConnectionFlags
    structure DBusError = GioDBusError
    exception DBusError = GioDBusError
    structure DBusInterfaceClass = GioDBusInterfaceClass
    structure DBusInterfaceInfoRecord = GioDBusInterfaceInfoRecord
    structure DBusInterfaceSkeletonClass = GioDBusInterfaceSkeletonClass
    structure DBusInterfaceSkeletonFlags = GioDBusInterfaceSkeletonFlags
    structure DBusMessageClass = GioDBusMessageClass
    structure DBusMessageByteOrder = GioDBusMessageByteOrder
    structure DBusMessageFlags = GioDBusMessageFlags
    structure DBusMessageHeaderField = GioDBusMessageHeaderField
    structure DBusMessageType = GioDBusMessageType
    structure DBusMethodInfoRecord = GioDBusMethodInfoRecord
    structure DBusMethodInvocationClass = GioDBusMethodInvocationClass
    structure DBusNodeInfoRecord = GioDBusNodeInfoRecord
    structure DBusObjectClass = GioDBusObjectClass
    structure DBusObjectManagerClass = GioDBusObjectManagerClass
    structure DBusObjectManagerClientClass = GioDBusObjectManagerClientClass
    structure DBusObjectManagerClientFlags = GioDBusObjectManagerClientFlags
    structure DBusObjectManagerServerClass = GioDBusObjectManagerServerClass
    structure DBusObjectProxyClass = GioDBusObjectProxyClass
    structure DBusObjectSkeletonClass = GioDBusObjectSkeletonClass
    structure DBusPropertyInfoRecord = GioDBusPropertyInfoRecord
    structure DBusPropertyInfoFlags = GioDBusPropertyInfoFlags
    structure DBusProxyClass = GioDBusProxyClass
    structure DBusProxyFlags = GioDBusProxyFlags
    structure DBusSendMessageFlags = GioDBusSendMessageFlags
    structure DBusServerClass = GioDBusServerClass
    structure DBusServerFlags = GioDBusServerFlags
    structure DBusSignalFlags = GioDBusSignalFlags
    structure DBusSignalInfoRecord = GioDBusSignalInfoRecord
    structure DBusSubtreeFlags = GioDBusSubtreeFlags
    structure DataStreamByteOrder = GioDataStreamByteOrder
    structure DataStreamNewlineType = GioDataStreamNewlineType
    structure DatagramBasedClass = GioDatagramBasedClass
    structure DesktopAppInfoClass = GioDesktopAppInfoClass
    structure DesktopAppInfoLookupClass = GioDesktopAppInfoLookupClass
    structure DriveClass = GioDriveClass
    structure DriveStartFlags = GioDriveStartFlags
    structure DriveStartStopType = GioDriveStartStopType
    structure DtlsClientConnectionClass = GioDtlsClientConnectionClass
    structure DtlsConnectionClass = GioDtlsConnectionClass
    structure DtlsServerConnectionClass = GioDtlsServerConnectionClass
    structure EmblemClass = GioEmblemClass
    structure EmblemOrigin = GioEmblemOrigin
    structure EmblemedIconClass = GioEmblemedIconClass
    structure FileClass = GioFileClass
    structure FileAttributeInfoRecord = GioFileAttributeInfoRecord
    structure FileAttributeInfoFlags = GioFileAttributeInfoFlags
    structure FileAttributeInfoListRecord = GioFileAttributeInfoListRecord
    structure FileAttributeMatcherRecord = GioFileAttributeMatcherRecord
    structure FileAttributeStatus = GioFileAttributeStatus
    structure FileAttributeType = GioFileAttributeType
    structure FileCopyFlags = GioFileCopyFlags
    structure FileCreateFlags = GioFileCreateFlags
    structure FileDescriptorBasedClass = GioFileDescriptorBasedClass
    structure FileEnumeratorClass = GioFileEnumeratorClass
    structure FileIconClass = GioFileIconClass
    structure FileInfoClass = GioFileInfoClass
    structure FileMeasureFlags = GioFileMeasureFlags
    structure FileMonitorClass = GioFileMonitorClass
    structure FileMonitorEvent = GioFileMonitorEvent
    structure FileMonitorFlags = GioFileMonitorFlags
    structure FileQueryInfoFlags = GioFileQueryInfoFlags
    structure FileType = GioFileType
    structure FilenameCompleterClass = GioFilenameCompleterClass
    structure FilesystemPreviewType = GioFilesystemPreviewType
    structure IOErrorEnum = GioIOErrorEnum
    exception IOErrorEnum = GioIOErrorEnum
    structure IOExtensionRecord = GioIOExtensionRecord
    structure IOExtensionPointRecord = GioIOExtensionPointRecord
    structure IOModuleClass = GioIOModuleClass
    structure IOModuleScopeRecord = GioIOModuleScopeRecord
    structure IOModuleScopeFlags = GioIOModuleScopeFlags
    structure IOStreamClass = GioIOStreamClass
    structure IOStreamSpliceFlags = GioIOStreamSpliceFlags
    structure IconClass = GioIconClass
    structure InetAddressClass = GioInetAddressClass
    structure InetAddressMaskClass = GioInetAddressMaskClass
    structure InitableClass = GioInitableClass
    structure InputStreamClass = GioInputStreamClass
    structure ListModelClass = GioListModelClass
    structure ListStoreClass = GioListStoreClass
    structure LoadableIconClass = GioLoadableIconClass
    structure MenuAttributeIterClass = GioMenuAttributeIterClass
    structure MenuItemClass = GioMenuItemClass
    structure MenuLinkIterClass = GioMenuLinkIterClass
    structure MenuModelClass = GioMenuModelClass
    structure MountClass = GioMountClass
    structure MountMountFlags = GioMountMountFlags
    structure MountOperationClass = GioMountOperationClass
    structure MountOperationResult = GioMountOperationResult
    structure MountUnmountFlags = GioMountUnmountFlags
    structure NetworkAddressClass = GioNetworkAddressClass
    structure NetworkConnectivity = GioNetworkConnectivity
    structure NetworkMonitorClass = GioNetworkMonitorClass
    structure NetworkServiceClass = GioNetworkServiceClass
    structure NotificationClass = GioNotificationClass
    structure NotificationPriority = GioNotificationPriority
    structure OutputStreamClass = GioOutputStreamClass
    structure OutputStreamSpliceFlags = GioOutputStreamSpliceFlags
    structure PasswordSave = GioPasswordSave
    structure PermissionClass = GioPermissionClass
    structure PollableInputStreamClass = GioPollableInputStreamClass
    structure PollableOutputStreamClass = GioPollableOutputStreamClass
    structure PropertyActionClass = GioPropertyActionClass
    structure ProxyClass = GioProxyClass
    structure ProxyResolverClass = GioProxyResolverClass
    structure RemoteActionGroupClass = GioRemoteActionGroupClass
    structure ResolverClass = GioResolverClass
    structure ResolverError = GioResolverError
    exception ResolverError = GioResolverError
    structure ResolverRecordType = GioResolverRecordType
    structure ResourceRecord = GioResourceRecord
    structure ResourceError = GioResourceError
    exception ResourceError = GioResourceError
    structure ResourceFlags = GioResourceFlags
    structure ResourceLookupFlags = GioResourceLookupFlags
    structure SeekableClass = GioSeekableClass
    structure SettingsClass = GioSettingsClass
    structure SettingsBackendRecord = GioSettingsBackendRecord
    structure SettingsBindFlags = GioSettingsBindFlags
    structure SettingsSchemaRecord = GioSettingsSchemaRecord
    structure SettingsSchemaKeyRecord = GioSettingsSchemaKeyRecord
    structure SettingsSchemaSourceRecord = GioSettingsSchemaSourceRecord
    structure SimpleActionClass = GioSimpleActionClass
    structure SimpleActionGroupClass = GioSimpleActionGroupClass
    structure SimpleAsyncResultClass = GioSimpleAsyncResultClass
    structure SimpleProxyResolverClass = GioSimpleProxyResolverClass
    structure SocketClass = GioSocketClass
    structure SocketAddressClass = GioSocketAddressClass
    structure SocketAddressEnumeratorClass = GioSocketAddressEnumeratorClass
    structure SocketClientClass = GioSocketClientClass
    structure SocketClientEvent = GioSocketClientEvent
    structure SocketConnectableClass = GioSocketConnectableClass
    structure SocketControlMessageClass = GioSocketControlMessageClass
    structure SocketFamily = GioSocketFamily
    structure SocketListenerClass = GioSocketListenerClass
    structure SocketListenerEvent = GioSocketListenerEvent
    structure SocketMsgFlags = GioSocketMsgFlags
    structure SocketProtocol = GioSocketProtocol
    structure SocketType = GioSocketType
    structure SrvTargetRecord = GioSrvTargetRecord
    structure SubprocessClass = GioSubprocessClass
    structure SubprocessFlags = GioSubprocessFlags
    structure SubprocessLauncherClass = GioSubprocessLauncherClass
    structure TaskClass = GioTaskClass
    structure TestDBusClass = GioTestDBusClass
    structure TestDBusFlags = GioTestDBusFlags
    structure ThemedIconClass = GioThemedIconClass
    structure TlsAuthenticationMode = GioTlsAuthenticationMode
    structure TlsBackendClass = GioTlsBackendClass
    structure TlsCertificateClass = GioTlsCertificateClass
    structure TlsCertificateFlags = GioTlsCertificateFlags
    structure TlsCertificateRequestFlags = GioTlsCertificateRequestFlags
    structure TlsClientConnectionClass = GioTlsClientConnectionClass
    structure TlsDatabaseClass = GioTlsDatabaseClass
    structure TlsDatabaseLookupFlags = GioTlsDatabaseLookupFlags
    structure TlsDatabaseVerifyFlags = GioTlsDatabaseVerifyFlags
    structure TlsError = GioTlsError
    exception TlsError = GioTlsError
    structure TlsFileDatabaseClass = GioTlsFileDatabaseClass
    structure TlsInteractionClass = GioTlsInteractionClass
    structure TlsInteractionResult = GioTlsInteractionResult
    structure TlsPasswordClass = GioTlsPasswordClass
    structure TlsPasswordFlags = GioTlsPasswordFlags
    structure TlsRehandshakeMode = GioTlsRehandshakeMode
    structure TlsServerConnectionClass = GioTlsServerConnectionClass
    structure UnixFDListClass = GioUnixFDListClass
    structure UnixMountEntryRecord = GioUnixMountEntryRecord
    structure UnixMountMonitorClass = GioUnixMountMonitorClass
    structure UnixMountPointRecord = GioUnixMountPointRecord
    structure UnixSocketAddressType = GioUnixSocketAddressType
    structure VfsClass = GioVfsClass
    structure VolumeClass = GioVolumeClass
    structure VolumeMonitorClass = GioVolumeMonitorClass
    structure ZlibCompressorClass = GioZlibCompressorClass
    structure ZlibCompressorFormat = GioZlibCompressorFormat
    structure ZlibDecompressorClass = GioZlibDecompressorClass
    structure Action = GioAction
    structure ActionGroup = GioActionGroup
    structure ActionMap = GioActionMap
    structure AppInfo = GioAppInfo
    structure AppInfoMonitor = GioAppInfoMonitor
    structure AppLaunchContext = GioAppLaunchContext
    structure Application = GioApplication
    structure ApplicationCommandLine = GioApplicationCommandLine
    structure AsyncInitable = GioAsyncInitable
    structure AsyncResult = GioAsyncResult
    structure BytesIcon = GioBytesIcon
    structure Cancellable = GioCancellable
    structure CharsetConverter = GioCharsetConverter
    structure Converter = GioConverter
    structure Credentials = GioCredentials
    structure DBusActionGroup = GioDBusActionGroup
    structure DBusAnnotationInfo = GioDBusAnnotationInfo
    structure DBusArgInfo = GioDBusArgInfo
    structure DBusAuthObserver = GioDBusAuthObserver
    structure DBusConnection = GioDBusConnection
    structure DBusInterface = GioDBusInterface
    structure DBusInterfaceInfo = GioDBusInterfaceInfo
    structure DBusInterfaceSkeleton = GioDBusInterfaceSkeleton
    structure DBusMenuModelClass = GioDBusMenuModelClass
    structure DBusMessage = GioDBusMessage
    structure DBusMethodInfo = GioDBusMethodInfo
    structure DBusMethodInvocation = GioDBusMethodInvocation
    structure DBusNodeInfo = GioDBusNodeInfo
    structure DBusObject = GioDBusObject
    structure DBusObjectManager = GioDBusObjectManager
    structure DBusObjectManagerClient = GioDBusObjectManagerClient
    structure DBusObjectManagerServer = GioDBusObjectManagerServer
    structure DBusObjectProxy = GioDBusObjectProxy
    structure DBusObjectSkeleton = GioDBusObjectSkeleton
    structure DBusPropertyInfo = GioDBusPropertyInfo
    structure DBusProxy = GioDBusProxy
    structure DBusServer = GioDBusServer
    structure DBusSignalInfo = GioDBusSignalInfo
    structure DatagramBased = GioDatagramBased
    structure DesktopAppInfo = GioDesktopAppInfo
    structure DesktopAppInfoLookup = GioDesktopAppInfoLookup
    structure Drive = GioDrive
    structure DtlsClientConnection = GioDtlsClientConnection
    structure DtlsConnection = GioDtlsConnection
    structure DtlsServerConnection = GioDtlsServerConnection
    structure Emblem = GioEmblem
    structure EmblemedIcon = GioEmblemedIcon
    structure FileAttributeInfo = GioFileAttributeInfo
    structure FileAttributeInfoList = GioFileAttributeInfoList
    structure FileAttributeMatcher = GioFileAttributeMatcher
    structure FileDescriptorBased = GioFileDescriptorBased
    structure FileEnumerator = GioFileEnumerator
    structure FileIOStreamClass = GioFileIOStreamClass
    structure FileIcon = GioFileIcon
    structure FileInfo = GioFileInfo
    structure FileInputStreamClass = GioFileInputStreamClass
    structure FileMonitor = GioFileMonitor
    structure FileOutputStreamClass = GioFileOutputStreamClass
    structure FilenameCompleter = GioFilenameCompleter
    structure FilterInputStreamClass = GioFilterInputStreamClass
    structure FilterOutputStreamClass = GioFilterOutputStreamClass
    structure IOExtension = GioIOExtension
    structure IOExtensionPoint = GioIOExtensionPoint
    structure IOModule = GioIOModule
    structure IOModuleScope = GioIOModuleScope
    structure IOStream = GioIOStream
    structure Icon = GioIcon
    structure InetAddress = GioInetAddress
    structure InetAddressMask = GioInetAddressMask
    structure InetSocketAddressClass = GioInetSocketAddressClass
    structure Initable = GioInitable
    structure InputStream = GioInputStream
    structure ListModel = GioListModel
    structure ListStore = GioListStore
    structure LoadableIcon = GioLoadableIcon
    structure MemoryInputStreamClass = GioMemoryInputStreamClass
    structure MemoryOutputStreamClass = GioMemoryOutputStreamClass
    structure MenuClass = GioMenuClass
    structure MenuAttributeIter = GioMenuAttributeIter
    structure MenuItem = GioMenuItem
    structure MenuLinkIter = GioMenuLinkIter
    structure MenuModel = GioMenuModel
    structure Mount = GioMount
    structure MountOperation = GioMountOperation
    structure NativeVolumeMonitorClass = GioNativeVolumeMonitorClass
    structure NetworkAddress = GioNetworkAddress
    structure NetworkMonitor = GioNetworkMonitor
    structure NetworkService = GioNetworkService
    structure Notification = GioNotification
    structure OutputStream = GioOutputStream
    structure Permission = GioPermission
    structure PollableInputStream = GioPollableInputStream
    structure PollableOutputStream = GioPollableOutputStream
    structure PropertyAction = GioPropertyAction
    structure ProxyAddressEnumeratorClass = GioProxyAddressEnumeratorClass
    structure ProxyResolver = GioProxyResolver
    structure RemoteActionGroup = GioRemoteActionGroup
    structure Resolver = GioResolver
    structure Resource = GioResource
    structure Seekable = GioSeekable
    structure Settings = GioSettings
    structure SettingsBackend = GioSettingsBackend
    structure SettingsSchema = GioSettingsSchema
    structure SettingsSchemaKey = GioSettingsSchemaKey
    structure SettingsSchemaSource = GioSettingsSchemaSource
    structure SimpleAction = GioSimpleAction
    structure SimpleActionGroup = GioSimpleActionGroup
    structure SimpleAsyncResult = GioSimpleAsyncResult
    structure SimpleIOStreamClass = GioSimpleIOStreamClass
    structure SimplePermissionClass = GioSimplePermissionClass
    structure SimpleProxyResolver = GioSimpleProxyResolver
    structure SocketAddress = GioSocketAddress
    structure SocketAddressEnumerator = GioSocketAddressEnumerator
    structure SocketConnectable = GioSocketConnectable
    structure SocketConnectionClass = GioSocketConnectionClass
    structure SocketControlMessage = GioSocketControlMessage
    structure SocketServiceClass = GioSocketServiceClass
    structure SrvTarget = GioSrvTarget
    structure Subprocess = GioSubprocess
    structure SubprocessLauncher = GioSubprocessLauncher
    structure Task = GioTask
    structure TestDBus = GioTestDBus
    structure ThemedIcon = GioThemedIcon
    structure TlsBackend = GioTlsBackend
    structure TlsCertificate = GioTlsCertificate
    structure TlsClientConnection = GioTlsClientConnection
    structure TlsConnectionClass = GioTlsConnectionClass
    structure TlsDatabase = GioTlsDatabase
    structure TlsFileDatabase = GioTlsFileDatabase
    structure TlsPassword = GioTlsPassword
    structure TlsServerConnection = GioTlsServerConnection
    structure UnixCredentialsMessageClass = GioUnixCredentialsMessageClass
    structure UnixFDList = GioUnixFDList
    structure UnixFDMessageClass = GioUnixFDMessageClass
    structure UnixInputStreamClass = GioUnixInputStreamClass
    structure UnixMountEntry = GioUnixMountEntry
    structure UnixMountMonitor = GioUnixMountMonitor
    structure UnixMountPoint = GioUnixMountPoint
    structure UnixOutputStreamClass = GioUnixOutputStreamClass
    structure UnixSocketAddressClass = GioUnixSocketAddressClass
    structure Vfs = GioVfs
    structure Volume = GioVolume
    structure VolumeMonitor = GioVolumeMonitor
    structure ZlibCompressor = GioZlibCompressor
    structure ZlibDecompressor = GioZlibDecompressor
    structure BufferedInputStreamClass = GioBufferedInputStreamClass
    structure BufferedOutputStreamClass = GioBufferedOutputStreamClass
    structure ConverterInputStreamClass = GioConverterInputStreamClass
    structure ConverterOutputStreamClass = GioConverterOutputStreamClass
    structure DBusMenuModel = GioDBusMenuModel
    structure DataOutputStreamClass = GioDataOutputStreamClass
    structure File = GioFile
    structure FileIOStream = GioFileIOStream
    structure FileInputStream = GioFileInputStream
    structure FileOutputStream = GioFileOutputStream
    structure FilterInputStream = GioFilterInputStream
    structure FilterOutputStream = GioFilterOutputStream
    structure InetSocketAddress = GioInetSocketAddress
    structure MemoryInputStream = GioMemoryInputStream
    structure MemoryOutputStream = GioMemoryOutputStream
    structure Menu = GioMenu
    structure NativeVolumeMonitor = GioNativeVolumeMonitor
    structure ProxyAddressClass = GioProxyAddressClass
    structure ProxyAddressEnumerator = GioProxyAddressEnumerator
    structure SimpleIOStream = GioSimpleIOStream
    structure SimplePermission = GioSimplePermission
    structure Socket = GioSocket
    structure SocketClient = GioSocketClient
    structure SocketConnection = GioSocketConnection
    structure SocketListener = GioSocketListener
    structure SocketService = GioSocketService
    structure TcpConnectionClass = GioTcpConnectionClass
    structure ThreadedSocketServiceClass = GioThreadedSocketServiceClass
    structure TlsConnection = GioTlsConnection
    structure TlsInteraction = GioTlsInteraction
    structure UnixConnectionClass = GioUnixConnectionClass
    structure UnixCredentialsMessage = GioUnixCredentialsMessage
    structure UnixFDMessage = GioUnixFDMessage
    structure UnixInputStream = GioUnixInputStream
    structure UnixOutputStream = GioUnixOutputStream
    structure UnixSocketAddress = GioUnixSocketAddress
    structure BufferedInputStream = GioBufferedInputStream
    structure BufferedOutputStream = GioBufferedOutputStream
    structure ConverterInputStream = GioConverterInputStream
    structure ConverterOutputStream = GioConverterOutputStream
    structure DataInputStreamClass = GioDataInputStreamClass
    structure DataOutputStream = GioDataOutputStream
    structure Proxy = GioProxy
    structure ProxyAddress = GioProxyAddress
    structure TcpConnection = GioTcpConnection
    structure TcpWrapperConnectionClass = GioTcpWrapperConnectionClass
    structure ThreadedSocketService = GioThreadedSocketService
    structure UnixConnection = GioUnixConnection
    structure DataInputStream = GioDataInputStream
    structure TcpWrapperConnection = GioTcpWrapperConnection
    val DESKTOP_APP_INFO_LOOKUP_EXTENSION_POINT_NAME = "gio-desktop-app-info-lookup"
    val FILE_ATTRIBUTE_ACCESS_CAN_DELETE = "access::can-delete"
    val FILE_ATTRIBUTE_ACCESS_CAN_EXECUTE = "access::can-execute"
    val FILE_ATTRIBUTE_ACCESS_CAN_READ = "access::can-read"
    val FILE_ATTRIBUTE_ACCESS_CAN_RENAME = "access::can-rename"
    val FILE_ATTRIBUTE_ACCESS_CAN_TRASH = "access::can-trash"
    val FILE_ATTRIBUTE_ACCESS_CAN_WRITE = "access::can-write"
    val FILE_ATTRIBUTE_DOS_IS_ARCHIVE = "dos::is-archive"
    val FILE_ATTRIBUTE_DOS_IS_SYSTEM = "dos::is-system"
    val FILE_ATTRIBUTE_ETAG_VALUE = "etag::value"
    val FILE_ATTRIBUTE_FILESYSTEM_FREE = "filesystem::free"
    val FILE_ATTRIBUTE_FILESYSTEM_READONLY = "filesystem::readonly"
    val FILE_ATTRIBUTE_FILESYSTEM_REMOTE = "filesystem::remote"
    val FILE_ATTRIBUTE_FILESYSTEM_SIZE = "filesystem::size"
    val FILE_ATTRIBUTE_FILESYSTEM_TYPE = "filesystem::type"
    val FILE_ATTRIBUTE_FILESYSTEM_USED = "filesystem::used"
    val FILE_ATTRIBUTE_FILESYSTEM_USE_PREVIEW = "filesystem::use-preview"
    val FILE_ATTRIBUTE_GVFS_BACKEND = "gvfs::backend"
    val FILE_ATTRIBUTE_ID_FILE = "id::file"
    val FILE_ATTRIBUTE_ID_FILESYSTEM = "id::filesystem"
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_EJECT = "mountable::can-eject"
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_MOUNT = "mountable::can-mount"
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_POLL = "mountable::can-poll"
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_START = "mountable::can-start"
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_START_DEGRADED = "mountable::can-start-degraded"
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_STOP = "mountable::can-stop"
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_UNMOUNT = "mountable::can-unmount"
    val FILE_ATTRIBUTE_MOUNTABLE_HAL_UDI = "mountable::hal-udi"
    val FILE_ATTRIBUTE_MOUNTABLE_IS_MEDIA_CHECK_AUTOMATIC = "mountable::is-media-check-automatic"
    val FILE_ATTRIBUTE_MOUNTABLE_START_STOP_TYPE = "mountable::start-stop-type"
    val FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE = "mountable::unix-device"
    val FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE_FILE = "mountable::unix-device-file"
    val FILE_ATTRIBUTE_OWNER_GROUP = "owner::group"
    val FILE_ATTRIBUTE_OWNER_USER = "owner::user"
    val FILE_ATTRIBUTE_OWNER_USER_REAL = "owner::user-real"
    val FILE_ATTRIBUTE_PREVIEW_ICON = "preview::icon"
    val FILE_ATTRIBUTE_SELINUX_CONTEXT = "selinux::context"
    val FILE_ATTRIBUTE_STANDARD_ALLOCATED_SIZE = "standard::allocated-size"
    val FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE = "standard::content-type"
    val FILE_ATTRIBUTE_STANDARD_COPY_NAME = "standard::copy-name"
    val FILE_ATTRIBUTE_STANDARD_DESCRIPTION = "standard::description"
    val FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME = "standard::display-name"
    val FILE_ATTRIBUTE_STANDARD_EDIT_NAME = "standard::edit-name"
    val FILE_ATTRIBUTE_STANDARD_FAST_CONTENT_TYPE = "standard::fast-content-type"
    val FILE_ATTRIBUTE_STANDARD_ICON = "standard::icon"
    val FILE_ATTRIBUTE_STANDARD_IS_BACKUP = "standard::is-backup"
    val FILE_ATTRIBUTE_STANDARD_IS_HIDDEN = "standard::is-hidden"
    val FILE_ATTRIBUTE_STANDARD_IS_SYMLINK = "standard::is-symlink"
    val FILE_ATTRIBUTE_STANDARD_IS_VIRTUAL = "standard::is-virtual"
    val FILE_ATTRIBUTE_STANDARD_IS_VOLATILE = "standard::is-volatile"
    val FILE_ATTRIBUTE_STANDARD_NAME = "standard::name"
    val FILE_ATTRIBUTE_STANDARD_SIZE = "standard::size"
    val FILE_ATTRIBUTE_STANDARD_SORT_ORDER = "standard::sort-order"
    val FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON = "standard::symbolic-icon"
    val FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET = "standard::symlink-target"
    val FILE_ATTRIBUTE_STANDARD_TARGET_URI = "standard::target-uri"
    val FILE_ATTRIBUTE_STANDARD_TYPE = "standard::type"
    val FILE_ATTRIBUTE_THUMBNAILING_FAILED = "thumbnail::failed"
    val FILE_ATTRIBUTE_THUMBNAIL_IS_VALID = "thumbnail::is-valid"
    val FILE_ATTRIBUTE_THUMBNAIL_PATH = "thumbnail::path"
    val FILE_ATTRIBUTE_TIME_ACCESS = "time::access"
    val FILE_ATTRIBUTE_TIME_ACCESS_USEC = "time::access-usec"
    val FILE_ATTRIBUTE_TIME_CHANGED = "time::changed"
    val FILE_ATTRIBUTE_TIME_CHANGED_USEC = "time::changed-usec"
    val FILE_ATTRIBUTE_TIME_CREATED = "time::created"
    val FILE_ATTRIBUTE_TIME_CREATED_USEC = "time::created-usec"
    val FILE_ATTRIBUTE_TIME_MODIFIED = "time::modified"
    val FILE_ATTRIBUTE_TIME_MODIFIED_USEC = "time::modified-usec"
    val FILE_ATTRIBUTE_TRASH_DELETION_DATE = "trash::deletion-date"
    val FILE_ATTRIBUTE_TRASH_ITEM_COUNT = "trash::item-count"
    val FILE_ATTRIBUTE_TRASH_ORIG_PATH = "trash::orig-path"
    val FILE_ATTRIBUTE_UNIX_BLOCKS = "unix::blocks"
    val FILE_ATTRIBUTE_UNIX_BLOCK_SIZE = "unix::block-size"
    val FILE_ATTRIBUTE_UNIX_DEVICE = "unix::device"
    val FILE_ATTRIBUTE_UNIX_GID = "unix::gid"
    val FILE_ATTRIBUTE_UNIX_INODE = "unix::inode"
    val FILE_ATTRIBUTE_UNIX_IS_MOUNTPOINT = "unix::is-mountpoint"
    val FILE_ATTRIBUTE_UNIX_MODE = "unix::mode"
    val FILE_ATTRIBUTE_UNIX_NLINK = "unix::nlink"
    val FILE_ATTRIBUTE_UNIX_RDEV = "unix::rdev"
    val FILE_ATTRIBUTE_UNIX_UID = "unix::uid"
    val MENU_ATTRIBUTE_ACTION = "action"
    val MENU_ATTRIBUTE_ACTION_NAMESPACE = "action-namespace"
    val MENU_ATTRIBUTE_ICON = "icon"
    val MENU_ATTRIBUTE_LABEL = "label"
    val MENU_ATTRIBUTE_TARGET = "target"
    val MENU_LINK_SECTION = "section"
    val MENU_LINK_SUBMENU = "submenu"
    val NATIVE_VOLUME_MONITOR_EXTENSION_POINT_NAME = "gio-native-volume-monitor"
    val NETWORK_MONITOR_EXTENSION_POINT_NAME = "gio-network-monitor"
    val PROXY_EXTENSION_POINT_NAME = "gio-proxy"
    val PROXY_RESOLVER_EXTENSION_POINT_NAME = "gio-proxy-resolver"
    val TLS_BACKEND_EXTENSION_POINT_NAME = "gio-tls-backend"
    val TLS_DATABASE_PURPOSE_AUTHENTICATE_CLIENT = "1.3.6.1.5.5.7.3.2"
    val TLS_DATABASE_PURPOSE_AUTHENTICATE_SERVER = "1.3.6.1.5.5.7.3.1"
    val VFS_EXTENSION_POINT_NAME = "gio-vfs"
    val VOLUME_IDENTIFIER_KIND_CLASS = "class"
    val VOLUME_IDENTIFIER_KIND_HAL_UDI = "hal-udi"
    val VOLUME_IDENTIFIER_KIND_LABEL = "label"
    val VOLUME_IDENTIFIER_KIND_NFS_MOUNT = "nfs-mount"
    val VOLUME_IDENTIFIER_KIND_UNIX_DEVICE = "unix-device"
    val VOLUME_IDENTIFIER_KIND_UUID = "uuid"
    val VOLUME_MONITOR_EXTENSION_POINT_NAME = "gio-volume-monitor"
    fun actionNameIsValid actionName = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) actionNameIsValid_ actionName
    fun actionParseDetailedName detailedName =
      let
        val actionName
         & targetValue
         & () =
          (
            Utf8.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibVariantRecord.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1
                   && GLibVariantRecord.FFI.fromPtr true
                   && ignore
          )
            actionParseDetailedName_
            (
              detailedName
               & NONE
               & NONE
               & []
            )
      in
        (actionName, targetValue)
      end
    fun actionPrintDetailedName (actionName, targetValue) = (Utf8.FFI.withPtr &&&> GLibVariantRecord.FFI.withOptPtr ---> Utf8.FFI.fromPtr 1) actionPrintDetailedName_ (actionName & targetValue)
    fun appInfoCreateFromCommandline
      (
        commandline,
        applicationName,
        flags
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GioAppInfoCreateFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioAppInfoClass.FFI.fromPtr true
      )
        appInfoCreateFromCommandline_
        (
          commandline
           & applicationName
           & flags
           & []
        )
    fun appInfoGetDefaultForType (contentType, mustSupportUris) = (Utf8.FFI.withPtr &&&> GBool.FFI.withVal ---> GioAppInfoClass.FFI.fromPtr true) appInfoGetDefaultForType_ (contentType & mustSupportUris)
    fun appInfoGetDefaultForUriScheme uriScheme = (Utf8.FFI.withPtr ---> GioAppInfoClass.FFI.fromPtr true) appInfoGetDefaultForUriScheme_ uriScheme
    fun appInfoLaunchDefaultForUri (uri, launchContext) =
      (
        Utf8.FFI.withPtr
         &&&> GioAppLaunchContextClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        appInfoLaunchDefaultForUri_
        (
          uri
           & launchContext
           & []
        )
    fun appInfoLaunchDefaultForUriFinish result = (GioAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) appInfoLaunchDefaultForUriFinish_ (result & [])
    fun appInfoResetTypeAssociations contentType = (Utf8.FFI.withPtr ---> I) appInfoResetTypeAssociations_ contentType
    fun busGetFinish res = (GioAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusConnectionClass.FFI.fromPtr true) busGetFinish_ (res & [])
    fun busGetSync (busType, cancellable) =
      (
        GioBusType.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioDBusConnectionClass.FFI.fromPtr true
      )
        busGetSync_
        (
          busType
           & cancellable
           & []
        )
    fun busOwnNameOnConnection
      (
        connection,
        name,
        flags,
        nameAcquiredClosure,
        nameLostClosure
      ) =
      (
        GioDBusConnectionClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioBusNameOwnerFlags.FFI.withVal
         &&&> GObjectClosureRecord.FFI.withOptPtr
         &&&> GObjectClosureRecord.FFI.withOptPtr
         ---> GUInt32.FFI.fromVal
      )
        busOwnNameOnConnection_
        (
          connection
           & name
           & flags
           & nameAcquiredClosure
           & nameLostClosure
        )
    fun busOwnName
      (
        busType,
        name,
        flags,
        busAcquiredClosure,
        nameAcquiredClosure,
        nameLostClosure
      ) =
      (
        GioBusType.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GioBusNameOwnerFlags.FFI.withVal
         &&&> GObjectClosureRecord.FFI.withOptPtr
         &&&> GObjectClosureRecord.FFI.withOptPtr
         &&&> GObjectClosureRecord.FFI.withOptPtr
         ---> GUInt32.FFI.fromVal
      )
        busOwnName_
        (
          busType
           & name
           & flags
           & busAcquiredClosure
           & nameAcquiredClosure
           & nameLostClosure
        )
    fun busUnownName ownerId = (GUInt32.FFI.withVal ---> I) busUnownName_ ownerId
    fun busUnwatchName watcherId = (GUInt32.FFI.withVal ---> I) busUnwatchName_ watcherId
    fun busWatchNameOnConnection
      (
        connection,
        name,
        flags,
        nameAppearedClosure,
        nameVanishedClosure
      ) =
      (
        GioDBusConnectionClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioBusNameWatcherFlags.FFI.withVal
         &&&> GObjectClosureRecord.FFI.withOptPtr
         &&&> GObjectClosureRecord.FFI.withOptPtr
         ---> GUInt32.FFI.fromVal
      )
        busWatchNameOnConnection_
        (
          connection
           & name
           & flags
           & nameAppearedClosure
           & nameVanishedClosure
        )
    fun busWatchName
      (
        busType,
        name,
        flags,
        nameAppearedClosure,
        nameVanishedClosure
      ) =
      (
        GioBusType.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GioBusNameWatcherFlags.FFI.withVal
         &&&> GObjectClosureRecord.FFI.withOptPtr
         &&&> GObjectClosureRecord.FFI.withOptPtr
         ---> GUInt32.FFI.fromVal
      )
        busWatchName_
        (
          busType
           & name
           & flags
           & nameAppearedClosure
           & nameVanishedClosure
        )
    fun contentTypeCanBeExecutable type' = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) contentTypeCanBeExecutable_ type'
    fun contentTypeEquals (type1, type2) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) contentTypeEquals_ (type1 & type2)
    fun contentTypeFromMimeType mimeType = (Utf8.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) contentTypeFromMimeType_ mimeType
    fun contentTypeGetDescription type' = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) contentTypeGetDescription_ type'
    fun contentTypeGetGenericIconName type' = (Utf8.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) contentTypeGetGenericIconName_ type'
    fun contentTypeGetIcon type' = (Utf8.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) contentTypeGetIcon_ type'
    fun contentTypeGetMimeType type' = (Utf8.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) contentTypeGetMimeType_ type'
    fun contentTypeGetSymbolicIcon type' = (Utf8.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) contentTypeGetSymbolicIcon_ type'
    fun contentTypeGuess (filename, data) =
      let
        val dataSize =
          case data of
            SOME data => LargeInt.fromInt (GUInt8CVectorN.length data)
          | NONE => GUInt64.null
        val resultUncertain & retVal =
          (
            Utf8.FFI.withOptPtr
             &&&> GUInt8CVectorN.FFI.withOptPtr
             &&&> GUInt64.FFI.withVal
             &&&> GBool.FFI.withRefVal
             ---> GBool.FFI.fromVal && Utf8.FFI.fromPtr 1
          )
            contentTypeGuess_
            (
              filename
               & data
               & dataSize
               & GBool.null
            )
      in
        (retVal, resultUncertain)
      end
    fun contentTypeGuessForTree root = (GioFileClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) contentTypeGuessForTree_ root
    fun contentTypeIsA (type', supertype) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) contentTypeIsA_ (type' & supertype)
    fun contentTypeIsUnknown type' = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) contentTypeIsUnknown_ type'
    fun dbusAddressEscapeValue string = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) dbusAddressEscapeValue_ string
    fun dbusAddressGetForBusSync (busType, cancellable) =
      (
        GioBusType.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 1
      )
        dbusAddressGetForBusSync_
        (
          busType
           & cancellable
           & []
        )
    fun dbusAddressGetStreamFinish res =
      let
        val outGuid & retVal =
          (
            GioAsyncResultClass.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1 && GioIOStreamClass.FFI.fromPtr true
          )
            dbusAddressGetStreamFinish_
            (
              res
               & NONE
               & []
            )
      in
        (retVal, outGuid)
      end
    fun dbusAddressGetStreamSync (address, cancellable) =
      let
        val outGuid & retVal =
          (
            Utf8.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1 && GioIOStreamClass.FFI.fromPtr true
          )
            dbusAddressGetStreamSync_
            (
              address
               & NONE
               & cancellable
               & []
            )
      in
        (retVal, outGuid)
      end
    fun dbusAnnotationInfoLookup (annotations, name) = (GioDBusAnnotationInfoRecordCVector.FFI.withOptPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) dbusAnnotationInfoLookup_ (annotations & name)
    fun dbusErrorQuark () = (I ---> GUInt32.FFI.fromVal) dbusErrorQuark_ ()
    fun dbusGenerateGuid () = (I ---> Utf8.FFI.fromPtr 1) dbusGenerateGuid_ ()
    fun dbusGvalueToGvariant (gvalue, type') = (GObjectValueRecord.FFI.withPtr &&&> GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) dbusGvalueToGvariant_ (gvalue & type')
    fun dbusGvariantToGvalue value =
      let
        val outGvalue & () = (GLibVariantRecord.FFI.withPtr &&&> GObjectValueRecord.FFI.withNewPtr ---> GObjectValueRecord.FFI.fromPtr true && I) dbusGvariantToGvalue_ (value & ())
      in
        outGvalue
      end
    fun dbusIsAddress string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) dbusIsAddress_ string
    fun dbusIsGuid string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) dbusIsGuid_ string
    fun dbusIsInterfaceName string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) dbusIsInterfaceName_ string
    fun dbusIsMemberName string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) dbusIsMemberName_ string
    fun dbusIsName string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) dbusIsName_ string
    fun dbusIsSupportedAddress string = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) dbusIsSupportedAddress_ (string & [])
    fun dbusIsUniqueName string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) dbusIsUniqueName_ string
    fun dtlsClientConnectionNew (baseSocket, serverIdentity) =
      (
        GioDatagramBasedClass.FFI.withPtr
         &&&> GioSocketConnectableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioDtlsClientConnectionClass.FFI.fromPtr true
      )
        dtlsClientConnectionNew_
        (
          baseSocket
           & serverIdentity
           & []
        )
    fun dtlsServerConnectionNew (baseSocket, certificate) =
      (
        GioDatagramBasedClass.FFI.withPtr
         &&&> GioTlsCertificateClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioDtlsServerConnectionClass.FFI.fromPtr true
      )
        dtlsServerConnectionNew_
        (
          baseSocket
           & certificate
           & []
        )
    fun fileNewForCommandlineArg arg = (Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) fileNewForCommandlineArg_ arg
    fun fileNewForCommandlineArgAndCwd (arg, cwd) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) fileNewForCommandlineArgAndCwd_ (arg & cwd)
    fun fileNewForPath path = (Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) fileNewForPath_ path
    fun fileNewForUri uri = (Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) fileNewForUri_ uri
    fun fileNewTmp tmpl =
      let
        val iostream & retVal =
          (
            Utf8.FFI.withOptPtr
             &&&> GioFileIOStreamClass.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GioFileIOStreamClass.FFI.fromPtr true && GioFileClass.FFI.fromPtr true
          )
            fileNewTmp_
            (
              tmpl
               & NONE
               & []
            )
      in
        (retVal, iostream)
      end
    fun fileParseName parseName = (Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) fileParseName_ parseName
    fun iconDeserialize value = (GLibVariantRecord.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) iconDeserialize_ value
    fun iconNewForString str = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioIconClass.FFI.fromPtr true) iconNewForString_ (str & [])
    fun initableNewv
      (
        objectType,
        parameters,
        cancellable
      ) =
      let
        val nParameters = LargeInt.fromInt (GObjectParameterRecordCVectorN.length parameters)
        val retVal =
          (
            GObjectType.FFI.withVal
             &&&> GUInt32.FFI.withVal
             &&&> GObjectParameterRecordCVectorN.FFI.withPtr
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GObjectObjectClass.FFI.fromPtr true
          )
            initableNewv_
            (
              objectType
               & nParameters
               & parameters
               & cancellable
               & []
            )
      in
        retVal
      end
    fun ioErrorFromErrno errNo = (GInt32.FFI.withVal ---> GioIOErrorEnum.FFI.fromVal) ioErrorFromErrno_ errNo
    fun ioErrorQuark () = (I ---> GUInt32.FFI.fromVal) ioErrorQuark_ ()
    fun ioExtensionPointImplement
      (
        extensionPointName,
        type',
        extensionName,
        priority
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GObjectType.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> GioIOExtensionRecord.FFI.fromPtr false
      )
        ioExtensionPointImplement_
        (
          extensionPointName
           & type'
           & extensionName
           & priority
        )
    fun ioExtensionPointLookup name = (Utf8.FFI.withPtr ---> GioIOExtensionPointRecord.FFI.fromPtr false) ioExtensionPointLookup_ name
    fun ioExtensionPointRegister name = (Utf8.FFI.withPtr ---> GioIOExtensionPointRecord.FFI.fromPtr false) ioExtensionPointRegister_ name
    fun ioModulesScanAllInDirectory dirname = (Utf8.FFI.withPtr ---> I) ioModulesScanAllInDirectory_ dirname
    fun ioModulesScanAllInDirectoryWithScope (dirname, scope) = (Utf8.FFI.withPtr &&&> GioIOModuleScopeRecord.FFI.withPtr ---> I) ioModulesScanAllInDirectoryWithScope_ (dirname & scope)
    fun ioSchedulerCancelAllJobs () = (I ---> I) ioSchedulerCancelAllJobs_ ()
    fun networkMonitorGetDefault () = (I ---> GioNetworkMonitorClass.FFI.fromPtr false) networkMonitorGetDefault_ ()
    fun networkingInit () = (I ---> I) networkingInit_ ()
    fun pollableSourceNew pollableStream = (GObjectObjectClass.FFI.withPtr ---> GLibSourceRecord.FFI.fromPtr true) pollableSourceNew_ pollableStream
    fun pollableSourceNewFull
      (
        pollableStream,
        childSource,
        cancellable
      ) =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> GLibSourceRecord.FFI.withOptPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         ---> GLibSourceRecord.FFI.fromPtr true
      )
        pollableSourceNewFull_
        (
          pollableStream
           & childSource
           & cancellable
        )
    fun pollableStreamRead
      (
        stream,
        buffer,
        blocking,
        cancellable
      ) =
      let
        val count = LargeInt.fromInt (GUInt8CVectorN.length buffer)
        val retVal =
          (
            GioInputStreamClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             &&&> GBool.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GInt64.FFI.fromVal
          )
            pollableStreamRead_
            (
              stream
               & buffer
               & count
               & blocking
               & cancellable
               & []
            )
      in
        retVal
      end
    fun pollableStreamWrite
      (
        stream,
        buffer,
        blocking,
        cancellable
      ) =
      let
        val count = LargeInt.fromInt (GUInt8CVectorN.length buffer)
        val retVal =
          (
            GioOutputStreamClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             &&&> GBool.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GInt64.FFI.fromVal
          )
            pollableStreamWrite_
            (
              stream
               & buffer
               & count
               & blocking
               & cancellable
               & []
            )
      in
        retVal
      end
    fun pollableStreamWriteAll
      (
        stream,
        buffer,
        blocking,
        cancellable
      ) =
      let
        val count = LargeInt.fromInt (GUInt8CVectorN.length buffer)
        val bytesWritten & () =
          (
            GioOutputStreamClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             &&&> GBool.FFI.withVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal && ignore
          )
            pollableStreamWriteAll_
            (
              stream
               & buffer
               & count
               & blocking
               & GUInt64.null
               & cancellable
               & []
            )
      in
        bytesWritten
      end
    fun proxyGetDefaultForProtocol protocol = (Utf8.FFI.withPtr ---> GioProxyClass.FFI.fromPtr true) proxyGetDefaultForProtocol_ protocol
    fun proxyResolverGetDefault () = (I ---> GioProxyResolverClass.FFI.fromPtr false) proxyResolverGetDefault_ ()
    fun resolverErrorQuark () = (I ---> GUInt32.FFI.fromVal) resolverErrorQuark_ ()
    fun resourceErrorQuark () = (I ---> GUInt32.FFI.fromVal) resourceErrorQuark_ ()
    fun resourceLoad filename = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioResourceRecord.FFI.fromPtr true) resourceLoad_ (filename & [])
    fun resourcesEnumerateChildren (path, lookupFlags) =
      (
        Utf8.FFI.withPtr
         &&&> GioResourceLookupFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> Utf8CVector.FFI.fromPtr 2
      )
        resourcesEnumerateChildren_
        (
          path
           & lookupFlags
           & []
        )
    fun resourcesGetInfo (path, lookupFlags) =
      let
        val size
         & flags
         & () =
          (
            Utf8.FFI.withPtr
             &&&> GioResourceLookupFlags.FFI.withVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GUInt32.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal
                   && GUInt32.FFI.fromVal
                   && ignore
          )
            resourcesGetInfo_
            (
              path
               & lookupFlags
               & GUInt64.null
               & GUInt32.null
               & []
            )
      in
        (size, flags)
      end
    fun resourcesLookupData (path, lookupFlags) =
      (
        Utf8.FFI.withPtr
         &&&> GioResourceLookupFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibBytesRecord.FFI.fromPtr true
      )
        resourcesLookupData_
        (
          path
           & lookupFlags
           & []
        )
    fun resourcesOpenStream (path, lookupFlags) =
      (
        Utf8.FFI.withPtr
         &&&> GioResourceLookupFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioInputStreamClass.FFI.fromPtr true
      )
        resourcesOpenStream_
        (
          path
           & lookupFlags
           & []
        )
    fun resourcesRegister resource = (GioResourceRecord.FFI.withPtr ---> I) resourcesRegister_ resource
    fun resourcesUnregister resource = (GioResourceRecord.FFI.withPtr ---> I) resourcesUnregister_ resource
    fun settingsSchemaSourceGetDefault () = (I ---> GioSettingsSchemaSourceRecord.FFI.fromPtr false) settingsSchemaSourceGetDefault_ ()
    fun tlsBackendGetDefault () = (I ---> GioTlsBackendClass.FFI.fromPtr false) tlsBackendGetDefault_ ()
    fun tlsClientConnectionNew (baseIoStream, serverIdentity) =
      (
        GioIOStreamClass.FFI.withPtr
         &&&> GioSocketConnectableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsClientConnectionClass.FFI.fromPtr true
      )
        tlsClientConnectionNew_
        (
          baseIoStream
           & serverIdentity
           & []
        )
    fun tlsErrorQuark () = (I ---> GUInt32.FFI.fromVal) tlsErrorQuark_ ()
    fun tlsFileDatabaseNew anchors = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioTlsFileDatabaseClass.FFI.fromPtr true) tlsFileDatabaseNew_ (anchors & [])
    fun tlsServerConnectionNew (baseIoStream, certificate) =
      (
        GioIOStreamClass.FFI.withPtr
         &&&> GioTlsCertificateClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioTlsServerConnectionClass.FFI.fromPtr true
      )
        tlsServerConnectionNew_
        (
          baseIoStream
           & certificate
           & []
        )
    fun unixIsMountPathSystemInternal mountPath = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) unixIsMountPathSystemInternal_ mountPath
    fun unixMountCompare (mount1, mount2) = (GioUnixMountEntryRecord.FFI.withPtr &&&> GioUnixMountEntryRecord.FFI.withPtr ---> GInt32.FFI.fromVal) unixMountCompare_ (mount1 & mount2)
    fun unixMountFree mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> I) unixMountFree_ mountEntry
    fun unixMountGetDevicePath mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) unixMountGetDevicePath_ mountEntry
    fun unixMountGetFsType mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) unixMountGetFsType_ mountEntry
    fun unixMountGetMountPath mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) unixMountGetMountPath_ mountEntry
    fun unixMountGuessCanEject mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> GBool.FFI.fromVal) unixMountGuessCanEject_ mountEntry
    fun unixMountGuessIcon mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) unixMountGuessIcon_ mountEntry
    fun unixMountGuessName mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) unixMountGuessName_ mountEntry
    fun unixMountGuessShouldDisplay mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> GBool.FFI.fromVal) unixMountGuessShouldDisplay_ mountEntry
    fun unixMountGuessSymbolicIcon mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) unixMountGuessSymbolicIcon_ mountEntry
    fun unixMountIsReadonly mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> GBool.FFI.fromVal) unixMountIsReadonly_ mountEntry
    fun unixMountIsSystemInternal mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> GBool.FFI.fromVal) unixMountIsSystemInternal_ mountEntry
    fun unixMountPointsChangedSince time = (GUInt64.FFI.withVal ---> GBool.FFI.fromVal) unixMountPointsChangedSince_ time
    fun unixMountsChangedSince time = (GUInt64.FFI.withVal ---> GBool.FFI.fromVal) unixMountsChangedSince_ time
  end
