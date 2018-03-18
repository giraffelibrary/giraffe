structure GdkCursor :>
  GDK_CURSOR
    where type 'a class = 'a GdkCursorClass.class
    where type cursor_type_t = GdkCursorType.t
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    val getType_ = _import "gdk_cursor_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gdk_cursor_new" : GdkCursorType.FFI.val_ -> GdkCursorClass.FFI.notnull GdkCursorClass.FFI.p;
    val newForDisplay_ = fn x1 & x2 => (_import "gdk_cursor_new_for_display" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p * GdkCursorType.FFI.val_ -> GdkCursorClass.FFI.notnull GdkCursorClass.FFI.p;) (x1, x2)
    val newFromName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_cursor_new_from_name" :
              GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit GdkCursorClass.FFI.p;
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
              GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p
               * GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GdkCursorClass.FFI.notnull GdkCursorClass.FFI.p;
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
              GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p
               * CairoSurfaceRecord.FFI.notnull CairoSurfaceRecord.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> GdkCursorClass.FFI.notnull GdkCursorClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getCursorType_ = _import "gdk_cursor_get_cursor_type" : GdkCursorClass.FFI.notnull GdkCursorClass.FFI.p -> GdkCursorType.FFI.val_;
    val getDisplay_ = _import "gdk_cursor_get_display" : GdkCursorClass.FFI.notnull GdkCursorClass.FFI.p -> GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p;
    val getImage_ = _import "gdk_cursor_get_image" : GdkCursorClass.FFI.notnull GdkCursorClass.FFI.p -> unit GdkPixbufPixbufClass.FFI.p;
    val getSurface_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_cursor_get_surface" :
              GdkCursorClass.FFI.notnull GdkCursorClass.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> unit CairoSurfaceRecord.FFI.p;
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
    fun newForDisplay (display, cursorType) = (GdkDisplayClass.FFI.withPtr &&&> GdkCursorType.FFI.withVal ---> GdkCursorClass.FFI.fromPtr true) newForDisplay_ (display & cursorType)
    fun newFromName (display, name) = (GdkDisplayClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GdkCursorClass.FFI.fromOptPtr true) newFromName_ (display & name)
    fun newFromPixbuf
      (
        display,
        pixbuf,
        x,
        y
      ) =
      (
        GdkDisplayClass.FFI.withPtr
         &&&> GdkPixbufPixbufClass.FFI.withPtr
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
        GdkDisplayClass.FFI.withPtr
         &&&> CairoSurfaceRecord.FFI.withPtr
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
    fun getCursorType self = (GdkCursorClass.FFI.withPtr ---> GdkCursorType.FFI.fromVal) getCursorType_ self
    fun getDisplay self = (GdkCursorClass.FFI.withPtr ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self
    fun getImage self = (GdkCursorClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromOptPtr true) getImage_ self
    fun getSurface self =
      let
        val xHot
         & yHot
         & retVal =
          (
            GdkCursorClass.FFI.withPtr
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
      open Property
    in
      val cursorTypeProp =
        {
          get = fn x => get "cursor-type" GdkCursorType.t x,
          new = fn x => new "cursor-type" GdkCursorType.t x
        }
      val displayProp =
        {
          get = fn x => get "display" GdkDisplayClass.tOpt x,
          new = fn x => new "display" GdkDisplayClass.tOpt x
        }
    end
  end
