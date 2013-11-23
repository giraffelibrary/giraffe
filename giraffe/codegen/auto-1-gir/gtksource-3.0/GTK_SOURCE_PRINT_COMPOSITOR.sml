signature GTK_SOURCE_PRINT_COMPOSITOR =
  sig
    type 'a class_t
    type 'a bufferclass_t
    type 'a viewclass_t
    val getType : unit -> GObject.Type.t
    val new : 'a bufferclass_t -> base class_t
    val newFromView : 'a viewclass_t -> base class_t
    val drawPage :
      'a class_t
       -> 'b Gtk.PrintContextClass.t
       -> LargeInt.int
       -> unit
    val getBodyFontName : 'a class_t -> string
    val getBottomMargin :
      'a class_t
       -> Gtk.Unit.t
       -> real
    val getBuffer : 'a class_t -> base bufferclass_t
    val getFooterFontName : 'a class_t -> string
    val getHeaderFontName : 'a class_t -> string
    val getHighlightSyntax : 'a class_t -> bool
    val getLeftMargin :
      'a class_t
       -> Gtk.Unit.t
       -> real
    val getLineNumbersFontName : 'a class_t -> string
    val getNPages : 'a class_t -> LargeInt.int
    val getPaginationProgress : 'a class_t -> real
    val getPrintFooter : 'a class_t -> bool
    val getPrintHeader : 'a class_t -> bool
    val getPrintLineNumbers : 'a class_t -> LargeInt.int
    val getRightMargin :
      'a class_t
       -> Gtk.Unit.t
       -> real
    val getTabWidth : 'a class_t -> LargeInt.int
    val getTopMargin :
      'a class_t
       -> Gtk.Unit.t
       -> real
    val getWrapMode : 'a class_t -> Gtk.WrapMode.t
    val paginate :
      'a class_t
       -> 'b Gtk.PrintContextClass.t
       -> bool
    val setBodyFontName :
      'a class_t
       -> string
       -> unit
    val setBottomMargin :
      'a class_t
       -> real
       -> Gtk.Unit.t
       -> unit
    val setFooterFontName :
      'a class_t
       -> string option
       -> unit
    val setFooterFormat :
      'a class_t
       -> bool
       -> string option
       -> string option
       -> string option
       -> unit
    val setHeaderFontName :
      'a class_t
       -> string option
       -> unit
    val setHeaderFormat :
      'a class_t
       -> bool
       -> string option
       -> string option
       -> string option
       -> unit
    val setHighlightSyntax :
      'a class_t
       -> bool
       -> unit
    val setLeftMargin :
      'a class_t
       -> real
       -> Gtk.Unit.t
       -> unit
    val setLineNumbersFontName :
      'a class_t
       -> string option
       -> unit
    val setPrintFooter :
      'a class_t
       -> bool
       -> unit
    val setPrintHeader :
      'a class_t
       -> bool
       -> unit
    val setPrintLineNumbers :
      'a class_t
       -> LargeInt.int
       -> unit
    val setRightMargin :
      'a class_t
       -> real
       -> Gtk.Unit.t
       -> unit
    val setTabWidth :
      'a class_t
       -> LargeInt.int
       -> unit
    val setTopMargin :
      'a class_t
       -> real
       -> Gtk.Unit.t
       -> unit
    val setWrapMode :
      'a class_t
       -> Gtk.WrapMode.t
       -> unit
    val bodyFontNameProp : ('a class_t, string option, string option) Property.readwrite
    val bufferProp : ('a class_t, base bufferclass_t option, 'b bufferclass_t option) Property.readwrite
    val footerFontNameProp : ('a class_t, string option, string option) Property.readwrite
    val headerFontNameProp : ('a class_t, string option, string option) Property.readwrite
    val highlightSyntaxProp : ('a class_t, bool, bool) Property.readwrite
    val lineNumbersFontNameProp : ('a class_t, string option, string option) Property.readwrite
    val nPagesProp : ('a class_t, LargeInt.int) Property.readonly
    val printFooterProp : ('a class_t, bool, bool) Property.readwrite
    val printHeaderProp : ('a class_t, bool, bool) Property.readwrite
    val printLineNumbersProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val tabWidthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val wrapModeProp : ('a class_t, Gtk.WrapMode.t, Gtk.WrapMode.t) Property.readwrite
  end
