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
        where type 'a class_t = 'a PixbufClass.t
        where type pixbuf_rotation_t = PixbufRotation.t
        where type interp_type_t = InterpType.t
        where type colorspace_t = Colorspace.t
    structure PixbufAnimation :
      GDK_PIXBUF_PIXBUF_ANIMATION
        where type 'a class_t = 'a PixbufAnimationClass.t
        where type 'a pixbuf_animation_iter_class_t = 'a PixbufAnimationIterClass.t
        where type 'a pixbuf_class_t = 'a PixbufClass.t
    structure PixbufAnimationIter :
      GDK_PIXBUF_PIXBUF_ANIMATION_ITER
        where type 'a class_t = 'a PixbufAnimationIterClass.t
        where type 'a pixbuf_class_t = 'a PixbufClass.t
    structure PixbufFormat :
      GDK_PIXBUF_PIXBUF_FORMAT
        where type record_t = PixbufFormatRecord.t
    structure PixbufLoader :
      GDK_PIXBUF_PIXBUF_LOADER
        where type 'a class_t = 'a PixbufLoaderClass.t
        where type 'a pixbuf_animation_class_t = 'a PixbufAnimationClass.t
        where type pixbuf_format_record_t = PixbufFormatRecord.t
        where type 'a pixbuf_class_t = 'a PixbufClass.t
    structure PixbufSimpleAnimClass :
      GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_CLASS
        where type 'a pixbuf_animation_class_t = 'a PixbufAnimationClass.t
    structure PixbufSimpleAnimIterClass :
      GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_ITER_CLASS
        where type 'a pixbuf_animation_iter_class_t = 'a PixbufAnimationIterClass.t
    structure PixbufSimpleAnim :
      GDK_PIXBUF_PIXBUF_SIMPLE_ANIM
        where type 'a class_t = 'a PixbufSimpleAnimClass.t
        where type 'a pixbuf_class_t = 'a PixbufClass.t
    structure PixbufSimpleAnimIter :
      GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_ITER
        where type 'a class_t = 'a PixbufSimpleAnimIterClass.t
    val PIXBUF_FEATURES_H : LargeInt.int
    val PIXBUF_MAGIC_NUMBER : LargeInt.int
    val PIXBUF_MAJOR : LargeInt.int
    val PIXBUF_MICRO : LargeInt.int
    val PIXBUF_MINOR : LargeInt.int
    val PIXBUF_VERSION : string
    val PIXDATA_HEADER_LENGTH : LargeInt.int
  end
