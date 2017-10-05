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
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_file_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newForCommandlineArg_ = call (getSymbol "g_file_new_for_commandline_arg") (Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val newForPath_ = call (getSymbol "g_file_new_for_path") (Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val newForUri_ = call (getSymbol "g_file_new_for_uri") (Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val parseName_ = call (getSymbol "g_file_parse_name") (Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val appendTo_ =
        call (getSymbol "g_file_append_to")
          (
            GioFileClass.PolyML.cPtr
             &&> GioFileCreateFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileOutputStreamClass.PolyML.cPtr
          )
      val appendToFinish_ =
        call (getSymbol "g_file_append_to_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileOutputStreamClass.PolyML.cPtr
          )
      val copyAttributes_ =
        call (getSymbol "g_file_copy_attributes")
          (
            GioFileClass.PolyML.cPtr
             &&> GioFileClass.PolyML.cPtr
             &&> GioFileCopyFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val copyFinish_ =
        call (getSymbol "g_file_copy_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val create_ =
        call (getSymbol "g_file_create")
          (
            GioFileClass.PolyML.cPtr
             &&> GioFileCreateFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileOutputStreamClass.PolyML.cPtr
          )
      val createFinish_ =
        call (getSymbol "g_file_create_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileOutputStreamClass.PolyML.cPtr
          )
      val createReadwrite_ =
        call (getSymbol "g_file_create_readwrite")
          (
            GioFileClass.PolyML.cPtr
             &&> GioFileCreateFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileIOStreamClass.PolyML.cPtr
          )
      val createReadwriteFinish_ =
        call (getSymbol "g_file_create_readwrite_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileIOStreamClass.PolyML.cPtr
          )
      val delete_ =
        call (getSymbol "g_file_delete")
          (
            GioFileClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val dup_ = call (getSymbol "g_file_dup") (GioFileClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val ejectMountableWithOperationFinish_ =
        call (getSymbol "g_file_eject_mountable_with_operation_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val enumerateChildren_ =
        call (getSymbol "g_file_enumerate_children")
          (
            GioFileClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileEnumeratorClass.PolyML.cPtr
          )
      val enumerateChildrenFinish_ =
        call (getSymbol "g_file_enumerate_children_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileEnumeratorClass.PolyML.cPtr
          )
      val equal_ = call (getSymbol "g_file_equal") (GioFileClass.PolyML.cPtr &&> GioFileClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val findEnclosingMount_ =
        call (getSymbol "g_file_find_enclosing_mount")
          (
            GioFileClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioMountClass.PolyML.cPtr
          )
      val findEnclosingMountFinish_ =
        call (getSymbol "g_file_find_enclosing_mount_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioMountClass.PolyML.cPtr
          )
      val getBasename_ = call (getSymbol "g_file_get_basename") (GioFileClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getChild_ = call (getSymbol "g_file_get_child") (GioFileClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val getChildForDisplayName_ =
        call (getSymbol "g_file_get_child_for_display_name")
          (
            GioFileClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileClass.PolyML.cPtr
          )
      val getParent_ = call (getSymbol "g_file_get_parent") (GioFileClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val getParseName_ = call (getSymbol "g_file_get_parse_name") (GioFileClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPath_ = call (getSymbol "g_file_get_path") (GioFileClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getRelativePath_ = call (getSymbol "g_file_get_relative_path") (GioFileClass.PolyML.cPtr &&> GioFileClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUri_ = call (getSymbol "g_file_get_uri") (GioFileClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUriScheme_ = call (getSymbol "g_file_get_uri_scheme") (GioFileClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val hasParent_ = call (getSymbol "g_file_has_parent") (GioFileClass.PolyML.cPtr &&> GioFileClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val hasPrefix_ = call (getSymbol "g_file_has_prefix") (GioFileClass.PolyML.cPtr &&> GioFileClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val hasUriScheme_ = call (getSymbol "g_file_has_uri_scheme") (GioFileClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val iconNew_ = call (getSymbol "g_file_icon_new") (GioFileClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val isNative_ = call (getSymbol "g_file_is_native") (GioFileClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val loadContents_ =
        call (getSymbol "g_file_load_contents")
          (
            GioFileClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GUInt8CVectorN.PolyML.cOutRef
             &&> GUInt64.PolyML.cRef
             &&> Utf8.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val loadContentsFinish_ =
        call (getSymbol "g_file_load_contents_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GUInt8CVectorN.PolyML.cOutRef
             &&> GUInt64.PolyML.cRef
             &&> Utf8.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val loadPartialContentsFinish_ =
        call (getSymbol "g_file_load_partial_contents_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GUInt8CVectorN.PolyML.cOutRef
             &&> GUInt64.PolyML.cRef
             &&> Utf8.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val makeDirectory_ =
        call (getSymbol "g_file_make_directory")
          (
            GioFileClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val makeDirectoryWithParents_ =
        call (getSymbol "g_file_make_directory_with_parents")
          (
            GioFileClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val makeSymbolicLink_ =
        call (getSymbol "g_file_make_symbolic_link")
          (
            GioFileClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val monitor_ =
        call (getSymbol "g_file_monitor")
          (
            GioFileClass.PolyML.cPtr
             &&> GioFileMonitorFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileMonitorClass.PolyML.cPtr
          )
      val monitorDirectory_ =
        call (getSymbol "g_file_monitor_directory")
          (
            GioFileClass.PolyML.cPtr
             &&> GioFileMonitorFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileMonitorClass.PolyML.cPtr
          )
      val monitorFile_ =
        call (getSymbol "g_file_monitor_file")
          (
            GioFileClass.PolyML.cPtr
             &&> GioFileMonitorFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileMonitorClass.PolyML.cPtr
          )
      val mountEnclosingVolumeFinish_ =
        call (getSymbol "g_file_mount_enclosing_volume_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val mountMountableFinish_ =
        call (getSymbol "g_file_mount_mountable_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileClass.PolyML.cPtr
          )
      val openReadwrite_ =
        call (getSymbol "g_file_open_readwrite")
          (
            GioFileClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileIOStreamClass.PolyML.cPtr
          )
      val openReadwriteFinish_ =
        call (getSymbol "g_file_open_readwrite_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileIOStreamClass.PolyML.cPtr
          )
      val pollMountableFinish_ =
        call (getSymbol "g_file_poll_mountable_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val queryDefaultHandler_ =
        call (getSymbol "g_file_query_default_handler")
          (
            GioFileClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioAppInfoClass.PolyML.cPtr
          )
      val queryExists_ = call (getSymbol "g_file_query_exists") (GioFileClass.PolyML.cPtr &&> GioCancellableClass.PolyML.cOptPtr --> GBool.PolyML.cVal)
      val queryFileType_ =
        call (getSymbol "g_file_query_file_type")
          (
            GioFileClass.PolyML.cPtr
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             --> GioFileType.PolyML.cVal
          )
      val queryFilesystemInfo_ =
        call (getSymbol "g_file_query_filesystem_info")
          (
            GioFileClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileInfoClass.PolyML.cPtr
          )
      val queryFilesystemInfoFinish_ =
        call (getSymbol "g_file_query_filesystem_info_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileInfoClass.PolyML.cPtr
          )
      val queryInfo_ =
        call (getSymbol "g_file_query_info")
          (
            GioFileClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileInfoClass.PolyML.cPtr
          )
      val queryInfoFinish_ =
        call (getSymbol "g_file_query_info_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileInfoClass.PolyML.cPtr
          )
      val querySettableAttributes_ =
        call (getSymbol "g_file_query_settable_attributes")
          (
            GioFileClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileAttributeInfoListRecord.PolyML.cPtr
          )
      val queryWritableNamespaces_ =
        call (getSymbol "g_file_query_writable_namespaces")
          (
            GioFileClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileAttributeInfoListRecord.PolyML.cPtr
          )
      val read_ =
        call (getSymbol "g_file_read")
          (
            GioFileClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileInputStreamClass.PolyML.cPtr
          )
      val readFinish_ =
        call (getSymbol "g_file_read_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileInputStreamClass.PolyML.cPtr
          )
      val replace_ =
        call (getSymbol "g_file_replace")
          (
            GioFileClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GBool.PolyML.cVal
             &&> GioFileCreateFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileOutputStreamClass.PolyML.cPtr
          )
      val replaceContents_ =
        call (getSymbol "g_file_replace_contents")
          (
            GioFileClass.PolyML.cPtr
             &&> GUInt8CVectorN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> GBool.PolyML.cVal
             &&> GioFileCreateFlags.PolyML.cVal
             &&> Utf8.PolyML.cOutRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val replaceContentsFinish_ =
        call (getSymbol "g_file_replace_contents_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> Utf8.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val replaceFinish_ =
        call (getSymbol "g_file_replace_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileOutputStreamClass.PolyML.cPtr
          )
      val replaceReadwrite_ =
        call (getSymbol "g_file_replace_readwrite")
          (
            GioFileClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GBool.PolyML.cVal
             &&> GioFileCreateFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileIOStreamClass.PolyML.cPtr
          )
      val replaceReadwriteFinish_ =
        call (getSymbol "g_file_replace_readwrite_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileIOStreamClass.PolyML.cPtr
          )
      val resolveRelativePath_ = call (getSymbol "g_file_resolve_relative_path") (GioFileClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioFileClass.PolyML.cPtr)
      val setAttributeByteString_ =
        call (getSymbol "g_file_set_attribute_byte_string")
          (
            GioFileClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setAttributeInt32_ =
        call (getSymbol "g_file_set_attribute_int32")
          (
            GioFileClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setAttributeInt64_ =
        call (getSymbol "g_file_set_attribute_int64")
          (
            GioFileClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setAttributeString_ =
        call (getSymbol "g_file_set_attribute_string")
          (
            GioFileClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setAttributeUint32_ =
        call (getSymbol "g_file_set_attribute_uint32")
          (
            GioFileClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt32.PolyML.cVal
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setAttributeUint64_ =
        call (getSymbol "g_file_set_attribute_uint64")
          (
            GioFileClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setAttributesFinish_ =
        call (getSymbol "g_file_set_attributes_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GioFileInfoClass.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setAttributesFromInfo_ =
        call (getSymbol "g_file_set_attributes_from_info")
          (
            GioFileClass.PolyML.cPtr
             &&> GioFileInfoClass.PolyML.cPtr
             &&> GioFileQueryInfoFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setDisplayName_ =
        call (getSymbol "g_file_set_display_name")
          (
            GioFileClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileClass.PolyML.cPtr
          )
      val setDisplayNameFinish_ =
        call (getSymbol "g_file_set_display_name_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileClass.PolyML.cPtr
          )
      val startMountableFinish_ =
        call (getSymbol "g_file_start_mountable_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val stopMountableFinish_ =
        call (getSymbol "g_file_stop_mountable_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val supportsThreadContexts_ = call (getSymbol "g_file_supports_thread_contexts") (GioFileClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val trash_ =
        call (getSymbol "g_file_trash")
          (
            GioFileClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val unmountMountableWithOperationFinish_ =
        call (getSymbol "g_file_unmount_mountable_with_operation_finish")
          (
            GioFileClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newForCommandlineArg arg = (Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) newForCommandlineArg_ arg
    fun newForPath path = (Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) newForPath_ path
    fun newForUri uri = (Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) newForUri_ uri
    fun parseName parseName = (Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) parseName_ parseName
    fun appendTo self (flags, cancellable) =
      (
        GioFileClass.FFI.withPtr
         &&&> GioFileCreateFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileOutputStreamClass.FFI.fromPtr true
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
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileOutputStreamClass.FFI.fromPtr true
      )
        appendToFinish_
        (
          self
           & res
           & []
        )
    fun copyAttributes
      self
      (
        destination,
        flags,
        cancellable
      ) =
      (
        GioFileClass.FFI.withPtr
         &&&> GioFileClass.FFI.withPtr
         &&&> GioFileCopyFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
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
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        copyFinish_
        (
          self
           & res
           & []
        )
    fun create self (flags, cancellable) =
      (
        GioFileClass.FFI.withPtr
         &&&> GioFileCreateFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileOutputStreamClass.FFI.fromPtr true
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
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileOutputStreamClass.FFI.fromPtr true
      )
        createFinish_
        (
          self
           & res
           & []
        )
    fun createReadwrite self (flags, cancellable) =
      (
        GioFileClass.FFI.withPtr
         &&&> GioFileCreateFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileIOStreamClass.FFI.fromPtr true
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
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileIOStreamClass.FFI.fromPtr true
      )
        createReadwriteFinish_
        (
          self
           & res
           & []
        )
    fun delete self cancellable =
      (
        GioFileClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        delete_
        (
          self
           & cancellable
           & []
        )
    fun dup self = (GioFileClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) dup_ self
    fun ejectMountableWithOperationFinish self result =
      (
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        ejectMountableWithOperationFinish_
        (
          self
           & result
           & []
        )
    fun enumerateChildren
      self
      (
        attributes,
        flags,
        cancellable
      ) =
      (
        GioFileClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileEnumeratorClass.FFI.fromPtr true
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
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileEnumeratorClass.FFI.fromPtr true
      )
        enumerateChildrenFinish_
        (
          self
           & res
           & []
        )
    fun equal self file2 = (GioFileClass.FFI.withPtr &&&> GioFileClass.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & file2)
    fun findEnclosingMount self cancellable =
      (
        GioFileClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioMountClass.FFI.fromPtr true
      )
        findEnclosingMount_
        (
          self
           & cancellable
           & []
        )
    fun findEnclosingMountFinish self res =
      (
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioMountClass.FFI.fromPtr true
      )
        findEnclosingMountFinish_
        (
          self
           & res
           & []
        )
    fun getBasename self = (GioFileClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getBasename_ self
    fun getChild self name = (GioFileClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) getChild_ (self & name)
    fun getChildForDisplayName self displayName =
      (
        GioFileClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileClass.FFI.fromPtr true
      )
        getChildForDisplayName_
        (
          self
           & displayName
           & []
        )
    fun getParent self = (GioFileClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) getParent_ self
    fun getParseName self = (GioFileClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getParseName_ self
    fun getPath self = (GioFileClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getPath_ self
    fun getRelativePath self descendant = (GioFileClass.FFI.withPtr &&&> GioFileClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getRelativePath_ (self & descendant)
    fun getUri self = (GioFileClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getUri_ self
    fun getUriScheme self = (GioFileClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getUriScheme_ self
    fun hasParent self parent = (GioFileClass.FFI.withPtr &&&> GioFileClass.FFI.withPtr ---> GBool.FFI.fromVal) hasParent_ (self & parent)
    fun hasPrefix self prefix = (GioFileClass.FFI.withPtr &&&> GioFileClass.FFI.withPtr ---> GBool.FFI.fromVal) hasPrefix_ (self & prefix)
    fun hasUriScheme self uriScheme = (GioFileClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hasUriScheme_ (self & uriScheme)
    fun iconNew self = (GioFileClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) iconNew_ self
    fun isNative self = (GioFileClass.FFI.withPtr ---> GBool.FFI.fromVal) isNative_ self
    fun loadContents self cancellable =
      let
        val contents
         & length
         & etagOut
         & () =
          (
            GioFileClass.FFI.withPtr
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GUInt8CVectorN.FFI.withRefOptPtr
             &&&> GUInt64.FFI.withRefVal
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CVectorN.FFI.fromPtr 1
                   && GUInt64.FFI.fromVal
                   && Utf8.FFI.fromPtr 1
                   && ignore
          )
            loadContents_
            (
              self
               & cancellable
               & NONE
               & GUInt64.null
               & NONE
               & []
            )
      in
        (contents (LargeInt.toInt length), etagOut)
      end
    fun loadContentsFinish self res =
      let
        val contents
         & length
         & etagOut
         & () =
          (
            GioFileClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withRefOptPtr
             &&&> GUInt64.FFI.withRefVal
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CVectorN.FFI.fromPtr 1
                   && GUInt64.FFI.fromVal
                   && Utf8.FFI.fromPtr 1
                   && ignore
          )
            loadContentsFinish_
            (
              self
               & res
               & NONE
               & GUInt64.null
               & NONE
               & []
            )
      in
        (contents (LargeInt.toInt length), etagOut)
      end
    fun loadPartialContentsFinish self res =
      let
        val contents
         & length
         & etagOut
         & () =
          (
            GioFileClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withRefOptPtr
             &&&> GUInt64.FFI.withRefVal
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CVectorN.FFI.fromPtr 1
                   && GUInt64.FFI.fromVal
                   && Utf8.FFI.fromPtr 1
                   && ignore
          )
            loadPartialContentsFinish_
            (
              self
               & res
               & NONE
               & GUInt64.null
               & NONE
               & []
            )
      in
        (contents (LargeInt.toInt length), etagOut)
      end
    fun makeDirectory self cancellable =
      (
        GioFileClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        makeDirectory_
        (
          self
           & cancellable
           & []
        )
    fun makeDirectoryWithParents self cancellable =
      (
        GioFileClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        makeDirectoryWithParents_
        (
          self
           & cancellable
           & []
        )
    fun makeSymbolicLink self (symlinkValue, cancellable) =
      (
        GioFileClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        makeSymbolicLink_
        (
          self
           & symlinkValue
           & cancellable
           & []
        )
    fun monitor self (flags, cancellable) =
      (
        GioFileClass.FFI.withPtr
         &&&> GioFileMonitorFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileMonitorClass.FFI.fromPtr true
      )
        monitor_
        (
          self
           & flags
           & cancellable
           & []
        )
    fun monitorDirectory self (flags, cancellable) =
      (
        GioFileClass.FFI.withPtr
         &&&> GioFileMonitorFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileMonitorClass.FFI.fromPtr true
      )
        monitorDirectory_
        (
          self
           & flags
           & cancellable
           & []
        )
    fun monitorFile self (flags, cancellable) =
      (
        GioFileClass.FFI.withPtr
         &&&> GioFileMonitorFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileMonitorClass.FFI.fromPtr true
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
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        mountEnclosingVolumeFinish_
        (
          self
           & result
           & []
        )
    fun mountMountableFinish self result =
      (
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileClass.FFI.fromPtr true
      )
        mountMountableFinish_
        (
          self
           & result
           & []
        )
    fun openReadwrite self cancellable =
      (
        GioFileClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileIOStreamClass.FFI.fromPtr true
      )
        openReadwrite_
        (
          self
           & cancellable
           & []
        )
    fun openReadwriteFinish self res =
      (
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileIOStreamClass.FFI.fromPtr true
      )
        openReadwriteFinish_
        (
          self
           & res
           & []
        )
    fun pollMountableFinish self result =
      (
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        pollMountableFinish_
        (
          self
           & result
           & []
        )
    fun queryDefaultHandler self cancellable =
      (
        GioFileClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioAppInfoClass.FFI.fromPtr true
      )
        queryDefaultHandler_
        (
          self
           & cancellable
           & []
        )
    fun queryExists self cancellable = (GioFileClass.FFI.withPtr &&&> GioCancellableClass.FFI.withOptPtr ---> GBool.FFI.fromVal) queryExists_ (self & cancellable)
    fun queryFileType self (flags, cancellable) =
      (
        GioFileClass.FFI.withPtr
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         ---> GioFileType.FFI.fromVal
      )
        queryFileType_
        (
          self
           & flags
           & cancellable
        )
    fun queryFilesystemInfo self (attributes, cancellable) =
      (
        GioFileClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.FFI.fromPtr true
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
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.FFI.fromPtr true
      )
        queryFilesystemInfoFinish_
        (
          self
           & res
           & []
        )
    fun queryInfo
      self
      (
        attributes,
        flags,
        cancellable
      ) =
      (
        GioFileClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.FFI.fromPtr true
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
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.FFI.fromPtr true
      )
        queryInfoFinish_
        (
          self
           & res
           & []
        )
    fun querySettableAttributes self cancellable =
      (
        GioFileClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileAttributeInfoListRecord.FFI.fromPtr true
      )
        querySettableAttributes_
        (
          self
           & cancellable
           & []
        )
    fun queryWritableNamespaces self cancellable =
      (
        GioFileClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileAttributeInfoListRecord.FFI.fromPtr true
      )
        queryWritableNamespaces_
        (
          self
           & cancellable
           & []
        )
    fun read self cancellable =
      (
        GioFileClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInputStreamClass.FFI.fromPtr true
      )
        read_
        (
          self
           & cancellable
           & []
        )
    fun readFinish self res =
      (
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInputStreamClass.FFI.fromPtr true
      )
        readFinish_
        (
          self
           & res
           & []
        )
    fun replace
      self
      (
        etag,
        makeBackup,
        flags,
        cancellable
      ) =
      (
        GioFileClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GBool.FFI.withVal
         &&&> GioFileCreateFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileOutputStreamClass.FFI.fromPtr true
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
    fun replaceContents
      self
      (
        contents,
        etag,
        makeBackup,
        flags,
        cancellable
      ) =
      let
        val length = LargeInt.fromInt (GUInt8CVectorN.length contents)
        val newEtag & () =
          (
            GioFileClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             &&&> Utf8.FFI.withOptPtr
             &&&> GBool.FFI.withVal
             &&&> GioFileCreateFlags.FFI.withVal
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1 && ignore
          )
            replaceContents_
            (
              self
               & contents
               & length
               & etag
               & makeBackup
               & flags
               & NONE
               & cancellable
               & []
            )
      in
        newEtag
      end
    fun replaceContentsFinish self res =
      let
        val newEtag & () =
          (
            GioFileClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1 && ignore
          )
            replaceContentsFinish_
            (
              self
               & res
               & NONE
               & []
            )
      in
        newEtag
      end
    fun replaceFinish self res =
      (
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileOutputStreamClass.FFI.fromPtr true
      )
        replaceFinish_
        (
          self
           & res
           & []
        )
    fun replaceReadwrite
      self
      (
        etag,
        makeBackup,
        flags,
        cancellable
      ) =
      (
        GioFileClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GBool.FFI.withVal
         &&&> GioFileCreateFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileIOStreamClass.FFI.fromPtr true
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
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileIOStreamClass.FFI.fromPtr true
      )
        replaceReadwriteFinish_
        (
          self
           & res
           & []
        )
    fun resolveRelativePath self relativePath = (GioFileClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) resolveRelativePath_ (self & relativePath)
    fun setAttributeByteString
      self
      (
        attribute,
        value,
        flags,
        cancellable
      ) =
      (
        GioFileClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
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
    fun setAttributeInt32
      self
      (
        attribute,
        value,
        flags,
        cancellable
      ) =
      (
        GioFileClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
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
    fun setAttributeInt64
      self
      (
        attribute,
        value,
        flags,
        cancellable
      ) =
      (
        GioFileClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt64.FFI.withVal
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
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
    fun setAttributeString
      self
      (
        attribute,
        value,
        flags,
        cancellable
      ) =
      (
        GioFileClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
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
    fun setAttributeUint32
      self
      (
        attribute,
        value,
        flags,
        cancellable
      ) =
      (
        GioFileClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
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
    fun setAttributeUint64
      self
      (
        attribute,
        value,
        flags,
        cancellable
      ) =
      (
        GioFileClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
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
        val info & () =
          (
            GioFileClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
             &&&> GioFileInfoClass.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GioFileInfoClass.FFI.fromPtr true && ignore
          )
            setAttributesFinish_
            (
              self
               & result
               & NONE
               & []
            )
      in
        info
      end
    fun setAttributesFromInfo
      self
      (
        info,
        flags,
        cancellable
      ) =
      (
        GioFileClass.FFI.withPtr
         &&&> GioFileInfoClass.FFI.withPtr
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        setAttributesFromInfo_
        (
          self
           & info
           & flags
           & cancellable
           & []
        )
    fun setDisplayName self (displayName, cancellable) =
      (
        GioFileClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileClass.FFI.fromPtr true
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
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileClass.FFI.fromPtr true
      )
        setDisplayNameFinish_
        (
          self
           & res
           & []
        )
    fun startMountableFinish self result =
      (
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        startMountableFinish_
        (
          self
           & result
           & []
        )
    fun stopMountableFinish self result =
      (
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        stopMountableFinish_
        (
          self
           & result
           & []
        )
    fun supportsThreadContexts self = (GioFileClass.FFI.withPtr ---> GBool.FFI.fromVal) supportsThreadContexts_ self
    fun trash self cancellable =
      (
        GioFileClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        trash_
        (
          self
           & cancellable
           & []
        )
    fun unmountMountableWithOperationFinish self result =
      (
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        unmountMountableWithOperationFinish_
        (
          self
           & result
           & []
        )
  end
