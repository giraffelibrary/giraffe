signature GTK_SOURCE_PRINT_COMPOSITOR =
  sig
    type 'a class
    type 'a view_class
    type 'a buffer_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a buffer_class -> base class
    val newFromView : 'a view_class -> base class
    val drawPage :
      'a class
       -> 'b Gtk.PrintContextClass.class * LargeInt.int
       -> unit
    val getBodyFontName : 'a class -> string
    val getBottomMargin :
      'a class
       -> Gtk.Unit.t
       -> real
    val getBuffer : 'a class -> base buffer_class
    val getFooterFontName : 'a class -> string
    val getHeaderFontName : 'a class -> string
    val getHighlightSyntax : 'a class -> bool
    val getLeftMargin :
      'a class
       -> Gtk.Unit.t
       -> real
    val getLineNumbersFontName : 'a class -> string
    val getNPages : 'a class -> LargeInt.int
    val getPaginationProgress : 'a class -> real
    val getPrintFooter : 'a class -> bool
    val getPrintHeader : 'a class -> bool
    val getPrintLineNumbers : 'a class -> LargeInt.int
    val getRightMargin :
      'a class
       -> Gtk.Unit.t
       -> real
    val getTabWidth : 'a class -> LargeInt.int
    val getTopMargin :
      'a class
       -> Gtk.Unit.t
       -> real
    val getWrapMode : 'a class -> Gtk.WrapMode.t
    val paginate :
      'a class
       -> 'b Gtk.PrintContextClass.class
       -> bool
    val setBodyFontName :
      'a class
       -> string
       -> unit
    val setBottomMargin :
      'a class
       -> real * Gtk.Unit.t
       -> unit
    val setFooterFontName :
      'a class
       -> string option
       -> unit
    val setFooterFormat :
      'a class
       -> bool
           * string option
           * string option
           * string option
       -> unit
    val setHeaderFontName :
      'a class
       -> string option
       -> unit
    val setHeaderFormat :
      'a class
       -> bool
           * string option
           * string option
           * string option
       -> unit
    val setHighlightSyntax :
      'a class
       -> bool
       -> unit
    val setLeftMargin :
      'a class
       -> real * Gtk.Unit.t
       -> unit
    val setLineNumbersFontName :
      'a class
       -> string option
       -> unit
    val setPrintFooter :
      'a class
       -> bool
       -> unit
    val setPrintHeader :
      'a class
       -> bool
       -> unit
    val setPrintLineNumbers :
      'a class
       -> LargeInt.int
       -> unit
    val setRightMargin :
      'a class
       -> real * Gtk.Unit.t
       -> unit
    val setTabWidth :
      'a class
       -> LargeInt.int
       -> unit
    val setTopMargin :
      'a class
       -> real * Gtk.Unit.t
       -> unit
    val setWrapMode :
      'a class
       -> Gtk.WrapMode.t
       -> unit
    val bodyFontNameProp : ('a class, string option, string option) Property.readwrite
    val bufferProp : ('a class, base buffer_class option, 'b buffer_class option) Property.readwrite
    val footerFontNameProp : ('a class, string option, string option) Property.readwrite
    val headerFontNameProp : ('a class, string option, string option) Property.readwrite
    val highlightSyntaxProp : ('a class, bool, bool) Property.readwrite
    val lineNumbersFontNameProp : ('a class, string option, string option) Property.readwrite
    val nPagesProp : ('a class, LargeInt.int) Property.readonly
    val printFooterProp : ('a class, bool, bool) Property.readwrite
    val printHeaderProp : ('a class, bool, bool) Property.readwrite
    val printLineNumbersProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val tabWidthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val wrapModeProp : ('a class, Gtk.WrapMode.t, Gtk.WrapMode.t) Property.readwrite
  end
