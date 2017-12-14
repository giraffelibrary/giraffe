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
    val getType_ = _import "g_file_get_type" : unit -> GObjectType.FFI.val_;
    val newForCommandlineArg_ = _import "mlton_g_file_new_for_commandline_arg" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
    val newForPath_ = _import "mlton_g_file_new_for_path" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
    val newForUri_ = _import "mlton_g_file_new_for_uri" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
    val parseName_ = _import "mlton_g_file_parse_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
    val appendTo_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_file_append_to" :
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioFileCreateFlags.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileOutputStreamClass.FFI.notnull GioFileOutputStreamClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileOutputStreamClass.FFI.notnull GioFileOutputStreamClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioFileCopyFlags.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioFileCreateFlags.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileOutputStreamClass.FFI.notnull GioFileOutputStreamClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileOutputStreamClass.FFI.notnull GioFileOutputStreamClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioFileCreateFlags.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileIOStreamClass.FFI.notnull GioFileIOStreamClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileIOStreamClass.FFI.notnull GioFileIOStreamClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val dup_ = _import "g_file_dup" : GioFileClass.FFI.notnull GioFileClass.FFI.p -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
    val ejectMountableFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_eject_mountable_finish" :
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val ejectMountableWithOperationFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_eject_mountable_with_operation_finish" :
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioFileQueryInfoFlags.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileEnumeratorClass.FFI.notnull GioFileEnumeratorClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileEnumeratorClass.FFI.notnull GioFileEnumeratorClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val equal_ = fn x1 & x2 => (_import "g_file_equal" : GioFileClass.FFI.notnull GioFileClass.FFI.p * GioFileClass.FFI.notnull GioFileClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val findEnclosingMount_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_find_enclosing_mount" :
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioMountClass.FFI.notnull GioMountClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioMountClass.FFI.notnull GioMountClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getBasename_ = _import "g_file_get_basename" : GioFileClass.FFI.notnull GioFileClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getChild_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_get_child" :
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getParent_ = _import "g_file_get_parent" : GioFileClass.FFI.notnull GioFileClass.FFI.p -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
    val getParseName_ = _import "g_file_get_parse_name" : GioFileClass.FFI.notnull GioFileClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getPath_ = _import "g_file_get_path" : GioFileClass.FFI.notnull GioFileClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getRelativePath_ = fn x1 & x2 => (_import "g_file_get_relative_path" : GioFileClass.FFI.notnull GioFileClass.FFI.p * GioFileClass.FFI.notnull GioFileClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val getUri_ = _import "g_file_get_uri" : GioFileClass.FFI.notnull GioFileClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUriScheme_ = _import "g_file_get_uri_scheme" : GioFileClass.FFI.notnull GioFileClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val hasParent_ = fn x1 & x2 => (_import "g_file_has_parent" : GioFileClass.FFI.notnull GioFileClass.FFI.p * GioFileClass.FFI.notnull GioFileClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val hasPrefix_ = fn x1 & x2 => (_import "g_file_has_prefix" : GioFileClass.FFI.notnull GioFileClass.FFI.p * GioFileClass.FFI.notnull GioFileClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val hasUriScheme_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_has_uri_scheme" :
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iconNew_ = _import "g_file_icon_new" : GioFileClass.FFI.notnull GioFileClass.FFI.p -> GioIconClass.FFI.notnull GioIconClass.FFI.p;
    val isNative_ = _import "g_file_is_native" : GioFileClass.FFI.notnull GioFileClass.FFI.p -> GBool.FFI.val_;
    val loadContents_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & (x6, x7)
         & x8 =>
          (
            _import "mlton_g_file_load_contents" :
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * GUInt8CVectorN.MLton.r1
               * (unit, GUInt8CVectorN.FFI.notnull) GUInt8CVectorN.MLton.r2
               * GUInt64.FFI.ref_
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
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
    val loadContentsFinish_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & (x6, x7)
         & x8 =>
          (
            _import "mlton_g_file_load_contents_finish" :
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * GUInt8CVectorN.MLton.r1
               * (unit, GUInt8CVectorN.FFI.notnull) GUInt8CVectorN.MLton.r2
               * GUInt64.FFI.ref_
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
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
    val loadPartialContentsFinish_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & (x6, x7)
         & x8 =>
          (
            _import "mlton_g_file_load_partial_contents_finish" :
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * GUInt8CVectorN.MLton.r1
               * (unit, GUInt8CVectorN.FFI.notnull) GUInt8CVectorN.MLton.r2
               * GUInt64.FFI.ref_
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
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
    val makeDirectory_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_make_directory" :
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioFileMonitorFlags.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileMonitorClass.FFI.notnull GioFileMonitorClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioFileMonitorFlags.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileMonitorClass.FFI.notnull GioFileMonitorClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioFileMonitorFlags.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileMonitorClass.FFI.notnull GioFileMonitorClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileIOStreamClass.FFI.notnull GioFileIOStreamClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileIOStreamClass.FFI.notnull GioFileIOStreamClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val queryExists_ = fn x1 & x2 => (_import "g_file_query_exists" : GioFileClass.FFI.notnull GioFileClass.FFI.p * unit GioCancellableClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val queryFileType_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_query_file_type" :
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioFileQueryInfoFlags.FFI.val_
               * unit GioCancellableClass.FFI.p
               -> GioFileType.FFI.val_;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileInfoClass.FFI.notnull GioFileInfoClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileInfoClass.FFI.notnull GioFileInfoClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioFileQueryInfoFlags.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileInfoClass.FFI.notnull GioFileInfoClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileInfoClass.FFI.notnull GioFileInfoClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileAttributeInfoListRecord.FFI.notnull GioFileAttributeInfoListRecord.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileAttributeInfoListRecord.FFI.notnull GioFileAttributeInfoListRecord.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileInputStreamClass.FFI.notnull GioFileInputStreamClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileInputStreamClass.FFI.notnull GioFileInputStreamClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GBool.FFI.val_
               * GioFileCreateFlags.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileOutputStreamClass.FFI.notnull GioFileOutputStreamClass.FFI.p;
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
    val replaceContents_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & x7
         & x8
         & (x9, x10)
         & x11
         & x12 =>
          (
            _import "mlton_g_file_replace_contents" :
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GUInt8CVectorN.MLton.p1
               * GUInt8CVectorN.FFI.notnull GUInt8CVectorN.MLton.p2
               * GUInt64.FFI.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GBool.FFI.val_
               * GioFileCreateFlags.FFI.val_
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
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
              x8,
              x9,
              x10,
              x11,
              x12
            )
    val replaceContentsFinish_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_file_replace_contents_finish" :
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileOutputStreamClass.FFI.notnull GioFileOutputStreamClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GBool.FFI.val_
               * GioFileCreateFlags.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileIOStreamClass.FFI.notnull GioFileIOStreamClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileIOStreamClass.FFI.notnull GioFileIOStreamClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioFileQueryInfoFlags.FFI.val_
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.val_
               * GioFileQueryInfoFlags.FFI.val_
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt64.FFI.val_
               * GioFileQueryInfoFlags.FFI.val_
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioFileQueryInfoFlags.FFI.val_
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt32.FFI.val_
               * GioFileQueryInfoFlags.FFI.val_
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt64.FFI.val_
               * GioFileQueryInfoFlags.FFI.val_
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, GioFileInfoClass.FFI.notnull) GioFileInfoClass.FFI.r
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioFileInfoClass.FFI.notnull GioFileInfoClass.FFI.p
               * GioFileQueryInfoFlags.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val supportsThreadContexts_ = _import "g_file_supports_thread_contexts" : GioFileClass.FFI.notnull GioFileClass.FFI.p -> GBool.FFI.val_;
    val trash_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_trash" :
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val unmountMountableFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_unmount_mountable_finish" :
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
    fun ejectMountableFinish self result =
      (
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        ejectMountableFinish_
        (
          self
           & result
           & []
        )
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
    fun unmountMountableFinish self result =
      (
        GioFileClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        unmountMountableFinish_
        (
          self
           & result
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
