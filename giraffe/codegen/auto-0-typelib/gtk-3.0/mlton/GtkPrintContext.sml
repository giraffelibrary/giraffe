structure GtkPrintContext :>
  GTK_PRINT_CONTEXT
    where type 'a class_t = 'a GtkPrintContextClass.t
    where type 'a page_setup_class_t = 'a GtkPageSetupClass.t =
  struct
    val getType_ = _import "gtk_print_context_get_type" : unit -> GObjectType.C.val_;
    val createPangoContext_ = _import "gtk_print_context_create_pango_context" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val createPangoLayout_ = _import "gtk_print_context_create_pango_layout" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getCairoContext_ = _import "gtk_print_context_get_cairo_context" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> CairoContextRecord.C.notnull CairoContextRecord.C.p;
    val getDpiX_ = _import "gtk_print_context_get_dpi_x" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val getDpiY_ = _import "gtk_print_context_get_dpi_y" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val getHardMargins_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_print_context_get_hard_margins" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getHeight_ = _import "gtk_print_context_get_height" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val getPageSetup_ = _import "gtk_print_context_get_page_setup" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getPangoFontmap_ = _import "gtk_print_context_get_pango_fontmap" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getWidth_ = _import "gtk_print_context_get_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val setCairoContext_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_print_context_set_cairo_context" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class_t = 'a GtkPrintContextClass.t
    type 'a page_setup_class_t = 'a GtkPageSetupClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createPangoContext self = (GObjectObjectClass.C.withPtr ---> PangoContextClass.C.fromPtr true) createPangoContext_ self
    fun createPangoLayout self = (GObjectObjectClass.C.withPtr ---> PangoLayoutClass.C.fromPtr true) createPangoLayout_ self
    fun getCairoContext self = (GObjectObjectClass.C.withPtr ---> CairoContextRecord.C.fromPtr false) getCairoContext_ self
    fun getDpiX self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getDpiX_ self
    fun getDpiY self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getDpiY_ self
    fun getHardMargins self =
      let
        val top
         & bottom
         & left
         & right
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             ---> FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getHardMargins_
            (
              self
               & FFI.Double.null
               & FFI.Double.null
               & FFI.Double.null
               & FFI.Double.null
            )
      in
        if retVal
        then
          SOME
            (
              top,
              bottom,
              left,
              right
            )
        else NONE
      end
    fun getHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getHeight_ self
    fun getPageSetup self = (GObjectObjectClass.C.withPtr ---> GtkPageSetupClass.C.fromPtr false) getPageSetup_ self
    fun getPangoFontmap self = (GObjectObjectClass.C.withPtr ---> PangoFontMapClass.C.fromPtr false) getPangoFontmap_ self
    fun getWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getWidth_ self
    fun setCairoContext self cr dpiX dpiY =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        setCairoContext_
        (
          self
           & cr
           & dpiX
           & dpiY
        )
  end
