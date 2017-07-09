structure Xlib : XLIB =
  struct
    local
      open PolyMLFFI
    in
      val openDisplay_ = call (getSymbol "XOpenDisplay") (cVoid --> cVoid)
    end
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
