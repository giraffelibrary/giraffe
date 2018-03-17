structure GdkPixbufPixbufSimpleAnimClass :>
  GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_CLASS
    where type 'a pixbuf_animation_class = 'a GdkPixbufPixbufAnimationClass.class
    where type C.notnull = GdkPixbufPixbufAnimationClass.C.notnull
    where type 'a C.p = 'a GdkPixbufPixbufAnimationClass.C.p =
  struct
    type 'a pixbuf_animation_class = 'a GdkPixbufPixbufAnimationClass.class
    open GdkPixbufPixbufAnimationClass
    type 'a pixbuf_simple_anim = unit
    type 'a class = 'a pixbuf_simple_anim class
    val getType_ = _import "gdk_pixbuf_simple_anim_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.notnull FFI.p;
    val getOptValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.notnull FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * unit FFI.p -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
