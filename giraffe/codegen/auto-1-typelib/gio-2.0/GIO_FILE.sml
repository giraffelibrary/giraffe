signature GIO_FILE =
  sig
    type 'a class_t
    type 'a asyncresultclass_t
    type 'a cancellableclass_t
    type 'a fileinfoclass_t
    type filequeryinfoflags_t
    type 'a fileiostreamclass_t
    type filecreateflags_t
    type 'a fileoutputstreamclass_t
    type 'a fileinputstreamclass_t
    type fileattributeinfolistrecord_t
    type filetype_t
    type 'a appinfoclass_t
    type filemonitorflags_t
    type 'a filemonitorclass_t
    type 'a iconclass_t
    type 'a mountclass_t
    type 'a fileenumeratorclass_t
    type filecopyflags_t
    val getType : unit -> GObject.Type.t
    val newForCommandlineArg : string -> base class_t
    val newForPath : string -> base class_t
    val newForUri : string -> base class_t
    val parseName : string -> base class_t
    val appendTo :
      'a class_t
       -> filecreateflags_t
       -> 'b cancellableclass_t option
       -> base fileoutputstreamclass_t
    val appendToFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base fileoutputstreamclass_t
    val copyAttributes :
      'a class_t
       -> 'b class_t
       -> filecopyflags_t
       -> 'c cancellableclass_t option
       -> bool
    val copyFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val create :
      'a class_t
       -> filecreateflags_t
       -> 'b cancellableclass_t option
       -> base fileoutputstreamclass_t
    val createFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base fileoutputstreamclass_t
    val createReadwrite :
      'a class_t
       -> filecreateflags_t
       -> 'b cancellableclass_t option
       -> base fileiostreamclass_t
    val createReadwriteFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base fileiostreamclass_t
    val delete :
      'a class_t
       -> 'b cancellableclass_t option
       -> bool
    val dup : 'a class_t -> base class_t
    val ejectMountableWithOperationFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val enumerateChildren :
      'a class_t
       -> string
       -> filequeryinfoflags_t
       -> 'b cancellableclass_t option
       -> base fileenumeratorclass_t
    val enumerateChildrenFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base fileenumeratorclass_t
    val equal :
      'a class_t
       -> 'b class_t
       -> bool
    val findEnclosingMount :
      'a class_t
       -> 'b cancellableclass_t option
       -> base mountclass_t
    val findEnclosingMountFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base mountclass_t
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
    val iconNew : 'a class_t -> base iconclass_t
    val isNative : 'a class_t -> bool
    val makeDirectory :
      'a class_t
       -> 'b cancellableclass_t option
       -> bool
    val makeDirectoryWithParents :
      'a class_t
       -> 'b cancellableclass_t option
       -> bool
    val makeSymbolicLink :
      'a class_t
       -> string
       -> 'b cancellableclass_t option
       -> bool
    val monitor :
      'a class_t
       -> filemonitorflags_t
       -> 'b cancellableclass_t option
       -> base filemonitorclass_t
    val monitorDirectory :
      'a class_t
       -> filemonitorflags_t
       -> 'b cancellableclass_t option
       -> base filemonitorclass_t
    val monitorFile :
      'a class_t
       -> filemonitorflags_t
       -> 'b cancellableclass_t option
       -> base filemonitorclass_t
    val mountEnclosingVolumeFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val mountMountableFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base class_t
    val openReadwrite :
      'a class_t
       -> 'b cancellableclass_t option
       -> base fileiostreamclass_t
    val openReadwriteFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base fileiostreamclass_t
    val pollMountableFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val queryDefaultHandler :
      'a class_t
       -> 'b cancellableclass_t option
       -> base appinfoclass_t
    val queryExists :
      'a class_t
       -> 'b cancellableclass_t option
       -> bool
    val queryFileType :
      'a class_t
       -> filequeryinfoflags_t
       -> 'b cancellableclass_t option
       -> filetype_t
    val queryFilesystemInfo :
      'a class_t
       -> string
       -> 'b cancellableclass_t option
       -> base fileinfoclass_t
    val queryFilesystemInfoFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base fileinfoclass_t
    val queryInfo :
      'a class_t
       -> string
       -> filequeryinfoflags_t
       -> 'b cancellableclass_t option
       -> base fileinfoclass_t
    val queryInfoFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base fileinfoclass_t
    val querySettableAttributes :
      'a class_t
       -> 'b cancellableclass_t option
       -> fileattributeinfolistrecord_t
    val queryWritableNamespaces :
      'a class_t
       -> 'b cancellableclass_t option
       -> fileattributeinfolistrecord_t
    val read :
      'a class_t
       -> 'b cancellableclass_t option
       -> base fileinputstreamclass_t
    val readFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base fileinputstreamclass_t
    val replace :
      'a class_t
       -> string option
       -> bool
       -> filecreateflags_t
       -> 'b cancellableclass_t option
       -> base fileoutputstreamclass_t
    val replaceContentsFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> string option
    val replaceFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base fileoutputstreamclass_t
    val replaceReadwrite :
      'a class_t
       -> string option
       -> bool
       -> filecreateflags_t
       -> 'b cancellableclass_t option
       -> base fileiostreamclass_t
    val replaceReadwriteFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base fileiostreamclass_t
    val resolveRelativePath :
      'a class_t
       -> string
       -> base class_t
    val setAttributeByteString :
      'a class_t
       -> string
       -> string
       -> filequeryinfoflags_t
       -> 'b cancellableclass_t option
       -> bool
    val setAttributeInt32 :
      'a class_t
       -> string
       -> LargeInt.int
       -> filequeryinfoflags_t
       -> 'b cancellableclass_t option
       -> bool
    val setAttributeInt64 :
      'a class_t
       -> string
       -> LargeInt.int
       -> filequeryinfoflags_t
       -> 'b cancellableclass_t option
       -> bool
    val setAttributeString :
      'a class_t
       -> string
       -> string
       -> filequeryinfoflags_t
       -> 'b cancellableclass_t option
       -> bool
    val setAttributeUint32 :
      'a class_t
       -> string
       -> LargeInt.int
       -> filequeryinfoflags_t
       -> 'b cancellableclass_t option
       -> bool
    val setAttributeUint64 :
      'a class_t
       -> string
       -> LargeInt.int
       -> filequeryinfoflags_t
       -> 'b cancellableclass_t option
       -> bool
    val setAttributesFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base fileinfoclass_t option
    val setAttributesFromInfo :
      'a class_t
       -> 'b fileinfoclass_t
       -> filequeryinfoflags_t
       -> 'c cancellableclass_t option
       -> bool
    val setDisplayName :
      'a class_t
       -> string
       -> 'b cancellableclass_t option
       -> base class_t
    val setDisplayNameFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base class_t
    val startMountableFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val stopMountableFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val supportsThreadContexts : 'a class_t -> bool
    val trash :
      'a class_t
       -> 'b cancellableclass_t option
       -> bool
    val unmountMountableWithOperationFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
  end
