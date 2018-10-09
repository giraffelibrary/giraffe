signature XLIB =
  sig
    structure Atom : XLIB_ATOM
    structure Colormap : XLIB_COLORMAP
    structure Cursor : XLIB_CURSOR
    structure Drawable : XLIB_DRAWABLE
    structure KeyCode : XLIB_KEY_CODE
    structure KeySym : XLIB_KEY_SYM
    structure Picture : XLIB_PICTURE
    structure Time : XLIB_TIME
    structure VisualID : XLIB_VISUAL_I_D
    structure Window : XLIB_WINDOW
    structure Xid : XLIB_XID
    structure Pixmap : XLIB_PIXMAP
    val openDisplay : unit -> unit
  end
