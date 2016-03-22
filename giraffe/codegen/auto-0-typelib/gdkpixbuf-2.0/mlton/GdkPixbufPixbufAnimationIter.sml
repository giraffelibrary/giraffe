structure GdkPixbufPixbufAnimationIter :>
  GDK_PIXBUF_PIXBUF_ANIMATION_ITER
    where type 'a class = 'a GdkPixbufPixbufAnimationIterClass.class
    where type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class =
  struct
    val getType_ = _import "gdk_pixbuf_animation_iter_get_type" : unit -> GObjectType.C.val_;
    val advance_ = fn x1 & x2 => (_import "gdk_pixbuf_animation_iter_advance" : GdkPixbufPixbufAnimationIterClass.C.notnull GdkPixbufPixbufAnimationIterClass.C.p * GLibTimeValRecord.C.notnull GLibTimeValRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getDelayTime_ = _import "gdk_pixbuf_animation_iter_get_delay_time" : GdkPixbufPixbufAnimationIterClass.C.notnull GdkPixbufPixbufAnimationIterClass.C.p -> FFI.Int32.C.val_;
    val getPixbuf_ = _import "gdk_pixbuf_animation_iter_get_pixbuf" : GdkPixbufPixbufAnimationIterClass.C.notnull GdkPixbufPixbufAnimationIterClass.C.p -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
    val onCurrentlyLoadingFrame_ = _import "gdk_pixbuf_animation_iter_on_currently_loading_frame" : GdkPixbufPixbufAnimationIterClass.C.notnull GdkPixbufPixbufAnimationIterClass.C.p -> FFI.Bool.C.val_;
    type 'a class = 'a GdkPixbufPixbufAnimationIterClass.class
    type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun advance self currentTime = (GdkPixbufPixbufAnimationIterClass.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> FFI.Bool.C.fromVal) advance_ (self & currentTime)
    fun getDelayTime self = (GdkPixbufPixbufAnimationIterClass.C.withPtr ---> FFI.Int32.C.fromVal) getDelayTime_ self
    fun getPixbuf self = (GdkPixbufPixbufAnimationIterClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun onCurrentlyLoadingFrame self = (GdkPixbufPixbufAnimationIterClass.C.withPtr ---> FFI.Bool.C.fromVal) onCurrentlyLoadingFrame_ self
  end
