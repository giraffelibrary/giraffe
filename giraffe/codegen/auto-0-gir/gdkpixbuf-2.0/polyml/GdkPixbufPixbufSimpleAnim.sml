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
            GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
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
        GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GFloat.FFI.withVal
         ---> GdkPixbufPixbufSimpleAnimClass.FFI.fromPtr true
      )
        new_
        (
          width
           & height
           & rate
        )
    fun addFrame self pixbuf = (GdkPixbufPixbufSimpleAnimClass.FFI.withPtr &&&> GdkPixbufPixbufClass.FFI.withPtr ---> I) addFrame_ (self & pixbuf)
    fun getLoop self = (GdkPixbufPixbufSimpleAnimClass.FFI.withPtr ---> GBool.FFI.fromVal) getLoop_ self
    fun setLoop self loop = (GdkPixbufPixbufSimpleAnimClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setLoop_ (self & loop)
    local
      open Property
    in
      val loopProp =
        {
          get = fn x => get "loop" boolean x,
          set = fn x => set "loop" boolean x,
          new = fn x => new "loop" boolean x
        }
    end
  end
