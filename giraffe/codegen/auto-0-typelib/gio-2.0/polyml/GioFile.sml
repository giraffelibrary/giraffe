structure GioFile :>
  GIO_FILE
    where type 'a class = 'a GioFileClass.class
    where type file_copy_flags_t = GioFileCopyFlags.t
    where type 'a file_enumerator_class = 'a GioFileEnumeratorClass.class
    where type 'a mount_class = 'a GioMountClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a file_monitor_class = 'a GioFileMonitorClass.class
    where type file_monitor_flags_t = GioFileMonitorFlags.t
    where type 'a app_info_class = 'a GioAppInfoClass.class
    where type file_type_t = GioFileType.t
    where type file_attribute_info_list_t = GioFileAttributeInfoListRecord.t
    where type 'a file_input_stream_class = 'a GioFileInputStreamClass.class
    where type 'a file_output_stream_class = 'a GioFileOutputStreamClass.class
    where type file_create_flags_t = GioFileCreateFlags.t
    where type 'a file_i_o_stream_class = 'a GioFileIOStreamClass.class
    where type file_query_info_flags_t = GioFileQueryInfoFlags.t
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_file_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val newForCommandlineArg_ = call (load_sym libgio "g_file_new_for_commandline_arg") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val newForPath_ = call (load_sym libgio "g_file_new_for_path") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val newForUri_ = call (load_sym libgio "g_file_new_for_uri") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val parseName_ = call (load_sym libgio "g_file_parse_name") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val appendTo_ =
        call (load_sym libgio "g_file_append_to")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GioFileCreateFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val appendToFinish_ =
        call (load_sym libgio "g_file_append_to_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val copyAttributes_ =
        call (load_sym libgio "g_file_copy_attributes")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GioFileCopyFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val copyFinish_ =
        call (load_sym libgio "g_file_copy_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val create_ =
        call (load_sym libgio "g_file_create")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GioFileCreateFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val createFinish_ =
        call (load_sym libgio "g_file_create_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val createReadwrite_ =
        call (load_sym libgio "g_file_create_readwrite")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GioFileCreateFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val createReadwriteFinish_ =
        call (load_sym libgio "g_file_create_readwrite_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val delete_ =
        call (load_sym libgio "g_file_delete")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val dup_ = call (load_sym libgio "g_file_dup") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val ejectMountableWithOperationFinish_ =
        call (load_sym libgio "g_file_eject_mountable_with_operation_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val enumerateChildren_ =
        call (load_sym libgio "g_file_enumerate_children")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val enumerateChildrenFinish_ =
        call (load_sym libgio "g_file_enumerate_children_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val equal_ = call (load_sym libgio "g_file_equal") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val findEnclosingMount_ =
        call (load_sym libgio "g_file_find_enclosing_mount")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val findEnclosingMountFinish_ =
        call (load_sym libgio "g_file_find_enclosing_mount_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getBasename_ = call (load_sym libgio "g_file_get_basename") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getChild_ = call (load_sym libgio "g_file_get_child") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val getChildForDisplayName_ =
        call (load_sym libgio "g_file_get_child_for_display_name")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getParent_ = call (load_sym libgio "g_file_get_parent") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getParseName_ = call (load_sym libgio "g_file_get_parse_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPath_ = call (load_sym libgio "g_file_get_path") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getRelativePath_ = call (load_sym libgio "g_file_get_relative_path") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUri_ = call (load_sym libgio "g_file_get_uri") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUriScheme_ = call (load_sym libgio "g_file_get_uri_scheme") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val hasParent_ = call (load_sym libgio "g_file_has_parent") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hasPrefix_ = call (load_sym libgio "g_file_has_prefix") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hasUriScheme_ = call (load_sym libgio "g_file_has_uri_scheme") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val iconNew_ = call (load_sym libgio "g_file_icon_new") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val isNative_ = call (load_sym libgio "g_file_is_native") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val makeDirectory_ =
        call (load_sym libgio "g_file_make_directory")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val makeDirectoryWithParents_ =
        call (load_sym libgio "g_file_make_directory_with_parents")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val makeSymbolicLink_ =
        call (load_sym libgio "g_file_make_symbolic_link")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val monitor_ =
        call (load_sym libgio "g_file_monitor")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GioFileMonitorFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val monitorDirectory_ =
        call (load_sym libgio "g_file_monitor_directory")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GioFileMonitorFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val monitorFile_ =
        call (load_sym libgio "g_file_monitor_file")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GioFileMonitorFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val mountEnclosingVolumeFinish_ =
        call (load_sym libgio "g_file_mount_enclosing_volume_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val mountMountableFinish_ =
        call (load_sym libgio "g_file_mount_mountable_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val openReadwrite_ =
        call (load_sym libgio "g_file_open_readwrite")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val openReadwriteFinish_ =
        call (load_sym libgio "g_file_open_readwrite_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val pollMountableFinish_ =
        call (load_sym libgio "g_file_poll_mountable_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val queryDefaultHandler_ =
        call (load_sym libgio "g_file_query_default_handler")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val queryExists_ = call (load_sym libgio "g_file_query_exists") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.Bool.PolyML.cVal)
      val queryFileType_ =
        call (load_sym libgio "g_file_query_file_type")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             --> GioFileType.PolyML.cVal
          )
      val queryFilesystemInfo_ =
        call (load_sym libgio "g_file_query_filesystem_info")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val queryFilesystemInfoFinish_ =
        call (load_sym libgio "g_file_query_filesystem_info_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val queryInfo_ =
        call (load_sym libgio "g_file_query_info")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val queryInfoFinish_ =
        call (load_sym libgio "g_file_query_info_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val querySettableAttributes_ =
        call (load_sym libgio "g_file_query_settable_attributes")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileAttributeInfoListRecord.PolyML.cPtr
          )
      val queryWritableNamespaces_ =
        call (load_sym libgio "g_file_query_writable_namespaces")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileAttributeInfoListRecord.PolyML.cPtr
          )
      val read_ =
        call (load_sym libgio "g_file_read")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val readFinish_ =
        call (load_sym libgio "g_file_read_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val replace_ =
        call (load_sym libgio "g_file_replace")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> FFI.Bool.PolyML.cVal
             &&> GioFileCreateFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val replaceContentsFinish_ =
        call (load_sym libgio "g_file_replace_contents_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val replaceFinish_ =
        call (load_sym libgio "g_file_replace_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val replaceReadwrite_ =
        call (load_sym libgio "g_file_replace_readwrite")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> FFI.Bool.PolyML.cVal
             &&> GioFileCreateFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val replaceReadwriteFinish_ =
        call (load_sym libgio "g_file_replace_readwrite_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val resolveRelativePath_ = call (load_sym libgio "g_file_resolve_relative_path") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val setAttributeByteString_ =
        call (load_sym libgio "g_file_set_attribute_byte_string")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setAttributeInt32_ =
        call (load_sym libgio "g_file_set_attribute_int32")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setAttributeInt64_ =
        call (load_sym libgio "g_file_set_attribute_int64")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int64.PolyML.cVal
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setAttributeString_ =
        call (load_sym libgio "g_file_set_attribute_string")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setAttributeUint32_ =
        call (load_sym libgio "g_file_set_attribute_uint32")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setAttributeUint64_ =
        call (load_sym libgio "g_file_set_attribute_uint64")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt64.PolyML.cVal
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setAttributesFinish_ =
        call (load_sym libgio "g_file_set_attributes_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setAttributesFromInfo_ =
        call (load_sym libgio "g_file_set_attributes_from_info")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setDisplayName_ =
        call (load_sym libgio "g_file_set_display_name")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val setDisplayNameFinish_ =
        call (load_sym libgio "g_file_set_display_name_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val startMountableFinish_ =
        call (load_sym libgio "g_file_start_mountable_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val stopMountableFinish_ =
        call (load_sym libgio "g_file_stop_mountable_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val supportsThreadContexts_ = call (load_sym libgio "g_file_supports_thread_contexts") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val trash_ =
        call (load_sym libgio "g_file_trash")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val unmountMountableWithOperationFinish_ =
        call (load_sym libgio "g_file_unmount_mountable_with_operation_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class = 'a GioFileClass.class
    type file_copy_flags_t = GioFileCopyFlags.t
    type 'a file_enumerator_class = 'a GioFileEnumeratorClass.class
    type 'a mount_class = 'a GioMountClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a file_monitor_class = 'a GioFileMonitorClass.class
    type file_monitor_flags_t = GioFileMonitorFlags.t
    type 'a app_info_class = 'a GioAppInfoClass.class
    type file_type_t = GioFileType.t
    type file_attribute_info_list_t = GioFileAttributeInfoListRecord.t
    type 'a file_input_stream_class = 'a GioFileInputStreamClass.class
    type 'a file_output_stream_class = 'a GioFileOutputStreamClass.class
    type file_create_flags_t = GioFileCreateFlags.t
    type 'a file_i_o_stream_class = 'a GioFileIOStreamClass.class
    type file_query_info_flags_t = GioFileQueryInfoFlags.t
    type 'a file_info_class = 'a GioFileInfoClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newForCommandlineArg arg = (Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) newForCommandlineArg_ arg
    fun newForPath path = (Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) newForPath_ path
    fun newForUri uri = (Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) newForUri_ uri
    fun parseName parseName = (Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) parseName_ parseName
    fun appendTo self flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GioFileCreateFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileOutputStreamClass.C.fromPtr true
      )
        appendTo_
        (
          self
           & flags
           & cancellable
           & []
        )
    fun appendToFinish self res =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileOutputStreamClass.C.fromPtr true
      )
        appendToFinish_
        (
          self
           & res
           & []
        )
    fun copyAttributes self destination flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GioFileCopyFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        copyAttributes_
        (
          self
           & destination
           & flags
           & cancellable
           & []
        )
    fun copyFinish self res =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        copyFinish_
        (
          self
           & res
           & []
        )
    fun create self flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GioFileCreateFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileOutputStreamClass.C.fromPtr true
      )
        create_
        (
          self
           & flags
           & cancellable
           & []
        )
    fun createFinish self res =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileOutputStreamClass.C.fromPtr true
      )
        createFinish_
        (
          self
           & res
           & []
        )
    fun createReadwrite self flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GioFileCreateFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileIOStreamClass.C.fromPtr true
      )
        createReadwrite_
        (
          self
           & flags
           & cancellable
           & []
        )
    fun createReadwriteFinish self res =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileIOStreamClass.C.fromPtr true
      )
        createReadwriteFinish_
        (
          self
           & res
           & []
        )
    fun delete self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        delete_
        (
          self
           & cancellable
           & []
        )
    fun dup self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromPtr true) dup_ self
    fun ejectMountableWithOperationFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        ejectMountableWithOperationFinish_
        (
          self
           & result
           & []
        )
    fun enumerateChildren self attributes flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileEnumeratorClass.C.fromPtr true
      )
        enumerateChildren_
        (
          self
           & attributes
           & flags
           & cancellable
           & []
        )
    fun enumerateChildrenFinish self res =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileEnumeratorClass.C.fromPtr true
      )
        enumerateChildrenFinish_
        (
          self
           & res
           & []
        )
    fun equal self file2 = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & file2)
    fun findEnclosingMount self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioMountClass.C.fromPtr true
      )
        findEnclosingMount_
        (
          self
           & cancellable
           & []
        )
    fun findEnclosingMountFinish self res =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioMountClass.C.fromPtr true
      )
        findEnclosingMountFinish_
        (
          self
           & res
           & []
        )
    fun getBasename self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getBasename_ self
    fun getChild self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) getChild_ (self & name)
    fun getChildForDisplayName self displayName =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileClass.C.fromPtr true
      )
        getChildForDisplayName_
        (
          self
           & displayName
           & []
        )
    fun getParent self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromPtr true) getParent_ self
    fun getParseName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getParseName_ self
    fun getPath self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getPath_ self
    fun getRelativePath self descendant = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getRelativePath_ (self & descendant)
    fun getUri self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getUri_ self
    fun getUriScheme self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getUriScheme_ self
    fun hasParent self parent = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasParent_ (self & parent)
    fun hasPrefix self prefix = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPrefix_ (self & prefix)
    fun hasUriScheme self uriScheme = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasUriScheme_ (self & uriScheme)
    fun iconNew self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr true) iconNew_ self
    fun isNative self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isNative_ self
    fun makeDirectory self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        makeDirectory_
        (
          self
           & cancellable
           & []
        )
    fun makeDirectoryWithParents self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        makeDirectoryWithParents_
        (
          self
           & cancellable
           & []
        )
    fun makeSymbolicLink self symlinkValue cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        makeSymbolicLink_
        (
          self
           & symlinkValue
           & cancellable
           & []
        )
    fun monitor self flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GioFileMonitorFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileMonitorClass.C.fromPtr true
      )
        monitor_
        (
          self
           & flags
           & cancellable
           & []
        )
    fun monitorDirectory self flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GioFileMonitorFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileMonitorClass.C.fromPtr true
      )
        monitorDirectory_
        (
          self
           & flags
           & cancellable
           & []
        )
    fun monitorFile self flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GioFileMonitorFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileMonitorClass.C.fromPtr true
      )
        monitorFile_
        (
          self
           & flags
           & cancellable
           & []
        )
    fun mountEnclosingVolumeFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        mountEnclosingVolumeFinish_
        (
          self
           & result
           & []
        )
    fun mountMountableFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileClass.C.fromPtr true
      )
        mountMountableFinish_
        (
          self
           & result
           & []
        )
    fun openReadwrite self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileIOStreamClass.C.fromPtr true
      )
        openReadwrite_
        (
          self
           & cancellable
           & []
        )
    fun openReadwriteFinish self res =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileIOStreamClass.C.fromPtr true
      )
        openReadwriteFinish_
        (
          self
           & res
           & []
        )
    fun pollMountableFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        pollMountableFinish_
        (
          self
           & result
           & []
        )
    fun queryDefaultHandler self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioAppInfoClass.C.fromPtr true
      )
        queryDefaultHandler_
        (
          self
           & cancellable
           & []
        )
    fun queryExists self cancellable = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> FFI.Bool.C.fromVal) queryExists_ (self & cancellable)
    fun queryFileType self flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         ---> GioFileType.C.fromVal
      )
        queryFileType_
        (
          self
           & flags
           & cancellable
        )
    fun queryFilesystemInfo self attributes cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.C.fromPtr true
      )
        queryFilesystemInfo_
        (
          self
           & attributes
           & cancellable
           & []
        )
    fun queryFilesystemInfoFinish self res =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.C.fromPtr true
      )
        queryFilesystemInfoFinish_
        (
          self
           & res
           & []
        )
    fun queryInfo self attributes flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.C.fromPtr true
      )
        queryInfo_
        (
          self
           & attributes
           & flags
           & cancellable
           & []
        )
    fun queryInfoFinish self res =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.C.fromPtr true
      )
        queryInfoFinish_
        (
          self
           & res
           & []
        )
    fun querySettableAttributes self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileAttributeInfoListRecord.C.fromPtr true
      )
        querySettableAttributes_
        (
          self
           & cancellable
           & []
        )
    fun queryWritableNamespaces self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileAttributeInfoListRecord.C.fromPtr true
      )
        queryWritableNamespaces_
        (
          self
           & cancellable
           & []
        )
    fun read self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInputStreamClass.C.fromPtr true
      )
        read_
        (
          self
           & cancellable
           & []
        )
    fun readFinish self res =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInputStreamClass.C.fromPtr true
      )
        readFinish_
        (
          self
           & res
           & []
        )
    fun replace self etag makeBackup flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> FFI.Bool.C.withVal
         &&&> GioFileCreateFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileOutputStreamClass.C.fromPtr true
      )
        replace_
        (
          self
           & etag
           & makeBackup
           & flags
           & cancellable
           & []
        )
    fun replaceContentsFinish self res =
      let
        val newEtag & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> Utf8.C.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8.C.fromPtr true && FFI.Bool.C.fromVal
          )
            replaceContentsFinish_
            (
              self
               & res
               & NONE
               & []
            )
      in
        if retVal then SOME newEtag else NONE
      end
    fun replaceFinish self res =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileOutputStreamClass.C.fromPtr true
      )
        replaceFinish_
        (
          self
           & res
           & []
        )
    fun replaceReadwrite self etag makeBackup flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> FFI.Bool.C.withVal
         &&&> GioFileCreateFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileIOStreamClass.C.fromPtr true
      )
        replaceReadwrite_
        (
          self
           & etag
           & makeBackup
           & flags
           & cancellable
           & []
        )
    fun replaceReadwriteFinish self res =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileIOStreamClass.C.fromPtr true
      )
        replaceReadwriteFinish_
        (
          self
           & res
           & []
        )
    fun resolveRelativePath self relativePath = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) resolveRelativePath_ (self & relativePath)
    fun setAttributeByteString self attribute value flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setAttributeByteString_
        (
          self
           & attribute
           & value
           & flags
           & cancellable
           & []
        )
    fun setAttributeInt32 self attribute value flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setAttributeInt32_
        (
          self
           & attribute
           & value
           & flags
           & cancellable
           & []
        )
    fun setAttributeInt64 self attribute value flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int64.C.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setAttributeInt64_
        (
          self
           & attribute
           & value
           & flags
           & cancellable
           & []
        )
    fun setAttributeString self attribute value flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setAttributeString_
        (
          self
           & attribute
           & value
           & flags
           & cancellable
           & []
        )
    fun setAttributeUint32 self attribute value flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setAttributeUint32_
        (
          self
           & attribute
           & value
           & flags
           & cancellable
           & []
        )
    fun setAttributeUint64 self attribute value flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt64.C.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setAttributeUint64_
        (
          self
           & attribute
           & value
           & flags
           & cancellable
           & []
        )
    fun setAttributesFinish self result =
      let
        val info & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GioFileInfoClass.C.fromPtr true && FFI.Bool.C.fromVal
          )
            setAttributesFinish_
            (
              self
               & result
               & NONE
               & []
            )
      in
        if retVal then SOME info else NONE
      end
    fun setAttributesFromInfo self info flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setAttributesFromInfo_
        (
          self
           & info
           & flags
           & cancellable
           & []
        )
    fun setDisplayName self displayName cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileClass.C.fromPtr true
      )
        setDisplayName_
        (
          self
           & displayName
           & cancellable
           & []
        )
    fun setDisplayNameFinish self res =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileClass.C.fromPtr true
      )
        setDisplayNameFinish_
        (
          self
           & res
           & []
        )
    fun startMountableFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        startMountableFinish_
        (
          self
           & result
           & []
        )
    fun stopMountableFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        stopMountableFinish_
        (
          self
           & result
           & []
        )
    fun supportsThreadContexts self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsThreadContexts_ self
    fun trash self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        trash_
        (
          self
           & cancellable
           & []
        )
    fun unmountMountableWithOperationFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        unmountMountableWithOperationFinish_
        (
          self
           & result
           & []
        )
  end
