structure GdkPixbufPixbufSimpleAnim :>
  GDK_PIXBUF_PIXBUF_SIMPLE_ANIM
    where type 'a class = 'a GdkPixbufPixbufSimpleAnimClass.class
    where type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_simple_anim_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_simple_anim_new")
          (
            FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Float.PolyML.cVal
             --> GdkPixbufPixbufSimpleAnimClass.PolyML.cPtr
          )
      val addFrame_ = call (load_sym libgdkpixbuf "gdk_pixbuf_simple_anim_add_frame") (GdkPixbufPixbufSimpleAnimClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getLoop_ = call (load_sym libgdkpixbuf "gdk_pixbuf_simple_anim_get_loop") (GdkPixbufPixbufSimpleAnimClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setLoop_ = call (load_sym libgdkpixbuf "gdk_pixbuf_simple_anim_set_loop") (GdkPixbufPixbufSimpleAnimClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GdkPixbufPixbufSimpleAnimClass.class
    type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new width height rate =
      (
        FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Float.C.withVal
         ---> GdkPixbufPixbufSimpleAnimClass.C.fromPtr true
      )
        new_
        (
          width
           & height
           & rate
        )
    fun addFrame self pixbuf = (GdkPixbufPixbufSimpleAnimClass.C.withPtr &&&> GdkPixbufPixbufClass.C.withPtr ---> I) addFrame_ (self & pixbuf)
    fun getLoop self = (GdkPixbufPixbufSimpleAnimClass.C.withPtr ---> FFI.Bool.C.fromVal) getLoop_ self
    fun setLoop self loop = (GdkPixbufPixbufSimpleAnimClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setLoop_ (self & loop)
    local
      open Property
    in
      val loopProp =
        {
          get = fn x => get "loop" boolean x,
          set = fn x => set "loop" boolean x
        }
    end
  end
