signature GDK_PIXBUF =
  sig
    structure Colorspace : GDK_PIXBUF_COLORSPACE
    structure InterpType : GDK_PIXBUF_INTERP_TYPE
    structure PixbufClass : GDK_PIXBUF_PIXBUF_CLASS
    structure PixbufAlphaMode : GDK_PIXBUF_PIXBUF_ALPHA_MODE
    structure PixbufAnimationClass : GDK_PIXBUF_PIXBUF_ANIMATION_CLASS
    structure PixbufAnimationIterClass : GDK_PIXBUF_PIXBUF_ANIMATION_ITER_CLASS
    structure PixbufError : GDK_PIXBUF_PIXBUF_ERROR
    exception PixbufError of PixbufError.t
    structure PixbufFormatRecord : GDK_PIXBUF_PIXBUF_FORMAT_RECORD
    structure PixbufLoaderClass : GDK_PIXBUF_PIXBUF_LOADER_CLASS
    structure PixbufRotation : GDK_PIXBUF_PIXBUF_ROTATION
    structure PixdataDumpType : GDK_PIXBUF_PIXDATA_DUMP_TYPE
    structure PixdataType : GDK_PIXBUF_PIXDATA_TYPE
    structure Pixbuf :
      GDK_PIXBUF_PIXBUF
        where type 'a class = 'a PixbufClass.class
        where type pixbuf_rotation_t = PixbufRotation.t
        where type interp_type_t = InterpType.t
        where type colorspace_t = Colorspace.t
    structure PixbufAnimation :
      GDK_PIXBUF_PIXBUF_ANIMATION
        where type 'a class = 'a PixbufAnimationClass.class
        where type 'a pixbuf_animation_iter_class = 'a PixbufAnimationIterClass.class
        where type 'a pixbuf_class = 'a PixbufClass.class
    structure PixbufAnimationIter :
      GDK_PIXBUF_PIXBUF_ANIMATION_ITER
        where type 'a class = 'a PixbufAnimationIterClass.class
        where type 'a pixbuf_class = 'a PixbufClass.class
    structure PixbufFormat :
      GDK_PIXBUF_PIXBUF_FORMAT
        where type t = PixbufFormatRecord.t
    structure PixbufLoader :
      GDK_PIXBUF_PIXBUF_LOADER
        where type 'a class = 'a PixbufLoaderClass.class
        where type 'a pixbuf_animation_class = 'a PixbufAnimationClass.class
        where type pixbuf_format_t = PixbufFormatRecord.t
        where type 'a pixbuf_class = 'a PixbufClass.class
    structure PixbufSimpleAnimClass :
      GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_CLASS
        where type 'a pixbuf_animation_class = 'a PixbufAnimationClass.class
    structure PixbufSimpleAnimIterClass :
      GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_ITER_CLASS
        where type 'a pixbuf_animation_iter_class = 'a PixbufAnimationIterClass.class
    structure PixbufSimpleAnim :
      GDK_PIXBUF_PIXBUF_SIMPLE_ANIM
        where type 'a class = 'a PixbufSimpleAnimClass.class
        where type 'a pixbuf_class = 'a PixbufClass.class
    structure PixbufSimpleAnimIter :
      GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_ITER
        where type 'a class = 'a PixbufSimpleAnimIterClass.class
    val PIXBUF_FEATURES_H : LargeInt.int
    val PIXBUF_MAGIC_NUMBER : LargeInt.int
    val PIXBUF_MAJOR : LargeInt.int
    val PIXBUF_MICRO : LargeInt.int
    val PIXBUF_MINOR : LargeInt.int
    val PIXBUF_VERSION : string
    val PIXDATA_HEADER_LENGTH : LargeInt.int
  end
