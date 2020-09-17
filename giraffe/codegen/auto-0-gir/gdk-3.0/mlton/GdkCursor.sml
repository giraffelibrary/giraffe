structure GdkCursor :>
  GDK_CURSOR
    where type 'a class = 'a GdkCursorClass.class
    where type cursor_type_t = GdkCursorType.t
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    val getType_ = _import "gdk_cursor_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gdk_cursor_new" : GdkCursorType.FFI.val_ -> GdkCursorClass.FFI.non_opt GdkCursorClass.FFI.p;
    val newForDisplay_ = fn x1 & x2 => (_import "gdk_cursor_new_for_display" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p * GdkCursorType.FFI.val_ -> GdkCursorClass.FFI.non_opt GdkCursorClass.FFI.p;) (x1, x2)
    val newFromName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_cursor_new_from_name" :
              GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GdkCursorClass.FFI.opt GdkCursorClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromPixbuf_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_cursor_new_from_pixbuf" :
              GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p
               * GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GdkCursorClass.FFI.non_opt GdkCursorClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val newFromSurface_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_cursor_new_from_surface" :
              GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p
               * CairoSurfaceRecord.FFI.non_opt CairoSurfaceRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> GdkCursorClass.FFI.non_opt GdkCursorClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getCursorType_ = _import "gdk_cursor_get_cursor_type" : GdkCursorClass.FFI.non_opt GdkCursorClass.FFI.p -> GdkCursorType.FFI.val_;
    val getDisplay_ = _import "gdk_cursor_get_display" : GdkCursorClass.FFI.non_opt GdkCursorClass.FFI.p -> GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p;
    val getImage_ = _import "gdk_cursor_get_image" : GdkCursorClass.FFI.non_opt GdkCursorClass.FFI.p -> GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p;
    val getSurface_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_cursor_get_surface" :
              GdkCursorClass.FFI.non_opt GdkCursorClass.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> CairoSurfaceRecord.FFI.opt CairoSurfaceRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GdkCursorClass.class
    type cursor_type_t = GdkCursorType.t
    type 'a display_class = 'a GdkDisplayClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new cursorType = (GdkCursorType.FFI.withVal ---> GdkCursorClass.FFI.fromPtr true) new_ cursorType
    fun newForDisplay (display, cursorType) = (GdkDisplayClass.FFI.withPtr false &&&> GdkCursorType.FFI.withVal ---> GdkCursorClass.FFI.fromPtr true) newForDisplay_ (display & cursorType)
    fun newFromName (display, name) = (GdkDisplayClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GdkCursorClass.FFI.fromOptPtr true) newFromName_ (display & name)
    fun newFromPixbuf
      (
        display,
        pixbuf,
        x,
        y
      ) =
      (
        GdkDisplayClass.FFI.withPtr false
         &&&> GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GdkCursorClass.FFI.fromPtr true
      )
        newFromPixbuf_
        (
          display
           & pixbuf
           & x
           & y
        )
    fun newFromSurface
      (
        display,
        surface,
        x,
        y
      ) =
      (
        GdkDisplayClass.FFI.withPtr false
         &&&> CairoSurfaceRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GdkCursorClass.FFI.fromPtr true
      )
        newFromSurface_
        (
          display
           & surface
           & x
           & y
        )
    fun getCursorType self = (GdkCursorClass.FFI.withPtr false ---> GdkCursorType.FFI.fromVal) getCursorType_ self
    fun getDisplay self = (GdkCursorClass.FFI.withPtr false ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self before GdkCursorClass.FFI.touchPtr self
    fun getImage self = (GdkCursorClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromOptPtr true) getImage_ self
    fun getSurface self =
      let
        val xHot
         & yHot
         & retVal =
          (
            GdkCursorClass.FFI.withPtr false
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && CairoSurfaceRecord.FFI.fromOptPtr true
          )
            getSurface_
            (
              self
               & GDouble.null
               & GDouble.null
            )
      in
        (
          retVal,
          xHot,
          yHot
        )
      end
    local
      open ValueAccessor
    in
      val cursorTypeProp =
        {
          name = "cursor-type",
          gtype = fn () => C.gtype GdkCursorType.t (),
          get = fn x => fn () => C.get GdkCursorType.t x,
          set = ignore,
          init = fn x => C.set GdkCursorType.t x
        }
      val displayProp =
        {
          name = "display",
          gtype = fn () => C.gtype GdkDisplayClass.tOpt (),
          get = fn x => fn () => C.get GdkDisplayClass.tOpt x,
          set = ignore,
          init = fn x => C.set GdkDisplayClass.tOpt x
        }
    end
  end
