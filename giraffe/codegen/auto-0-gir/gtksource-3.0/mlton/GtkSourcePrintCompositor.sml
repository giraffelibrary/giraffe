structure GtkSourcePrintCompositor :>
  GTK_SOURCE_PRINT_COMPOSITOR
    where type 'a class_t = 'a GtkSourcePrintCompositorClass.t
    where type 'a view_class_t = 'a GtkSourceViewClass.t
    where type 'a buffer_class_t = 'a GtkSourceBufferClass.t =
  struct
    val getType_ = _import "gtk_source_print_compositor_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_source_print_compositor_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newFromView_ = _import "gtk_source_print_compositor_new_from_view" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val drawPage_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_print_compositor_draw_page" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getBodyFontName_ = _import "gtk_source_print_compositor_get_body_font_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getBottomMargin_ = fn x1 & x2 => (_import "gtk_source_print_compositor_get_bottom_margin" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getBuffer_ = _import "gtk_source_print_compositor_get_buffer" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFooterFontName_ = _import "gtk_source_print_compositor_get_footer_font_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getHeaderFontName_ = _import "gtk_source_print_compositor_get_header_font_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getHighlightSyntax_ = _import "gtk_source_print_compositor_get_highlight_syntax" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getLeftMargin_ = fn x1 & x2 => (_import "gtk_source_print_compositor_get_left_margin" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getLineNumbersFontName_ = _import "gtk_source_print_compositor_get_line_numbers_font_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getNPages_ = _import "gtk_source_print_compositor_get_n_pages" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getPaginationProgress_ = _import "gtk_source_print_compositor_get_pagination_progress" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val getPrintFooter_ = _import "gtk_source_print_compositor_get_print_footer" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getPrintHeader_ = _import "gtk_source_print_compositor_get_print_header" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getPrintLineNumbers_ = _import "gtk_source_print_compositor_get_print_line_numbers" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt.C.val_;
    val getRightMargin_ = fn x1 & x2 => (_import "gtk_source_print_compositor_get_right_margin" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getTabWidth_ = _import "gtk_source_print_compositor_get_tab_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt.C.val_;
    val getTopMargin_ = fn x1 & x2 => (_import "gtk_source_print_compositor_get_top_margin" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getWrapMode_ = _import "gtk_source_print_compositor_get_wrap_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkWrapMode.C.val_;
    val paginate_ = fn x1 & x2 => (_import "gtk_source_print_compositor_paginate" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val setBodyFontName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_print_compositor_set_body_font_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setBottomMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_print_compositor_set_bottom_margin" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.val_
               * GtkUnit.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFooterFontName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_print_compositor_set_footer_font_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFooterFormat_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6)
         & (x7, x8) =>
          (
            _import "mlton_gtk_source_print_compositor_set_footer_format" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Bool.C.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val setHeaderFontName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_print_compositor_set_header_font_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setHeaderFormat_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6)
         & (x7, x8) =>
          (
            _import "mlton_gtk_source_print_compositor_set_header_format" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Bool.C.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val setHighlightSyntax_ = fn x1 & x2 => (_import "gtk_source_print_compositor_set_highlight_syntax" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setLeftMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_print_compositor_set_left_margin" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.val_
               * GtkUnit.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLineNumbersFontName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_print_compositor_set_line_numbers_font_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPrintFooter_ = fn x1 & x2 => (_import "gtk_source_print_compositor_set_print_footer" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setPrintHeader_ = fn x1 & x2 => (_import "gtk_source_print_compositor_set_print_header" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setPrintLineNumbers_ = fn x1 & x2 => (_import "gtk_source_print_compositor_set_print_line_numbers" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val setRightMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_print_compositor_set_right_margin" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.val_
               * GtkUnit.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTabWidth_ = fn x1 & x2 => (_import "gtk_source_print_compositor_set_tab_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val setTopMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_print_compositor_set_top_margin" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.val_
               * GtkUnit.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWrapMode_ = fn x1 & x2 => (_import "gtk_source_print_compositor_set_wrap_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkWrapMode.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkSourcePrintCompositorClass.t
    type 'a view_class_t = 'a GtkSourceViewClass.t
    type 'a buffer_class_t = 'a GtkSourceBufferClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new buffer = (GObjectObjectClass.C.withPtr ---> GtkSourcePrintCompositorClass.C.fromPtr true) new_ buffer
    fun newFromView view = (GObjectObjectClass.C.withPtr ---> GtkSourcePrintCompositorClass.C.fromPtr true) newFromView_ view
    fun drawPage self context pageNr =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        drawPage_
        (
          self
           & context
           & pageNr
        )
    fun getBodyFontName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getBodyFontName_ self
    fun getBottomMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getBottomMargin_ (self & unit)
    fun getBuffer self = (GObjectObjectClass.C.withPtr ---> GtkSourceBufferClass.C.fromPtr false) getBuffer_ self
    fun getFooterFontName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getFooterFontName_ self
    fun getHeaderFontName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getHeaderFontName_ self
    fun getHighlightSyntax self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHighlightSyntax_ self
    fun getLeftMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getLeftMargin_ (self & unit)
    fun getLineNumbersFontName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getLineNumbersFontName_ self
    fun getNPages self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNPages_ self
    fun getPaginationProgress self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getPaginationProgress_ self
    fun getPrintFooter self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getPrintFooter_ self
    fun getPrintHeader self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getPrintHeader_ self
    fun getPrintLineNumbers self = (GObjectObjectClass.C.withPtr ---> FFI.UInt.C.fromVal) getPrintLineNumbers_ self
    fun getRightMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getRightMargin_ (self & unit)
    fun getTabWidth self = (GObjectObjectClass.C.withPtr ---> FFI.UInt.C.fromVal) getTabWidth_ self
    fun getTopMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getTopMargin_ (self & unit)
    fun getWrapMode self = (GObjectObjectClass.C.withPtr ---> GtkWrapMode.C.fromVal) getWrapMode_ self
    fun paginate self context = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) paginate_ (self & context)
    fun setBodyFontName self fontName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setBodyFontName_ (self & fontName)
    fun setBottomMargin self margin unit =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setBottomMargin_
        (
          self
           & margin
           & unit
        )
    fun setFooterFontName self fontName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setFooterFontName_ (self & fontName)
    fun setFooterFormat self separator left center right =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         ---> I
      )
        setFooterFormat_
        (
          self
           & separator
           & left
           & center
           & right
        )
    fun setHeaderFontName self fontName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setHeaderFontName_ (self & fontName)
    fun setHeaderFormat self separator left center right =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         ---> I
      )
        setHeaderFormat_
        (
          self
           & separator
           & left
           & center
           & right
        )
    fun setHighlightSyntax self highlight = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHighlightSyntax_ (self & highlight)
    fun setLeftMargin self margin unit =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setLeftMargin_
        (
          self
           & margin
           & unit
        )
    fun setLineNumbersFontName self fontName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setLineNumbersFontName_ (self & fontName)
    fun setPrintFooter self print = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPrintFooter_ (self & print)
    fun setPrintHeader self print = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPrintHeader_ (self & print)
    fun setPrintLineNumbers self interval = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) setPrintLineNumbers_ (self & interval)
    fun setRightMargin self margin unit =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setRightMargin_
        (
          self
           & margin
           & unit
        )
    fun setTabWidth self width = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) setTabWidth_ (self & width)
    fun setTopMargin self margin unit =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setTopMargin_
        (
          self
           & margin
           & unit
        )
    fun setWrapMode self wrapMode = (GObjectObjectClass.C.withPtr &&&> GtkWrapMode.C.withVal ---> I) setWrapMode_ (self & wrapMode)
    local
      open Property
    in
      val bodyFontNameProp =
        {
          get = fn x => get "body-font-name" stringOpt x,
          set = fn x => set "body-font-name" stringOpt x
        }
      val bufferProp =
        {
          get = fn x => get "buffer" GtkSourceBufferClass.tOpt x,
          set = fn x => set "buffer" GtkSourceBufferClass.tOpt x
        }
      val footerFontNameProp =
        {
          get = fn x => get "footer-font-name" stringOpt x,
          set = fn x => set "footer-font-name" stringOpt x
        }
      val headerFontNameProp =
        {
          get = fn x => get "header-font-name" stringOpt x,
          set = fn x => set "header-font-name" stringOpt x
        }
      val highlightSyntaxProp =
        {
          get = fn x => get "highlight-syntax" boolean x,
          set = fn x => set "highlight-syntax" boolean x
        }
      val lineNumbersFontNameProp =
        {
          get = fn x => get "line-numbers-font-name" stringOpt x,
          set = fn x => set "line-numbers-font-name" stringOpt x
        }
      val nPagesProp = {get = fn x => get "n-pages" int x}
      val printFooterProp =
        {
          get = fn x => get "print-footer" boolean x,
          set = fn x => set "print-footer" boolean x
        }
      val printHeaderProp =
        {
          get = fn x => get "print-header" boolean x,
          set = fn x => set "print-header" boolean x
        }
      val printLineNumbersProp =
        {
          get = fn x => get "print-line-numbers" uint x,
          set = fn x => set "print-line-numbers" uint x
        }
      val tabWidthProp =
        {
          get = fn x => get "tab-width" uint x,
          set = fn x => set "tab-width" uint x
        }
      val wrapModeProp =
        {
          get = fn x => get "wrap-mode" GtkWrapMode.t x,
          set = fn x => set "wrap-mode" GtkWrapMode.t x
        }
    end
  end
