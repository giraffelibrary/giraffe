signature GIO =
  sig
    structure ActionClass : GIO_ACTION_CLASS
    structure ActionGroupClass : GIO_ACTION_GROUP_CLASS
    structure AppInfoClass : GIO_APP_INFO_CLASS
    structure AppInfoCreateFlags : GIO_APP_INFO_CREATE_FLAGS
    structure AppLaunchContextClass : GIO_APP_LAUNCH_CONTEXT_CLASS
    structure ApplicationClass : GIO_APPLICATION_CLASS
    structure ApplicationCommandLineClass : GIO_APPLICATION_COMMAND_LINE_CLASS
    structure ApplicationFlags : GIO_APPLICATION_FLAGS
    structure AskPasswordFlags : GIO_ASK_PASSWORD_FLAGS
    structure AsyncInitableClass : GIO_ASYNC_INITABLE_CLASS
    structure AsyncResultClass : GIO_ASYNC_RESULT_CLASS
    structure BusNameOwnerFlags : GIO_BUS_NAME_OWNER_FLAGS
    structure BusNameWatcherFlags : GIO_BUS_NAME_WATCHER_FLAGS
    structure BusType : GIO_BUS_TYPE
    structure CancellableClass : GIO_CANCELLABLE_CLASS
    structure CharsetConverterClass : GIO_CHARSET_CONVERTER_CLASS
    structure ConverterClass : GIO_CONVERTER_CLASS
    structure ConverterFlags : GIO_CONVERTER_FLAGS
    structure ConverterResult : GIO_CONVERTER_RESULT
    structure CredentialsClass : GIO_CREDENTIALS_CLASS
    structure CredentialsType : GIO_CREDENTIALS_TYPE
    structure DBusAuthObserverClass : GIO_D_BUS_AUTH_OBSERVER_CLASS
    structure DBusCallFlags : GIO_D_BUS_CALL_FLAGS
    structure DBusCapabilityFlags : GIO_D_BUS_CAPABILITY_FLAGS
    structure DBusConnectionClass : GIO_D_BUS_CONNECTION_CLASS
    structure DBusConnectionFlags : GIO_D_BUS_CONNECTION_FLAGS
    structure DBusError : GIO_D_BUS_ERROR
    structure DBusInterfaceClass : GIO_D_BUS_INTERFACE_CLASS
    structure DBusInterfaceSkeletonClass : GIO_D_BUS_INTERFACE_SKELETON_CLASS
    structure DBusInterfaceSkeletonFlags : GIO_D_BUS_INTERFACE_SKELETON_FLAGS
    structure DBusMessageClass : GIO_D_BUS_MESSAGE_CLASS
    structure DBusMessageByteOrder : GIO_D_BUS_MESSAGE_BYTE_ORDER
    structure DBusMessageFlags : GIO_D_BUS_MESSAGE_FLAGS
    structure DBusMessageHeaderField : GIO_D_BUS_MESSAGE_HEADER_FIELD
    structure DBusMessageType : GIO_D_BUS_MESSAGE_TYPE
    structure DBusMethodInvocationClass : GIO_D_BUS_METHOD_INVOCATION_CLASS
    structure DBusObjectClass : GIO_D_BUS_OBJECT_CLASS
    structure DBusObjectManagerClass : GIO_D_BUS_OBJECT_MANAGER_CLASS
    structure DBusObjectManagerClientClass : GIO_D_BUS_OBJECT_MANAGER_CLIENT_CLASS
    structure DBusObjectManagerClientFlags : GIO_D_BUS_OBJECT_MANAGER_CLIENT_FLAGS
    structure DBusObjectManagerServerClass : GIO_D_BUS_OBJECT_MANAGER_SERVER_CLASS
    structure DBusObjectProxyClass : GIO_D_BUS_OBJECT_PROXY_CLASS
    structure DBusObjectSkeletonClass : GIO_D_BUS_OBJECT_SKELETON_CLASS
    structure DBusPropertyInfoFlags : GIO_D_BUS_PROPERTY_INFO_FLAGS
    structure DBusProxyClass : GIO_D_BUS_PROXY_CLASS
    structure DBusProxyFlags : GIO_D_BUS_PROXY_FLAGS
    structure DBusSendMessageFlags : GIO_D_BUS_SEND_MESSAGE_FLAGS
    structure DBusServerClass : GIO_D_BUS_SERVER_CLASS
    structure DBusServerFlags : GIO_D_BUS_SERVER_FLAGS
    structure DBusSignalFlags : GIO_D_BUS_SIGNAL_FLAGS
    structure DBusSubtreeFlags : GIO_D_BUS_SUBTREE_FLAGS
    structure DataStreamByteOrder : GIO_DATA_STREAM_BYTE_ORDER
    structure DataStreamNewlineType : GIO_DATA_STREAM_NEWLINE_TYPE
    structure DesktopAppInfoClass : GIO_DESKTOP_APP_INFO_CLASS
    structure DesktopAppInfoLookupClass : GIO_DESKTOP_APP_INFO_LOOKUP_CLASS
    structure DriveClass : GIO_DRIVE_CLASS
    structure DriveStartFlags : GIO_DRIVE_START_FLAGS
    structure DriveStartStopType : GIO_DRIVE_START_STOP_TYPE
    structure EmblemClass : GIO_EMBLEM_CLASS
    structure EmblemOrigin : GIO_EMBLEM_ORIGIN
    structure EmblemedIconClass : GIO_EMBLEMED_ICON_CLASS
    structure FileClass : GIO_FILE_CLASS
    structure FileAttributeInfoFlags : GIO_FILE_ATTRIBUTE_INFO_FLAGS
    structure FileAttributeStatus : GIO_FILE_ATTRIBUTE_STATUS
    structure FileAttributeType : GIO_FILE_ATTRIBUTE_TYPE
    structure FileCopyFlags : GIO_FILE_COPY_FLAGS
    structure FileCreateFlags : GIO_FILE_CREATE_FLAGS
    structure FileDescriptorBasedClass : GIO_FILE_DESCRIPTOR_BASED_CLASS
    structure FileEnumeratorClass : GIO_FILE_ENUMERATOR_CLASS
    structure FileIconClass : GIO_FILE_ICON_CLASS
    structure FileInfoClass : GIO_FILE_INFO_CLASS
    structure FileMonitorClass : GIO_FILE_MONITOR_CLASS
    structure FileMonitorEvent : GIO_FILE_MONITOR_EVENT
    structure FileMonitorFlags : GIO_FILE_MONITOR_FLAGS
    structure FileQueryInfoFlags : GIO_FILE_QUERY_INFO_FLAGS
    structure FileType : GIO_FILE_TYPE
    structure FilenameCompleterClass : GIO_FILENAME_COMPLETER_CLASS
    structure FilesystemPreviewType : GIO_FILESYSTEM_PREVIEW_TYPE
    structure IOErrorEnum : GIO_I_O_ERROR_ENUM
    exception IOErrorEnum of IOErrorEnum.t
    structure IOModuleClass : GIO_I_O_MODULE_CLASS
    structure IOModuleScopeFlags : GIO_I_O_MODULE_SCOPE_FLAGS
    structure IOStreamClass : GIO_I_O_STREAM_CLASS
    structure IOStreamSpliceFlags : GIO_I_O_STREAM_SPLICE_FLAGS
    structure IconClass : GIO_ICON_CLASS
    structure InetAddressClass : GIO_INET_ADDRESS_CLASS
    structure InitableClass : GIO_INITABLE_CLASS
    structure InputStreamClass : GIO_INPUT_STREAM_CLASS
    structure LoadableIconClass : GIO_LOADABLE_ICON_CLASS
    structure MountClass : GIO_MOUNT_CLASS
    structure MountMountFlags : GIO_MOUNT_MOUNT_FLAGS
    structure MountOperationClass : GIO_MOUNT_OPERATION_CLASS
    structure MountOperationResult : GIO_MOUNT_OPERATION_RESULT
    structure MountUnmountFlags : GIO_MOUNT_UNMOUNT_FLAGS
    structure NetworkAddressClass : GIO_NETWORK_ADDRESS_CLASS
    structure NetworkServiceClass : GIO_NETWORK_SERVICE_CLASS
    structure OutputStreamClass : GIO_OUTPUT_STREAM_CLASS
    structure OutputStreamSpliceFlags : GIO_OUTPUT_STREAM_SPLICE_FLAGS
    structure PasswordSave : GIO_PASSWORD_SAVE
    structure PermissionClass : GIO_PERMISSION_CLASS
    structure PollableInputStreamClass : GIO_POLLABLE_INPUT_STREAM_CLASS
    structure PollableOutputStreamClass : GIO_POLLABLE_OUTPUT_STREAM_CLASS
    structure ProxyClass : GIO_PROXY_CLASS
    structure ProxyResolverClass : GIO_PROXY_RESOLVER_CLASS
    structure ResolverClass : GIO_RESOLVER_CLASS
    structure ResolverError : GIO_RESOLVER_ERROR
    exception ResolverError of ResolverError.t
    structure SeekableClass : GIO_SEEKABLE_CLASS
    structure SettingsClass : GIO_SETTINGS_CLASS
    structure SettingsBindFlags : GIO_SETTINGS_BIND_FLAGS
    structure SimpleActionClass : GIO_SIMPLE_ACTION_CLASS
    structure SimpleActionGroupClass : GIO_SIMPLE_ACTION_GROUP_CLASS
    structure SimpleAsyncResultClass : GIO_SIMPLE_ASYNC_RESULT_CLASS
    structure SocketClass : GIO_SOCKET_CLASS
    structure SocketAddressClass : GIO_SOCKET_ADDRESS_CLASS
    structure SocketAddressEnumeratorClass : GIO_SOCKET_ADDRESS_ENUMERATOR_CLASS
    structure SocketClientClass : GIO_SOCKET_CLIENT_CLASS
    structure SocketConnectableClass : GIO_SOCKET_CONNECTABLE_CLASS
    structure SocketControlMessageClass : GIO_SOCKET_CONTROL_MESSAGE_CLASS
    structure SocketFamily : GIO_SOCKET_FAMILY
    structure SocketListenerClass : GIO_SOCKET_LISTENER_CLASS
    structure SocketMsgFlags : GIO_SOCKET_MSG_FLAGS
    structure SocketProtocol : GIO_SOCKET_PROTOCOL
    structure SocketType : GIO_SOCKET_TYPE
    structure ThemedIconClass : GIO_THEMED_ICON_CLASS
    structure TlsAuthenticationMode : GIO_TLS_AUTHENTICATION_MODE
    structure TlsBackendClass : GIO_TLS_BACKEND_CLASS
    structure TlsCertificateClass : GIO_TLS_CERTIFICATE_CLASS
    structure TlsCertificateFlags : GIO_TLS_CERTIFICATE_FLAGS
    structure TlsClientConnectionClass : GIO_TLS_CLIENT_CONNECTION_CLASS
    structure TlsDatabaseClass : GIO_TLS_DATABASE_CLASS
    structure TlsDatabaseLookupFlags : GIO_TLS_DATABASE_LOOKUP_FLAGS
    structure TlsDatabaseVerifyFlags : GIO_TLS_DATABASE_VERIFY_FLAGS
    structure TlsError : GIO_TLS_ERROR
    exception TlsError of TlsError.t
    structure TlsFileDatabaseClass : GIO_TLS_FILE_DATABASE_CLASS
    structure TlsInteractionClass : GIO_TLS_INTERACTION_CLASS
    structure TlsInteractionResult : GIO_TLS_INTERACTION_RESULT
    structure TlsPasswordClass : GIO_TLS_PASSWORD_CLASS
    structure TlsPasswordFlags : GIO_TLS_PASSWORD_FLAGS
    structure TlsRehandshakeMode : GIO_TLS_REHANDSHAKE_MODE
    structure TlsServerConnectionClass : GIO_TLS_SERVER_CONNECTION_CLASS
    structure UnixFDListClass : GIO_UNIX_F_D_LIST_CLASS
    structure UnixMountMonitorClass : GIO_UNIX_MOUNT_MONITOR_CLASS
    structure UnixSocketAddressType : GIO_UNIX_SOCKET_ADDRESS_TYPE
    structure VfsClass : GIO_VFS_CLASS
    structure VolumeClass : GIO_VOLUME_CLASS
    structure VolumeMonitorClass : GIO_VOLUME_MONITOR_CLASS
    structure ZlibCompressorClass : GIO_ZLIB_COMPRESSOR_CLASS
    structure ZlibCompressorFormat : GIO_ZLIB_COMPRESSOR_FORMAT
    structure ZlibDecompressorClass : GIO_ZLIB_DECOMPRESSOR_CLASS
    structure Action :
      GIO_ACTION
        where type 'a class_t = 'a ActionClass.t
    structure ActionGroup :
      GIO_ACTION_GROUP
        where type 'a class_t = 'a ActionGroupClass.t
    structure AppInfo :
      GIO_APP_INFO
        where type 'a class_t = 'a AppInfoClass.t
        where type appinfocreateflags_t = AppInfoCreateFlags.t
        where type 'a applaunchcontextclass_t = 'a AppLaunchContextClass.t
        where type 'a iconclass_t = 'a IconClass.t
    structure AppLaunchContext :
      GIO_APP_LAUNCH_CONTEXT
        where type 'a class_t = 'a AppLaunchContextClass.t
    structure Application :
      GIO_APPLICATION
        where type 'a class_t = 'a ApplicationClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a applicationcommandlineclass_t = 'a ApplicationCommandLineClass.t
        where type 'a actiongroupclass_t = 'a ActionGroupClass.t
        where type applicationflags_t = ApplicationFlags.t
    structure ApplicationCommandLine :
      GIO_APPLICATION_COMMAND_LINE
        where type 'a class_t = 'a ApplicationCommandLineClass.t
    structure AsyncInitable :
      GIO_ASYNC_INITABLE
        where type 'a class_t = 'a AsyncInitableClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
    structure AsyncResult :
      GIO_ASYNC_RESULT
        where type 'a class_t = 'a AsyncResultClass.t
    structure Cancellable :
      GIO_CANCELLABLE
        where type 'a class_t = 'a CancellableClass.t
    structure CharsetConverter :
      GIO_CHARSET_CONVERTER
        where type 'a class_t = 'a CharsetConverterClass.t
        where type 'a converterclass_t = 'a ConverterClass.t
        where type 'a initableclass_t = 'a InitableClass.t
    structure Converter :
      GIO_CONVERTER
        where type 'a class_t = 'a ConverterClass.t
    structure Credentials :
      GIO_CREDENTIALS
        where type 'a class_t = 'a CredentialsClass.t
        where type credentialstype_t = CredentialsType.t
    structure DBusAuthObserver :
      GIO_D_BUS_AUTH_OBSERVER
        where type 'a class_t = 'a DBusAuthObserverClass.t
        where type 'a credentialsclass_t = 'a CredentialsClass.t
        where type 'a iostreamclass_t = 'a IOStreamClass.t
    structure DBusConnection :
      GIO_D_BUS_CONNECTION
        where type 'a class_t = 'a DBusConnectionClass.t
        where type 'a asyncinitableclass_t = 'a AsyncInitableClass.t
        where type 'a initableclass_t = 'a InitableClass.t
        where type 'a unixfdlistclass_t = 'a UnixFDListClass.t
        where type dbuscallflags_t = DBusCallFlags.t
        where type 'a credentialsclass_t = 'a CredentialsClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type dbussendmessageflags_t = DBusSendMessageFlags.t
        where type 'a dbusmessageclass_t = 'a DBusMessageClass.t
        where type 'a dbusauthobserverclass_t = 'a DBusAuthObserverClass.t
        where type dbuscapabilityflags_t = DBusCapabilityFlags.t
        where type dbusconnectionflags_t = DBusConnectionFlags.t
        where type 'a iostreamclass_t = 'a IOStreamClass.t
    structure DBusMessage :
      GIO_D_BUS_MESSAGE
        where type 'a class_t = 'a DBusMessageClass.t
        where type dbusmessagebyteorder_t = DBusMessageByteOrder.t
        where type dbusmessageflags_t = DBusMessageFlags.t
        where type dbusmessageheaderfield_t = DBusMessageHeaderField.t
        where type dbusmessagetype_t = DBusMessageType.t
        where type 'a unixfdlistclass_t = 'a UnixFDListClass.t
    structure DBusObject :
      GIO_D_BUS_OBJECT
        where type 'a class_t = 'a DBusObjectClass.t
        where type 'a dbusinterfaceclass_t = 'a DBusInterfaceClass.t
    structure DBusObjectManager :
      GIO_D_BUS_OBJECT_MANAGER
        where type 'a class_t = 'a DBusObjectManagerClass.t
        where type 'a dbusinterfaceclass_t = 'a DBusInterfaceClass.t
        where type 'a dbusobjectclass_t = 'a DBusObjectClass.t
    structure DBusObjectManagerClient :
      GIO_D_BUS_OBJECT_MANAGER_CLIENT
        where type 'a class_t = 'a DBusObjectManagerClientClass.t
        where type 'a asyncinitableclass_t = 'a AsyncInitableClass.t
        where type 'a dbusobjectmanagerclass_t = 'a DBusObjectManagerClass.t
        where type 'a initableclass_t = 'a InitableClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
        where type 'a dbusproxyclass_t = 'a DBusProxyClass.t
        where type 'a dbusobjectproxyclass_t = 'a DBusObjectProxyClass.t
        where type bustype_t = BusType.t
        where type 'a dbusconnectionclass_t = 'a DBusConnectionClass.t
        where type dbusobjectmanagerclientflags_t = DBusObjectManagerClientFlags.t
    structure DBusObjectManagerServer :
      GIO_D_BUS_OBJECT_MANAGER_SERVER
        where type 'a class_t = 'a DBusObjectManagerServerClass.t
        where type 'a dbusobjectmanagerclass_t = 'a DBusObjectManagerClass.t
        where type 'a dbusobjectskeletonclass_t = 'a DBusObjectSkeletonClass.t
        where type 'a dbusconnectionclass_t = 'a DBusConnectionClass.t
    structure DBusObjectProxy :
      GIO_D_BUS_OBJECT_PROXY
        where type 'a class_t = 'a DBusObjectProxyClass.t
        where type 'a dbusobjectclass_t = 'a DBusObjectClass.t
        where type 'a dbusconnectionclass_t = 'a DBusConnectionClass.t
    structure DBusObjectSkeleton :
      GIO_D_BUS_OBJECT_SKELETON
        where type 'a class_t = 'a DBusObjectSkeletonClass.t
        where type 'a dbusobjectclass_t = 'a DBusObjectClass.t
        where type 'a dbusmethodinvocationclass_t = 'a DBusMethodInvocationClass.t
        where type 'a dbusinterfaceskeletonclass_t = 'a DBusInterfaceSkeletonClass.t
    structure DBusServer :
      GIO_D_BUS_SERVER
        where type 'a class_t = 'a DBusServerClass.t
        where type 'a initableclass_t = 'a InitableClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a dbusconnectionclass_t = 'a DBusConnectionClass.t
        where type 'a dbusauthobserverclass_t = 'a DBusAuthObserverClass.t
        where type dbusserverflags_t = DBusServerFlags.t
    structure DesktopAppInfo :
      GIO_DESKTOP_APP_INFO
        where type 'a class_t = 'a DesktopAppInfoClass.t
        where type 'a appinfoclass_t = 'a AppInfoClass.t
    structure DesktopAppInfoLookup :
      GIO_DESKTOP_APP_INFO_LOOKUP
        where type 'a class_t = 'a DesktopAppInfoLookupClass.t
    structure Drive :
      GIO_DRIVE
        where type 'a class_t = 'a DriveClass.t
        where type 'a iconclass_t = 'a IconClass.t
        where type drivestartstoptype_t = DriveStartStopType.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
    structure Emblem :
      GIO_EMBLEM
        where type 'a class_t = 'a EmblemClass.t
        where type 'a iconclass_t = 'a IconClass.t
        where type emblemorigin_t = EmblemOrigin.t
    structure EmblemedIcon :
      GIO_EMBLEMED_ICON
        where type 'a class_t = 'a EmblemedIconClass.t
        where type 'a emblemclass_t = 'a EmblemClass.t
        where type 'a iconclass_t = 'a IconClass.t
    structure FileDescriptorBased :
      GIO_FILE_DESCRIPTOR_BASED
        where type 'a class_t = 'a FileDescriptorBasedClass.t
    structure FileEnumerator :
      GIO_FILE_ENUMERATOR
        where type 'a class_t = 'a FileEnumeratorClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
        where type 'a fileinfoclass_t = 'a FileInfoClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a fileclass_t = 'a FileClass.t
    structure FileIOStreamClass :
      GIO_FILE_I_O_STREAM_CLASS
        where type 'a iostreamclass_t = 'a IOStreamClass.t
    structure FileIcon :
      GIO_FILE_ICON
        where type 'a class_t = 'a FileIconClass.t
        where type 'a iconclass_t = 'a IconClass.t
        where type 'a loadableiconclass_t = 'a LoadableIconClass.t
        where type 'a fileclass_t = 'a FileClass.t
    structure FileInputStreamClass :
      GIO_FILE_INPUT_STREAM_CLASS
        where type 'a inputstreamclass_t = 'a InputStreamClass.t
    structure FileMonitor :
      GIO_FILE_MONITOR
        where type 'a class_t = 'a FileMonitorClass.t
        where type filemonitorevent_t = FileMonitorEvent.t
        where type 'a fileclass_t = 'a FileClass.t
    structure FileOutputStreamClass :
      GIO_FILE_OUTPUT_STREAM_CLASS
        where type 'a outputstreamclass_t = 'a OutputStreamClass.t
    structure FilenameCompleter :
      GIO_FILENAME_COMPLETER
        where type 'a class_t = 'a FilenameCompleterClass.t
    structure FilterInputStreamClass :
      GIO_FILTER_INPUT_STREAM_CLASS
        where type 'a inputstreamclass_t = 'a InputStreamClass.t
    structure FilterOutputStreamClass :
      GIO_FILTER_OUTPUT_STREAM_CLASS
        where type 'a outputstreamclass_t = 'a OutputStreamClass.t
    structure IOModule :
      GIO_I_O_MODULE
        where type 'a class_t = 'a IOModuleClass.t
    structure IOStream :
      GIO_I_O_STREAM
        where type 'a class_t = 'a IOStreamClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
        where type 'a inputstreamclass_t = 'a InputStreamClass.t
        where type 'a outputstreamclass_t = 'a OutputStreamClass.t
    structure Icon :
      GIO_ICON
        where type 'a class_t = 'a IconClass.t
    structure InetAddress :
      GIO_INET_ADDRESS
        where type 'a class_t = 'a InetAddressClass.t
        where type socketfamily_t = SocketFamily.t
    structure InetSocketAddressClass :
      GIO_INET_SOCKET_ADDRESS_CLASS
        where type 'a socketaddressclass_t = 'a SocketAddressClass.t
    structure Initable :
      GIO_INITABLE
        where type 'a class_t = 'a InitableClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
    structure InputStream :
      GIO_INPUT_STREAM
        where type 'a class_t = 'a InputStreamClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
    structure LoadableIcon :
      GIO_LOADABLE_ICON
        where type 'a class_t = 'a LoadableIconClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a inputstreamclass_t = 'a InputStreamClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
    structure MemoryInputStreamClass :
      GIO_MEMORY_INPUT_STREAM_CLASS
        where type 'a inputstreamclass_t = 'a InputStreamClass.t
    structure MemoryOutputStreamClass :
      GIO_MEMORY_OUTPUT_STREAM_CLASS
        where type 'a outputstreamclass_t = 'a OutputStreamClass.t
    structure Mount :
      GIO_MOUNT
        where type 'a class_t = 'a MountClass.t
        where type 'a driveclass_t = 'a DriveClass.t
        where type 'a iconclass_t = 'a IconClass.t
        where type 'a fileclass_t = 'a FileClass.t
        where type 'a volumeclass_t = 'a VolumeClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
    structure MountOperation :
      GIO_MOUNT_OPERATION
        where type 'a class_t = 'a MountOperationClass.t
        where type askpasswordflags_t = AskPasswordFlags.t
        where type mountoperationresult_t = MountOperationResult.t
        where type passwordsave_t = PasswordSave.t
    structure NativeVolumeMonitorClass :
      GIO_NATIVE_VOLUME_MONITOR_CLASS
        where type 'a volumemonitorclass_t = 'a VolumeMonitorClass.t
    structure NetworkAddress :
      GIO_NETWORK_ADDRESS
        where type 'a class_t = 'a NetworkAddressClass.t
        where type 'a socketconnectableclass_t = 'a SocketConnectableClass.t
    structure NetworkService :
      GIO_NETWORK_SERVICE
        where type 'a class_t = 'a NetworkServiceClass.t
        where type 'a socketconnectableclass_t = 'a SocketConnectableClass.t
    structure OutputStream :
      GIO_OUTPUT_STREAM
        where type 'a class_t = 'a OutputStreamClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type outputstreamspliceflags_t = OutputStreamSpliceFlags.t
        where type 'a inputstreamclass_t = 'a InputStreamClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
    structure Permission :
      GIO_PERMISSION
        where type 'a class_t = 'a PermissionClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
    structure PollableInputStream :
      GIO_POLLABLE_INPUT_STREAM
        where type 'a class_t = 'a PollableInputStreamClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
    structure PollableOutputStream :
      GIO_POLLABLE_OUTPUT_STREAM
        where type 'a class_t = 'a PollableOutputStreamClass.t
    structure ProxyAddressEnumeratorClass :
      GIO_PROXY_ADDRESS_ENUMERATOR_CLASS
        where type 'a socketaddressenumeratorclass_t = 'a SocketAddressEnumeratorClass.t
    structure ProxyResolver :
      GIO_PROXY_RESOLVER
        where type 'a class_t = 'a ProxyResolverClass.t
    structure Resolver :
      GIO_RESOLVER
        where type 'a class_t = 'a ResolverClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a inetaddressclass_t = 'a InetAddressClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
    structure Seekable :
      GIO_SEEKABLE
        where type 'a class_t = 'a SeekableClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
    structure SimpleAction :
      GIO_SIMPLE_ACTION
        where type 'a class_t = 'a SimpleActionClass.t
        where type 'a actionclass_t = 'a ActionClass.t
    structure SimpleAsyncResult :
      GIO_SIMPLE_ASYNC_RESULT
        where type 'a class_t = 'a SimpleAsyncResultClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
    structure SimplePermissionClass :
      GIO_SIMPLE_PERMISSION_CLASS
        where type 'a permissionclass_t = 'a PermissionClass.t
    structure SocketAddress :
      GIO_SOCKET_ADDRESS
        where type 'a class_t = 'a SocketAddressClass.t
        where type 'a socketconnectableclass_t = 'a SocketConnectableClass.t
        where type socketfamily_t = SocketFamily.t
    structure SocketAddressEnumerator :
      GIO_SOCKET_ADDRESS_ENUMERATOR
        where type 'a class_t = 'a SocketAddressEnumeratorClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a socketaddressclass_t = 'a SocketAddressClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
    structure SocketConnectable :
      GIO_SOCKET_CONNECTABLE
        where type 'a class_t = 'a SocketConnectableClass.t
        where type 'a socketaddressenumeratorclass_t = 'a SocketAddressEnumeratorClass.t
    structure SocketConnectionClass :
      GIO_SOCKET_CONNECTION_CLASS
        where type 'a iostreamclass_t = 'a IOStreamClass.t
    structure SocketControlMessage :
      GIO_SOCKET_CONTROL_MESSAGE
        where type 'a class_t = 'a SocketControlMessageClass.t
    structure SocketServiceClass :
      GIO_SOCKET_SERVICE_CLASS
        where type 'a socketlistenerclass_t = 'a SocketListenerClass.t
    structure ThemedIcon :
      GIO_THEMED_ICON
        where type 'a class_t = 'a ThemedIconClass.t
        where type 'a iconclass_t = 'a IconClass.t
    structure TlsBackend :
      GIO_TLS_BACKEND
        where type 'a class_t = 'a TlsBackendClass.t
        where type 'a tlsdatabaseclass_t = 'a TlsDatabaseClass.t
    structure TlsCertificate :
      GIO_TLS_CERTIFICATE
        where type 'a class_t = 'a TlsCertificateClass.t
        where type tlscertificateflags_t = TlsCertificateFlags.t
        where type 'a socketconnectableclass_t = 'a SocketConnectableClass.t
    structure TlsClientConnection :
      GIO_TLS_CLIENT_CONNECTION
        where type 'a class_t = 'a TlsClientConnectionClass.t
        where type 'a iostreamclass_t = 'a IOStreamClass.t
        where type 'a socketconnectableclass_t = 'a SocketConnectableClass.t
        where type tlscertificateflags_t = TlsCertificateFlags.t
    structure TlsConnectionClass :
      GIO_TLS_CONNECTION_CLASS
        where type 'a iostreamclass_t = 'a IOStreamClass.t
    structure TlsDatabase :
      GIO_TLS_DATABASE
        where type 'a class_t = 'a TlsDatabaseClass.t
        where type tlsdatabaselookupflags_t = TlsDatabaseLookupFlags.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type tlsdatabaseverifyflags_t = TlsDatabaseVerifyFlags.t
        where type 'a tlsinteractionclass_t = 'a TlsInteractionClass.t
        where type 'a socketconnectableclass_t = 'a SocketConnectableClass.t
        where type 'a tlscertificateclass_t = 'a TlsCertificateClass.t
        where type tlscertificateflags_t = TlsCertificateFlags.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
    structure TlsFileDatabase :
      GIO_TLS_FILE_DATABASE
        where type 'a class_t = 'a TlsFileDatabaseClass.t
        where type 'a tlsdatabaseclass_t = 'a TlsDatabaseClass.t
    structure TlsInteraction :
      GIO_TLS_INTERACTION
        where type 'a class_t = 'a TlsInteractionClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
        where type tlsinteractionresult_t = TlsInteractionResult.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a tlspasswordclass_t = 'a TlsPasswordClass.t
    structure TlsPassword :
      GIO_TLS_PASSWORD
        where type 'a class_t = 'a TlsPasswordClass.t
        where type tlspasswordflags_t = TlsPasswordFlags.t
    structure TlsServerConnection :
      GIO_TLS_SERVER_CONNECTION
        where type 'a class_t = 'a TlsServerConnectionClass.t
        where type 'a tlscertificateclass_t = 'a TlsCertificateClass.t
        where type 'a iostreamclass_t = 'a IOStreamClass.t
        where type tlsauthenticationmode_t = TlsAuthenticationMode.t
    structure UnixCredentialsMessageClass :
      GIO_UNIX_CREDENTIALS_MESSAGE_CLASS
        where type 'a socketcontrolmessageclass_t = 'a SocketControlMessageClass.t
    structure UnixFDList :
      GIO_UNIX_F_D_LIST
        where type 'a class_t = 'a UnixFDListClass.t
    structure UnixFDMessageClass :
      GIO_UNIX_F_D_MESSAGE_CLASS
        where type 'a socketcontrolmessageclass_t = 'a SocketControlMessageClass.t
    structure UnixInputStreamClass :
      GIO_UNIX_INPUT_STREAM_CLASS
        where type 'a inputstreamclass_t = 'a InputStreamClass.t
    structure UnixMountMonitor :
      GIO_UNIX_MOUNT_MONITOR
        where type 'a class_t = 'a UnixMountMonitorClass.t
    structure UnixOutputStreamClass :
      GIO_UNIX_OUTPUT_STREAM_CLASS
        where type 'a outputstreamclass_t = 'a OutputStreamClass.t
    structure UnixSocketAddressClass :
      GIO_UNIX_SOCKET_ADDRESS_CLASS
        where type 'a socketaddressclass_t = 'a SocketAddressClass.t
    structure Vfs :
      GIO_VFS
        where type 'a class_t = 'a VfsClass.t
        where type 'a fileclass_t = 'a FileClass.t
    structure Volume :
      GIO_VOLUME
        where type 'a class_t = 'a VolumeClass.t
        where type 'a fileclass_t = 'a FileClass.t
        where type 'a driveclass_t = 'a DriveClass.t
        where type 'a iconclass_t = 'a IconClass.t
        where type 'a mountclass_t = 'a MountClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
    structure VolumeMonitor :
      GIO_VOLUME_MONITOR
        where type 'a class_t = 'a VolumeMonitorClass.t
        where type 'a driveclass_t = 'a DriveClass.t
        where type 'a mountclass_t = 'a MountClass.t
        where type 'a volumeclass_t = 'a VolumeClass.t
    structure ZlibCompressor :
      GIO_ZLIB_COMPRESSOR
        where type 'a class_t = 'a ZlibCompressorClass.t
        where type 'a converterclass_t = 'a ConverterClass.t
        where type 'a fileinfoclass_t = 'a FileInfoClass.t
        where type zlibcompressorformat_t = ZlibCompressorFormat.t
    structure ZlibDecompressor :
      GIO_ZLIB_DECOMPRESSOR
        where type 'a class_t = 'a ZlibDecompressorClass.t
        where type 'a converterclass_t = 'a ConverterClass.t
        where type 'a fileinfoclass_t = 'a FileInfoClass.t
        where type zlibcompressorformat_t = ZlibCompressorFormat.t
    structure BufferedInputStreamClass :
      GIO_BUFFERED_INPUT_STREAM_CLASS
        where type 'a filterinputstreamclass_t = 'a FilterInputStreamClass.t
    structure BufferedOutputStreamClass :
      GIO_BUFFERED_OUTPUT_STREAM_CLASS
        where type 'a filteroutputstreamclass_t = 'a FilterOutputStreamClass.t
    structure ConverterInputStreamClass :
      GIO_CONVERTER_INPUT_STREAM_CLASS
        where type 'a filterinputstreamclass_t = 'a FilterInputStreamClass.t
    structure ConverterOutputStreamClass :
      GIO_CONVERTER_OUTPUT_STREAM_CLASS
        where type 'a filteroutputstreamclass_t = 'a FilterOutputStreamClass.t
    structure DataOutputStreamClass :
      GIO_DATA_OUTPUT_STREAM_CLASS
        where type 'a filteroutputstreamclass_t = 'a FilterOutputStreamClass.t
    structure FileIOStream :
      GIO_FILE_I_O_STREAM
        where type 'a class_t = 'a FileIOStreamClass.t
        where type 'a seekableclass_t = 'a SeekableClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a fileinfoclass_t = 'a FileInfoClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
    structure FileInputStream :
      GIO_FILE_INPUT_STREAM
        where type 'a class_t = 'a FileInputStreamClass.t
        where type 'a seekableclass_t = 'a SeekableClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a fileinfoclass_t = 'a FileInfoClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
    structure FileOutputStream :
      GIO_FILE_OUTPUT_STREAM
        where type 'a class_t = 'a FileOutputStreamClass.t
        where type 'a seekableclass_t = 'a SeekableClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a fileinfoclass_t = 'a FileInfoClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
    structure FilterInputStream :
      GIO_FILTER_INPUT_STREAM
        where type 'a class_t = 'a FilterInputStreamClass.t
        where type 'a inputstreamclass_t = 'a InputStreamClass.t
    structure FilterOutputStream :
      GIO_FILTER_OUTPUT_STREAM
        where type 'a class_t = 'a FilterOutputStreamClass.t
        where type 'a outputstreamclass_t = 'a OutputStreamClass.t
    structure InetSocketAddress :
      GIO_INET_SOCKET_ADDRESS
        where type 'a class_t = 'a InetSocketAddressClass.t
        where type 'a socketconnectableclass_t = 'a SocketConnectableClass.t
        where type 'a inetaddressclass_t = 'a InetAddressClass.t
    structure MemoryInputStream :
      GIO_MEMORY_INPUT_STREAM
        where type 'a class_t = 'a MemoryInputStreamClass.t
        where type 'a seekableclass_t = 'a SeekableClass.t
    structure MemoryOutputStream :
      GIO_MEMORY_OUTPUT_STREAM
        where type 'a class_t = 'a MemoryOutputStreamClass.t
        where type 'a seekableclass_t = 'a SeekableClass.t
    structure NativeVolumeMonitor :
      GIO_NATIVE_VOLUME_MONITOR
        where type 'a class_t = 'a NativeVolumeMonitorClass.t
    structure ProxyAddressClass :
      GIO_PROXY_ADDRESS_CLASS
        where type 'a inetsocketaddressclass_t = 'a InetSocketAddressClass.t
    structure ProxyAddressEnumerator :
      GIO_PROXY_ADDRESS_ENUMERATOR
        where type 'a class_t = 'a ProxyAddressEnumeratorClass.t
        where type 'a socketconnectableclass_t = 'a SocketConnectableClass.t
    structure SimplePermission :
      GIO_SIMPLE_PERMISSION
        where type 'a class_t = 'a SimplePermissionClass.t
    structure Socket :
      GIO_SOCKET
        where type 'a class_t = 'a SocketClass.t
        where type 'a initableclass_t = 'a InitableClass.t
        where type 'a socketconnectionclass_t = 'a SocketConnectionClass.t
        where type 'a credentialsclass_t = 'a CredentialsClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type socketfamily_t = SocketFamily.t
        where type socketprotocol_t = SocketProtocol.t
        where type 'a socketaddressclass_t = 'a SocketAddressClass.t
        where type sockettype_t = SocketType.t
    structure SocketClient :
      GIO_SOCKET_CLIENT
        where type 'a class_t = 'a SocketClientClass.t
        where type 'a socketconnectableclass_t = 'a SocketConnectableClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a socketconnectionclass_t = 'a SocketConnectionClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
        where type socketfamily_t = SocketFamily.t
        where type 'a socketaddressclass_t = 'a SocketAddressClass.t
        where type socketprotocol_t = SocketProtocol.t
        where type tlscertificateflags_t = TlsCertificateFlags.t
        where type sockettype_t = SocketType.t
    structure SocketConnection :
      GIO_SOCKET_CONNECTION
        where type 'a class_t = 'a SocketConnectionClass.t
        where type 'a socketaddressclass_t = 'a SocketAddressClass.t
        where type 'a socketclass_t = 'a SocketClass.t
    structure SocketListener :
      GIO_SOCKET_LISTENER
        where type 'a class_t = 'a SocketListenerClass.t
        where type 'a socketconnectionclass_t = 'a SocketConnectionClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
        where type socketprotocol_t = SocketProtocol.t
        where type sockettype_t = SocketType.t
        where type 'a socketaddressclass_t = 'a SocketAddressClass.t
        where type 'a socketclass_t = 'a SocketClass.t
    structure SocketService :
      GIO_SOCKET_SERVICE
        where type 'a class_t = 'a SocketServiceClass.t
        where type 'a socketconnectionclass_t = 'a SocketConnectionClass.t
    structure TcpConnectionClass :
      GIO_TCP_CONNECTION_CLASS
        where type 'a socketconnectionclass_t = 'a SocketConnectionClass.t
    structure ThreadedSocketServiceClass :
      GIO_THREADED_SOCKET_SERVICE_CLASS
        where type 'a socketserviceclass_t = 'a SocketServiceClass.t
    structure TlsConnection :
      GIO_TLS_CONNECTION
        where type 'a class_t = 'a TlsConnectionClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
        where type 'a iostreamclass_t = 'a IOStreamClass.t
        where type 'a tlsdatabaseclass_t = 'a TlsDatabaseClass.t
        where type 'a tlsinteractionclass_t = 'a TlsInteractionClass.t
        where type 'a tlscertificateclass_t = 'a TlsCertificateClass.t
        where type tlscertificateflags_t = TlsCertificateFlags.t
        where type tlsrehandshakemode_t = TlsRehandshakeMode.t
    structure UnixConnectionClass :
      GIO_UNIX_CONNECTION_CLASS
        where type 'a socketconnectionclass_t = 'a SocketConnectionClass.t
    structure UnixCredentialsMessage :
      GIO_UNIX_CREDENTIALS_MESSAGE
        where type 'a class_t = 'a UnixCredentialsMessageClass.t
        where type 'a credentialsclass_t = 'a CredentialsClass.t
    structure UnixFDMessage :
      GIO_UNIX_F_D_MESSAGE
        where type 'a class_t = 'a UnixFDMessageClass.t
        where type 'a unixfdlistclass_t = 'a UnixFDListClass.t
    structure UnixInputStream :
      GIO_UNIX_INPUT_STREAM
        where type 'a class_t = 'a UnixInputStreamClass.t
        where type 'a pollableinputstreamclass_t = 'a PollableInputStreamClass.t
    structure UnixOutputStream :
      GIO_UNIX_OUTPUT_STREAM
        where type 'a class_t = 'a UnixOutputStreamClass.t
        where type 'a pollableoutputstreamclass_t = 'a PollableOutputStreamClass.t
    structure UnixSocketAddress :
      GIO_UNIX_SOCKET_ADDRESS
        where type 'a class_t = 'a UnixSocketAddressClass.t
        where type 'a socketconnectableclass_t = 'a SocketConnectableClass.t
        where type unixsocketaddresstype_t = UnixSocketAddressType.t
    structure BufferedInputStream :
      GIO_BUFFERED_INPUT_STREAM
        where type 'a class_t = 'a BufferedInputStreamClass.t
        where type 'a inputstreamclass_t = 'a InputStreamClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
    structure BufferedOutputStream :
      GIO_BUFFERED_OUTPUT_STREAM
        where type 'a class_t = 'a BufferedOutputStreamClass.t
        where type 'a outputstreamclass_t = 'a OutputStreamClass.t
    structure ConverterInputStream :
      GIO_CONVERTER_INPUT_STREAM
        where type 'a class_t = 'a ConverterInputStreamClass.t
        where type 'a inputstreamclass_t = 'a InputStreamClass.t
        where type 'a converterclass_t = 'a ConverterClass.t
    structure ConverterOutputStream :
      GIO_CONVERTER_OUTPUT_STREAM
        where type 'a class_t = 'a ConverterOutputStreamClass.t
        where type 'a outputstreamclass_t = 'a OutputStreamClass.t
        where type 'a converterclass_t = 'a ConverterClass.t
    structure DataInputStreamClass :
      GIO_DATA_INPUT_STREAM_CLASS
        where type 'a bufferedinputstreamclass_t = 'a BufferedInputStreamClass.t
    structure DataOutputStream :
      GIO_DATA_OUTPUT_STREAM
        where type 'a class_t = 'a DataOutputStreamClass.t
        where type 'a outputstreamclass_t = 'a OutputStreamClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type datastreambyteorder_t = DataStreamByteOrder.t
    structure Proxy :
      GIO_PROXY
        where type 'a class_t = 'a ProxyClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a proxyaddressclass_t = 'a ProxyAddressClass.t
        where type 'a iostreamclass_t = 'a IOStreamClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
    structure ProxyAddress :
      GIO_PROXY_ADDRESS
        where type 'a class_t = 'a ProxyAddressClass.t
        where type 'a socketconnectableclass_t = 'a SocketConnectableClass.t
        where type 'a inetaddressclass_t = 'a InetAddressClass.t
    structure TcpConnection :
      GIO_TCP_CONNECTION
        where type 'a class_t = 'a TcpConnectionClass.t
    structure TcpWrapperConnectionClass :
      GIO_TCP_WRAPPER_CONNECTION_CLASS
        where type 'a tcpconnectionclass_t = 'a TcpConnectionClass.t
    structure ThreadedSocketService :
      GIO_THREADED_SOCKET_SERVICE
        where type 'a class_t = 'a ThreadedSocketServiceClass.t
        where type 'a socketconnectionclass_t = 'a SocketConnectionClass.t
    structure UnixConnection :
      GIO_UNIX_CONNECTION
        where type 'a class_t = 'a UnixConnectionClass.t
        where type 'a credentialsclass_t = 'a CredentialsClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
    structure DataInputStream :
      GIO_DATA_INPUT_STREAM
        where type 'a class_t = 'a DataInputStreamClass.t
        where type 'a inputstreamclass_t = 'a InputStreamClass.t
        where type 'a cancellableclass_t = 'a CancellableClass.t
        where type 'a asyncresultclass_t = 'a AsyncResultClass.t
        where type datastreambyteorder_t = DataStreamByteOrder.t
        where type datastreamnewlinetype_t = DataStreamNewlineType.t
    structure TcpWrapperConnection :
      GIO_TCP_WRAPPER_CONNECTION
        where type 'a class_t = 'a TcpWrapperConnectionClass.t
        where type 'a socketclass_t = 'a SocketClass.t
        where type 'a iostreamclass_t = 'a IOStreamClass.t
    val DESKTOP_APP_INFO_LOOKUP_EXTENSION_POINT_NAME : string
    val FILE_ATTRIBUTE_ACCESS_CAN_DELETE : string
    val FILE_ATTRIBUTE_ACCESS_CAN_EXECUTE : string
    val FILE_ATTRIBUTE_ACCESS_CAN_READ : string
    val FILE_ATTRIBUTE_ACCESS_CAN_RENAME : string
    val FILE_ATTRIBUTE_ACCESS_CAN_TRASH : string
    val FILE_ATTRIBUTE_ACCESS_CAN_WRITE : string
    val FILE_ATTRIBUTE_DOS_IS_ARCHIVE : string
    val FILE_ATTRIBUTE_DOS_IS_SYSTEM : string
    val FILE_ATTRIBUTE_ETAG_VALUE : string
    val FILE_ATTRIBUTE_FILESYSTEM_FREE : string
    val FILE_ATTRIBUTE_FILESYSTEM_READONLY : string
    val FILE_ATTRIBUTE_FILESYSTEM_SIZE : string
    val FILE_ATTRIBUTE_FILESYSTEM_TYPE : string
    val FILE_ATTRIBUTE_FILESYSTEM_USE_PREVIEW : string
    val FILE_ATTRIBUTE_GVFS_BACKEND : string
    val FILE_ATTRIBUTE_ID_FILE : string
    val FILE_ATTRIBUTE_ID_FILESYSTEM : string
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_EJECT : string
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_MOUNT : string
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_POLL : string
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_START : string
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_START_DEGRADED : string
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_STOP : string
    val FILE_ATTRIBUTE_MOUNTABLE_CAN_UNMOUNT : string
    val FILE_ATTRIBUTE_MOUNTABLE_HAL_UDI : string
    val FILE_ATTRIBUTE_MOUNTABLE_IS_MEDIA_CHECK_AUTOMATIC : string
    val FILE_ATTRIBUTE_MOUNTABLE_START_STOP_TYPE : string
    val FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE : string
    val FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE_FILE : string
    val FILE_ATTRIBUTE_OWNER_GROUP : string
    val FILE_ATTRIBUTE_OWNER_USER : string
    val FILE_ATTRIBUTE_OWNER_USER_REAL : string
    val FILE_ATTRIBUTE_PREVIEW_ICON : string
    val FILE_ATTRIBUTE_SELINUX_CONTEXT : string
    val FILE_ATTRIBUTE_STANDARD_ALLOCATED_SIZE : string
    val FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE : string
    val FILE_ATTRIBUTE_STANDARD_COPY_NAME : string
    val FILE_ATTRIBUTE_STANDARD_DESCRIPTION : string
    val FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME : string
    val FILE_ATTRIBUTE_STANDARD_EDIT_NAME : string
    val FILE_ATTRIBUTE_STANDARD_FAST_CONTENT_TYPE : string
    val FILE_ATTRIBUTE_STANDARD_ICON : string
    val FILE_ATTRIBUTE_STANDARD_IS_BACKUP : string
    val FILE_ATTRIBUTE_STANDARD_IS_HIDDEN : string
    val FILE_ATTRIBUTE_STANDARD_IS_SYMLINK : string
    val FILE_ATTRIBUTE_STANDARD_IS_VIRTUAL : string
    val FILE_ATTRIBUTE_STANDARD_NAME : string
    val FILE_ATTRIBUTE_STANDARD_SIZE : string
    val FILE_ATTRIBUTE_STANDARD_SORT_ORDER : string
    val FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET : string
    val FILE_ATTRIBUTE_STANDARD_TARGET_URI : string
    val FILE_ATTRIBUTE_STANDARD_TYPE : string
    val FILE_ATTRIBUTE_THUMBNAILING_FAILED : string
    val FILE_ATTRIBUTE_THUMBNAIL_PATH : string
    val FILE_ATTRIBUTE_TIME_ACCESS : string
    val FILE_ATTRIBUTE_TIME_ACCESS_USEC : string
    val FILE_ATTRIBUTE_TIME_CHANGED : string
    val FILE_ATTRIBUTE_TIME_CHANGED_USEC : string
    val FILE_ATTRIBUTE_TIME_CREATED : string
    val FILE_ATTRIBUTE_TIME_CREATED_USEC : string
    val FILE_ATTRIBUTE_TIME_MODIFIED : string
    val FILE_ATTRIBUTE_TIME_MODIFIED_USEC : string
    val FILE_ATTRIBUTE_TRASH_DELETION_DATE : string
    val FILE_ATTRIBUTE_TRASH_ITEM_COUNT : string
    val FILE_ATTRIBUTE_TRASH_ORIG_PATH : string
    val FILE_ATTRIBUTE_UNIX_BLOCKS : string
    val FILE_ATTRIBUTE_UNIX_BLOCK_SIZE : string
    val FILE_ATTRIBUTE_UNIX_DEVICE : string
    val FILE_ATTRIBUTE_UNIX_GID : string
    val FILE_ATTRIBUTE_UNIX_INODE : string
    val FILE_ATTRIBUTE_UNIX_IS_MOUNTPOINT : string
    val FILE_ATTRIBUTE_UNIX_MODE : string
    val FILE_ATTRIBUTE_UNIX_NLINK : string
    val FILE_ATTRIBUTE_UNIX_RDEV : string
    val FILE_ATTRIBUTE_UNIX_UID : string
    val NATIVE_VOLUME_MONITOR_EXTENSION_POINT_NAME : string
    val PROXY_EXTENSION_POINT_NAME : string
    val PROXY_RESOLVER_EXTENSION_POINT_NAME : string
    val TLS_BACKEND_EXTENSION_POINT_NAME : string
    val TLS_DATABASE_PURPOSE_AUTHENTICATE_CLIENT : string
    val TLS_DATABASE_PURPOSE_AUTHENTICATE_SERVER : string
    val VFS_EXTENSION_POINT_NAME : string
    val VOLUME_IDENTIFIER_KIND_HAL_UDI : string
    val VOLUME_IDENTIFIER_KIND_LABEL : string
    val VOLUME_IDENTIFIER_KIND_NFS_MOUNT : string
    val VOLUME_IDENTIFIER_KIND_UNIX_DEVICE : string
    val VOLUME_IDENTIFIER_KIND_UUID : string
    val VOLUME_MONITOR_EXTENSION_POINT_NAME : string
    val appInfoCreateFromCommandline :
      string
       -> string option
       -> AppInfoCreateFlags.t
       -> base AppInfoClass.t
    val appInfoGetDefaultForType :
      string
       -> bool
       -> base AppInfoClass.t
    val appInfoGetDefaultForUriScheme : string -> base AppInfoClass.t
    val appInfoLaunchDefaultForUri :
      string
       -> 'a AppLaunchContextClass.t option
       -> bool
    val appInfoResetTypeAssociations : string -> unit
    val busGetFinish : 'a AsyncResultClass.t -> base DBusConnectionClass.t
    val busGetSync :
      BusType.t
       -> 'a CancellableClass.t option
       -> base DBusConnectionClass.t
    val busOwnNameOnConnection :
      'a DBusConnectionClass.t
       -> string
       -> BusNameOwnerFlags.t
       -> GObject.ClosureRecord.t option
       -> GObject.ClosureRecord.t option
       -> LargeInt.int
    val busOwnName :
      BusType.t
       -> string
       -> BusNameOwnerFlags.t
       -> GObject.ClosureRecord.t option
       -> GObject.ClosureRecord.t option
       -> GObject.ClosureRecord.t option
       -> LargeInt.int
    val busUnownName : LargeInt.int -> unit
    val busUnwatchName : LargeInt.int -> unit
    val busWatchNameOnConnection :
      'a DBusConnectionClass.t
       -> string
       -> BusNameWatcherFlags.t
       -> GObject.ClosureRecord.t option
       -> GObject.ClosureRecord.t option
       -> LargeInt.int
    val busWatchName :
      BusType.t
       -> string
       -> BusNameWatcherFlags.t
       -> GObject.ClosureRecord.t option
       -> GObject.ClosureRecord.t option
       -> LargeInt.int
    val contentTypeCanBeExecutable : string -> bool
    val contentTypeEquals :
      string
       -> string
       -> bool
    val contentTypeFromMimeType : string -> string
    val contentTypeGetDescription : string -> string
    val contentTypeGetIcon : string -> base IconClass.t
    val contentTypeGetMimeType : string -> string
    val contentTypeIsA :
      string
       -> string
       -> bool
    val contentTypeIsUnknown : string -> bool
    val dbusAddressGetForBusSync :
      BusType.t
       -> 'a CancellableClass.t option
       -> string
    val dbusAddressGetStreamFinish :
      'a AsyncResultClass.t
       -> string
       -> base IOStreamClass.t
    val dbusAddressGetStreamSync :
      string
       -> string
       -> 'a CancellableClass.t option
       -> base IOStreamClass.t
    val dbusAnnotationInfoLookup :
      DBusAnnotationInfoRecord.t
       -> string
       -> string
    val dbusErrorQuark : unit -> LargeInt.int
    val dbusGenerateGuid : unit -> string
    val dbusGvalueToGvariant :
      GObject.ValueRecord.t
       -> GLib.VariantTypeRecord.t
       -> GLib.VariantRecord.t
    val dbusGvariantToGvalue :
      GLib.VariantRecord.t
       -> GObject.ValueRecord.t
       -> unit
    val dbusIsAddress : string -> bool
    val dbusIsGuid : string -> bool
    val dbusIsInterfaceName : string -> bool
    val dbusIsMemberName : string -> bool
    val dbusIsName : string -> bool
    val dbusIsSupportedAddress : string -> bool
    val dbusIsUniqueName : string -> bool
    val fileHash : unit -> LargeInt.int
    val fileNewForCommandlineArg : string -> base FileClass.t
    val fileNewForPath : string -> base FileClass.t
    val fileNewForUri : string -> base FileClass.t
    val fileParseName : string -> base FileClass.t
    val iconHash : unit -> LargeInt.int
    val iconNewForString : string -> base IconClass.t
    val ioErrorFromErrno : LargeInt.int -> IOErrorEnum.t
    val ioErrorQuark : unit -> LargeInt.int
    val ioExtensionPointLookup : string -> IOExtensionPointRecord.t
    val ioExtensionPointRegister : string -> IOExtensionPointRecord.t
    val ioModulesScanAllInDirectory : string -> unit
    val ioModulesScanAllInDirectoryWithScope :
      string
       -> IOModuleScopeRecord.t
       -> unit
    val ioSchedulerCancelAllJobs : unit -> unit
    val proxyGetDefaultForProtocol : string -> base ProxyClass.t
    val proxyResolverGetDefault : unit -> base ProxyResolverClass.t
    val resolverErrorQuark : unit -> LargeInt.int
    val tlsBackendGetDefault : unit -> base TlsBackendClass.t
    val tlsClientConnectionNew :
      'a IOStreamClass.t
       -> 'b SocketConnectableClass.t option
       -> base IOStreamClass.t
    val tlsErrorQuark : unit -> LargeInt.int
    val tlsFileDatabaseNew : string -> base TlsDatabaseClass.t
    val tlsServerConnectionNew :
      'a IOStreamClass.t
       -> 'b TlsCertificateClass.t option
       -> base IOStreamClass.t
    val unixIsMountPathSystemInternal : string -> bool
    val unixMountCompare :
      UnixMountEntryRecord.t
       -> UnixMountEntryRecord.t
       -> LargeInt.int
    val unixMountFree : UnixMountEntryRecord.t -> unit
    val unixMountGetDevicePath : UnixMountEntryRecord.t -> string
    val unixMountGetFsType : UnixMountEntryRecord.t -> string
    val unixMountGetMountPath : UnixMountEntryRecord.t -> string
    val unixMountGuessCanEject : UnixMountEntryRecord.t -> bool
    val unixMountGuessIcon : UnixMountEntryRecord.t -> base IconClass.t
    val unixMountGuessName : UnixMountEntryRecord.t -> string
    val unixMountGuessShouldDisplay : UnixMountEntryRecord.t -> bool
    val unixMountIsReadonly : UnixMountEntryRecord.t -> bool
    val unixMountIsSystemInternal : UnixMountEntryRecord.t -> bool
    val unixMountPointsChangedSince : LargeInt.int -> bool
    val unixMountsChangedSince : LargeInt.int -> bool
  end
