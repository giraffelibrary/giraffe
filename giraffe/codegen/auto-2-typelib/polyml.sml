val libglib = CInterface.load_lib "libglib-2.0.so"
val libgobject = CInterface.load_lib "libgobject-2.0.so"
val libgio = CInterface.load_lib "libgio-2.0.so"
val libgmodule = CInterface.load_lib "libgmodule-2.0.so"
val libatk = CInterface.load_lib "libatk-1.0.so"
val libgdkpixbuf = CInterface.load_lib "libgdk_pixbuf-2.0.so"
val libpango = CInterface.load_lib "libpango-1.0.so"
val libcairo = CInterface.load_lib "libcairo.so"
val libcairogobject = CInterface.load_lib "libcairo-gobject.so"
val libpangocairo = CInterface.load_lib "libpangocairo-1.0.so"
val libgdk = CInterface.load_lib "libgdk-3.so"
val libgtk = CInterface.load_lib "libgtk-3.so"
val libvte = CInterface.load_lib "libvte2_90.so"
val libgtksourceview = CInterface.load_lib "libgtksourceview-3.0.so"

val libgiraffeglib = CInterface.load_lib "libgiraffe-glib-2.0.so"
val libgiraffegobject = CInterface.load_lib "libgiraffe-gobject-2.0.so"
val libgiraffecairo = CInterface.load_lib "libgiraffe-cairo.so"
val libgiraffepango = CInterface.load_lib "libgiraffe-pango.so"
val libgiraffegdk = CInterface.load_lib "libgiraffe-gdk-3.0.so"
val libgiraffegtk = CInterface.load_lib "libgiraffe-gtk+-3.0.so"
val libgiraffevte = CInterface.load_lib "libgiraffe-vte-2.90.so"
;

use "gobject-2.0/polyml.sml";
use "glib-2.0/polyml.sml";
use "gio-2.0/polyml.sml";
use "gmodule-2.0/polyml.sml";
use "gdkpixbuf-2.0/polyml.sml";
use "pango-1.0/polyml.sml";
use "cairo-1.0/polyml.sml";
use "pangocairo-1.0/polyml.sml";
use "gdk-3.0/polyml.sml";
use "atk-1.0/polyml.sml";
use "gtk-3.0/polyml.sml";
use "gtksource-3.0/polyml.sml";
use "vte-2.90/polyml.sml";
