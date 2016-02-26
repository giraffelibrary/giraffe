structure GdkCursor :>
  GDK_CURSOR
    where type 'a class_t = 'a GdkCursorClass.t
    where type cursor_type_t = GdkCursorType.t
    where type 'a display_class_t = 'a GdkDisplayClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_cursor_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgdk "gdk_cursor_new") (GdkCursorType.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val newForDisplay_ = call (load_sym libgdk "gdk_cursor_new_for_display") (GObjectObjectClass.PolyML.cPtr &&> GdkCursorType.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val newFromName_ = call (load_sym libgdk "gdk_cursor_new_from_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val newFromPixbuf_ =
        call (load_sym libgdk "gdk_cursor_new_from_pixbuf")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getCursorType_ = call (load_sym libgdk "gdk_cursor_get_cursor_type") (GObjectObjectClass.PolyML.cPtr --> GdkCursorType.PolyML.cVal)
      val getDisplay_ = call (load_sym libgdk "gdk_cursor_get_display") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getImage_ = call (load_sym libgdk "gdk_cursor_get_image") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class_t = 'a GdkCursorClass.t
    type cursor_type_t = GdkCursorType.t
    type 'a display_class_t = 'a GdkDisplayClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new cursorType = (GdkCursorType.C.withVal ---> GdkCursorClass.C.fromPtr true) new_ cursorType
    fun newForDisplay display cursorType = (GObjectObjectClass.C.withPtr &&&> GdkCursorType.C.withVal ---> GdkCursorClass.C.fromPtr true) newForDisplay_ (display & cursorType)
    fun newFromName display name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GdkCursorClass.C.fromPtr true) newFromName_ (display & name)
    fun newFromPixbuf display pixbuf x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
    fun getCursorType self = (GObjectObjectClass.C.withPtr ---> GdkCursorType.C.fromVal) getCursorType_ self
    fun getDisplay self = (GObjectObjectClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
    fun getImage self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) getImage_ self
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
