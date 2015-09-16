signature GIO_FILE =
  sig
    type 'a class_t
    type file_copy_flags_t
    type 'a file_enumerator_class_t
    type 'a mount_class_t
    type 'a icon_class_t
    type 'a file_monitor_class_t
    type file_monitor_flags_t
    type 'a app_info_class_t
    type file_type_t
    type file_attribute_info_list_record_t
    type 'a file_input_stream_class_t
    type 'a file_output_stream_class_t
    type file_create_flags_t
    type 'a file_i_o_stream_class_t
    type file_query_info_flags_t
    type 'a file_info_class_t
    type 'a cancellable_class_t
    type 'a async_result_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val newForCommandlineArg : string -> base class_t
    val newForPath : string -> base class_t
    val newForUri : string -> base class_t
    val parseName : string -> base class_t
    val appendTo :
      'a class_t
       -> file_create_flags_t
       -> 'b cancellable_class_t option
       -> base file_output_stream_class_t
    val appendToFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base file_output_stream_class_t
    val copyAttributes :
      'a class_t
       -> 'b class_t
       -> file_copy_flags_t
       -> 'c cancellable_class_t option
       -> bool
    val copyFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val create :
      'a class_t
       -> file_create_flags_t
       -> 'b cancellable_class_t option
       -> base file_output_stream_class_t
    val createFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base file_output_stream_class_t
    val createReadwrite :
      'a class_t
       -> file_create_flags_t
       -> 'b cancellable_class_t option
       -> base file_i_o_stream_class_t
    val createReadwriteFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base file_i_o_stream_class_t
    val delete :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val dup : 'a class_t -> base class_t
    val ejectMountableWithOperationFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val enumerateChildren :
      'a class_t
       -> string
       -> file_query_info_flags_t
       -> 'b cancellable_class_t option
       -> base file_enumerator_class_t
    val enumerateChildrenFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base file_enumerator_class_t
    val equal :
      'a class_t
       -> 'b class_t
       -> bool
    val findEnclosingMount :
      'a class_t
       -> 'b cancellable_class_t option
       -> base mount_class_t
    val findEnclosingMountFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base mount_class_t
    val getBasename : 'a class_t -> string
    val getChild :
      'a class_t
       -> string
       -> base class_t
    val getChildForDisplayName :
      'a class_t
       -> string
       -> base class_t
    val getParent : 'a class_t -> base class_t
    val getParseName : 'a class_t -> string
    val getPath : 'a class_t -> string
    val getRelativePath :
      'a class_t
       -> 'b class_t
       -> string
    val getUri : 'a class_t -> string
    val getUriScheme : 'a class_t -> string
    val hasParent :
      'a class_t
       -> 'b class_t
       -> bool
    val hasPrefix :
      'a class_t
       -> 'b class_t
       -> bool
    val hasUriScheme :
      'a class_t
       -> string
       -> bool
    val iconNew : 'a class_t -> base icon_class_t
    val isNative : 'a class_t -> bool
    val makeDirectory :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val makeDirectoryWithParents :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val makeSymbolicLink :
      'a class_t
       -> string
       -> 'b cancellable_class_t option
       -> bool
    val monitor :
      'a class_t
       -> file_monitor_flags_t
       -> 'b cancellable_class_t option
       -> base file_monitor_class_t
    val monitorDirectory :
      'a class_t
       -> file_monitor_flags_t
       -> 'b cancellable_class_t option
       -> base file_monitor_class_t
    val monitorFile :
      'a class_t
       -> file_monitor_flags_t
       -> 'b cancellable_class_t option
       -> base file_monitor_class_t
    val mountEnclosingVolumeFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val mountMountableFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base class_t
    val openReadwrite :
      'a class_t
       -> 'b cancellable_class_t option
       -> base file_i_o_stream_class_t
    val openReadwriteFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base file_i_o_stream_class_t
    val pollMountableFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val queryDefaultHandler :
      'a class_t
       -> 'b cancellable_class_t option
       -> base app_info_class_t
    val queryExists :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val queryFileType :
      'a class_t
       -> file_query_info_flags_t
       -> 'b cancellable_class_t option
       -> file_type_t
    val queryFilesystemInfo :
      'a class_t
       -> string
       -> 'b cancellable_class_t option
       -> base file_info_class_t
    val queryFilesystemInfoFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base file_info_class_t
    val queryInfo :
      'a class_t
       -> string
       -> file_query_info_flags_t
       -> 'b cancellable_class_t option
       -> base file_info_class_t
    val queryInfoFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base file_info_class_t
    val querySettableAttributes :
      'a class_t
       -> 'b cancellable_class_t option
       -> file_attribute_info_list_record_t
    val queryWritableNamespaces :
      'a class_t
       -> 'b cancellable_class_t option
       -> file_attribute_info_list_record_t
    val read :
      'a class_t
       -> 'b cancellable_class_t option
       -> base file_input_stream_class_t
    val readFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base file_input_stream_class_t
    val replace :
      'a class_t
       -> string option
       -> bool
       -> file_create_flags_t
       -> 'b cancellable_class_t option
       -> base file_output_stream_class_t
    val replaceContentsFinish :
      'a class_t
       -> 'b async_result_class_t
       -> string option
    val replaceFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base file_output_stream_class_t
    val replaceReadwrite :
      'a class_t
       -> string option
       -> bool
       -> file_create_flags_t
       -> 'b cancellable_class_t option
       -> base file_i_o_stream_class_t
    val replaceReadwriteFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base file_i_o_stream_class_t
    val resolveRelativePath :
      'a class_t
       -> string
       -> base class_t
    val setAttributeByteString :
      'a class_t
       -> string
       -> string
       -> file_query_info_flags_t
       -> 'b cancellable_class_t option
       -> bool
    val setAttributeInt32 :
      'a class_t
       -> string
       -> LargeInt.int
       -> file_query_info_flags_t
       -> 'b cancellable_class_t option
       -> bool
    val setAttributeInt64 :
      'a class_t
       -> string
       -> LargeInt.int
       -> file_query_info_flags_t
       -> 'b cancellable_class_t option
       -> bool
    val setAttributeString :
      'a class_t
       -> string
       -> string
       -> file_query_info_flags_t
       -> 'b cancellable_class_t option
       -> bool
    val setAttributeUint32 :
      'a class_t
       -> string
       -> LargeInt.int
       -> file_query_info_flags_t
       -> 'b cancellable_class_t option
       -> bool
    val setAttributeUint64 :
      'a class_t
       -> string
       -> LargeInt.int
       -> file_query_info_flags_t
       -> 'b cancellable_class_t option
       -> bool
    val setAttributesFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base file_info_class_t option
    val setAttributesFromInfo :
      'a class_t
       -> 'b file_info_class_t
       -> file_query_info_flags_t
       -> 'c cancellable_class_t option
       -> bool
    val setDisplayName :
      'a class_t
       -> string
       -> 'b cancellable_class_t option
       -> base class_t
    val setDisplayNameFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base class_t
    val startMountableFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val stopMountableFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val supportsThreadContexts : 'a class_t -> bool
    val trash :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val unmountMountableWithOperationFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
  end
