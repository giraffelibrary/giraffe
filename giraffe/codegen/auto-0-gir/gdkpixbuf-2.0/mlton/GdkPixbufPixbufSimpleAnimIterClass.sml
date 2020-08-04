structure GdkPixbufPixbufSimpleAnimIterClass :>
  GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_ITER_CLASS
    where type 'a pixbuf_animation_iter_class = 'a GdkPixbufPixbufAnimationIterClass.class
    where type C.opt = GdkPixbufPixbufAnimationIterClass.C.opt
    where type C.non_opt = GdkPixbufPixbufAnimationIterClass.C.non_opt
    where type 'a C.p = 'a GdkPixbufPixbufAnimationIterClass.C.p =
  struct
    type 'a pixbuf_animation_iter_class = 'a GdkPixbufPixbufAnimationIterClass.class
    open GdkPixbufPixbufAnimationIterClass
    type 'a pixbuf_simple_anim_iter = unit
    type 'a class = 'a pixbuf_simple_anim_iter class
    val getType_ = _import "gdk_pixbuf_simple_anim_iter_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.non_opt FFI.p;
    val getOptValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.opt FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.non_opt FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.opt FFI.p -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr false ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
        }
  end
