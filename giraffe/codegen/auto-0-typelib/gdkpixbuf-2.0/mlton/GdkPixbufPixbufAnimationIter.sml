structure GdkPixbufPixbufAnimationIter :>
  GDK_PIXBUF_PIXBUF_ANIMATION_ITER
    where type 'a class = 'a GdkPixbufPixbufAnimationIterClass.class
    where type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class =
  struct
    val getType_ = _import "gdk_pixbuf_animation_iter_get_type" : unit -> GObjectType.FFI.val_;
    val advance_ = fn x1 & x2 => (_import "gdk_pixbuf_animation_iter_advance" : GdkPixbufPixbufAnimationIterClass.FFI.notnull GdkPixbufPixbufAnimationIterClass.FFI.p * unit GLibTimeValRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getDelayTime_ = _import "gdk_pixbuf_animation_iter_get_delay_time" : GdkPixbufPixbufAnimationIterClass.FFI.notnull GdkPixbufPixbufAnimationIterClass.FFI.p -> GInt32.FFI.val_;
    val getPixbuf_ = _import "gdk_pixbuf_animation_iter_get_pixbuf" : GdkPixbufPixbufAnimationIterClass.FFI.notnull GdkPixbufPixbufAnimationIterClass.FFI.p -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
    val onCurrentlyLoadingFrame_ = _import "gdk_pixbuf_animation_iter_on_currently_loading_frame" : GdkPixbufPixbufAnimationIterClass.FFI.notnull GdkPixbufPixbufAnimationIterClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a GdkPixbufPixbufAnimationIterClass.class
    type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun advance self currentTime = (GdkPixbufPixbufAnimationIterClass.FFI.withPtr &&&> GLibTimeValRecord.FFI.withOptPtr ---> GBool.FFI.fromVal) advance_ (self & currentTime)
    fun getDelayTime self = (GdkPixbufPixbufAnimationIterClass.FFI.withPtr ---> GInt32.FFI.fromVal) getDelayTime_ self
    fun getPixbuf self = (GdkPixbufPixbufAnimationIterClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPixbuf_ self
    fun onCurrentlyLoadingFrame self = (GdkPixbufPixbufAnimationIterClass.FFI.withPtr ---> GBool.FFI.fromVal) onCurrentlyLoadingFrame_ self
  end
