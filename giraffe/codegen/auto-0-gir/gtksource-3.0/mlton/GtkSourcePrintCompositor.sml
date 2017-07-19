structure GtkSourcePrintCompositor :>
  GTK_SOURCE_PRINT_COMPOSITOR
    where type 'a class = 'a GtkSourcePrintCompositorClass.class
    where type 'a view_class = 'a GtkSourceViewClass.class
    where type 'a buffer_class = 'a GtkSourceBufferClass.class =
  struct
    val getType_ = _import "gtk_source_print_compositor_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_print_compositor_new" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p -> GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p;
    val newFromView_ = _import "gtk_source_print_compositor_new_from_view" : GtkSourceViewClass.FFI.notnull GtkSourceViewClass.FFI.p -> GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p;
    val drawPage_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_print_compositor_draw_page" :
              GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p
               * GtkPrintContextClass.FFI.notnull GtkPrintContextClass.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getBodyFontName_ = _import "gtk_source_print_compositor_get_body_font_name" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getBottomMargin_ = fn x1 & x2 => (_import "gtk_source_print_compositor_get_bottom_margin" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getBuffer_ = _import "gtk_source_print_compositor_get_buffer" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p -> GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p;
    val getFooterFontName_ = _import "gtk_source_print_compositor_get_footer_font_name" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getHeaderFontName_ = _import "gtk_source_print_compositor_get_header_font_name" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getHighlightSyntax_ = _import "gtk_source_print_compositor_get_highlight_syntax" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p -> GBool.FFI.val_;
    val getLeftMargin_ = fn x1 & x2 => (_import "gtk_source_print_compositor_get_left_margin" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getLineNumbersFontName_ = _import "gtk_source_print_compositor_get_line_numbers_font_name" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getNPages_ = _import "gtk_source_print_compositor_get_n_pages" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p -> GInt.FFI.val_;
    val getPaginationProgress_ = _import "gtk_source_print_compositor_get_pagination_progress" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p -> GDouble.FFI.val_;
    val getPrintFooter_ = _import "gtk_source_print_compositor_get_print_footer" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p -> GBool.FFI.val_;
    val getPrintHeader_ = _import "gtk_source_print_compositor_get_print_header" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p -> GBool.FFI.val_;
    val getPrintLineNumbers_ = _import "gtk_source_print_compositor_get_print_line_numbers" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p -> GUInt.FFI.val_;
    val getRightMargin_ = fn x1 & x2 => (_import "gtk_source_print_compositor_get_right_margin" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getTabWidth_ = _import "gtk_source_print_compositor_get_tab_width" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p -> GUInt.FFI.val_;
    val getTopMargin_ = fn x1 & x2 => (_import "gtk_source_print_compositor_get_top_margin" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getWrapMode_ = _import "gtk_source_print_compositor_get_wrap_mode" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p -> GtkWrapMode.FFI.val_;
    val paginate_ = fn x1 & x2 => (_import "gtk_source_print_compositor_paginate" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p * GtkPrintContextClass.FFI.notnull GtkPrintContextClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val setBodyFontName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_print_compositor_set_body_font_name" :
              GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p
               * GDouble.FFI.val_
               * GtkUnit.FFI.val_
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
              GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p
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
              GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p
               * GBool.FFI.val_
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
              GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p
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
              GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p
               * GBool.FFI.val_
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
    val setHighlightSyntax_ = fn x1 & x2 => (_import "gtk_source_print_compositor_set_highlight_syntax" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setLeftMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_print_compositor_set_left_margin" :
              GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p
               * GDouble.FFI.val_
               * GtkUnit.FFI.val_
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
              GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPrintFooter_ = fn x1 & x2 => (_import "gtk_source_print_compositor_set_print_footer" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPrintHeader_ = fn x1 & x2 => (_import "gtk_source_print_compositor_set_print_header" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPrintLineNumbers_ = fn x1 & x2 => (_import "gtk_source_print_compositor_set_print_line_numbers" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setRightMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_print_compositor_set_right_margin" :
              GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p
               * GDouble.FFI.val_
               * GtkUnit.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTabWidth_ = fn x1 & x2 => (_import "gtk_source_print_compositor_set_tab_width" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setTopMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_print_compositor_set_top_margin" :
              GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p
               * GDouble.FFI.val_
               * GtkUnit.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWrapMode_ = fn x1 & x2 => (_import "gtk_source_print_compositor_set_wrap_mode" : GtkSourcePrintCompositorClass.FFI.notnull GtkSourcePrintCompositorClass.FFI.p * GtkWrapMode.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkSourcePrintCompositorClass.class
    type 'a view_class = 'a GtkSourceViewClass.class
    type 'a buffer_class = 'a GtkSourceBufferClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new buffer = (GtkSourceBufferClass.FFI.withPtr ---> GtkSourcePrintCompositorClass.FFI.fromPtr true) new_ buffer
    fun newFromView view = (GtkSourceViewClass.FFI.withPtr ---> GtkSourcePrintCompositorClass.FFI.fromPtr true) newFromView_ view
    fun drawPage self (context, pageNr) =
      (
        GtkSourcePrintCompositorClass.FFI.withPtr
         &&&> GtkPrintContextClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        drawPage_
        (
          self
           & context
           & pageNr
        )
    fun getBodyFontName self = (GtkSourcePrintCompositorClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getBodyFontName_ self
    fun getBottomMargin self unit = (GtkSourcePrintCompositorClass.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getBottomMargin_ (self & unit)
    fun getBuffer self = (GtkSourcePrintCompositorClass.FFI.withPtr ---> GtkSourceBufferClass.FFI.fromPtr false) getBuffer_ self
    fun getFooterFontName self = (GtkSourcePrintCompositorClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getFooterFontName_ self
    fun getHeaderFontName self = (GtkSourcePrintCompositorClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getHeaderFontName_ self
    fun getHighlightSyntax self = (GtkSourcePrintCompositorClass.FFI.withPtr ---> GBool.FFI.fromVal) getHighlightSyntax_ self
    fun getLeftMargin self unit = (GtkSourcePrintCompositorClass.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getLeftMargin_ (self & unit)
    fun getLineNumbersFontName self = (GtkSourcePrintCompositorClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getLineNumbersFontName_ self
    fun getNPages self = (GtkSourcePrintCompositorClass.FFI.withPtr ---> GInt.FFI.fromVal) getNPages_ self
    fun getPaginationProgress self = (GtkSourcePrintCompositorClass.FFI.withPtr ---> GDouble.FFI.fromVal) getPaginationProgress_ self
    fun getPrintFooter self = (GtkSourcePrintCompositorClass.FFI.withPtr ---> GBool.FFI.fromVal) getPrintFooter_ self
    fun getPrintHeader self = (GtkSourcePrintCompositorClass.FFI.withPtr ---> GBool.FFI.fromVal) getPrintHeader_ self
    fun getPrintLineNumbers self = (GtkSourcePrintCompositorClass.FFI.withPtr ---> GUInt.FFI.fromVal) getPrintLineNumbers_ self
    fun getRightMargin self unit = (GtkSourcePrintCompositorClass.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getRightMargin_ (self & unit)
    fun getTabWidth self = (GtkSourcePrintCompositorClass.FFI.withPtr ---> GUInt.FFI.fromVal) getTabWidth_ self
    fun getTopMargin self unit = (GtkSourcePrintCompositorClass.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getTopMargin_ (self & unit)
    fun getWrapMode self = (GtkSourcePrintCompositorClass.FFI.withPtr ---> GtkWrapMode.FFI.fromVal) getWrapMode_ self
    fun paginate self context = (GtkSourcePrintCompositorClass.FFI.withPtr &&&> GtkPrintContextClass.FFI.withPtr ---> GBool.FFI.fromVal) paginate_ (self & context)
    fun setBodyFontName self fontName = (GtkSourcePrintCompositorClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setBodyFontName_ (self & fontName)
    fun setBottomMargin self (margin, unit) =
      (
        GtkSourcePrintCompositorClass.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setBottomMargin_
        (
          self
           & margin
           & unit
        )
    fun setFooterFontName self fontName = (GtkSourcePrintCompositorClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setFooterFontName_ (self & fontName)
    fun setFooterFormat
      self
      (
        separator,
        left,
        center,
        right
      ) =
      (
        GtkSourcePrintCompositorClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
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
    fun setHeaderFontName self fontName = (GtkSourcePrintCompositorClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setHeaderFontName_ (self & fontName)
    fun setHeaderFormat
      self
      (
        separator,
        left,
        center,
        right
      ) =
      (
        GtkSourcePrintCompositorClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
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
    fun setHighlightSyntax self highlight = (GtkSourcePrintCompositorClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHighlightSyntax_ (self & highlight)
    fun setLeftMargin self (margin, unit) =
      (
        GtkSourcePrintCompositorClass.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setLeftMargin_
        (
          self
           & margin
           & unit
        )
    fun setLineNumbersFontName self fontName = (GtkSourcePrintCompositorClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setLineNumbersFontName_ (self & fontName)
    fun setPrintFooter self print = (GtkSourcePrintCompositorClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setPrintFooter_ (self & print)
    fun setPrintHeader self print = (GtkSourcePrintCompositorClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setPrintHeader_ (self & print)
    fun setPrintLineNumbers self interval = (GtkSourcePrintCompositorClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) setPrintLineNumbers_ (self & interval)
    fun setRightMargin self (margin, unit) =
      (
        GtkSourcePrintCompositorClass.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setRightMargin_
        (
          self
           & margin
           & unit
        )
    fun setTabWidth self width = (GtkSourcePrintCompositorClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) setTabWidth_ (self & width)
    fun setTopMargin self (margin, unit) =
      (
        GtkSourcePrintCompositorClass.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setTopMargin_
        (
          self
           & margin
           & unit
        )
    fun setWrapMode self wrapMode = (GtkSourcePrintCompositorClass.FFI.withPtr &&&> GtkWrapMode.FFI.withVal ---> I) setWrapMode_ (self & wrapMode)
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
