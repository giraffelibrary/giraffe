structure GioFile :>
  GIO_FILE
    where type 'a class = 'a GioFileClass.class
    where type file_copy_flags_t = GioFileCopyFlags.t
    where type 'a file_enumerator_class = 'a GioFileEnumeratorClass.class
    where type 'a mount_class = 'a GioMountClass.class
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
    val getType_ = _import "g_file_get_type" : unit -> GObjectType.FFI.val_;
    val newForCommandlineArg_ = _import "mlton_g_file_new_for_commandline_arg" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
    val newForCommandlineArgAndCwd_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_file_new_for_commandline_arg_and_cwd" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val newForPath_ = _import "mlton_g_file_new_for_path" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
    val newForUri_ = _import "mlton_g_file_new_for_uri" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
    val newTmp_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_file_new_tmp" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * (GioFileIOStreamClass.FFI.opt, GioFileIOStreamClass.FFI.non_opt) GioFileIOStreamClass.FFI.r
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val parseName_ = _import "mlton_g_file_parse_name" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
    val appendTo_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_file_append_to" :
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioFileCreateFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileOutputStreamClass.FFI.non_opt GioFileOutputStreamClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileOutputStreamClass.FFI.non_opt GioFileOutputStreamClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioFileCopyFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioFileCreateFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileOutputStreamClass.FFI.non_opt GioFileOutputStreamClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileOutputStreamClass.FFI.non_opt GioFileOutputStreamClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioFileCreateFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileIOStreamClass.FFI.non_opt GioFileIOStreamClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileIOStreamClass.FFI.non_opt GioFileIOStreamClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val deleteFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_delete_finish" :
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val dup_ = _import "g_file_dup" : GioFileClass.FFI.non_opt GioFileClass.FFI.p -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
    val ejectMountableFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_eject_mountable_finish" :
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioFileQueryInfoFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileEnumeratorClass.FFI.non_opt GioFileEnumeratorClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileEnumeratorClass.FFI.non_opt GioFileEnumeratorClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val equal_ = fn x1 & x2 => (_import "g_file_equal" : GioFileClass.FFI.non_opt GioFileClass.FFI.p * GioFileClass.FFI.non_opt GioFileClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val findEnclosingMount_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_find_enclosing_mount" :
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioMountClass.FFI.non_opt GioMountClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioMountClass.FFI.non_opt GioMountClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getBasename_ = _import "g_file_get_basename" : GioFileClass.FFI.non_opt GioFileClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getChild_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_get_child" :
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getParent_ = _import "g_file_get_parent" : GioFileClass.FFI.non_opt GioFileClass.FFI.p -> GioFileClass.FFI.opt GioFileClass.FFI.p;
    val getParseName_ = _import "g_file_get_parse_name" : GioFileClass.FFI.non_opt GioFileClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPath_ = _import "g_file_get_path" : GioFileClass.FFI.non_opt GioFileClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getRelativePath_ = fn x1 & x2 => (_import "g_file_get_relative_path" : GioFileClass.FFI.non_opt GioFileClass.FFI.p * GioFileClass.FFI.non_opt GioFileClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;) (x1, x2)
    val getUri_ = _import "g_file_get_uri" : GioFileClass.FFI.non_opt GioFileClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getUriScheme_ = _import "g_file_get_uri_scheme" : GioFileClass.FFI.non_opt GioFileClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val hasParent_ = fn x1 & x2 => (_import "g_file_has_parent" : GioFileClass.FFI.non_opt GioFileClass.FFI.p * GioFileClass.FFI.opt GioFileClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val hasPrefix_ = fn x1 & x2 => (_import "g_file_has_prefix" : GioFileClass.FFI.non_opt GioFileClass.FFI.p * GioFileClass.FFI.non_opt GioFileClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val hasUriScheme_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_file_has_uri_scheme" :
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val hash_ = _import "g_file_hash" : GioFileClass.FFI.non_opt GioFileClass.FFI.p -> GUInt.FFI.val_;
    val isNative_ = _import "g_file_is_native" : GioFileClass.FFI.non_opt GioFileClass.FFI.p -> GBool.FFI.val_;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * GUInt8CArrayN.MLton.r1
               * (GUInt8CArrayN.FFI.opt, GUInt8CArrayN.FFI.non_opt) GUInt8CArrayN.MLton.r2
               * GSize.FFI.ref_
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * GUInt8CArrayN.MLton.r1
               * (GUInt8CArrayN.FFI.opt, GUInt8CArrayN.FFI.non_opt) GUInt8CArrayN.MLton.r2
               * GSize.FFI.ref_
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * GUInt8CArrayN.MLton.r1
               * (GUInt8CArrayN.FFI.opt, GUInt8CArrayN.FFI.non_opt) GUInt8CArrayN.MLton.r2
               * GSize.FFI.ref_
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val makeDirectoryFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_make_directory_finish" :
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val measureDiskUsageFinish_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "g_file_measure_disk_usage_finish" :
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * GUInt64.FFI.ref_
               * GUInt64.FFI.ref_
               * GUInt64.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
    val monitor_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_file_monitor" :
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioFileMonitorFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileMonitorClass.FFI.non_opt GioFileMonitorClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioFileMonitorFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileMonitorClass.FFI.non_opt GioFileMonitorClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioFileMonitorFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileMonitorClass.FFI.non_opt GioFileMonitorClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileIOStreamClass.FFI.non_opt GioFileIOStreamClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileIOStreamClass.FFI.non_opt GioFileIOStreamClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioAppInfoClass.FFI.non_opt GioAppInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val queryExists_ = fn x1 & x2 => (_import "g_file_query_exists" : GioFileClass.FFI.non_opt GioFileClass.FFI.p * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val queryFileType_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_query_file_type" :
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioFileQueryInfoFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioFileQueryInfoFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileAttributeInfoListRecord.FFI.non_opt GioFileAttributeInfoListRecord.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileAttributeInfoListRecord.FFI.non_opt GioFileAttributeInfoListRecord.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileInputStreamClass.FFI.non_opt GioFileInputStreamClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileInputStreamClass.FFI.non_opt GioFileInputStreamClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GBool.FFI.val_
               * GioFileCreateFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileOutputStreamClass.FFI.non_opt GioFileOutputStreamClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GBool.FFI.val_
               * GioFileCreateFlags.FFI.val_
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileOutputStreamClass.FFI.non_opt GioFileOutputStreamClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GBool.FFI.val_
               * GioFileCreateFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileIOStreamClass.FFI.non_opt GioFileIOStreamClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileIOStreamClass.FFI.non_opt GioFileIOStreamClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioFileQueryInfoFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               * GioFileQueryInfoFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt64.FFI.val_
               * GioFileQueryInfoFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioFileQueryInfoFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt32.FFI.val_
               * GioFileQueryInfoFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt64.FFI.val_
               * GioFileQueryInfoFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GioFileInfoClass.FFI.opt, GioFileInfoClass.FFI.non_opt) GioFileInfoClass.FFI.r
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p
               * GioFileQueryInfoFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val supportsThreadContexts_ = _import "g_file_supports_thread_contexts" : GioFileClass.FFI.non_opt GioFileClass.FFI.p -> GBool.FFI.val_;
    val trash_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_trash" :
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val trashFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_trash_finish" :
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioFileClass.FFI.non_opt GioFileClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
    fun newForCommandlineArg arg = (Utf8.FFI.withPtr 0 ---> GioFileClass.FFI.fromPtr true) newForCommandlineArg_ arg
    fun newForCommandlineArgAndCwd (arg, cwd) = (Utf8.FFI.withPtr 0 &&&> Utf8.FFI.withPtr 0 ---> GioFileClass.FFI.fromPtr true) newForCommandlineArgAndCwd_ (arg & cwd)
    fun newForPath path = (Utf8.FFI.withPtr 0 ---> GioFileClass.FFI.fromPtr true) newForPath_ path
    fun newForUri uri = (Utf8.FFI.withPtr 0 ---> GioFileClass.FFI.fromPtr true) newForUri_ uri
    fun newTmp tmpl =
      let
        val iostream & retVal =
          (
            Utf8.FFI.withOptPtr 0
             &&&> GioFileIOStreamClass.FFI.withRefOptPtr true
             &&&> GLibErrorRecord.handleError
             ---> GioFileIOStreamClass.FFI.fromPtr true && GioFileClass.FFI.fromPtr true
          )
            newTmp_
            (
              tmpl
               & NONE
               & []
            )
      in
        (retVal, iostream)
      end
    fun parseName parseName = (Utf8.FFI.withPtr 0 ---> GioFileClass.FFI.fromPtr true) parseName_ parseName
    fun appendTo self (flags, cancellable) =
      (
        GioFileClass.FFI.withPtr false
         &&&> GioFileCreateFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioFileClass.FFI.withPtr false
         &&&> GioFileCopyFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioFileCreateFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioFileCreateFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        delete_
        (
          self
           & cancellable
           & []
        )
    fun deleteFinish self result =
      (
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        deleteFinish_
        (
          self
           & result
           & []
        )
    fun dup self = (GioFileClass.FFI.withPtr false ---> GioFileClass.FFI.fromPtr true) dup_ self
    fun ejectMountableFinish self result =
      (
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioFileEnumeratorClass.FFI.fromPtr true
      )
        enumerateChildrenFinish_
        (
          self
           & res
           & []
        )
    fun equal self file2 = (GioFileClass.FFI.withPtr false &&&> GioFileClass.FFI.withPtr false ---> GBool.FFI.fromVal) equal_ (self & file2)
    fun findEnclosingMount self cancellable =
      (
        GioFileClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioMountClass.FFI.fromPtr true
      )
        findEnclosingMountFinish_
        (
          self
           & res
           & []
        )
    fun getBasename self = (GioFileClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getBasename_ self
    fun getChild self name = (GioFileClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioFileClass.FFI.fromPtr true) getChild_ (self & name)
    fun getChildForDisplayName self displayName =
      (
        GioFileClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> GioFileClass.FFI.fromPtr true
      )
        getChildForDisplayName_
        (
          self
           & displayName
           & []
        )
    fun getParent self = (GioFileClass.FFI.withPtr false ---> GioFileClass.FFI.fromOptPtr true) getParent_ self
    fun getParseName self = (GioFileClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getParseName_ self
    fun getPath self = (GioFileClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getPath_ self
    fun getRelativePath self descendant = (GioFileClass.FFI.withPtr false &&&> GioFileClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getRelativePath_ (self & descendant)
    fun getUri self = (GioFileClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getUri_ self
    fun getUriScheme self = (GioFileClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getUriScheme_ self
    fun hasParent self parent = (GioFileClass.FFI.withPtr false &&&> GioFileClass.FFI.withOptPtr false ---> GBool.FFI.fromVal) hasParent_ (self & parent)
    fun hasPrefix self prefix = (GioFileClass.FFI.withPtr false &&&> GioFileClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasPrefix_ (self & prefix)
    fun hasUriScheme self uriScheme = (GioFileClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hasUriScheme_ (self & uriScheme)
    fun hash self = (GioFileClass.FFI.withPtr false ---> GUInt.FFI.fromVal) hash_ self
    fun isNative self = (GioFileClass.FFI.withPtr false ---> GBool.FFI.fromVal) isNative_ self
    fun loadContents self cancellable =
      let
        val contents
         & length
         & etagOut
         & () =
          (
            GioFileClass.FFI.withPtr false
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GUInt8CArrayN.FFI.withRefOptPtr 0
             &&&> GSize.FFI.withRefVal
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CArrayN.FFI.fromPtr ~1
                   && GSize.FFI.fromVal
                   && Utf8.FFI.fromPtr ~1
                   && ignore
          )
            loadContents_
            (
              self
               & cancellable
               & NONE
               & GSize.null
               & NONE
               & []
            )
      in
        (contents length, etagOut)
      end
    fun loadContentsFinish self res =
      let
        val contents
         & length
         & etagOut
         & () =
          (
            GioFileClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withRefOptPtr 0
             &&&> GSize.FFI.withRefVal
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CArrayN.FFI.fromPtr ~1
                   && GSize.FFI.fromVal
                   && Utf8.FFI.fromPtr ~1
                   && ignore
          )
            loadContentsFinish_
            (
              self
               & res
               & NONE
               & GSize.null
               & NONE
               & []
            )
      in
        (contents length, etagOut)
      end
    fun loadPartialContentsFinish self res =
      let
        val contents
         & length
         & etagOut
         & () =
          (
            GioFileClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withRefOptPtr 0
             &&&> GSize.FFI.withRefVal
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CArrayN.FFI.fromPtr ~1
                   && GSize.FFI.fromVal
                   && Utf8.FFI.fromPtr ~1
                   && ignore
          )
            loadPartialContentsFinish_
            (
              self
               & res
               & NONE
               & GSize.null
               & NONE
               & []
            )
      in
        (contents length, etagOut)
      end
    fun makeDirectory self cancellable =
      (
        GioFileClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        makeDirectory_
        (
          self
           & cancellable
           & []
        )
    fun makeDirectoryFinish self result =
      (
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        makeDirectoryFinish_
        (
          self
           & result
           & []
        )
    fun makeDirectoryWithParents self cancellable =
      (
        GioFileClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioCancellableClass.FFI.withOptPtr false
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
    fun measureDiskUsageFinish self result =
      let
        val diskUsage
         & numDirs
         & numFiles
         & () =
          (
            GioFileClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GUInt64.FFI.withRefVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal
                   && GUInt64.FFI.fromVal
                   && GUInt64.FFI.fromVal
                   && ignore
          )
            measureDiskUsageFinish_
            (
              self
               & result
               & GUInt64.null
               & GUInt64.null
               & GUInt64.null
               & []
            )
      in
        (
          diskUsage,
          numDirs,
          numFiles
        )
      end
    fun monitor self (flags, cancellable) =
      (
        GioFileClass.FFI.withPtr false
         &&&> GioFileMonitorFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioFileMonitorFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioFileMonitorFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioAppInfoClass.FFI.fromPtr true
      )
        queryDefaultHandler_
        (
          self
           & cancellable
           & []
        )
    fun queryExists self cancellable = (GioFileClass.FFI.withPtr false &&&> GioCancellableClass.FFI.withOptPtr false ---> GBool.FFI.fromVal) queryExists_ (self & cancellable)
    fun queryFileType self (flags, cancellable) =
      (
        GioFileClass.FFI.withPtr false
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GBool.FFI.withVal
         &&&> GioFileCreateFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        val length = GUInt8CArrayN.length contents
        val newEtag & () =
          (
            GioFileClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GSize.FFI.withVal
             &&&> Utf8.FFI.withOptPtr 0
             &&&> GBool.FFI.withVal
             &&&> GioFileCreateFlags.FFI.withVal
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr ~1 && ignore
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
            GioFileClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr ~1 && ignore
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GBool.FFI.withVal
         &&&> GioFileCreateFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioFileIOStreamClass.FFI.fromPtr true
      )
        replaceReadwriteFinish_
        (
          self
           & res
           & []
        )
    fun resolveRelativePath self relativePath = (GioFileClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioFileClass.FFI.fromPtr true) resolveRelativePath_ (self & relativePath)
    fun setAttributeByteString
      self
      (
        attribute,
        value,
        flags,
        cancellable
      ) =
      (
        GioFileClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt64.FFI.withVal
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt32.FFI.withVal
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt64.FFI.withVal
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
            GioFileClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GioFileInfoClass.FFI.withRefOptPtr true
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
        GioFileClass.FFI.withPtr false
         &&&> GioFileInfoClass.FFI.withPtr false
         &&&> GioFileQueryInfoFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        stopMountableFinish_
        (
          self
           & result
           & []
        )
    fun supportsThreadContexts self = (GioFileClass.FFI.withPtr false ---> GBool.FFI.fromVal) supportsThreadContexts_ self
    fun trash self cancellable =
      (
        GioFileClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        trash_
        (
          self
           & cancellable
           & []
        )
    fun trashFinish self result =
      (
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        trashFinish_
        (
          self
           & result
           & []
        )
    fun unmountMountableFinish self result =
      (
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
        GioFileClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
