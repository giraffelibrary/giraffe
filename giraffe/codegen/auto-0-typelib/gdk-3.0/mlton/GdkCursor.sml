structure GdkCursor :>
  GDK_CURSOR
    where type 'a class_t = 'a GdkCursorClass.t
    where type cursor_type_t = GdkCursorType.t
    where type 'a display_class_t = 'a GdkDisplayClass.t =
  struct
    val getType_ = _import "gdk_cursor_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gdk_cursor_new" : GdkCursorType.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newForDisplay_ = fn x1 & x2 => (_import "gdk_cursor_new_for_display" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkCursorType.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val newFromName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_cursor_new_from_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getCursorType_ = _import "gdk_cursor_get_cursor_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkCursorType.C.val_;
    val getDisplay_ = _import "gdk_cursor_get_display" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getImage_ = _import "gdk_cursor_get_image" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GdkCursorClass.t
    type cursor_type_t = GdkCursorType.t
    type 'a display_class_t = 'a GdkDisplayClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new cursorType = (GdkCursorType.C.withVal ---> GdkCursorClass.C.fromPtr true) new_ cursorType
    fun newForDisplay display cursorType = (GObjectObjectClass.C.withPtr &&&> GdkCursorType.C.withVal ---> GdkCursorClass.C.fromPtr true) newForDisplay_ (display & cursorType)
    fun newFromName display name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GdkCursorClass.C.fromPtr true) newFromName_ (display & name)
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
