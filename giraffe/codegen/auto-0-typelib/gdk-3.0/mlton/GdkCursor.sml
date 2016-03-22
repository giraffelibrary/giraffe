structure GdkCursor :>
  GDK_CURSOR
    where type 'a class = 'a GdkCursorClass.class
    where type cursor_type_t = GdkCursorType.t
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    val getType_ = _import "gdk_cursor_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gdk_cursor_new" : GdkCursorType.C.val_ -> GdkCursorClass.C.notnull GdkCursorClass.C.p;
    val newForDisplay_ = fn x1 & x2 => (_import "gdk_cursor_new_for_display" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p * GdkCursorType.C.val_ -> GdkCursorClass.C.notnull GdkCursorClass.C.p;) (x1, x2)
    val newFromName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_cursor_new_from_name" :
              GdkDisplayClass.C.notnull GdkDisplayClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GdkCursorClass.C.notnull GdkCursorClass.C.p;
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
              GdkDisplayClass.C.notnull GdkDisplayClass.C.p
               * GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> GdkCursorClass.C.notnull GdkCursorClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getCursorType_ = _import "gdk_cursor_get_cursor_type" : GdkCursorClass.C.notnull GdkCursorClass.C.p -> GdkCursorType.C.val_;
    val getDisplay_ = _import "gdk_cursor_get_display" : GdkCursorClass.C.notnull GdkCursorClass.C.p -> GdkDisplayClass.C.notnull GdkDisplayClass.C.p;
    val getImage_ = _import "gdk_cursor_get_image" : GdkCursorClass.C.notnull GdkCursorClass.C.p -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
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
