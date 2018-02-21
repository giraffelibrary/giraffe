signature GDK_PIXBUF_PIXBUF =
  sig
    type 'a class
    type pixdata_t
    type pixbuf_format_t
    type pixbuf_rotation_t
    type interp_type_t
    type colorspace_t
    type t = base class
    val asIcon : 'a class -> base Gio.IconClass.class
    val asLoadableIcon : 'a class -> base Gio.LoadableIconClass.class
    val getType : unit -> GObject.Type.t
    val new :
      colorspace_t
       * bool
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> base class
    val newFromBytes :
      GLib.BytesRecord.t
       * colorspace_t
       * bool
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> base class
    val newFromFile : string -> base class
    val newFromFileAtScale :
      string
       * LargeInt.int
       * LargeInt.int
       * bool
       -> base class
    val newFromFileAtSize :
      string
       * LargeInt.int
       * LargeInt.int
       -> base class
    val newFromInline : Word8Vector.vector * bool -> base class
    val newFromResource : string -> base class
    val newFromResourceAtScale :
      string
       * LargeInt.int
       * LargeInt.int
       * bool
       -> base class
    val newFromStream : 'a Gio.InputStreamClass.class * 'b Gio.CancellableClass.class option -> base class
    val newFromStreamAtScale :
      'a Gio.InputStreamClass.class
       * LargeInt.int
       * LargeInt.int
       * bool
       * 'b Gio.CancellableClass.class option
       -> base class
    val newFromStreamFinish : 'a Gio.AsyncResultClass.class -> base class
    val newFromXpmData : string list -> base class
    val calculateRowstride :
      colorspace_t
       * bool
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> LargeInt.int
    val fromPixdata : pixdata_t * bool -> base class
    val getFileInfo :
      string
       -> pixbuf_format_t option
           * LargeInt.int
           * LargeInt.int
    val getFileInfoFinish :
      'a Gio.AsyncResultClass.class
       -> pixbuf_format_t
           * LargeInt.int
           * LargeInt.int
    val saveToStreamFinish : 'a Gio.AsyncResultClass.class -> unit
    val addAlpha :
      'a class
       -> bool
           * Word8.word
           * Word8.word
           * Word8.word
       -> base class
    val applyEmbeddedOrientation : 'a class -> base class
    val composite :
      'a class
       -> 'b class
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * real
           * real
           * real
           * real
           * interp_type_t
           * LargeInt.int
       -> unit
    val compositeColor :
      'a class
       -> 'b class
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * real
           * real
           * real
           * real
           * interp_type_t
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val compositeColorSimple :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * interp_type_t
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> base class
    val copy : 'a class -> base class
    val copyArea :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * 'b class
           * LargeInt.int
           * LargeInt.int
       -> unit
    val copyOptions :
      'a class
       -> 'b class
       -> bool
    val fill :
      'a class
       -> LargeInt.int
       -> unit
    val flip :
      'a class
       -> bool
       -> base class option
    val getBitsPerSample : 'a class -> LargeInt.int
    val getByteLength : 'a class -> LargeInt.int
    val getColorspace : 'a class -> colorspace_t
    val getHasAlpha : 'a class -> bool
    val getHeight : 'a class -> LargeInt.int
    val getNChannels : 'a class -> LargeInt.int
    val getOption :
      'a class
       -> string
       -> string
    val getPixelsWithLength : 'a class -> Word8Vector.vector
    val getRowstride : 'a class -> LargeInt.int
    val getWidth : 'a class -> LargeInt.int
    val newSubpixbuf :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> base class
    val readPixelBytes : 'a class -> GLib.BytesRecord.t
    val removeOption :
      'a class
       -> string
       -> bool
    val rotateSimple :
      'a class
       -> pixbuf_rotation_t
       -> base class option
    val saturateAndPixelate :
      'a class
       -> 'b class
           * real
           * bool
       -> unit
    val saveToBufferv :
      'a class
       -> string
           * string list
           * string list
       -> Word8Vector.vector
    val saveToStreamv :
      'a class
       -> 'b Gio.OutputStreamClass.class
           * string
           * string list
           * string list
           * 'c Gio.CancellableClass.class option
       -> unit
    val savev :
      'a class
       -> string
           * string
           * string list
           * string list
       -> unit
    val scale :
      'a class
       -> 'b class
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * real
           * real
           * real
           * real
           * interp_type_t
       -> unit
    val scaleSimple :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * interp_type_t
       -> base class
    val setOption :
      'a class
       -> string * string
       -> bool
    val bitsPerSampleProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val colorspaceProp : ('a class, colorspace_t, colorspace_t) Property.readwrite
    val hasAlphaProp : ('a class, bool, bool) Property.readwrite
    val heightProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val nChannelsProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val pixelBytesProp : ('a class, GLib.BytesRecord.t option, GLib.BytesRecord.t option) Property.readwrite
    val rowstrideProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val widthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
