structure GdkCursor :>
  GDK_CURSOR
    where type 'a class = 'a GdkCursorClass.class
    where type cursor_type_t = GdkCursorType.t
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_cursor_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gdk_cursor_new") (GdkCursorType.PolyML.cVal --> GdkCursorClass.PolyML.cPtr)
      val newForDisplay_ = call (getSymbol "gdk_cursor_new_for_display") (GdkDisplayClass.PolyML.cPtr &&> GdkCursorType.PolyML.cVal --> GdkCursorClass.PolyML.cPtr)
      val newFromName_ = call (getSymbol "gdk_cursor_new_from_name") (GdkDisplayClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GdkCursorClass.PolyML.cPtr)
      val newFromPixbuf_ =
        call (getSymbol "gdk_cursor_new_from_pixbuf")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> GdkPixbufPixbufClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GdkCursorClass.PolyML.cPtr
          )
      val getCursorType_ = call (getSymbol "gdk_cursor_get_cursor_type") (GdkCursorClass.PolyML.cPtr --> GdkCursorType.PolyML.cVal)
      val getDisplay_ = call (getSymbol "gdk_cursor_get_display") (GdkCursorClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cPtr)
      val getImage_ = call (getSymbol "gdk_cursor_get_image") (GdkCursorClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
    end
    type 'a class = 'a GdkCursorClass.class
    type cursor_type_t = GdkCursorType.t
    type 'a display_class = 'a GdkDisplayClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new cursorType = (GdkCursorType.FFI.withVal ---> GdkCursorClass.FFI.fromPtr true) new_ cursorType
    fun newForDisplay display cursorType = (GdkDisplayClass.FFI.withPtr &&&> GdkCursorType.FFI.withVal ---> GdkCursorClass.FFI.fromPtr true) newForDisplay_ (display & cursorType)
    fun newFromName display name = (GdkDisplayClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GdkCursorClass.FFI.fromPtr true) newFromName_ (display & name)
    fun newFromPixbuf display pixbuf x y =
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
    fun getCursorType self = (GdkCursorClass.FFI.withPtr ---> GdkCursorType.FFI.fromVal) getCursorType_ self
    fun getDisplay self = (GdkCursorClass.FFI.withPtr ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self
    fun getImage self = (GdkCursorClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr true) getImage_ self
    local
      open Property
    in
      val cursorTypeProp =
        {
          get = fn x => get "cursor-type" GdkCursorType.t x,
          set = fn x => set "cursor-type" GdkCursorType.t x
        }
      val displayProp =
        {
          get = fn x => get "display" GdkDisplayClass.tOpt x,
          set = fn x => set "display" GdkDisplayClass.tOpt x
        }
    end
  end
