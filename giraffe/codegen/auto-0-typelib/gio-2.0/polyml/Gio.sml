structure Gio : GIO =
  struct
    local
      open PolyMLFFI
    in
      val appInfoCreateFromCommandline_ =
        call (load_sym libgio "g_app_info_create_from_commandline")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GioAppInfoCreateFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioAppInfoClass.PolyML.cPtr
          )
      val appInfoGetDefaultForType_ = call (load_sym libgio "g_app_info_get_default_for_type") (Utf8.PolyML.cInPtr &&> FFI.Bool.PolyML.cVal --> GioAppInfoClass.PolyML.cPtr)
      val appInfoGetDefaultForUriScheme_ = call (load_sym libgio "g_app_info_get_default_for_uri_scheme") (Utf8.PolyML.cInPtr --> GioAppInfoClass.PolyML.cPtr)
      val appInfoLaunchDefaultForUri_ =
        call (load_sym libgio "g_app_info_launch_default_for_uri")
          (
            Utf8.PolyML.cInPtr
             &&> GioAppLaunchContextClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val appInfoResetTypeAssociations_ = call (load_sym libgio "g_app_info_reset_type_associations") (Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val busGetFinish_ = call (load_sym libgio "g_bus_get_finish") (GioAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioDBusConnectionClass.PolyML.cPtr)
      val busGetSync_ =
        call (load_sym libgio "g_bus_get_sync")
          (
            GioBusType.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioDBusConnectionClass.PolyML.cPtr
          )
      val busOwnNameOnConnection_ =
        call (load_sym libgio "g_bus_own_name_on_connection_with_closures")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioBusNameOwnerFlags.PolyML.cVal
             &&> GObjectClosureRecord.PolyML.cOptPtr
             &&> GObjectClosureRecord.PolyML.cOptPtr
             --> FFI.UInt32.PolyML.cVal
          )
      val busOwnName_ =
        call (load_sym libgio "g_bus_own_name_with_closures")
          (
            GioBusType.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GioBusNameOwnerFlags.PolyML.cVal
             &&> GObjectClosureRecord.PolyML.cOptPtr
             &&> GObjectClosureRecord.PolyML.cOptPtr
             &&> GObjectClosureRecord.PolyML.cOptPtr
             --> FFI.UInt32.PolyML.cVal
          )
      val busUnownName_ = call (load_sym libgio "g_bus_unown_name") (FFI.UInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val busUnwatchName_ = call (load_sym libgio "g_bus_unwatch_name") (FFI.UInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val busWatchNameOnConnection_ =
        call (load_sym libgio "g_bus_watch_name_on_connection_with_closures")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioBusNameWatcherFlags.PolyML.cVal
             &&> GObjectClosureRecord.PolyML.cOptPtr
             &&> GObjectClosureRecord.PolyML.cOptPtr
             --> FFI.UInt32.PolyML.cVal
          )
      val busWatchName_ =
        call (load_sym libgio "g_bus_watch_name_with_closures")
          (
            GioBusType.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GioBusNameWatcherFlags.PolyML.cVal
             &&> GObjectClosureRecord.PolyML.cOptPtr
             &&> GObjectClosureRecord.PolyML.cOptPtr
             --> FFI.UInt32.PolyML.cVal
          )
      val contentTypeCanBeExecutable_ = call (load_sym libgio "g_content_type_can_be_executable") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val contentTypeEquals_ = call (load_sym libgio "g_content_type_equals") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val contentTypeFromMimeType_ = call (load_sym libgio "g_content_type_from_mime_type") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val contentTypeGetDescription_ = call (load_sym libgio "g_content_type_get_description") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val contentTypeGetIcon_ = call (load_sym libgio "g_content_type_get_icon") (Utf8.PolyML.cInPtr --> GioIconClass.PolyML.cPtr)
      val contentTypeGetMimeType_ = call (load_sym libgio "g_content_type_get_mime_type") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val contentTypeIsA_ = call (load_sym libgio "g_content_type_is_a") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val contentTypeIsUnknown_ = call (load_sym libgio "g_content_type_is_unknown") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val dbusAddressGetForBusSync_ =
        call (load_sym libgio "g_dbus_address_get_for_bus_sync")
          (
            GioBusType.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val dbusAddressGetStreamFinish_ =
        call (load_sym libgio "g_dbus_address_get_stream_finish")
          (
            GioAsyncResultClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioIOStreamClass.PolyML.cPtr
          )
      val dbusAddressGetStreamSync_ =
        call (load_sym libgio "g_dbus_address_get_stream_sync")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioIOStreamClass.PolyML.cPtr
          )
      val dbusAnnotationInfoLookup_ = call (load_sym libgio "g_dbus_annotation_info_lookup") (GioDBusAnnotationInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val dbusErrorQuark_ = call (load_sym libgio "g_dbus_error_quark") (PolyMLFFI.cVoid --> FFI.UInt32.PolyML.cVal)
      val dbusGenerateGuid_ = call (load_sym libgio "g_dbus_generate_guid") (PolyMLFFI.cVoid --> Utf8.PolyML.cOutPtr)
      val dbusGvalueToGvariant_ = call (load_sym libgio "g_dbus_gvalue_to_gvariant") (GObjectValueRecord.PolyML.cPtr &&> GLibVariantTypeRecord.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val dbusGvariantToGvalue_ = call (load_sym libgio "g_dbus_gvariant_to_gvalue") (GLibVariantRecord.PolyML.cPtr &&> GObjectValueRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val dbusIsAddress_ = call (load_sym libgio "g_dbus_is_address") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val dbusIsGuid_ = call (load_sym libgio "g_dbus_is_guid") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val dbusIsInterfaceName_ = call (load_sym libgio "g_dbus_is_interface_name") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val dbusIsMemberName_ = call (load_sym libgio "g_dbus_is_member_name") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val dbusIsName_ = call (load_sym libgio "g_dbus_is_name") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val dbusIsSupportedAddress_ = call (load_sym libgio "g_dbus_is_supported_address") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val dbusIsUniqueName_ = call (load_sym libgio "g_dbus_is_unique_name") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val fileNewForCommandlineArg_ = call (load_sym libgio "g_file_new_for_commandline_arg") (Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val fileNewForPath_ = call (load_sym libgio "g_file_new_for_path") (Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val fileNewForUri_ = call (load_sym libgio "g_file_new_for_uri") (Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val fileParseName_ = call (load_sym libgio "g_file_parse_name") (Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val iconNewForString_ = call (load_sym libgio "g_icon_new_for_string") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioIconClass.PolyML.cPtr)
      val ioErrorFromErrno_ = call (load_sym libgio "g_io_error_from_errno") (FFI.Int32.PolyML.cVal --> GioIOErrorEnum.PolyML.cVal)
      val ioErrorQuark_ = call (load_sym libgio "g_io_error_quark") (PolyMLFFI.cVoid --> FFI.UInt32.PolyML.cVal)
      val ioExtensionPointLookup_ = call (load_sym libgio "g_io_extension_point_lookup") (Utf8.PolyML.cInPtr --> GioIOExtensionPointRecord.PolyML.cPtr)
      val ioExtensionPointRegister_ = call (load_sym libgio "g_io_extension_point_register") (Utf8.PolyML.cInPtr --> GioIOExtensionPointRecord.PolyML.cPtr)
      val ioModulesScanAllInDirectory_ = call (load_sym libgio "g_io_modules_scan_all_in_directory") (Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val ioModulesScanAllInDirectoryWithScope_ = call (load_sym libgio "g_io_modules_scan_all_in_directory_with_scope") (Utf8.PolyML.cInPtr &&> GioIOModuleScopeRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val ioSchedulerCancelAllJobs_ = call (load_sym libgio "g_io_scheduler_cancel_all_jobs") (PolyMLFFI.cVoid --> PolyMLFFI.cVoid)
      val proxyGetDefaultForProtocol_ = call (load_sym libgio "g_proxy_get_default_for_protocol") (Utf8.PolyML.cInPtr --> GioProxyClass.PolyML.cPtr)
      val proxyResolverGetDefault_ = call (load_sym libgio "g_proxy_resolver_get_default") (PolyMLFFI.cVoid --> GioProxyResolverClass.PolyML.cPtr)
      val resolverErrorQuark_ = call (load_sym libgio "g_resolver_error_quark") (PolyMLFFI.cVoid --> FFI.UInt32.PolyML.cVal)
      val tlsBackendGetDefault_ = call (load_sym libgio "g_tls_backend_get_default") (PolyMLFFI.cVoid --> GioTlsBackendClass.PolyML.cPtr)
      val tlsClientConnectionNew_ =
        call (load_sym libgio "g_tls_client_connection_new")
          (
            GioIOStreamClass.PolyML.cPtr
             &&> GioSocketConnectableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioIOStreamClass.PolyML.cPtr
          )
      val tlsErrorQuark_ = call (load_sym libgio "g_tls_error_quark") (PolyMLFFI.cVoid --> FFI.UInt32.PolyML.cVal)
      val tlsFileDatabaseNew_ = call (load_sym libgio "g_tls_file_database_new") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioTlsDatabaseClass.PolyML.cPtr)
      val tlsServerConnectionNew_ =
        call (load_sym libgio "g_tls_server_connection_new")
          (
            GioIOStreamClass.PolyML.cPtr
             &&> GioTlsCertificateClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioIOStreamClass.PolyML.cPtr
          )
      val unixIsMountPathSystemInternal_ = call (load_sym libgio "g_unix_is_mount_path_system_internal") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val unixMountCompare_ = call (load_sym libgio "g_unix_mount_compare") (GioUnixMountEntryRecord.PolyML.cPtr &&> GioUnixMountEntryRecord.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val unixMountFree_ = call (load_sym libgio "g_unix_mount_free") (GioUnixMountEntryRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val unixMountGetDevicePath_ = call (load_sym libgio "g_unix_mount_get_device_path") (GioUnixMountEntryRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val unixMountGetFsType_ = call (load_sym libgio "g_unix_mount_get_fs_type") (GioUnixMountEntryRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val unixMountGetMountPath_ = call (load_sym libgio "g_unix_mount_get_mount_path") (GioUnixMountEntryRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val unixMountGuessCanEject_ = call (load_sym libgio "g_unix_mount_guess_can_eject") (GioUnixMountEntryRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val unixMountGuessIcon_ = call (load_sym libgio "g_unix_mount_guess_icon") (GioUnixMountEntryRecord.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val unixMountGuessName_ = call (load_sym libgio "g_unix_mount_guess_name") (GioUnixMountEntryRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val unixMountGuessShouldDisplay_ = call (load_sym libgio "g_unix_mount_guess_should_display") (GioUnixMountEntryRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val unixMountIsReadonly_ = call (load_sym libgio "g_unix_mount_is_readonly") (GioUnixMountEntryRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val unixMountIsSystemInternal_ = call (load_sym libgio "g_unix_mount_is_system_internal") (GioUnixMountEntryRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val unixMountPointsChangedSince_ = call (load_sym libgio "g_unix_mount_points_changed_since") (FFI.UInt64.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unixMountsChangedSince_ = call (load_sym libgio "g_unix_mounts_changed_since") (FFI.UInt64.PolyML.cVal --> FFI.Bool.PolyML.cVal)
    end
    structure ActionClass = GioActionClass
    structure ActionGroupClass = GioActionGroupClass
    structure AppInfoClass = GioAppInfoClass
    structure AppInfoCreateFlags = GioAppInfoCreateFlags
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
    structure CancellableClass = GioCancellableClass
    structure CharsetConverterClass = GioCharsetConverterClass
    structure ConverterClass = GioConverterClass
    structure ConverterFlags = GioConverterFlags
    structure ConverterResult = GioConverterResult
    structure CredentialsClass = GioCredentialsClass
    structure CredentialsType = GioCredentialsType
    structure DBusAuthObserverClass = GioDBusAuthObserverClass
    structure DBusCallFlags = GioDBusCallFlags
    structure DBusCapabilityFlags = GioDBusCapabilityFlags
    structure DBusConnectionClass = GioDBusConnectionClass
    structure DBusConnectionFlags = GioDBusConnectionFlags
    structure DBusError = GioDBusError
    structure DBusInterfaceClass = GioDBusInterfaceClass
    structure DBusInterfaceSkeletonClass = GioDBusInterfaceSkeletonClass
    structure DBusInterfaceSkeletonFlags = GioDBusInterfaceSkeletonFlags
    structure DBusMessageClass = GioDBusMessageClass
    structure DBusMessageByteOrder = GioDBusMessageByteOrder
    structure DBusMessageFlags = GioDBusMessageFlags
    structure DBusMessageHeaderField = GioDBusMessageHeaderField
    structure DBusMessageType = GioDBusMessageType
    structure DBusMethodInvocationClass = GioDBusMethodInvocationClass
    structure DBusObjectClass = GioDBusObjectClass
    structure DBusObjectManagerClass = GioDBusObjectManagerClass
    structure DBusObjectManagerClientClass = GioDBusObjectManagerClientClass
    structure DBusObjectManagerClientFlags = GioDBusObjectManagerClientFlags
    structure DBusObjectManagerServerClass = GioDBusObjectManagerServerClass
    structure DBusObjectProxyClass = GioDBusObjectProxyClass
    structure DBusObjectSkeletonClass = GioDBusObjectSkeletonClass
    structure DBusPropertyInfoFlags = GioDBusPropertyInfoFlags
    structure DBusProxyClass = GioDBusProxyClass
    structure DBusProxyFlags = GioDBusProxyFlags
    structure DBusSendMessageFlags = GioDBusSendMessageFlags
    structure DBusServerClass = GioDBusServerClass
    structure DBusServerFlags = GioDBusServerFlags
    structure DBusSignalFlags = GioDBusSignalFlags
    structure DBusSubtreeFlags = GioDBusSubtreeFlags
    structure DataStreamByteOrder = GioDataStreamByteOrder
    structure DataStreamNewlineType = GioDataStreamNewlineType
    structure DesktopAppInfoClass = GioDesktopAppInfoClass
    structure DesktopAppInfoLookupClass = GioDesktopAppInfoLookupClass
    structure DriveClass = GioDriveClass
    structure DriveStartFlags = GioDriveStartFlags
    structure DriveStartStopType = GioDriveStartStopType
    structure EmblemClass = GioEmblemClass
    structure EmblemOrigin = GioEmblemOrigin
    structure EmblemedIconClass = GioEmblemedIconClass
    structure FileClass = GioFileClass
    structure FileAttributeInfoFlags = GioFileAttributeInfoFlags
    structure FileAttributeStatus = GioFileAttributeStatus
    structure FileAttributeType = GioFileAttributeType
    structure FileCopyFlags = GioFileCopyFlags
    structure FileCreateFlags = GioFileCreateFlags
    structure FileDescriptorBasedClass = GioFileDescriptorBasedClass
    structure FileEnumeratorClass = GioFileEnumeratorClass
    structure FileIconClass = GioFileIconClass
    structure FileInfoClass = GioFileInfoClass
    structure FileMonitorClass = GioFileMonitorClass
    structure FileMonitorEvent = GioFileMonitorEvent
    structure FileMonitorFlags = GioFileMonitorFlags
    structure FileQueryInfoFlags = GioFileQueryInfoFlags
    structure FileType = GioFileType
    structure FilenameCompleterClass = GioFilenameCompleterClass
    structure FilesystemPreviewType = GioFilesystemPreviewType
    structure IOErrorEnum = GioIOErrorEnum
    exception IOErrorEnum = GioIOErrorEnum
    structure IOModuleClass = GioIOModuleClass
    structure IOModuleScopeFlags = GioIOModuleScopeFlags
    structure IOStreamClass = GioIOStreamClass
    structure IOStreamSpliceFlags = GioIOStreamSpliceFlags
    structure IconClass = GioIconClass
    structure InetAddressClass = GioInetAddressClass
    structure InitableClass = GioInitableClass
    structure InputStreamClass = GioInputStreamClass
    structure LoadableIconClass = GioLoadableIconClass
    structure MountClass = GioMountClass
    structure MountMountFlags = GioMountMountFlags
    structure MountOperationClass = GioMountOperationClass
    structure MountOperationResult = GioMountOperationResult
    structure MountUnmountFlags = GioMountUnmountFlags
    structure NetworkAddressClass = GioNetworkAddressClass
    structure NetworkServiceClass = GioNetworkServiceClass
    structure OutputStreamClass = GioOutputStreamClass
    structure OutputStreamSpliceFlags = GioOutputStreamSpliceFlags
    structure PasswordSave = GioPasswordSave
    structure PermissionClass = GioPermissionClass
    structure PollableInputStreamClass = GioPollableInputStreamClass
    structure PollableOutputStreamClass = GioPollableOutputStreamClass
    structure ProxyClass = GioProxyClass
    structure ProxyResolverClass = GioProxyResolverClass
    structure ResolverClass = GioResolverClass
    structure ResolverError = GioResolverError
    exception ResolverError = GioResolverError
    structure SeekableClass = GioSeekableClass
    structure SettingsClass = GioSettingsClass
    structure SettingsBindFlags = GioSettingsBindFlags
    structure SimpleActionClass = GioSimpleActionClass
    structure SimpleActionGroupClass = GioSimpleActionGroupClass
    structure SimpleAsyncResultClass = GioSimpleAsyncResultClass
    structure SocketClass = GioSocketClass
    structure SocketAddressClass = GioSocketAddressClass
    structure SocketAddressEnumeratorClass = GioSocketAddressEnumeratorClass
    structure SocketClientClass = GioSocketClientClass
    structure SocketConnectableClass = GioSocketConnectableClass
    structure SocketControlMessageClass = GioSocketControlMessageClass
    structure SocketFamily = GioSocketFamily
    structure SocketListenerClass = GioSocketListenerClass
    structure SocketMsgFlags = GioSocketMsgFlags
    structure SocketProtocol = GioSocketProtocol
    structure SocketType = GioSocketType
    structure ThemedIconClass = GioThemedIconClass
    structure TlsAuthenticationMode = GioTlsAuthenticationMode
    structure TlsBackendClass = GioTlsBackendClass
    structure TlsCertificateClass = GioTlsCertificateClass
    structure TlsCertificateFlags = GioTlsCertificateFlags
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
    structure UnixMountMonitorClass = GioUnixMountMonitorClass
    structure UnixSocketAddressType = GioUnixSocketAddressType
    structure VfsClass = GioVfsClass
    structure VolumeClass = GioVolumeClass
    structure VolumeMonitorClass = GioVolumeMonitorClass
    structure ZlibCompressorClass = GioZlibCompressorClass
    structure ZlibCompressorFormat = GioZlibCompressorFormat
    structure ZlibDecompressorClass = GioZlibDecompressorClass
    structure Action = GioAction
    structure ActionGroup = GioActionGroup
    structure AppInfo = GioAppInfo
    structure AppLaunchContext = GioAppLaunchContext
    structure Application = GioApplication
    structure ApplicationCommandLine = GioApplicationCommandLine
    structure AsyncInitable = GioAsyncInitable
    structure AsyncResult = GioAsyncResult
    structure Cancellable = GioCancellable
    structure CharsetConverter = GioCharsetConverter
    structure Converter = GioConverter
    structure Credentials = GioCredentials
    structure DBusAuthObserver = GioDBusAuthObserver
    structure DBusConnection = GioDBusConnection
    structure DBusMessage = GioDBusMessage
    structure DBusObject = GioDBusObject
    structure DBusObjectManager = GioDBusObjectManager
    structure DBusObjectManagerClient = GioDBusObjectManagerClient
    structure DBusObjectManagerServer = GioDBusObjectManagerServer
    structure DBusObjectProxy = GioDBusObjectProxy
    structure DBusObjectSkeleton = GioDBusObjectSkeleton
    structure DBusServer = GioDBusServer
    structure DesktopAppInfo = GioDesktopAppInfo
    structure DesktopAppInfoLookup = GioDesktopAppInfoLookup
    structure Drive = GioDrive
    structure Emblem = GioEmblem
    structure EmblemedIcon = GioEmblemedIcon
    structure FileDescriptorBased = GioFileDescriptorBased
    structure FileEnumerator = GioFileEnumerator
    structure FileIOStreamClass = GioFileIOStreamClass
    structure FileIcon = GioFileIcon
    structure FileInputStreamClass = GioFileInputStreamClass
    structure FileMonitor = GioFileMonitor
    structure FileOutputStreamClass = GioFileOutputStreamClass
    structure FilenameCompleter = GioFilenameCompleter
    structure FilterInputStreamClass = GioFilterInputStreamClass
    structure FilterOutputStreamClass = GioFilterOutputStreamClass
    structure IOModule = GioIOModule
    structure IOStream = GioIOStream
    structure Icon = GioIcon
    structure InetAddress = GioInetAddress
    structure InetSocketAddressClass = GioInetSocketAddressClass
    structure Initable = GioInitable
    structure InputStream = GioInputStream
    structure LoadableIcon = GioLoadableIcon
    structure MemoryInputStreamClass = GioMemoryInputStreamClass
    structure MemoryOutputStreamClass = GioMemoryOutputStreamClass
    structure Mount = GioMount
    structure MountOperation = GioMountOperation
    structure NativeVolumeMonitorClass = GioNativeVolumeMonitorClass
    structure NetworkAddress = GioNetworkAddress
    structure NetworkService = GioNetworkService
    structure OutputStream = GioOutputStream
    structure Permission = GioPermission
    structure PollableInputStream = GioPollableInputStream
    structure PollableOutputStream = GioPollableOutputStream
    structure ProxyAddressEnumeratorClass = GioProxyAddressEnumeratorClass
    structure ProxyResolver = GioProxyResolver
    structure Resolver = GioResolver
    structure Seekable = GioSeekable
    structure SimpleAction = GioSimpleAction
    structure SimpleActionGroup = GioSimpleActionGroup
    structure SimpleAsyncResult = GioSimpleAsyncResult
    structure SimplePermissionClass = GioSimplePermissionClass
    structure SocketAddress = GioSocketAddress
    structure SocketAddressEnumerator = GioSocketAddressEnumerator
    structure SocketConnectable = GioSocketConnectable
    structure SocketConnectionClass = GioSocketConnectionClass
    structure SocketControlMessage = GioSocketControlMessage
    structure SocketServiceClass = GioSocketServiceClass
    structure ThemedIcon = GioThemedIcon
    structure TlsBackend = GioTlsBackend
    structure TlsCertificate = GioTlsCertificate
    structure TlsClientConnection = GioTlsClientConnection
    structure TlsConnectionClass = GioTlsConnectionClass
    structure TlsDatabase = GioTlsDatabase
    structure TlsFileDatabase = GioTlsFileDatabase
    structure TlsInteraction = GioTlsInteraction
    structure TlsPassword = GioTlsPassword
    structure TlsServerConnection = GioTlsServerConnection
    structure UnixCredentialsMessageClass = GioUnixCredentialsMessageClass
    structure UnixFDList = GioUnixFDList
    structure UnixFDMessageClass = GioUnixFDMessageClass
    structure UnixInputStreamClass = GioUnixInputStreamClass
    structure UnixMountMonitor = GioUnixMountMonitor
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
    structure DataOutputStreamClass = GioDataOutputStreamClass
    structure FileIOStream = GioFileIOStream
    structure FileInputStream = GioFileInputStream
    structure FileOutputStream = GioFileOutputStream
    structure FilterInputStream = GioFilterInputStream
    structure FilterOutputStream = GioFilterOutputStream
    structure InetSocketAddress = GioInetSocketAddress
    structure MemoryInputStream = GioMemoryInputStream
    structure MemoryOutputStream = GioMemoryOutputStream
    structure NativeVolumeMonitor = GioNativeVolumeMonitor
    structure ProxyAddressClass = GioProxyAddressClass
    structure ProxyAddressEnumerator = GioProxyAddressEnumerator
    structure SimplePermission = GioSimplePermission
    structure Socket = GioSocket
    structure SocketClient = GioSocketClient
    structure SocketConnection = GioSocketConnection
    structure SocketListener = GioSocketListener
    structure SocketService = GioSocketService
    structure TcpConnectionClass = GioTcpConnectionClass
    structure ThreadedSocketServiceClass = GioThreadedSocketServiceClass
    structure TlsConnection = GioTlsConnection
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
    val FILE_ATTRIBUTE_FILESYSTEM_SIZE = "filesystem::size"
    val FILE_ATTRIBUTE_FILESYSTEM_TYPE = "filesystem::type"
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
    val FILE_ATTRIBUTE_STANDARD_NAME = "standard::name"
    val FILE_ATTRIBUTE_STANDARD_SIZE = "standard::size"
    val FILE_ATTRIBUTE_STANDARD_SORT_ORDER = "standard::sort-order"
    val FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET = "standard::symlink-target"
    val FILE_ATTRIBUTE_STANDARD_TARGET_URI = "standard::target-uri"
    val FILE_ATTRIBUTE_STANDARD_TYPE = "standard::type"
    val FILE_ATTRIBUTE_THUMBNAILING_FAILED = "thumbnail::failed"
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
    val NATIVE_VOLUME_MONITOR_EXTENSION_POINT_NAME = "gio-native-volume-monitor"
    val PROXY_EXTENSION_POINT_NAME = "gio-proxy"
    val PROXY_RESOLVER_EXTENSION_POINT_NAME = "gio-proxy-resolver"
    val TLS_BACKEND_EXTENSION_POINT_NAME = "gio-tls-backend"
    val TLS_DATABASE_PURPOSE_AUTHENTICATE_CLIENT = "1.3.6.1.5.5.7.3.2"
    val TLS_DATABASE_PURPOSE_AUTHENTICATE_SERVER = "1.3.6.1.5.5.7.3.1"
    val VFS_EXTENSION_POINT_NAME = "gio-vfs"
    val VOLUME_IDENTIFIER_KIND_HAL_UDI = "hal-udi"
    val VOLUME_IDENTIFIER_KIND_LABEL = "label"
    val VOLUME_IDENTIFIER_KIND_NFS_MOUNT = "nfs-mount"
    val VOLUME_IDENTIFIER_KIND_UNIX_DEVICE = "unix-device"
    val VOLUME_IDENTIFIER_KIND_UUID = "uuid"
    val VOLUME_MONITOR_EXTENSION_POINT_NAME = "gio-volume-monitor"
    fun appInfoCreateFromCommandline commandline applicationName flags =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GioAppInfoCreateFlags.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioAppInfoClass.C.fromPtr true
      )
        appInfoCreateFromCommandline_
        (
          commandline
           & applicationName
           & flags
           & []
        )
    fun appInfoGetDefaultForType contentType mustSupportUris = (Utf8.C.withPtr &&&> FFI.Bool.C.withVal ---> GioAppInfoClass.C.fromPtr true) appInfoGetDefaultForType_ (contentType & mustSupportUris)
    fun appInfoGetDefaultForUriScheme uriScheme = (Utf8.C.withPtr ---> GioAppInfoClass.C.fromPtr true) appInfoGetDefaultForUriScheme_ uriScheme
    fun appInfoLaunchDefaultForUri uri launchContext =
      (
        Utf8.C.withPtr
         &&&> GioAppLaunchContextClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        appInfoLaunchDefaultForUri_
        (
          uri
           & launchContext
           & []
        )
    fun appInfoResetTypeAssociations contentType = (Utf8.C.withPtr ---> I) appInfoResetTypeAssociations_ contentType
    fun busGetFinish res = (GioAsyncResultClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusConnectionClass.C.fromPtr true) busGetFinish_ (res & [])
    fun busGetSync busType cancellable =
      (
        GioBusType.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioDBusConnectionClass.C.fromPtr true
      )
        busGetSync_
        (
          busType
           & cancellable
           & []
        )
    fun busOwnNameOnConnection connection name flags nameAcquiredClosure nameLostClosure =
      (
        GioDBusConnectionClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioBusNameOwnerFlags.C.withVal
         &&&> GObjectClosureRecord.C.withOptPtr
         &&&> GObjectClosureRecord.C.withOptPtr
         ---> FFI.UInt32.C.fromVal
      )
        busOwnNameOnConnection_
        (
          connection
           & name
           & flags
           & nameAcquiredClosure
           & nameLostClosure
        )
    fun busOwnName busType name flags busAcquiredClosure nameAcquiredClosure nameLostClosure =
      (
        GioBusType.C.withVal
         &&&> Utf8.C.withPtr
         &&&> GioBusNameOwnerFlags.C.withVal
         &&&> GObjectClosureRecord.C.withOptPtr
         &&&> GObjectClosureRecord.C.withOptPtr
         &&&> GObjectClosureRecord.C.withOptPtr
         ---> FFI.UInt32.C.fromVal
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
    fun busUnownName ownerId = (FFI.UInt32.C.withVal ---> I) busUnownName_ ownerId
    fun busUnwatchName watcherId = (FFI.UInt32.C.withVal ---> I) busUnwatchName_ watcherId
    fun busWatchNameOnConnection connection name flags nameAppearedClosure nameVanishedClosure =
      (
        GioDBusConnectionClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioBusNameWatcherFlags.C.withVal
         &&&> GObjectClosureRecord.C.withOptPtr
         &&&> GObjectClosureRecord.C.withOptPtr
         ---> FFI.UInt32.C.fromVal
      )
        busWatchNameOnConnection_
        (
          connection
           & name
           & flags
           & nameAppearedClosure
           & nameVanishedClosure
        )
    fun busWatchName busType name flags nameAppearedClosure nameVanishedClosure =
      (
        GioBusType.C.withVal
         &&&> Utf8.C.withPtr
         &&&> GioBusNameWatcherFlags.C.withVal
         &&&> GObjectClosureRecord.C.withOptPtr
         &&&> GObjectClosureRecord.C.withOptPtr
         ---> FFI.UInt32.C.fromVal
      )
        busWatchName_
        (
          busType
           & name
           & flags
           & nameAppearedClosure
           & nameVanishedClosure
        )
    fun contentTypeCanBeExecutable type' = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) contentTypeCanBeExecutable_ type'
    fun contentTypeEquals type1 type2 = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) contentTypeEquals_ (type1 & type2)
    fun contentTypeFromMimeType mimeType = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) contentTypeFromMimeType_ mimeType
    fun contentTypeGetDescription type' = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) contentTypeGetDescription_ type'
    fun contentTypeGetIcon type' = (Utf8.C.withPtr ---> GioIconClass.C.fromPtr true) contentTypeGetIcon_ type'
    fun contentTypeGetMimeType type' = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) contentTypeGetMimeType_ type'
    fun contentTypeIsA type' supertype = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) contentTypeIsA_ (type' & supertype)
    fun contentTypeIsUnknown type' = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) contentTypeIsUnknown_ type'
    fun dbusAddressGetForBusSync busType cancellable =
      (
        GioBusType.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.C.fromPtr true
      )
        dbusAddressGetForBusSync_
        (
          busType
           & cancellable
           & []
        )
    fun dbusAddressGetStreamFinish res outGuid =
      (
        GioAsyncResultClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioIOStreamClass.C.fromPtr true
      )
        dbusAddressGetStreamFinish_
        (
          res
           & outGuid
           & []
        )
    fun dbusAddressGetStreamSync address outGuid cancellable =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioIOStreamClass.C.fromPtr true
      )
        dbusAddressGetStreamSync_
        (
          address
           & outGuid
           & cancellable
           & []
        )
    fun dbusAnnotationInfoLookup annotations name = (GioDBusAnnotationInfoRecord.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) dbusAnnotationInfoLookup_ (annotations & name)
    fun dbusErrorQuark () = (I ---> FFI.UInt32.C.fromVal) dbusErrorQuark_ ()
    fun dbusGenerateGuid () = (I ---> Utf8.C.fromPtr true) dbusGenerateGuid_ ()
    fun dbusGvalueToGvariant gvalue type' = (GObjectValueRecord.C.withPtr &&&> GLibVariantTypeRecord.C.withPtr ---> GLibVariantRecord.C.fromPtr true) dbusGvalueToGvariant_ (gvalue & type')
    fun dbusGvariantToGvalue value outGvalue = (GLibVariantRecord.C.withPtr &&&> GObjectValueRecord.C.withPtr ---> I) dbusGvariantToGvalue_ (value & outGvalue)
    fun dbusIsAddress string = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) dbusIsAddress_ string
    fun dbusIsGuid string = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) dbusIsGuid_ string
    fun dbusIsInterfaceName string = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) dbusIsInterfaceName_ string
    fun dbusIsMemberName string = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) dbusIsMemberName_ string
    fun dbusIsName string = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) dbusIsName_ string
    fun dbusIsSupportedAddress string = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) dbusIsSupportedAddress_ (string & [])
    fun dbusIsUniqueName string = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) dbusIsUniqueName_ string
    fun fileNewForCommandlineArg arg = (Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) fileNewForCommandlineArg_ arg
    fun fileNewForPath path = (Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) fileNewForPath_ path
    fun fileNewForUri uri = (Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) fileNewForUri_ uri
    fun fileParseName parseName = (Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) fileParseName_ parseName
    fun iconNewForString str = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> GioIconClass.C.fromPtr true) iconNewForString_ (str & [])
    fun ioErrorFromErrno errNo = (FFI.Int32.C.withVal ---> GioIOErrorEnum.C.fromVal) ioErrorFromErrno_ errNo
    fun ioErrorQuark () = (I ---> FFI.UInt32.C.fromVal) ioErrorQuark_ ()
    fun ioExtensionPointLookup name = (Utf8.C.withPtr ---> GioIOExtensionPointRecord.C.fromPtr false) ioExtensionPointLookup_ name
    fun ioExtensionPointRegister name = (Utf8.C.withPtr ---> GioIOExtensionPointRecord.C.fromPtr false) ioExtensionPointRegister_ name
    fun ioModulesScanAllInDirectory dirname = (Utf8.C.withPtr ---> I) ioModulesScanAllInDirectory_ dirname
    fun ioModulesScanAllInDirectoryWithScope dirname scope = (Utf8.C.withPtr &&&> GioIOModuleScopeRecord.C.withPtr ---> I) ioModulesScanAllInDirectoryWithScope_ (dirname & scope)
    fun ioSchedulerCancelAllJobs () = (I ---> I) ioSchedulerCancelAllJobs_ ()
    fun proxyGetDefaultForProtocol protocol = (Utf8.C.withPtr ---> GioProxyClass.C.fromPtr true) proxyGetDefaultForProtocol_ protocol
    fun proxyResolverGetDefault () = (I ---> GioProxyResolverClass.C.fromPtr false) proxyResolverGetDefault_ ()
    fun resolverErrorQuark () = (I ---> FFI.UInt32.C.fromVal) resolverErrorQuark_ ()
    fun tlsBackendGetDefault () = (I ---> GioTlsBackendClass.C.fromPtr false) tlsBackendGetDefault_ ()
    fun tlsClientConnectionNew baseIoStream serverIdentity =
      (
        GioIOStreamClass.C.withPtr
         &&&> GioSocketConnectableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioIOStreamClass.C.fromPtr true
      )
        tlsClientConnectionNew_
        (
          baseIoStream
           & serverIdentity
           & []
        )
    fun tlsErrorQuark () = (I ---> FFI.UInt32.C.fromVal) tlsErrorQuark_ ()
    fun tlsFileDatabaseNew anchors = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> GioTlsDatabaseClass.C.fromPtr true) tlsFileDatabaseNew_ (anchors & [])
    fun tlsServerConnectionNew baseIoStream certificate =
      (
        GioIOStreamClass.C.withPtr
         &&&> GioTlsCertificateClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioIOStreamClass.C.fromPtr true
      )
        tlsServerConnectionNew_
        (
          baseIoStream
           & certificate
           & []
        )
    fun unixIsMountPathSystemInternal mountPath = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) unixIsMountPathSystemInternal_ mountPath
    fun unixMountCompare mount1 mount2 = (GioUnixMountEntryRecord.C.withPtr &&&> GioUnixMountEntryRecord.C.withPtr ---> FFI.Int32.C.fromVal) unixMountCompare_ (mount1 & mount2)
    fun unixMountFree mountEntry = (GioUnixMountEntryRecord.C.withPtr ---> I) unixMountFree_ mountEntry
    fun unixMountGetDevicePath mountEntry = (GioUnixMountEntryRecord.C.withPtr ---> Utf8.C.fromPtr false) unixMountGetDevicePath_ mountEntry
    fun unixMountGetFsType mountEntry = (GioUnixMountEntryRecord.C.withPtr ---> Utf8.C.fromPtr false) unixMountGetFsType_ mountEntry
    fun unixMountGetMountPath mountEntry = (GioUnixMountEntryRecord.C.withPtr ---> Utf8.C.fromPtr false) unixMountGetMountPath_ mountEntry
    fun unixMountGuessCanEject mountEntry = (GioUnixMountEntryRecord.C.withPtr ---> FFI.Bool.C.fromVal) unixMountGuessCanEject_ mountEntry
    fun unixMountGuessIcon mountEntry = (GioUnixMountEntryRecord.C.withPtr ---> GioIconClass.C.fromPtr true) unixMountGuessIcon_ mountEntry
    fun unixMountGuessName mountEntry = (GioUnixMountEntryRecord.C.withPtr ---> Utf8.C.fromPtr true) unixMountGuessName_ mountEntry
    fun unixMountGuessShouldDisplay mountEntry = (GioUnixMountEntryRecord.C.withPtr ---> FFI.Bool.C.fromVal) unixMountGuessShouldDisplay_ mountEntry
    fun unixMountIsReadonly mountEntry = (GioUnixMountEntryRecord.C.withPtr ---> FFI.Bool.C.fromVal) unixMountIsReadonly_ mountEntry
    fun unixMountIsSystemInternal mountEntry = (GioUnixMountEntryRecord.C.withPtr ---> FFI.Bool.C.fromVal) unixMountIsSystemInternal_ mountEntry
    fun unixMountPointsChangedSince time = (FFI.UInt64.C.withVal ---> FFI.Bool.C.fromVal) unixMountPointsChangedSince_ time
    fun unixMountsChangedSince time = (FFI.UInt64.C.withVal ---> FFI.Bool.C.fromVal) unixMountsChangedSince_ time
  end
