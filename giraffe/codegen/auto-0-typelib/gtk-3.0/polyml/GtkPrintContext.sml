structure GtkPrintContext :>
  GTK_PRINT_CONTEXT
    where type 'a class_t = 'a GtkPrintContextClass.t
    where type 'a page_setup_class_t = 'a GtkPageSetupClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_print_context_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val createPangoContext_ = call (load_sym libgtk "gtk_print_context_create_pango_context") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val createPangoLayout_ = call (load_sym libgtk "gtk_print_context_create_pango_layout") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getCairoContext_ = call (load_sym libgtk "gtk_print_context_get_cairo_context") (GObjectObjectClass.PolyML.PTR --> CairoContextRecord.PolyML.PTR)
      val getDpiX_ = call (load_sym libgtk "gtk_print_context_get_dpi_x") (GObjectObjectClass.PolyML.PTR --> FFI.Double.PolyML.VAL)
      val getDpiY_ = call (load_sym libgtk "gtk_print_context_get_dpi_y") (GObjectObjectClass.PolyML.PTR --> FFI.Double.PolyML.VAL)
      val getHardMargins_ =
        call (load_sym libgtk "gtk_print_context_get_hard_margins")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Double.PolyML.REF
             &&> FFI.Double.PolyML.REF
             &&> FFI.Double.PolyML.REF
             &&> FFI.Double.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val getHeight_ = call (load_sym libgtk "gtk_print_context_get_height") (GObjectObjectClass.PolyML.PTR --> FFI.Double.PolyML.VAL)
      val getPageSetup_ = call (load_sym libgtk "gtk_print_context_get_page_setup") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getPangoFontmap_ = call (load_sym libgtk "gtk_print_context_get_pango_fontmap") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getWidth_ = call (load_sym libgtk "gtk_print_context_get_width") (GObjectObjectClass.PolyML.PTR --> FFI.Double.PolyML.VAL)
      val setCairoContext_ =
        call (load_sym libgtk "gtk_print_context_set_cairo_context")
          (
            GObjectObjectClass.PolyML.PTR
             &&> CairoContextRecord.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             --> FFI.PolyML.VOID
          )
    end
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
