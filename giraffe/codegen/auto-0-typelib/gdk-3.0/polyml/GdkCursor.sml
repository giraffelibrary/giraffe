structure GdkCursor :>
  GDK_CURSOR
    where type 'a class = 'a GdkCursorClass.class
    where type cursor_type_t = GdkCursorType.t
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_cursor_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgdk "gdk_cursor_new") (GdkCursorType.PolyML.cVal --> GdkCursorClass.PolyML.cPtr)
      val newForDisplay_ = call (load_sym libgdk "gdk_cursor_new_for_display") (GdkDisplayClass.PolyML.cPtr &&> GdkCursorType.PolyML.cVal --> GdkCursorClass.PolyML.cPtr)
      val newFromName_ = call (load_sym libgdk "gdk_cursor_new_from_name") (GdkDisplayClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GdkCursorClass.PolyML.cPtr)
      val newFromPixbuf_ =
        call (load_sym libgdk "gdk_cursor_new_from_pixbuf")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> GdkPixbufPixbufClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> GdkCursorClass.PolyML.cPtr
          )
      val getCursorType_ = call (load_sym libgdk "gdk_cursor_get_cursor_type") (GdkCursorClass.PolyML.cPtr --> GdkCursorType.PolyML.cVal)
      val getDisplay_ = call (load_sym libgdk "gdk_cursor_get_display") (GdkCursorClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cPtr)
      val getImage_ = call (load_sym libgdk "gdk_cursor_get_image") (GdkCursorClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
    end
    type 'a class = 'a GdkCursorClass.class
    type cursor_type_t = GdkCursorType.t
    type 'a display_class = 'a GdkDisplayClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new cursorType = (GdkCursorType.C.withVal ---> GdkCursorClass.C.fromPtr true) new_ cursorType
    fun newForDisplay display cursorType = (GdkDisplayClass.C.withPtr &&&> GdkCursorType.C.withVal ---> GdkCursorClass.C.fromPtr true) newForDisplay_ (display & cursorType)
    fun newFromName display name = (GdkDisplayClass.C.withPtr &&&> Utf8.C.withPtr ---> GdkCursorClass.C.fromPtr true) newFromName_ (display & name)
    fun newFromPixbuf display pixbuf x y =
      (
        GdkDisplayClass.C.withPtr
         &&&> GdkPixbufPixbufClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> GdkCursorClass.C.fromPtr true
      )
        newFromPixbuf_
        (
          display
           & pixbuf
           & x
           & y
        )
    fun getCursorType self = (GdkCursorClass.C.withPtr ---> GdkCursorType.C.fromVal) getCursorType_ self
    fun getDisplay self = (GdkCursorClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
    fun getImage self = (GdkCursorClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) getImage_ self
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
