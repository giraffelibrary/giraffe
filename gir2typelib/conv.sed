s/externalFunctionSymbol/getSymbol/g
s/externalDataSymbol/getSymbol/g
s/GInt\(CArray\|CArrayN\|\)\./GInt32\1\./g
s/GUInt\(CArray\|CArrayN\|\)\./GUInt32\1\./g
s/GLong\(CArray\|CArrayN\|\)\./GInt64\1\./g
s/GULong\(CArray\|CArrayN\|\)\./GUInt64\1\./g
s/GSize\(CArray\|CArrayN\|\)\./GUInt64\1\./g
s/GSSize\(CArray\|CArrayN\|\)\./GInt64\1\./g
s/GLibQuark\(CArray\|CArrayN\|\)\.PolyML\./GUInt32\1\.PolyML\./g
s/GLibQuark\(CArray\|CArrayN\|\)\.FFI\./GUInt32\1\.FFI\./g
s/GLib\.Quark\.t/LargeInt\.int/g
s/GLibPid\.FFI\./GInt32\.FFI\./g
s/GLibPid\.PolyML\./GInt32\.PolyML\./g
s/GLib.Pid\.t/LargeInt.int/g
s/XlibWindow\.FFI\./GUInt64\.FFI\./g
s/XlibWindow\.PolyML\./GUInt64\.PolyML\./g
s/Xlib.Window\.t/LargeInt.int/g
s/AtkState\.FFI\./GUInt64\.FFI\./g
s/AtkState\.PolyML\./GUInt64\.PolyML\./g
s/PangoGlyph\.FFI\./GUInt32\.FFI\./g
s/PangoGlyph\.PolyML\./GUInt32\.PolyML\./g
s/GdkRectangleRecord\.PolyML\./CairoRectangleIntRecord\.PolyML\./g
s/GdkRectangleRecord\.FFI\./CairoRectangleIntRecord\.FFI\./g
s/Gdk\.RectangleRecord\.PolyML\./Cairo\.RectangleIntRecord\.PolyML\./g
s/Gdk\.RectangleRecord\.FFI\./Cairo\.RectangleIntRecord\.FFI\./g
s/Gdk\.RectangleRecord\.t/Cairo\.RectangleIntRecord\.t/g
s/GtkAllocationRecord\.FFI\./CairoRectangleIntRecord\.FFI\./g
s/GtkAllocationRecord\.PolyML\./CairoRectangleIntRecord\.PolyML\./g
