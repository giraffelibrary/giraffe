structure GdkPixbufPixbufSimpleAnim :>
  GDK_PIXBUF_PIXBUF_SIMPLE_ANIM
    where type 'a class = 'a GdkPixbufPixbufSimpleAnimClass.class
    where type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class =
  struct
    val getType_ = _import "gdk_pixbuf_simple_anim_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_pixbuf_simple_anim_new" :
              FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Float.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val addFrame_ = fn x1 & x2 => (_import "gdk_pixbuf_simple_anim_add_frame" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val getLoop_ = _import "gdk_pixbuf_simple_anim_get_loop" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setLoop_ = fn x1 & x2 => (_import "gdk_pixbuf_simple_anim_set_loop" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GdkPixbufPixbufSimpleAnimClass.class
    type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new width height rate =
      (
        FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Float.C.withVal
         ---> GdkPixbufPixbufSimpleAnimClass.C.fromPtr true
      )
        new_
        (
          width
           & height
           & rate
        )
    fun addFrame self pixbuf = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addFrame_ (self & pixbuf)
    fun getLoop self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getLoop_ self
    fun setLoop self loop = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setLoop_ (self & loop)
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
