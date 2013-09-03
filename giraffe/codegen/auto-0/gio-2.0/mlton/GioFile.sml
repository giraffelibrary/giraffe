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
    where type fileattributetype_t = GioFileAttributeType.t
    where type filequeryinfoflags_t = GioFileQueryInfoFlags.t
    where type 'a fileinfoclass_t = 'a GioFileInfoClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t =
  struct
    val getType_ = _import "g_file_get_type" : unit -> GObjectType.C.val_;
    val hash_ = _import "g_file_hash" : unit -> FFI.UInt32.val_;
    val newForCommandlineArg_ = _import "mlton_g_file_new_for_commandline_arg" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newForPath_ = _import "mlton_g_file_new_for_path" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newForUri_ = _import "mlton_g_file_new_for_uri" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val parseName_ = _import "mlton_g_file_parse_name" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val appendTo_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_file_append_to" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GioFileCreateFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val appendToFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_append_to_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val copyAttributes_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_file_copy_attributes" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GioFileCopyFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val copyFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_copy_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val create_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_file_create" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GioFileCreateFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val createFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_create_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val createReadwrite_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_file_create_readwrite" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GioFileCreateFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val createReadwriteFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_create_readwrite_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val delete_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_delete" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val dup_ = _import "g_file_dup" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val ejectMountableWithOperationFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_eject_mountable_with_operation_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val enumerateChildren_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_file_enumerate_children" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GioFileQueryInfoFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val enumerateChildrenFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_enumerate_children_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val equal_ = fn x1 & x2 => (_import "g_file_equal" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;) (x1, x2)
    val findEnclosingMount_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_find_enclosing_mount" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val findEnclosingMountFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_find_enclosing_mount_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getBasename_ = _import "g_file_get_basename" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getChild_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_get_child" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getChildForDisplayName_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_file_get_child_for_display_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getParent_ = _import "g_file_get_parent" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getParseName_ = _import "g_file_get_parse_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getPath_ = _import "g_file_get_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getRelativePath_ = fn x1 & x2 => (_import "g_file_get_relative_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;) (x1, x2)
    val getUri_ = _import "g_file_get_uri" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getUriScheme_ = _import "g_file_get_uri_scheme" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val hasParent_ = fn x1 & x2 => (_import "g_file_has_parent" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;) (x1, x2)
    val hasPrefix_ = fn x1 & x2 => (_import "g_file_has_prefix" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;) (x1, x2)
    val hasUriScheme_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_has_uri_scheme" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iconNew_ = _import "g_file_icon_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val isNative_ = _import "g_file_is_native" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val makeDirectory_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_make_directory" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val makeDirectoryWithParents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_make_directory_with_parents" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val makeSymbolicLink_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_file_make_symbolic_link" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val monitor_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_file_monitor" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GioFileMonitorFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val monitorDirectory_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_file_monitor_directory" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GioFileMonitorFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val monitorFile_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_file_monitor_file" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GioFileMonitorFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val mountEnclosingVolumeFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_mount_enclosing_volume_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val mountMountableFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_mount_mountable_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val openReadwrite_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_open_readwrite" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val openReadwriteFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_open_readwrite_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val pollMountableFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_poll_mountable_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val queryDefaultHandler_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_query_default_handler" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val queryExists_ = fn x1 & x2 => (_import "g_file_query_exists" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> FFI.Bool.val_;) (x1, x2)
    val queryFileType_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_query_file_type" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GioFileQueryInfoFlags.C.val_
               * unit GObjectObjectClass.C.p
               -> GioFileType.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val queryFilesystemInfo_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_file_query_filesystem_info" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val queryFilesystemInfoFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_query_filesystem_info_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val queryInfo_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_file_query_info" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GioFileQueryInfoFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val queryInfoFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_query_info_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val querySettableAttributes_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_query_settable_attributes" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileAttributeInfoListRecord.C.notnull GioFileAttributeInfoListRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val queryWritableNamespaces_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_query_writable_namespaces" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileAttributeInfoListRecord.C.notnull GioFileAttributeInfoListRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val read_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_read" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val readFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_read_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val replace_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_file_replace" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Bool.val_
               * GioFileCreateFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
    val replaceContentsFinish_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_file_replace_contents_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t ref
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val replaceFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_replace_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val replaceReadwrite_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_file_replace_readwrite" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Bool.val_
               * GioFileCreateFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
    val replaceReadwriteFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_replace_readwrite_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val resolveRelativePath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_resolve_relative_path" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val setAttribute_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_file_set_attribute" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GioFileAttributeType.C.val_
               * GioFileQueryInfoFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
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
    val setAttributeByteString_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6
         & x7
         & x8 =>
          (
            _import "mlton_g_file_set_attribute_byte_string" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * GioFileQueryInfoFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
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
    val setAttributeInt32_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_file_set_attribute_int32" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.val_
               * GioFileQueryInfoFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
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
    val setAttributeInt64_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_file_set_attribute_int64" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int64.val_
               * GioFileQueryInfoFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
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
    val setAttributeString_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6
         & x7
         & x8 =>
          (
            _import "mlton_g_file_set_attribute_string" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * GioFileQueryInfoFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
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
    val setAttributeUint32_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_file_set_attribute_uint32" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.UInt32.val_
               * GioFileQueryInfoFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
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
    val setAttributeUint64_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_file_set_attribute_uint64" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.UInt64.val_
               * GioFileQueryInfoFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
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
    val setAttributesFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_file_set_attributes_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAttributesFromInfo_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_file_set_attributes_from_info" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GioFileQueryInfoFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setDisplayName_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_file_set_display_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setDisplayNameFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_set_display_name_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val startMountableFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_start_mountable_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val stopMountableFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_stop_mountable_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val supportsThreadContexts_ = _import "g_file_supports_thread_contexts" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val trash_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_trash" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val unmountMountableWithOperationFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_unmount_mountable_with_operation_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
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
    type fileattributetype_t = GioFileAttributeType.t
    type filequeryinfoflags_t = GioFileQueryInfoFlags.t
    type 'a fileinfoclass_t = 'a GioFileInfoClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun hash () = (I ---> FFI.UInt32.fromVal) hash_ ()
    fun newForCommandlineArg arg = (FFI.String.withConstPtr ---> GioFileClass.C.fromPtr true) newForCommandlineArg_ arg
    fun newForPath path = (FFI.String.withConstPtr ---> GioFileClass.C.fromPtr true) newForPath_ path
    fun newForUri uri = (FFI.String.withConstPtr ---> GioFileClass.C.fromPtr true) newForUri_ uri
    fun parseName parseName = (FFI.String.withConstPtr ---> GioFileClass.C.fromPtr true) parseName_ parseName
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
         ---> FFI.Bool.fromVal
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
         ---> FFI.Bool.fromVal
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
         ---> FFI.Bool.fromVal
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
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
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
    fun equal self file2 = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) equal_ (self & file2)
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
    fun getBasename self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getBasename_ self
    fun getChild self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GioFileClass.C.fromPtr true) getChild_ (self & name)
    fun getChildForDisplayName self displayName =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
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
    fun getParseName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getParseName_ self
    fun getPath self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getPath_ self
    fun getRelativePath self descendant = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getRelativePath_ (self & descendant)
    fun getUri self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getUri_ self
    fun getUriScheme self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getUriScheme_ self
    fun hasParent self parent = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) hasParent_ (self & parent)
    fun hasPrefix self prefix = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) hasPrefix_ (self & prefix)
    fun hasUriScheme self uriScheme = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) hasUriScheme_ (self & uriScheme)
    fun iconNew self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr true) iconNew_ self
    fun isNative self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isNative_ self
    fun makeDirectory self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
         ---> FFI.Bool.fromVal
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
         ---> FFI.Bool.fromVal
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
    fun queryExists self cancellable = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> FFI.Bool.fromVal) queryExists_ (self & cancellable)
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
         &&&> FFI.String.withConstPtr
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
         &&&> FFI.String.withConstPtr
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
         &&&> FFI.String.withConstOptPtr
         &&&> FFI.Bool.withVal
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
             &&&> FFI.String.withRefConstOptPtr
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.String.fromPtr true && FFI.Bool.fromVal
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
         &&&> FFI.String.withConstOptPtr
         &&&> FFI.Bool.withVal
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
    fun resolveRelativePath self relativePath = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GioFileClass.C.fromPtr true) resolveRelativePath_ (self & relativePath)
    fun setAttribute self attribute type' flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GioFileAttributeType.C.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        setAttribute_
        (
          self
           & attribute
           & type'
           & flags
           & cancellable
           & []
        )
    fun setAttributeByteString self attribute value flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int64.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.UInt32.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.UInt64.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
             ---> GioFileInfoClass.C.fromPtr true && FFI.Bool.fromVal
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
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
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
         ---> FFI.Bool.fromVal
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
         ---> FFI.Bool.fromVal
      )
        stopMountableFinish_
        (
          self
           & result
           & []
        )
    fun supportsThreadContexts self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) supportsThreadContexts_ self
    fun trash self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
         ---> FFI.Bool.fromVal
      )
        unmountMountableWithOperationFinish_
        (
          self
           & result
           & []
        )
  end
