structure GdkPixbufPixbufAnimationIter :>
  GDK_PIXBUF_PIXBUF_ANIMATION_ITER
    where type 'a class_t = 'a GdkPixbufPixbufAnimationIterClass.t
    where type 'a pixbufclass_t = 'a GdkPixbufPixbufClass.t =
  struct
    val getType_ = _import "gdk_pixbuf_animation_iter_get_type" : unit -> GObjectType.C.val_;
    val advance_ = fn x1 & x2 => (_import "gdk_pixbuf_animation_iter_advance" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GLibTimeValRecord.C.notnull GLibTimeValRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getDelayTime_ = _import "gdk_pixbuf_animation_iter_get_delay_time" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getPixbuf_ = _import "gdk_pixbuf_animation_iter_get_pixbuf" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val onCurrentlyLoadingFrame_ = _import "gdk_pixbuf_animation_iter_on_currently_loading_frame" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    type 'a class_t = 'a GdkPixbufPixbufAnimationIterClass.t
    type 'a pixbufclass_t = 'a GdkPixbufPixbufClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun advance self currentTime = (GObjectObjectClass.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> FFI.Bool.C.fromVal) advance_ (self & currentTime)
    fun getDelayTime self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getDelayTime_ self
    fun getPixbuf self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun onCurrentlyLoadingFrame self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) onCurrentlyLoadingFrame_ self
  end
