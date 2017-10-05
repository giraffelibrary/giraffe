structure Gio : GIO =
  struct
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
    local
      open PolyMLFFI
    in
      val busGetFinish_ = call (getSymbol "g_bus_get_finish") (GioAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioDBusConnectionClass.PolyML.cPtr)
      val busGetSync_ =
        call (getSymbol "g_bus_get_sync")
          (
            GioBusType.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioDBusConnectionClass.PolyML.cPtr
          )
      val busOwnNameOnConnectionWithClosures_ =
        call (getSymbol "g_bus_own_name_on_connection_with_closures")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioBusNameOwnerFlags.PolyML.cVal
             &&> GObjectClosureRecord.PolyML.cOptPtr
             &&> GObjectClosureRecord.PolyML.cOptPtr
             --> GUInt.PolyML.cVal
          )
      val busOwnNameWithClosures_ =
        call (getSymbol "g_bus_own_name_with_closures")
          (
            GioBusType.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GioBusNameOwnerFlags.PolyML.cVal
             &&> GObjectClosureRecord.PolyML.cOptPtr
             &&> GObjectClosureRecord.PolyML.cOptPtr
             &&> GObjectClosureRecord.PolyML.cOptPtr
             --> GUInt.PolyML.cVal
          )
      val busUnownName_ = call (getSymbol "g_bus_unown_name") (GUInt.PolyML.cVal --> cVoid)
      val busUnwatchName_ = call (getSymbol "g_bus_unwatch_name") (GUInt.PolyML.cVal --> cVoid)
      val busWatchNameOnConnectionWithClosures_ =
        call (getSymbol "g_bus_watch_name_on_connection_with_closures")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioBusNameWatcherFlags.PolyML.cVal
             &&> GObjectClosureRecord.PolyML.cOptPtr
             &&> GObjectClosureRecord.PolyML.cOptPtr
             --> GUInt.PolyML.cVal
          )
      val busWatchNameWithClosures_ =
        call (getSymbol "g_bus_watch_name_with_closures")
          (
            GioBusType.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GioBusNameWatcherFlags.PolyML.cVal
             &&> GObjectClosureRecord.PolyML.cOptPtr
             &&> GObjectClosureRecord.PolyML.cOptPtr
             --> GUInt.PolyML.cVal
          )
      val contentTypeCanBeExecutable_ = call (getSymbol "g_content_type_can_be_executable") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val contentTypeEquals_ = call (getSymbol "g_content_type_equals") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val contentTypeFromMimeType_ = call (getSymbol "g_content_type_from_mime_type") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val contentTypeGetDescription_ = call (getSymbol "g_content_type_get_description") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val contentTypeGetIcon_ = call (getSymbol "g_content_type_get_icon") (Utf8.PolyML.cInPtr --> GioIconClass.PolyML.cPtr)
      val contentTypeGetMimeType_ = call (getSymbol "g_content_type_get_mime_type") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val contentTypeGuess_ =
        call (getSymbol "g_content_type_guess")
          (
            Utf8.PolyML.cInOptPtr
             &&> GUInt8CVectorN.PolyML.cInOptPtr
             &&> GSize.PolyML.cVal
             &&> GBool.PolyML.cRef
             --> Utf8.PolyML.cOutPtr
          )
      val contentTypeGuessForTree_ = call (getSymbol "g_content_type_guess_for_tree") (GioFileClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val contentTypeIsA_ = call (getSymbol "g_content_type_is_a") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val contentTypeIsUnknown_ = call (getSymbol "g_content_type_is_unknown") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val dbusAddressGetForBusSync_ =
        call (getSymbol "g_dbus_address_get_for_bus_sync")
          (
            GioBusType.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val dbusAddressGetStreamFinish_ =
        call (getSymbol "g_dbus_address_get_stream_finish")
          (
            GioAsyncResultClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioIOStreamClass.PolyML.cPtr
          )
      val dbusAddressGetStreamSync_ =
        call (getSymbol "g_dbus_address_get_stream_sync")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioIOStreamClass.PolyML.cPtr
          )
      val dbusGenerateGuid_ = call (getSymbol "g_dbus_generate_guid") (cVoid --> Utf8.PolyML.cOutPtr)
      val dbusGvalueToGvariant_ = call (getSymbol "g_dbus_gvalue_to_gvariant") (GObjectValueRecord.PolyML.cPtr &&> GLibVariantTypeRecord.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val dbusGvariantToGvalue_ = call (getSymbol "g_dbus_gvariant_to_gvalue") (GLibVariantRecord.PolyML.cPtr &&> GObjectValueRecord.PolyML.cPtr --> cVoid)
      val dbusIsAddress_ = call (getSymbol "g_dbus_is_address") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val dbusIsGuid_ = call (getSymbol "g_dbus_is_guid") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val dbusIsInterfaceName_ = call (getSymbol "g_dbus_is_interface_name") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val dbusIsMemberName_ = call (getSymbol "g_dbus_is_member_name") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val dbusIsName_ = call (getSymbol "g_dbus_is_name") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val dbusIsSupportedAddress_ = call (getSymbol "g_dbus_is_supported_address") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val dbusIsUniqueName_ = call (getSymbol "g_dbus_is_unique_name") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val ioErrorFromErrno_ = call (getSymbol "g_io_error_from_errno") (GInt.PolyML.cVal --> GioIOErrorEnum.PolyML.cVal)
      val ioErrorQuark_ = call (getSymbol "g_io_error_quark") (cVoid --> GLibQuark.PolyML.cVal)
      val ioModulesScanAllInDirectory_ = call (getSymbol "g_io_modules_scan_all_in_directory") (Utf8.PolyML.cInPtr --> cVoid)
      val ioModulesScanAllInDirectoryWithScope_ = call (getSymbol "g_io_modules_scan_all_in_directory_with_scope") (Utf8.PolyML.cInPtr &&> GioIOModuleScopeRecord.PolyML.cPtr --> cVoid)
      val ioSchedulerCancelAllJobs_ = call (getSymbol "g_io_scheduler_cancel_all_jobs") (cVoid --> cVoid)
      val unixIsMountPathSystemInternal_ = call (getSymbol "g_unix_is_mount_path_system_internal") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val unixMountCompare_ = call (getSymbol "g_unix_mount_compare") (GioUnixMountEntryRecord.PolyML.cPtr &&> GioUnixMountEntryRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val unixMountFree_ = call (getSymbol "g_unix_mount_free") (GioUnixMountEntryRecord.PolyML.cPtr --> cVoid)
      val unixMountGetDevicePath_ = call (getSymbol "g_unix_mount_get_device_path") (GioUnixMountEntryRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val unixMountGetFsType_ = call (getSymbol "g_unix_mount_get_fs_type") (GioUnixMountEntryRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val unixMountGetMountPath_ = call (getSymbol "g_unix_mount_get_mount_path") (GioUnixMountEntryRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val unixMountGuessCanEject_ = call (getSymbol "g_unix_mount_guess_can_eject") (GioUnixMountEntryRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val unixMountGuessIcon_ = call (getSymbol "g_unix_mount_guess_icon") (GioUnixMountEntryRecord.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val unixMountGuessName_ = call (getSymbol "g_unix_mount_guess_name") (GioUnixMountEntryRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val unixMountGuessShouldDisplay_ = call (getSymbol "g_unix_mount_guess_should_display") (GioUnixMountEntryRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val unixMountIsReadonly_ = call (getSymbol "g_unix_mount_is_readonly") (GioUnixMountEntryRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val unixMountIsSystemInternal_ = call (getSymbol "g_unix_mount_is_system_internal") (GioUnixMountEntryRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val unixMountPointsChangedSince_ = call (getSymbol "g_unix_mount_points_changed_since") (GUInt64.PolyML.cVal --> GBool.PolyML.cVal)
      val unixMountsChangedSince_ = call (getSymbol "g_unix_mounts_changed_since") (GUInt64.PolyML.cVal --> GBool.PolyML.cVal)
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
    structure DBusAnnotationInfoRecord = GioDBusAnnotationInfoRecord
    structure DBusAuthObserverClass = GioDBusAuthObserverClass
    structure DBusCallFlags = GioDBusCallFlags
    structure DBusCapabilityFlags = GioDBusCapabilityFlags
    structure DBusConnectionClass = GioDBusConnectionClass
    structure DBusConnectionFlags = GioDBusConnectionFlags
    structure DBusError = GioDBusError
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
    structure DesktopAppInfoClass = GioDesktopAppInfoClass
    structure DesktopAppInfoLookupClass = GioDesktopAppInfoLookupClass
    structure DriveClass = GioDriveClass
    structure DriveStartFlags = GioDriveStartFlags
    structure DriveStartStopType = GioDriveStartStopType
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
    structure SettingsBackendRecord = GioSettingsBackendRecord
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
    structure UnixMountEntryRecord = GioUnixMountEntryRecord
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
    structure DBusAnnotationInfo = GioDBusAnnotationInfo
    structure DBusAuthObserver = GioDBusAuthObserver
    structure DBusConnection = GioDBusConnection
    structure DBusInterface = GioDBusInterface
    structure DBusInterfaceInfo = GioDBusInterfaceInfo
    structure DBusInterfaceSkeleton = GioDBusInterfaceSkeleton
    structure DBusMessage = GioDBusMessage
    structure DBusMethodInfo = GioDBusMethodInfo
    structure DBusMethodInvocation = GioDBusMethodInvocation
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
    structure DesktopAppInfo = GioDesktopAppInfo
    structure DesktopAppInfoLookup = GioDesktopAppInfoLookup
    structure Drive = GioDrive
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
    structure Settings = GioSettings
    structure SettingsBackend = GioSettingsBackend
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
    structure UnixMountEntry = GioUnixMountEntry
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
    structure File = GioFile
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
    fun busOwnNameOnConnectionWithClosures
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
         ---> GUInt.FFI.fromVal
      )
        busOwnNameOnConnectionWithClosures_
        (
          connection
           & name
           & flags
           & nameAcquiredClosure
           & nameLostClosure
        )
    fun busOwnNameWithClosures
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
         ---> GUInt.FFI.fromVal
      )
        busOwnNameWithClosures_
        (
          busType
           & name
           & flags
           & busAcquiredClosure
           & nameAcquiredClosure
           & nameLostClosure
        )
    fun busUnownName ownerId = (GUInt.FFI.withVal ---> I) busUnownName_ ownerId
    fun busUnwatchName watcherId = (GUInt.FFI.withVal ---> I) busUnwatchName_ watcherId
    fun busWatchNameOnConnectionWithClosures
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
         ---> GUInt.FFI.fromVal
      )
        busWatchNameOnConnectionWithClosures_
        (
          connection
           & name
           & flags
           & nameAppearedClosure
           & nameVanishedClosure
        )
    fun busWatchNameWithClosures
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
         ---> GUInt.FFI.fromVal
      )
        busWatchNameWithClosures_
        (
          busType
           & name
           & flags
           & nameAppearedClosure
           & nameVanishedClosure
        )
    fun contentTypeCanBeExecutable type' = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) contentTypeCanBeExecutable_ type'
    fun contentTypeEquals (type1, type2) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) contentTypeEquals_ (type1 & type2)
    fun contentTypeFromMimeType mimeType = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) contentTypeFromMimeType_ mimeType
    fun contentTypeGetDescription type' = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) contentTypeGetDescription_ type'
    fun contentTypeGetIcon type' = (Utf8.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) contentTypeGetIcon_ type'
    fun contentTypeGetMimeType type' = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) contentTypeGetMimeType_ type'
    fun contentTypeGuess (filename, data) =
      let
        val dataSize =
          case data of
            SOME data => LargeInt.fromInt (GUInt8CVectorN.length data)
          | NONE => GSize.null
        val resultUncertain & retVal =
          (
            Utf8.FFI.withOptPtr
             &&&> GUInt8CVectorN.FFI.withOptPtr
             &&&> GSize.FFI.withVal
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
    fun dbusAddressGetStreamFinish (res, outGuid) =
      (
        GioAsyncResultClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioIOStreamClass.FFI.fromPtr true
      )
        dbusAddressGetStreamFinish_
        (
          res
           & outGuid
           & []
        )
    fun dbusAddressGetStreamSync
      (
        address,
        outGuid,
        cancellable
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioIOStreamClass.FFI.fromPtr true
      )
        dbusAddressGetStreamSync_
        (
          address
           & outGuid
           & cancellable
           & []
        )
    fun dbusGenerateGuid () = (I ---> Utf8.FFI.fromPtr 1) dbusGenerateGuid_ ()
    fun dbusGvalueToGvariant (gvalue, type') = (GObjectValueRecord.FFI.withPtr &&&> GLibVariantTypeRecord.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) dbusGvalueToGvariant_ (gvalue & type')
    fun dbusGvariantToGvalue (value, outGvalue) = (GLibVariantRecord.FFI.withPtr &&&> GObjectValueRecord.FFI.withPtr ---> I) dbusGvariantToGvalue_ (value & outGvalue)
    fun dbusIsAddress string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) dbusIsAddress_ string
    fun dbusIsGuid string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) dbusIsGuid_ string
    fun dbusIsInterfaceName string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) dbusIsInterfaceName_ string
    fun dbusIsMemberName string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) dbusIsMemberName_ string
    fun dbusIsName string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) dbusIsName_ string
    fun dbusIsSupportedAddress string = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) dbusIsSupportedAddress_ (string & [])
    fun dbusIsUniqueName string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) dbusIsUniqueName_ string
    fun ioErrorFromErrno errNo = (GInt.FFI.withVal ---> GioIOErrorEnum.FFI.fromVal) ioErrorFromErrno_ errNo
    fun ioErrorQuark () = (I ---> GLibQuark.FFI.fromVal) ioErrorQuark_ ()
    fun ioModulesScanAllInDirectory dirname = (Utf8.FFI.withPtr ---> I) ioModulesScanAllInDirectory_ dirname
    fun ioModulesScanAllInDirectoryWithScope (dirname, scope) = (Utf8.FFI.withPtr &&&> GioIOModuleScopeRecord.FFI.withPtr ---> I) ioModulesScanAllInDirectoryWithScope_ (dirname & scope)
    fun ioSchedulerCancelAllJobs () = (I ---> I) ioSchedulerCancelAllJobs_ ()
    fun unixIsMountPathSystemInternal mountPath = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) unixIsMountPathSystemInternal_ mountPath
    fun unixMountCompare (mount1, mount2) = (GioUnixMountEntryRecord.FFI.withPtr &&&> GioUnixMountEntryRecord.FFI.withPtr ---> GInt.FFI.fromVal) unixMountCompare_ (mount1 & mount2)
    fun unixMountFree mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> I) unixMountFree_ mountEntry
    fun unixMountGetDevicePath mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) unixMountGetDevicePath_ mountEntry
    fun unixMountGetFsType mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) unixMountGetFsType_ mountEntry
    fun unixMountGetMountPath mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) unixMountGetMountPath_ mountEntry
    fun unixMountGuessCanEject mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> GBool.FFI.fromVal) unixMountGuessCanEject_ mountEntry
    fun unixMountGuessIcon mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) unixMountGuessIcon_ mountEntry
    fun unixMountGuessName mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) unixMountGuessName_ mountEntry
    fun unixMountGuessShouldDisplay mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> GBool.FFI.fromVal) unixMountGuessShouldDisplay_ mountEntry
    fun unixMountIsReadonly mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> GBool.FFI.fromVal) unixMountIsReadonly_ mountEntry
    fun unixMountIsSystemInternal mountEntry = (GioUnixMountEntryRecord.FFI.withPtr ---> GBool.FFI.fromVal) unixMountIsSystemInternal_ mountEntry
    fun unixMountPointsChangedSince time = (GUInt64.FFI.withVal ---> GBool.FFI.fromVal) unixMountPointsChangedSince_ time
    fun unixMountsChangedSince time = (GUInt64.FFI.withVal ---> GBool.FFI.fromVal) unixMountsChangedSince_ time
  end
