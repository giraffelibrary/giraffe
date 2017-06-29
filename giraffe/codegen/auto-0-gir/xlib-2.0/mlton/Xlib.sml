structure Xlib : XLIB =
  struct
    val openDisplay_ = _import "XOpenDisplay" : unit -> unit;
    structure Atom = XlibAtom
    structure Colormap = XlibColormap
    structure Cursor = XlibCursor
    structure Drawable = XlibDrawable
    structure KeyCode = XlibKeyCode
    structure KeySym = XlibKeySym
    structure Picture = XlibPicture
    structure Time = XlibTime
    structure VisualID = XlibVisualID
    structure Window = XlibWindow
    structure Xid = XlibXid
    structure Pixmap = XlibPixmap
    fun openDisplay () = (I ---> I) openDisplay_ ()
  end
