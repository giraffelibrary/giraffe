signature GIO_FILE_INFO =
  sig
    type 'a class_t
    type file_attribute_type_t
    type file_attribute_matcher_record_t
    type file_attribute_status_t
    type file_type_t
    type 'a icon_class_t
    type t = base class_t
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
       -> file_attribute_status_t
    val getAttributeString :
      'a class_t
       -> string
       -> string
    val getAttributeType :
      'a class_t
       -> string
       -> file_attribute_type_t
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
    val getFileType : 'a class_t -> file_type_t
    val getIcon : 'a class_t -> base icon_class_t
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
       -> file_attribute_matcher_record_t
       -> unit
    val setAttributeObject :
      'a class_t
       -> string
       -> 'b GObject.ObjectClass.t
       -> unit
    val setAttributeStatus :
      'a class_t
       -> string
       -> file_attribute_status_t
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
       -> file_type_t
       -> unit
    val setIcon :
      'a class_t
       -> 'b icon_class_t
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
