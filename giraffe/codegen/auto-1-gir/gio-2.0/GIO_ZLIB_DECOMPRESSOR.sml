signature GIO_ZLIB_DECOMPRESSOR =
  sig
    type 'a class_t
    type zlibcompressorformat_t
    type 'a fileinfoclass_t
    type 'a converterclass_t
    val asConverter : 'a class_t -> base converterclass_t
    val getType : unit -> GObject.Type.t
    val new : zlibcompressorformat_t -> base class_t
    val getFileInfo : 'a class_t -> base fileinfoclass_t
    val fileInfoProp : ('a class_t, base fileinfoclass_t option) Property.readonly
    val formatProp : ('a class_t, zlibcompressorformat_t, zlibcompressorformat_t) Property.readwrite
  end
