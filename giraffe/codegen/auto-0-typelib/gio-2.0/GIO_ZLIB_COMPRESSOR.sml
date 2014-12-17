signature GIO_ZLIB_COMPRESSOR =
  sig
    type 'a class_t
    type 'a converterclass_t
    type 'a fileinfoclass_t
    type zlibcompressorformat_t
    type t = base class_t
    val asConverter : 'a class_t -> base converterclass_t
    val getType : unit -> GObject.Type.t
    val new :
      zlibcompressorformat_t
       -> LargeInt.int
       -> base class_t
    val getFileInfo : 'a class_t -> base fileinfoclass_t
    val setFileInfo :
      'a class_t
       -> 'b fileinfoclass_t option
       -> unit
    val fileInfoProp : ('a class_t, base fileinfoclass_t option, 'b fileinfoclass_t option) Property.readwrite
    val formatProp : ('a class_t, zlibcompressorformat_t, zlibcompressorformat_t) Property.readwrite
    val levelProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
