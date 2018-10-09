signature GIO_FILE =
  sig
    type 'a class
    type file_copy_flags_t
    type 'a file_enumerator_class
    type 'a mount_class
    type 'a file_monitor_class
    type file_monitor_flags_t
    type 'a app_info_class
    type file_type_t
    type file_attribute_info_list_t
    type 'a file_input_stream_class
    type 'a file_output_stream_class
    type file_create_flags_t
    type 'a file_i_o_stream_class
    type file_query_info_flags_t
    type 'a file_info_class
    type 'a cancellable_class
    type 'a async_result_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val newForCommandlineArg : string -> base class
    val newForCommandlineArgAndCwd : string * string -> base class
    val newForPath : string -> base class
    val newForUri : string -> base class
    val newTmp : string option -> base class * base file_i_o_stream_class
    val parseName : string -> base class
    val appendTo :
      'a class
       -> file_create_flags_t * 'b cancellable_class option
       -> base file_output_stream_class
    val appendToFinish :
      'a class
       -> 'b async_result_class
       -> base file_output_stream_class
    val copyAttributes :
      'a class
       -> 'b class
           * file_copy_flags_t
           * 'c cancellable_class option
       -> unit
    val copyFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val create :
      'a class
       -> file_create_flags_t * 'b cancellable_class option
       -> base file_output_stream_class
    val createFinish :
      'a class
       -> 'b async_result_class
       -> base file_output_stream_class
    val createReadwrite :
      'a class
       -> file_create_flags_t * 'b cancellable_class option
       -> base file_i_o_stream_class
    val createReadwriteFinish :
      'a class
       -> 'b async_result_class
       -> base file_i_o_stream_class
    val delete :
      'a class
       -> 'b cancellable_class option
       -> unit
    val deleteFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val dup : 'a class -> base class
    val ejectMountableFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val ejectMountableWithOperationFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val enumerateChildren :
      'a class
       -> string
           * file_query_info_flags_t
           * 'b cancellable_class option
       -> base file_enumerator_class
    val enumerateChildrenFinish :
      'a class
       -> 'b async_result_class
       -> base file_enumerator_class
    val equal :
      'a class
       -> 'b class
       -> bool
    val findEnclosingMount :
      'a class
       -> 'b cancellable_class option
       -> base mount_class
    val findEnclosingMountFinish :
      'a class
       -> 'b async_result_class
       -> base mount_class
    val getBasename : 'a class -> string option
    val getChild :
      'a class
       -> string
       -> base class
    val getChildForDisplayName :
      'a class
       -> string
       -> base class
    val getParent : 'a class -> base class option
    val getParseName : 'a class -> string
    val getPath : 'a class -> string option
    val getRelativePath :
      'a class
       -> 'b class
       -> string option
    val getUri : 'a class -> string
    val getUriScheme : 'a class -> string
    val hasParent :
      'a class
       -> 'b class option
       -> bool
    val hasPrefix :
      'a class
       -> 'b class
       -> bool
    val hasUriScheme :
      'a class
       -> string
       -> bool
    val hash : 'a class -> LargeInt.int
    val isNative : 'a class -> bool
    val loadContents :
      'a class
       -> 'b cancellable_class option
       -> Word8Vector.vector * string
    val loadContentsFinish :
      'a class
       -> 'b async_result_class
       -> Word8Vector.vector * string
    val loadPartialContentsFinish :
      'a class
       -> 'b async_result_class
       -> Word8Vector.vector * string
    val makeDirectory :
      'a class
       -> 'b cancellable_class option
       -> unit
    val makeDirectoryFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val makeDirectoryWithParents :
      'a class
       -> 'b cancellable_class option
       -> unit
    val makeSymbolicLink :
      'a class
       -> string * 'b cancellable_class option
       -> unit
    val measureDiskUsageFinish :
      'a class
       -> 'b async_result_class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val monitor :
      'a class
       -> file_monitor_flags_t * 'b cancellable_class option
       -> base file_monitor_class
    val monitorDirectory :
      'a class
       -> file_monitor_flags_t * 'b cancellable_class option
       -> base file_monitor_class
    val monitorFile :
      'a class
       -> file_monitor_flags_t * 'b cancellable_class option
       -> base file_monitor_class
    val mountEnclosingVolumeFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val mountMountableFinish :
      'a class
       -> 'b async_result_class
       -> base class
    val openReadwrite :
      'a class
       -> 'b cancellable_class option
       -> base file_i_o_stream_class
    val openReadwriteFinish :
      'a class
       -> 'b async_result_class
       -> base file_i_o_stream_class
    val pollMountableFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val queryDefaultHandler :
      'a class
       -> 'b cancellable_class option
       -> base app_info_class
    val queryExists :
      'a class
       -> 'b cancellable_class option
       -> bool
    val queryFileType :
      'a class
       -> file_query_info_flags_t * 'b cancellable_class option
       -> file_type_t
    val queryFilesystemInfo :
      'a class
       -> string * 'b cancellable_class option
       -> base file_info_class
    val queryFilesystemInfoFinish :
      'a class
       -> 'b async_result_class
       -> base file_info_class
    val queryInfo :
      'a class
       -> string
           * file_query_info_flags_t
           * 'b cancellable_class option
       -> base file_info_class
    val queryInfoFinish :
      'a class
       -> 'b async_result_class
       -> base file_info_class
    val querySettableAttributes :
      'a class
       -> 'b cancellable_class option
       -> file_attribute_info_list_t
    val queryWritableNamespaces :
      'a class
       -> 'b cancellable_class option
       -> file_attribute_info_list_t
    val read :
      'a class
       -> 'b cancellable_class option
       -> base file_input_stream_class
    val readFinish :
      'a class
       -> 'b async_result_class
       -> base file_input_stream_class
    val replace :
      'a class
       -> string option
           * bool
           * file_create_flags_t
           * 'b cancellable_class option
       -> base file_output_stream_class
    val replaceContents :
      'a class
       -> Word8Vector.vector
           * string option
           * bool
           * file_create_flags_t
           * 'b cancellable_class option
       -> string
    val replaceContentsFinish :
      'a class
       -> 'b async_result_class
       -> string
    val replaceFinish :
      'a class
       -> 'b async_result_class
       -> base file_output_stream_class
    val replaceReadwrite :
      'a class
       -> string option
           * bool
           * file_create_flags_t
           * 'b cancellable_class option
       -> base file_i_o_stream_class
    val replaceReadwriteFinish :
      'a class
       -> 'b async_result_class
       -> base file_i_o_stream_class
    val resolveRelativePath :
      'a class
       -> string
       -> base class
    val setAttributeByteString :
      'a class
       -> string
           * string
           * file_query_info_flags_t
           * 'b cancellable_class option
       -> unit
    val setAttributeInt32 :
      'a class
       -> string
           * LargeInt.int
           * file_query_info_flags_t
           * 'b cancellable_class option
       -> unit
    val setAttributeInt64 :
      'a class
       -> string
           * LargeInt.int
           * file_query_info_flags_t
           * 'b cancellable_class option
       -> unit
    val setAttributeString :
      'a class
       -> string
           * string
           * file_query_info_flags_t
           * 'b cancellable_class option
       -> unit
    val setAttributeUint32 :
      'a class
       -> string
           * LargeInt.int
           * file_query_info_flags_t
           * 'b cancellable_class option
       -> unit
    val setAttributeUint64 :
      'a class
       -> string
           * LargeInt.int
           * file_query_info_flags_t
           * 'b cancellable_class option
       -> unit
    val setAttributesFinish :
      'a class
       -> 'b async_result_class
       -> base file_info_class
    val setAttributesFromInfo :
      'a class
       -> 'b file_info_class
           * file_query_info_flags_t
           * 'c cancellable_class option
       -> unit
    val setDisplayName :
      'a class
       -> string * 'b cancellable_class option
       -> base class
    val setDisplayNameFinish :
      'a class
       -> 'b async_result_class
       -> base class
    val startMountableFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val stopMountableFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val supportsThreadContexts : 'a class -> bool
    val trash :
      'a class
       -> 'b cancellable_class option
       -> unit
    val trashFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val unmountMountableFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val unmountMountableWithOperationFinish :
      'a class
       -> 'b async_result_class
       -> unit
  end
