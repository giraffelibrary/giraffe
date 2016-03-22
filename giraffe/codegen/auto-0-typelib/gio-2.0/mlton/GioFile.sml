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
    val getType_ = _import "g_file_get_type" : unit -> GObjectType.C.val_;
    val newForCommandlineArg_ = _import "mlton_g_file_new_for_commandline_arg" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GioFileClass.C.notnull GioFileClass.C.p;
    val newForPath_ = _import "mlton_g_file_new_for_path" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GioFileClass.C.notnull GioFileClass.C.p;
    val newForUri_ = _import "mlton_g_file_new_for_uri" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GioFileClass.C.notnull GioFileClass.C.p;
    val parseName_ = _import "mlton_g_file_parse_name" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GioFileClass.C.notnull GioFileClass.C.p;
    val appendTo_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_file_append_to" :
              GioFileClass.C.notnull GioFileClass.C.p
               * GioFileCreateFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileOutputStreamClass.C.notnull GioFileOutputStreamClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileOutputStreamClass.C.notnull GioFileOutputStreamClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioFileClass.C.notnull GioFileClass.C.p
               * GioFileCopyFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioFileCreateFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileOutputStreamClass.C.notnull GioFileOutputStreamClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileOutputStreamClass.C.notnull GioFileOutputStreamClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioFileCreateFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileIOStreamClass.C.notnull GioFileIOStreamClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileIOStreamClass.C.notnull GioFileIOStreamClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val dup_ = _import "g_file_dup" : GioFileClass.C.notnull GioFileClass.C.p -> GioFileClass.C.notnull GioFileClass.C.p;
    val ejectMountableWithOperationFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_eject_mountable_with_operation_finish" :
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GioFileQueryInfoFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileEnumeratorClass.C.notnull GioFileEnumeratorClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileEnumeratorClass.C.notnull GioFileEnumeratorClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val equal_ = fn x1 & x2 => (_import "g_file_equal" : GioFileClass.C.notnull GioFileClass.C.p * GioFileClass.C.notnull GioFileClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val findEnclosingMount_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_find_enclosing_mount" :
              GioFileClass.C.notnull GioFileClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioMountClass.C.notnull GioMountClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioMountClass.C.notnull GioMountClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getBasename_ = _import "g_file_get_basename" : GioFileClass.C.notnull GioFileClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getChild_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_get_child" :
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioFileClass.C.notnull GioFileClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileClass.C.notnull GioFileClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getParent_ = _import "g_file_get_parent" : GioFileClass.C.notnull GioFileClass.C.p -> GioFileClass.C.notnull GioFileClass.C.p;
    val getParseName_ = _import "g_file_get_parse_name" : GioFileClass.C.notnull GioFileClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getPath_ = _import "g_file_get_path" : GioFileClass.C.notnull GioFileClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getRelativePath_ = fn x1 & x2 => (_import "g_file_get_relative_path" : GioFileClass.C.notnull GioFileClass.C.p * GioFileClass.C.notnull GioFileClass.C.p -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getUri_ = _import "g_file_get_uri" : GioFileClass.C.notnull GioFileClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getUriScheme_ = _import "g_file_get_uri_scheme" : GioFileClass.C.notnull GioFileClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val hasParent_ = fn x1 & x2 => (_import "g_file_has_parent" : GioFileClass.C.notnull GioFileClass.C.p * GioFileClass.C.notnull GioFileClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val hasPrefix_ = fn x1 & x2 => (_import "g_file_has_prefix" : GioFileClass.C.notnull GioFileClass.C.p * GioFileClass.C.notnull GioFileClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val hasUriScheme_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_has_uri_scheme" :
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iconNew_ = _import "g_file_icon_new" : GioFileClass.C.notnull GioFileClass.C.p -> GioIconClass.C.notnull GioIconClass.C.p;
    val isNative_ = _import "g_file_is_native" : GioFileClass.C.notnull GioFileClass.C.p -> FFI.Bool.C.val_;
    val makeDirectory_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_make_directory" :
              GioFileClass.C.notnull GioFileClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioFileMonitorFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileMonitorClass.C.notnull GioFileMonitorClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioFileMonitorFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileMonitorClass.C.notnull GioFileMonitorClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioFileMonitorFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileMonitorClass.C.notnull GioFileMonitorClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileClass.C.notnull GioFileClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileIOStreamClass.C.notnull GioFileIOStreamClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileIOStreamClass.C.notnull GioFileIOStreamClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioAppInfoClass.C.notnull GioAppInfoClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val queryExists_ = fn x1 & x2 => (_import "g_file_query_exists" : GioFileClass.C.notnull GioFileClass.C.p * unit GioCancellableClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val queryFileType_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_query_file_type" :
              GioFileClass.C.notnull GioFileClass.C.p
               * GioFileQueryInfoFlags.C.val_
               * unit GioCancellableClass.C.p
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
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileInfoClass.C.notnull GioFileInfoClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileInfoClass.C.notnull GioFileInfoClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GioFileQueryInfoFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileInfoClass.C.notnull GioFileInfoClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileInfoClass.C.notnull GioFileInfoClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * unit GioCancellableClass.C.p
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
              GioFileClass.C.notnull GioFileClass.C.p
               * unit GioCancellableClass.C.p
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
              GioFileClass.C.notnull GioFileClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileInputStreamClass.C.notnull GioFileInputStreamClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileInputStreamClass.C.notnull GioFileInputStreamClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * FFI.Bool.C.val_
               * GioFileCreateFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileOutputStreamClass.C.notnull GioFileOutputStreamClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * Utf8.MLton.r1
               * (unit, Utf8.C.notnull) Utf8.MLton.r2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileOutputStreamClass.C.notnull GioFileOutputStreamClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * FFI.Bool.C.val_
               * GioFileCreateFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileIOStreamClass.C.notnull GioFileIOStreamClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileIOStreamClass.C.notnull GioFileIOStreamClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GioFileClass.C.notnull GioFileClass.C.p;
          )
            (
              x1,
              x2,
              x3
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
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GioFileQueryInfoFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
               * GioFileQueryInfoFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int64.C.val_
               * GioFileQueryInfoFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GioFileQueryInfoFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt32.C.val_
               * GioFileQueryInfoFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt64.C.val_
               * GioFileQueryInfoFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, GioFileInfoClass.C.notnull) GioFileInfoClass.C.r
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioFileInfoClass.C.notnull GioFileInfoClass.C.p
               * GioFileQueryInfoFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileClass.C.notnull GioFileClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileClass.C.notnull GioFileClass.C.p;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val supportsThreadContexts_ = _import "g_file_supports_thread_contexts" : GioFileClass.C.notnull GioFileClass.C.p -> FFI.Bool.C.val_;
    val trash_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_trash" :
              GioFileClass.C.notnull GioFileClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioFileClass.C.notnull GioFileClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
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
        GioFileClass.C.withPtr
         &&&> GioFileCreateFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioFileClass.C.withPtr
         &&&> GioFileClass.C.withPtr
         &&&> GioFileCopyFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioFileClass.C.withPtr
         &&&> GioFileCreateFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioFileClass.C.withPtr
         &&&> GioFileCreateFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioFileClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        delete_
        (
          self
           & cancellable
           & []
        )
    fun dup self = (GioFileClass.C.withPtr ---> GioFileClass.C.fromPtr true) dup_ self
    fun ejectMountableWithOperationFinish self result =
      (
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioFileClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileEnumeratorClass.C.fromPtr true
      )
        enumerateChildrenFinish_
        (
          self
           & res
           & []
        )
    fun equal self file2 = (GioFileClass.C.withPtr &&&> GioFileClass.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & file2)
    fun findEnclosingMount self cancellable =
      (
        GioFileClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioMountClass.C.fromPtr true
      )
        findEnclosingMountFinish_
        (
          self
           & res
           & []
        )
    fun getBasename self = (GioFileClass.C.withPtr ---> Utf8.C.fromPtr true) getBasename_ self
    fun getChild self name = (GioFileClass.C.withPtr &&&> Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) getChild_ (self & name)
    fun getChildForDisplayName self displayName =
      (
        GioFileClass.C.withPtr
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
    fun getParent self = (GioFileClass.C.withPtr ---> GioFileClass.C.fromPtr true) getParent_ self
    fun getParseName self = (GioFileClass.C.withPtr ---> Utf8.C.fromPtr true) getParseName_ self
    fun getPath self = (GioFileClass.C.withPtr ---> Utf8.C.fromPtr true) getPath_ self
    fun getRelativePath self descendant = (GioFileClass.C.withPtr &&&> GioFileClass.C.withPtr ---> Utf8.C.fromPtr true) getRelativePath_ (self & descendant)
    fun getUri self = (GioFileClass.C.withPtr ---> Utf8.C.fromPtr true) getUri_ self
    fun getUriScheme self = (GioFileClass.C.withPtr ---> Utf8.C.fromPtr true) getUriScheme_ self
    fun hasParent self parent = (GioFileClass.C.withPtr &&&> GioFileClass.C.withPtr ---> FFI.Bool.C.fromVal) hasParent_ (self & parent)
    fun hasPrefix self prefix = (GioFileClass.C.withPtr &&&> GioFileClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPrefix_ (self & prefix)
    fun hasUriScheme self uriScheme = (GioFileClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasUriScheme_ (self & uriScheme)
    fun iconNew self = (GioFileClass.C.withPtr ---> GioIconClass.C.fromPtr true) iconNew_ self
    fun isNative self = (GioFileClass.C.withPtr ---> FFI.Bool.C.fromVal) isNative_ self
    fun makeDirectory self cancellable =
      (
        GioFileClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioFileMonitorFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioFileMonitorFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioFileMonitorFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioFileClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioFileClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioAppInfoClass.C.fromPtr true
      )
        queryDefaultHandler_
        (
          self
           & cancellable
           & []
        )
    fun queryExists self cancellable = (GioFileClass.C.withPtr &&&> GioCancellableClass.C.withOptPtr ---> FFI.Bool.C.fromVal) queryExists_ (self & cancellable)
    fun queryFileType self flags cancellable =
      (
        GioFileClass.C.withPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioFileClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioFileClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioFileClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> FFI.Bool.C.withVal
         &&&> GioFileCreateFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
            GioFileClass.C.withPtr
             &&&> GioAsyncResultClass.C.withPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioFileClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> FFI.Bool.C.withVal
         &&&> GioFileCreateFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileIOStreamClass.C.fromPtr true
      )
        replaceReadwriteFinish_
        (
          self
           & res
           & []
        )
    fun resolveRelativePath self relativePath = (GioFileClass.C.withPtr &&&> Utf8.C.withPtr ---> GioFileClass.C.fromPtr true) resolveRelativePath_ (self & relativePath)
    fun setAttributeByteString self attribute value flags cancellable =
      (
        GioFileClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int64.C.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt64.C.withVal
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
            GioFileClass.C.withPtr
             &&&> GioAsyncResultClass.C.withPtr
             &&&> GioFileInfoClass.C.withRefOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioFileInfoClass.C.withPtr
         &&&> GioFileQueryInfoFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        stopMountableFinish_
        (
          self
           & result
           & []
        )
    fun supportsThreadContexts self = (GioFileClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsThreadContexts_ self
    fun trash self cancellable =
      (
        GioFileClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioFileClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
