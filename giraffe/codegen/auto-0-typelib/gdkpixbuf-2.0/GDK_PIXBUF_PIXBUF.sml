signature GDK_PIXBUF_PIXBUF =
  sig
    type 'a class
    type pixbuf_rotation_t
    type interp_type_t
    type colorspace_t
    type t = base class
    val asIcon : 'a class -> base Gio.IconClass.class
    val getType : unit -> GObject.Type.t
    val new :
      colorspace_t
       -> bool
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> base class
    val newFromFile : string -> base class
    val newFromFileAtScale :
      string
       -> LargeInt.int
       -> LargeInt.int
       -> bool
       -> base class
    val newFromFileAtSize :
      string
       -> LargeInt.int
       -> LargeInt.int
       -> base class
    val newFromStream :
      'a Gio.InputStreamClass.class
       -> 'b Gio.CancellableClass.class option
       -> base class
    val newFromStreamAtScale :
      'a Gio.InputStreamClass.class
       -> LargeInt.int
       -> LargeInt.int
       -> bool
       -> 'b Gio.CancellableClass.class option
       -> base class
    val newFromStreamFinish : 'a Gio.AsyncResultClass.class -> base class
    val newFromXpmData : string -> base class
    val gettext : string -> string
    val saveToStreamFinish : 'a Gio.AsyncResultClass.class -> bool
    val addAlpha :
      'a class
       -> bool
       -> Word8.word
       -> Word8.word
       -> Word8.word
       -> base class
    val applyEmbeddedOrientation : 'a class -> base class
    val composite :
      'a class
       -> 'b class
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> real
       -> real
       -> real
       -> real
       -> interp_type_t
       -> LargeInt.int
       -> unit
    val compositeColor :
      'a class
       -> 'b class
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> real
       -> real
       -> real
       -> real
       -> interp_type_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val compositeColorSimple :
      'a class
       -> LargeInt.int
       -> LargeInt.int
       -> interp_type_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> base class
    val copy : 'a class -> base class
    val copyArea :
      'a class
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> 'b class
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val fill :
      'a class
       -> LargeInt.int
       -> unit
    val flip :
      'a class
       -> bool
       -> base class
    val getBitsPerSample : 'a class -> LargeInt.int
    val getColorspace : 'a class -> colorspace_t
    val getHasAlpha : 'a class -> bool
    val getHeight : 'a class -> LargeInt.int
    val getNChannels : 'a class -> LargeInt.int
    val getOption :
      'a class
       -> string
       -> string
    val getRowstride : 'a class -> LargeInt.int
    val getWidth : 'a class -> LargeInt.int
    val newSubpixbuf :
      'a class
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> base class
    val rotateSimple :
      'a class
       -> pixbuf_rotation_t
       -> base class
    val saturateAndPixelate :
      'a class
       -> 'b class
       -> real
       -> bool
       -> unit
    val savev :
      'a class
       -> string
       -> string
       -> string list
       -> string list
       -> bool
    val scale :
      'a class
       -> 'b class
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> real
       -> real
       -> real
       -> real
       -> interp_type_t
       -> unit
    val scaleSimple :
      'a class
       -> LargeInt.int
       -> LargeInt.int
       -> interp_type_t
       -> base class
    val bitsPerSampleProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val colorspaceProp : ('a class, colorspace_t, colorspace_t) Property.readwrite
    val hasAlphaProp : ('a class, bool, bool) Property.readwrite
    val heightProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val nChannelsProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val rowstrideProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val widthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
