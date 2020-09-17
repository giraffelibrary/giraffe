structure GdkCursor :>
  GDK_CURSOR
    where type 'a class = 'a GdkCursorClass.class
    where type cursor_type_t = GdkCursorType.t
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_cursor_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gdk_cursor_new") (GdkCursorType.PolyML.cVal --> GdkCursorClass.PolyML.cPtr)
      val newForDisplay_ = call (getSymbol "gdk_cursor_new_for_display") (GdkDisplayClass.PolyML.cPtr &&> GdkCursorType.PolyML.cVal --> GdkCursorClass.PolyML.cPtr)
      val newFromName_ = call (getSymbol "gdk_cursor_new_from_name") (GdkDisplayClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GdkCursorClass.PolyML.cOptPtr)
      val newFromPixbuf_ =
        call (getSymbol "gdk_cursor_new_from_pixbuf")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> GdkPixbufPixbufClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GdkCursorClass.PolyML.cPtr
          )
      val newFromSurface_ =
        call (getSymbol "gdk_cursor_new_from_surface")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> CairoSurfaceRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GdkCursorClass.PolyML.cPtr
          )
      val getCursorType_ = call (getSymbol "gdk_cursor_get_cursor_type") (GdkCursorClass.PolyML.cPtr --> GdkCursorType.PolyML.cVal)
      val getDisplay_ = call (getSymbol "gdk_cursor_get_display") (GdkCursorClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cPtr)
      val getImage_ = call (getSymbol "gdk_cursor_get_image") (GdkCursorClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cOptPtr)
      val getSurface_ =
        call (getSymbol "gdk_cursor_get_surface")
          (
            GdkCursorClass.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> CairoSurfaceRecord.PolyML.cOptPtr
          )
    end
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
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
