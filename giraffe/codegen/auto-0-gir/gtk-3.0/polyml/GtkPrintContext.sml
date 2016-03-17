structure GtkPrintContext :>
  GTK_PRINT_CONTEXT
    where type 'a class = 'a GtkPrintContextClass.class
    where type 'a page_setup_class = 'a GtkPageSetupClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_print_context_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val createPangoContext_ = call (load_sym libgtk "gtk_print_context_create_pango_context") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val createPangoLayout_ = call (load_sym libgtk "gtk_print_context_create_pango_layout") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getCairoContext_ = call (load_sym libgtk "gtk_print_context_get_cairo_context") (GObjectObjectClass.PolyML.cPtr --> CairoContextRecord.PolyML.cPtr)
      val getDpiX_ = call (load_sym libgtk "gtk_print_context_get_dpi_x") (GObjectObjectClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getDpiY_ = call (load_sym libgtk "gtk_print_context_get_dpi_y") (GObjectObjectClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getHardMargins_ =
        call (load_sym libgtk "gtk_print_context_get_hard_margins")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cRef
             &&> FFI.Double.PolyML.cRef
             &&> FFI.Double.PolyML.cRef
             &&> FFI.Double.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
      val getHeight_ = call (load_sym libgtk "gtk_print_context_get_height") (GObjectObjectClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getPageSetup_ = call (load_sym libgtk "gtk_print_context_get_page_setup") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getPangoFontmap_ = call (load_sym libgtk "gtk_print_context_get_pango_fontmap") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getWidth_ = call (load_sym libgtk "gtk_print_context_get_width") (GObjectObjectClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val setCairoContext_ =
        call (load_sym libgtk "gtk_print_context_set_cairo_context")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
    end
    type 'a class = 'a GtkPrintContextClass.class
    type 'a page_setup_class = 'a GtkPageSetupClass.class
    type t = base class
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
