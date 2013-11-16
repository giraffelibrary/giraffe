structure GioFile :>
  GIO_FILE
    where type 'a class_t = 'a GioFileClass.t
    where type filecopyflags_t = GioFileCopyFlags.t
    where type 'a fileenumeratorclass_t = 'a GioFileEnumeratorClass.t
    where type 'a mountclass_t = 'a GioMountClass.t
    where type 'a iconclass_t = 'a GioIconClass.t
    where type 'a filemonitorclass_t = 'a GioFileMonitorClass.t
    where type filemonitorflags_t = GioFileMonitorFlags.t
    where type 'a appinfoclass_t = 'a GioAppInfoClass.t
    where type filetype_t = GioFileType.t
    where type fileattributeinfolistrecord_t = GioFileAttributeInfoListRecord.t
    where type 'a fileinputstreamclass_t = 'a GioFileInputStreamClass.t
    where type 'a fileoutputstreamclass_t = 'a GioFileOutputStreamClass.t
    where type filecreateflags_t = GioFileCreateFlags.t
    where type 'a fileiostreamclass_t = 'a GioFileIOStreamClass.t
    where type filequeryinfoflags_t = GioFileQueryInfoFlags.t
    where type 'a fileinfoclass_t = 'a GioFileInfoClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_file_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val newForCommandlineArg_ = call (load_sym libgio "g_file_new_for_commandline_arg") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newForPath_ = call (load_sym libgio "g_file_new_for_path") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newForUri_ = call (load_sym libgio "g_file_new_for_uri") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val parseName_ = call (load_sym libgio "g_file_parse_name") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val appendTo_ =
        call (load_sym libgio "g_file_append_to")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GioFileCreateFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val appendToFinish_ =
        call (load_sym libgio "g_file_append_to_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val copyAttributes_ =
        call (load_sym libgio "g_file_copy_attributes")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GioFileCopyFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val copyFinish_ =
        call (load_sym libgio "g_file_copy_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val create_ =
        call (load_sym libgio "g_file_create")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GioFileCreateFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val createFinish_ =
        call (load_sym libgio "g_file_create_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val createReadwrite_ =
        call (load_sym libgio "g_file_create_readwrite")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GioFileCreateFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val createReadwriteFinish_ =
        call (load_sym libgio "g_file_create_readwrite_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val delete_ =
        call (load_sym libgio "g_file_delete")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val dup_ = call (load_sym libgio "g_file_dup") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val ejectMountableWithOperationFinish_ =
        call (load_sym libgio "g_file_eject_mountable_with_operation_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val enumerateChildren_ =
        call (load_sym libgio "g_file_enumerate_children")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GioFileQueryInfoFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val enumerateChildrenFinish_ =
        call (load_sym libgio "g_file_enumerate_children_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val equal_ = call (load_sym libgio "g_file_equal") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val findEnclosingMount_ =
        call (load_sym libgio "g_file_find_enclosing_mount")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val findEnclosingMountFinish_ =
        call (load_sym libgio "g_file_find_enclosing_mount_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val getBasename_ = call (load_sym libgio "g_file_get_basename") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getChild_ = call (load_sym libgio "g_file_get_child") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getChildForDisplayName_ =
        call (load_sym libgio "g_file_get_child_for_display_name")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val getParent_ = call (load_sym libgio "g_file_get_parent") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getParseName_ = call (load_sym libgio "g_file_get_parse_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getPath_ = call (load_sym libgio "g_file_get_path") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getRelativePath_ = call (load_sym libgio "g_file_get_relative_path") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getUri_ = call (load_sym libgio "g_file_get_uri") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getUriScheme_ = call (load_sym libgio "g_file_get_uri_scheme") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val hasParent_ = call (load_sym libgio "g_file_has_parent") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val hasPrefix_ = call (load_sym libgio "g_file_has_prefix") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val hasUriScheme_ = call (load_sym libgio "g_file_has_uri_scheme") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val iconNew_ = call (load_sym libgio "g_file_icon_new") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val isNative_ = call (load_sym libgio "g_file_is_native") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val makeDirectory_ =
        call (load_sym libgio "g_file_make_directory")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val makeDirectoryWithParents_ =
        call (load_sym libgio "g_file_make_directory_with_parents")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val makeSymbolicLink_ =
        call (load_sym libgio "g_file_make_symbolic_link")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val monitor_ =
        call (load_sym libgio "g_file_monitor")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GioFileMonitorFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val monitorDirectory_ =
        call (load_sym libgio "g_file_monitor_directory")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GioFileMonitorFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val monitorFile_ =
        call (load_sym libgio "g_file_monitor_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GioFileMonitorFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val mountEnclosingVolumeFinish_ =
        call (load_sym libgio "g_file_mount_enclosing_volume_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val mountMountableFinish_ =
        call (load_sym libgio "g_file_mount_mountable_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val openReadwrite_ =
        call (load_sym libgio "g_file_open_readwrite")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val openReadwriteFinish_ =
        call (load_sym libgio "g_file_open_readwrite_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val pollMountableFinish_ =
        call (load_sym libgio "g_file_poll_mountable_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val queryDefaultHandler_ =
        call (load_sym libgio "g_file_query_default_handler")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val queryExists_ = call (load_sym libgio "g_file_query_exists") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.Bool.PolyML.VAL)
      val queryFileType_ =
        call (load_sym libgio "g_file_query_file_type")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GioFileQueryInfoFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             --> GioFileType.PolyML.VAL
          )
      val queryFilesystemInfo_ =
        call (load_sym libgio "g_file_query_filesystem_info")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val queryFilesystemInfoFinish_ =
        call (load_sym libgio "g_file_query_filesystem_info_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val queryInfo_ =
        call (load_sym libgio "g_file_query_info")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GioFileQueryInfoFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val queryInfoFinish_ =
        call (load_sym libgio "g_file_query_info_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val querySettableAttributes_ =
        call (load_sym libgio "g_file_query_settable_attributes")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GioFileAttributeInfoListRecord.PolyML.PTR
          )
      val queryWritableNamespaces_ =
        call (load_sym libgio "g_file_query_writable_namespaces")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GioFileAttributeInfoListRecord.PolyML.PTR
          )
      val read_ =
        call (load_sym libgio "g_file_read")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val readFinish_ =
        call (load_sym libgio "g_file_read_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val replace_ =
        call (load_sym libgio "g_file_replace")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> FFI.Bool.PolyML.VAL
             &&> GioFileCreateFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val replaceContentsFinish_ =
        call (load_sym libgio "g_file_replace_contents_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.OUTREF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val replaceFinish_ =
        call (load_sym libgio "g_file_replace_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val replaceReadwrite_ =
        call (load_sym libgio "g_file_replace_readwrite")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> FFI.Bool.PolyML.VAL
             &&> GioFileCreateFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val replaceReadwriteFinish_ =
        call (load_sym libgio "g_file_replace_readwrite_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val resolveRelativePath_ = call (load_sym libgio "g_file_resolve_relative_path") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val setAttributeByteString_ =
        call (load_sym libgio "g_file_set_attribute_byte_string")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GioFileQueryInfoFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setAttributeInt32_ =
        call (load_sym libgio "g_file_set_attribute_int32")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             &&> GioFileQueryInfoFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setAttributeInt64_ =
        call (load_sym libgio "g_file_set_attribute_int64")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int64.PolyML.VAL
             &&> GioFileQueryInfoFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setAttributeString_ =
        call (load_sym libgio "g_file_set_attribute_string")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GioFileQueryInfoFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setAttributeUint32_ =
        call (load_sym libgio "g_file_set_attribute_uint32")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.UInt32.PolyML.VAL
             &&> GioFileQueryInfoFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setAttributeUint64_ =
        call (load_sym libgio "g_file_set_attribute_uint64")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.UInt64.PolyML.VAL
             &&> GioFileQueryInfoFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setAttributesFinish_ =
        call (load_sym libgio "g_file_set_attributes_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setAttributesFromInfo_ =
        call (load_sym libgio "g_file_set_attributes_from_info")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GioFileQueryInfoFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setDisplayName_ =
        call (load_sym libgio "g_file_set_display_name")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val setDisplayNameFinish_ =
        call (load_sym libgio "g_file_set_display_name_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val startMountableFinish_ =
        call (load_sym libgio "g_file_start_mountable_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val stopMountableFinish_ =
        call (load_sym libgio "g_file_stop_mountable_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val supportsThreadContexts_ = call (load_sym libgio "g_file_supports_thread_contexts") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val trash_ =
        call (load_sym libgio "g_file_trash")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val unmountMountableWithOperationFinish_ =
        call (load_sym libgio "g_file_unmount_mountable_with_operation_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
    end
    type 'a class_t = 'a GioFileClass.t
    type filecopyflags_t = GioFileCopyFlags.t
    type 'a fileenumeratorclass_t = 'a GioFileEnumeratorClass.t
    type 'a mountclass_t = 'a GioMountClass.t
    type 'a iconclass_t = 'a GioIconClass.t
    type 'a filemonitorclass_t = 'a GioFileMonitorClass.t
    type filemonitorflags_t = GioFileMonitorFlags.t
    type 'a appinfoclass_t = 'a GioAppInfoClass.t
    type filetype_t = GioFileType.t
    type fileattributeinfolistrecord_t = GioFileAttributeInfoListRecord.t
    type 'a fileinputstreamclass_t = 'a GioFileInputStreamClass.t
    type 'a fileoutputstreamclass_t = 'a GioFileOutputStreamClass.t
    type filecreateflags_t = GioFileCreateFlags.t
    type 'a fileiostreamclass_t = 'a GioFileIOStreamClass.t
    type filequeryinfoflags_t = GioFileQueryInfoFlags.t
    type 'a fileinfoclass_t = 'a GioFileInfoClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newForCommandlineArg arg = (FFI.String.C.withConstPtr ---> GioFileClass.C.fromPtr true) newForCommandlineArg_ arg
    fun newForPath path = (FFI.String.C.withConstPtr ---> GioFileClass.C.fromPtr true) newForPath_ path
    fun newForUri uri = (FFI.String.C.withConstPtr ---> GioFileClass.C.fromPtr true) newForUri_ uri
    fun parseName parseName = (FFI.String.C.withConstPtr ---> GioFileClass.C.fromPtr true) parseName_ parseName
    fun appendTo self flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GioFileCreateFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
         ---> GioMountClass.C.fromPtr true
      )
        findEnclosingMountFinish_
        (
          self
           & res
           & []
        )
    fun getBasename self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getBasename_ self
    fun getChild self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioFileClass.C.fromPtr true) getChild_ (self & name)
    fun getChildForDisplayName self displayName =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GioFileClass.C.fromPtr true
      )
        getChildForDisplayName_
        (
          self
           & displayName
           & []
        )
    fun getParent self = (GObjectObjectClass.C.withPtr ---> GioFileClass.C.fromPtr true) getParent_ self
    fun getParseName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getParseName_ self
    fun getPath self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getPath_ self
    fun getRelativePath self descendant = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getRelativePath_ (self & descendant)
    fun getUri self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getUri_ self
    fun getUriScheme self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getUriScheme_ self
    fun hasParent self parent = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasParent_ (self & parent)
    fun hasPrefix self prefix = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPrefix_ (self & prefix)
    fun hasUriScheme self uriScheme = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) hasUriScheme_ (self & uriScheme)
    fun iconNew self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr true) iconNew_ self
    fun isNative self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isNative_ self
    fun makeDirectory self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Bool.C.withVal
         &&&> GioFileCreateFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
             &&&> FFI.String.C.withRefConstOptPtr
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.String.C.fromPtr true && FFI.Bool.C.fromVal
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.Bool.C.withVal
         &&&> GioFileCreateFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
         ---> GioFileIOStreamClass.C.fromPtr true
      )
        replaceReadwriteFinish_
        (
          self
           & res
           & []
        )
    fun resolveRelativePath self relativePath = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioFileClass.C.fromPtr true) resolveRelativePath_ (self & relativePath)
    fun setAttributeByteString self attribute value flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int64.C.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.UInt64.C.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
             &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        unmountMountableWithOperationFinish_
        (
          self
           & result
           & []
        )
  end
