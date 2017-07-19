signature GTK_PRINT_CONTEXT =
  sig
    type 'a class
    type 'a page_setup_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val createPangoContext : 'a class -> base Pango.ContextClass.class
    val createPangoLayout : 'a class -> base Pango.LayoutClass.class
    val getCairoContext : 'a class -> Cairo.ContextRecord.t
    val getDpiX : 'a class -> real
    val getDpiY : 'a class -> real
    val getHardMargins :
      'a class
       -> (real
            * real
            * real
            * real)
            option
    val getHeight : 'a class -> real
    val getPageSetup : 'a class -> base page_setup_class
    val getPangoFontmap : 'a class -> base Pango.FontMapClass.class
    val getWidth : 'a class -> real
    val setCairoContext :
      'a class
       -> Cairo.ContextRecord.t
           * real
           * real
       -> unit
  end
