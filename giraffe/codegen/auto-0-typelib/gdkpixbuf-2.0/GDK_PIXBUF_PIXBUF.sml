signature GDK_PIXBUF_PIXBUF =
  sig
    type 'a class_t
    type pixbufrotation_t
    type interptype_t
    type colorspace_t
    type t = base class_t
    val asIcon : 'a class_t -> base Gio.IconClass.t
    val getType : unit -> GObject.Type.t
    val new :
      colorspace_t
       -> bool
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> base class_t
    val newFromFile : string -> base class_t
    val newFromFileAtScale :
      string
       -> LargeInt.int
       -> LargeInt.int
       -> bool
       -> base class_t
    val newFromFileAtSize :
      string
       -> LargeInt.int
       -> LargeInt.int
       -> base class_t
    val newFromStream :
      'a Gio.InputStreamClass.t
       -> 'b Gio.CancellableClass.t option
       -> base class_t
    val newFromStreamAtScale :
      'a Gio.InputStreamClass.t
       -> LargeInt.int
       -> LargeInt.int
       -> bool
       -> 'b Gio.CancellableClass.t option
       -> base class_t
    val newFromStreamFinish : 'a Gio.AsyncResultClass.t -> base class_t
    val newFromXpmData : string -> base class_t
    val gettext : string -> string
    val saveToStreamFinish : 'a Gio.AsyncResultClass.t -> bool
    val addAlpha :
      'a class_t
       -> bool
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> base class_t
    val applyEmbeddedOrientation : 'a class_t -> base class_t
    val composite :
      'a class_t
       -> 'b class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> real
       -> real
       -> real
       -> real
       -> interptype_t
       -> LargeInt.int
       -> unit
    val compositeColor :
      'a class_t
       -> 'b class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> real
       -> real
       -> real
       -> real
       -> interptype_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val compositeColorSimple :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> interptype_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> base class_t
    val copy : 'a class_t -> base class_t
    val copyArea :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> 'b class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val fill :
      'a class_t
       -> LargeInt.int
       -> unit
    val flip :
      'a class_t
       -> bool
       -> base class_t
    val getBitsPerSample : 'a class_t -> LargeInt.int
    val getColorspace : 'a class_t -> colorspace_t
    val getHasAlpha : 'a class_t -> bool
    val getHeight : 'a class_t -> LargeInt.int
    val getNChannels : 'a class_t -> LargeInt.int
    val getOption :
      'a class_t
       -> string
       -> string
    val getRowstride : 'a class_t -> LargeInt.int
    val getWidth : 'a class_t -> LargeInt.int
    val newSubpixbuf :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> base class_t
    val rotateSimple :
      'a class_t
       -> pixbufrotation_t
       -> base class_t
    val saturateAndPixelate :
      'a class_t
       -> 'b class_t
       -> real
       -> bool
       -> unit
    val scale :
      'a class_t
       -> 'b class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> real
       -> real
       -> real
       -> real
       -> interptype_t
       -> unit
    val scaleSimple :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> interptype_t
       -> base class_t
    val bitsPerSampleProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val colorspaceProp : ('a class_t, colorspace_t, colorspace_t) Property.readwrite
    val hasAlphaProp : ('a class_t, bool, bool) Property.readwrite
    val heightProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val nChannelsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val rowstrideProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val widthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
