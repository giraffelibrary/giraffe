structure GdkPixbufPixbufSimpleAnim :>
  GDK_PIXBUF_PIXBUF_SIMPLE_ANIM
    where type 'a class = 'a GdkPixbufPixbufSimpleAnimClass.class
    where type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_pixbuf_simple_anim_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gdk_pixbuf_simple_anim_new")
          (
            GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GFloat.PolyML.cVal
             --> GdkPixbufPixbufSimpleAnimClass.PolyML.cPtr
          )
      val addFrame_ = call (getSymbol "gdk_pixbuf_simple_anim_add_frame") (GdkPixbufPixbufSimpleAnimClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cPtr --> cVoid)
      val getLoop_ = call (getSymbol "gdk_pixbuf_simple_anim_get_loop") (GdkPixbufPixbufSimpleAnimClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setLoop_ = call (getSymbol "gdk_pixbuf_simple_anim_set_loop") (GdkPixbufPixbufSimpleAnimClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GdkPixbufPixbufSimpleAnimClass.class
    type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        width,
        height,
        rate
      ) =
      (
        GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GFloat.FFI.withVal
         ---> GdkPixbufPixbufSimpleAnimClass.FFI.fromPtr true
      )
        new_
        (
          width
           & height
           & rate
        )
    fun addFrame self pixbuf = (GdkPixbufPixbufSimpleAnimClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withPtr false ---> I) addFrame_ (self & pixbuf)
    fun getLoop self = (GdkPixbufPixbufSimpleAnimClass.FFI.withPtr false ---> GBool.FFI.fromVal) getLoop_ self
    fun setLoop self loop = (GdkPixbufPixbufSimpleAnimClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setLoop_ (self & loop)
    local
      open ValueAccessor
    in
      val loopProp =
        {
          name = "loop",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
