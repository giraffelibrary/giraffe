signature GIO_FILE_INFO =
  sig
    type 'a class_t
    type 'a iconclass_t
    type filetype_t
    type fileattributestatus_t
    type fileattributematcherrecord_t
    type fileattributetype_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val clearStatus : 'a class_t -> unit
    val copyInto :
      'a class_t
       -> 'b class_t
       -> unit
    val dup : 'a class_t -> base class_t
    val getAttributeAsString :
      'a class_t
       -> string
       -> string
    val getAttributeBoolean :
      'a class_t
       -> string
       -> bool
    val getAttributeByteString :
      'a class_t
       -> string
       -> string
    val getAttributeInt32 :
      'a class_t
       -> string
       -> LargeInt.int
    val getAttributeInt64 :
      'a class_t
       -> string
       -> LargeInt.int
    val getAttributeObject :
      'a class_t
       -> string
       -> base GObject.ObjectClass.t
    val getAttributeStatus :
      'a class_t
       -> string
       -> fileattributestatus_t
    val getAttributeString :
      'a class_t
       -> string
       -> string
    val getAttributeType :
      'a class_t
       -> string
       -> fileattributetype_t
    val getAttributeUint32 :
      'a class_t
       -> string
       -> LargeInt.int
    val getAttributeUint64 :
      'a class_t
       -> string
       -> LargeInt.int
    val getContentType : 'a class_t -> string
    val getDisplayName : 'a class_t -> string
    val getEditName : 'a class_t -> string
    val getEtag : 'a class_t -> string
    val getFileType : 'a class_t -> filetype_t
    val getIcon : 'a class_t -> base iconclass_t
    val getIsBackup : 'a class_t -> bool
    val getIsHidden : 'a class_t -> bool
    val getIsSymlink : 'a class_t -> bool
    val getModificationTime :
      'a class_t
       -> GLib.TimeValRecord.t
       -> unit
    val getName : 'a class_t -> string
    val getSize : 'a class_t -> LargeInt.int
    val getSortOrder : 'a class_t -> LargeInt.int
    val getSymlinkTarget : 'a class_t -> string
    val hasAttribute :
      'a class_t
       -> string
       -> bool
    val hasNamespace :
      'a class_t
       -> string
       -> bool
    val removeAttribute :
      'a class_t
       -> string
       -> unit
    val setAttributeBoolean :
      'a class_t
       -> string
       -> bool
       -> unit
    val setAttributeByteString :
      'a class_t
       -> string
       -> string
       -> unit
    val setAttributeInt32 :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val setAttributeInt64 :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val setAttributeMask :
      'a class_t
       -> fileattributematcherrecord_t
       -> unit
    val setAttributeObject :
      'a class_t
       -> string
       -> 'b GObject.ObjectClass.t
       -> unit
    val setAttributeStatus :
      'a class_t
       -> string
       -> fileattributestatus_t
       -> bool
    val setAttributeString :
      'a class_t
       -> string
       -> string
       -> unit
    val setAttributeStringv :
      'a class_t
       -> string
       -> string
       -> unit
    val setAttributeUint32 :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val setAttributeUint64 :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val setContentType :
      'a class_t
       -> string
       -> unit
    val setDisplayName :
      'a class_t
       -> string
       -> unit
    val setEditName :
      'a class_t
       -> string
       -> unit
    val setFileType :
      'a class_t
       -> filetype_t
       -> unit
    val setIcon :
      'a class_t
       -> 'b iconclass_t
       -> unit
    val setIsHidden :
      'a class_t
       -> bool
       -> unit
    val setIsSymlink :
      'a class_t
       -> bool
       -> unit
    val setModificationTime :
      'a class_t
       -> GLib.TimeValRecord.t
       -> unit
    val setName :
      'a class_t
       -> string
       -> unit
    val setSize :
      'a class_t
       -> LargeInt.int
       -> unit
    val setSortOrder :
      'a class_t
       -> LargeInt.int
       -> unit
    val setSymlinkTarget :
      'a class_t
       -> string
       -> unit
    val unsetAttributeMask : 'a class_t -> unit
  end
