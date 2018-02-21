signature GIO_FILE_INFO =
  sig
    type 'a class
    type file_attribute_type_t
    type file_attribute_matcher_t
    type file_attribute_status_t
    type file_type_t
    type 'a icon_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val clearStatus : 'a class -> unit
    val copyInto :
      'a class
       -> 'b class
       -> unit
    val dup : 'a class -> base class
    val getAttributeAsString :
      'a class
       -> string
       -> string
    val getAttributeBoolean :
      'a class
       -> string
       -> bool
    val getAttributeByteString :
      'a class
       -> string
       -> string
    val getAttributeInt32 :
      'a class
       -> string
       -> LargeInt.int
    val getAttributeInt64 :
      'a class
       -> string
       -> LargeInt.int
    val getAttributeObject :
      'a class
       -> string
       -> base GObject.ObjectClass.class
    val getAttributeStatus :
      'a class
       -> string
       -> file_attribute_status_t
    val getAttributeString :
      'a class
       -> string
       -> string
    val getAttributeStringv :
      'a class
       -> string
       -> string list
    val getAttributeType :
      'a class
       -> string
       -> file_attribute_type_t
    val getAttributeUint32 :
      'a class
       -> string
       -> LargeInt.int
    val getAttributeUint64 :
      'a class
       -> string
       -> LargeInt.int
    val getContentType : 'a class -> string
    val getDeletionDate : 'a class -> GLib.DateTimeRecord.t
    val getDisplayName : 'a class -> string
    val getEditName : 'a class -> string
    val getEtag : 'a class -> string
    val getFileType : 'a class -> file_type_t
    val getIcon : 'a class -> base icon_class
    val getIsBackup : 'a class -> bool
    val getIsHidden : 'a class -> bool
    val getIsSymlink : 'a class -> bool
    val getModificationTime : 'a class -> GLib.TimeValRecord.t
    val getName : 'a class -> string
    val getSize : 'a class -> LargeInt.int
    val getSortOrder : 'a class -> LargeInt.int
    val getSymbolicIcon : 'a class -> base icon_class
    val getSymlinkTarget : 'a class -> string
    val hasAttribute :
      'a class
       -> string
       -> bool
    val hasNamespace :
      'a class
       -> string
       -> bool
    val listAttributes :
      'a class
       -> string option
       -> string list option
    val removeAttribute :
      'a class
       -> string
       -> unit
    val setAttributeBoolean :
      'a class
       -> string * bool
       -> unit
    val setAttributeByteString :
      'a class
       -> string * string
       -> unit
    val setAttributeInt32 :
      'a class
       -> string * LargeInt.int
       -> unit
    val setAttributeInt64 :
      'a class
       -> string * LargeInt.int
       -> unit
    val setAttributeMask :
      'a class
       -> file_attribute_matcher_t
       -> unit
    val setAttributeObject :
      'a class
       -> string * 'b GObject.ObjectClass.class
       -> unit
    val setAttributeStatus :
      'a class
       -> string * file_attribute_status_t
       -> bool
    val setAttributeString :
      'a class
       -> string * string
       -> unit
    val setAttributeUint32 :
      'a class
       -> string * LargeInt.int
       -> unit
    val setAttributeUint64 :
      'a class
       -> string * LargeInt.int
       -> unit
    val setContentType :
      'a class
       -> string
       -> unit
    val setDisplayName :
      'a class
       -> string
       -> unit
    val setEditName :
      'a class
       -> string
       -> unit
    val setFileType :
      'a class
       -> file_type_t
       -> unit
    val setIcon :
      'a class
       -> 'b icon_class
       -> unit
    val setIsHidden :
      'a class
       -> bool
       -> unit
    val setIsSymlink :
      'a class
       -> bool
       -> unit
    val setModificationTime :
      'a class
       -> GLib.TimeValRecord.t
       -> unit
    val setName :
      'a class
       -> string
       -> unit
    val setSize :
      'a class
       -> LargeInt.int
       -> unit
    val setSortOrder :
      'a class
       -> LargeInt.int
       -> unit
    val setSymbolicIcon :
      'a class
       -> 'b icon_class
       -> unit
    val setSymlinkTarget :
      'a class
       -> string
       -> unit
    val unsetAttributeMask : 'a class -> unit
  end
