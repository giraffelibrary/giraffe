structure GdkPixbufPixbufSimpleAnimClass :>
  GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_CLASS
    where type 'a pixbuf_animation_class = 'a GdkPixbufPixbufAnimationClass.class
    where type C.opt = GdkPixbufPixbufAnimationClass.C.opt
    where type C.non_opt = GdkPixbufPixbufAnimationClass.C.non_opt
    where type 'a C.p = 'a GdkPixbufPixbufAnimationClass.C.p =
  struct
    type 'a pixbuf_animation_class = 'a GdkPixbufPixbufAnimationClass.class
    open GdkPixbufPixbufAnimationClass
    type 'a pixbuf_simple_anim = unit
    type 'a class = 'a pixbuf_simple_anim class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_pixbuf_simple_anim_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
    end
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
