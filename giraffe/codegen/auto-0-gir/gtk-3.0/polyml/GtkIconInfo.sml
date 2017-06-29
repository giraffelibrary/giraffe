structure GtkIconInfo :>
  GTK_ICON_INFO
    where type t = GtkIconInfoRecord.t
    where type 'a icon_theme_class = 'a GtkIconThemeClass.class
    where type 'a style_context_class = 'a GtkStyleContextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_icon_info_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val newForPixbuf_ = call (getSymbol "gtk_icon_info_new_for_pixbuf") (GtkIconThemeClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cPtr --> GtkIconInfoRecord.PolyML.cPtr)
      val copy_ = call (getSymbol "gtk_icon_info_copy") (GtkIconInfoRecord.PolyML.cPtr --> GtkIconInfoRecord.PolyML.cPtr)
      val getBaseSize_ = call (getSymbol "gtk_icon_info_get_base_size") (GtkIconInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getBuiltinPixbuf_ = call (getSymbol "gtk_icon_info_get_builtin_pixbuf") (GtkIconInfoRecord.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getDisplayName_ = call (getSymbol "gtk_icon_info_get_display_name") (GtkIconInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEmbeddedRect_ = call (getSymbol "gtk_icon_info_get_embedded_rect") (GtkIconInfoRecord.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFilename_ = call (getSymbol "gtk_icon_info_get_filename") (GtkIconInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val loadIcon_ = call (getSymbol "gtk_icon_info_load_icon") (GtkIconInfoRecord.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GdkPixbufPixbufClass.PolyML.cPtr)
      val loadSymbolic_ =
        call (getSymbol "gtk_icon_info_load_symbolic")
          (
            GtkIconInfoRecord.PolyML.cPtr
             &&> GdkRgbaRecord.PolyML.cPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GBool.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val loadSymbolicForContext_ =
        call (getSymbol "gtk_icon_info_load_symbolic_for_context")
          (
            GtkIconInfoRecord.PolyML.cPtr
             &&> GtkStyleContextClass.PolyML.cPtr
             &&> GBool.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val setRawCoordinates_ = call (getSymbol "gtk_icon_info_set_raw_coordinates") (GtkIconInfoRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type t = GtkIconInfoRecord.t
    type 'a icon_theme_class = 'a GtkIconThemeClass.class
    type 'a style_context_class = 'a GtkStyleContextClass.class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newForPixbuf iconTheme pixbuf = (GtkIconThemeClass.FFI.withPtr &&&> GdkPixbufPixbufClass.FFI.withPtr ---> GtkIconInfoRecord.FFI.fromPtr true) newForPixbuf_ (iconTheme & pixbuf)
    fun copy self = (GtkIconInfoRecord.FFI.withPtr ---> GtkIconInfoRecord.FFI.fromPtr true) copy_ self
    fun getBaseSize self = (GtkIconInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) getBaseSize_ self
    fun getBuiltinPixbuf self = (GtkIconInfoRecord.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getBuiltinPixbuf_ self
    fun getDisplayName self = (GtkIconInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDisplayName_ self
    fun getEmbeddedRect self =
      let
        val rectangle & retVal = (GtkIconInfoRecord.FFI.withPtr &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && GBool.FFI.fromVal) getEmbeddedRect_ (self & ())
      in
        if retVal then SOME rectangle else NONE
      end
    fun getFilename self = (GtkIconInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getFilename_ self
    fun loadIcon self = (GtkIconInfoRecord.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.FFI.fromPtr true) loadIcon_ (self & [])
    fun loadSymbolic self fg successColor warningColor errorColor =
      let
        val wasSymbolic & retVal =
          (
            GtkIconInfoRecord.FFI.withPtr
             &&&> GdkRgbaRecord.FFI.withPtr
             &&&> GdkRgbaRecord.FFI.withOptPtr
             &&&> GdkRgbaRecord.FFI.withOptPtr
             &&&> GdkRgbaRecord.FFI.withOptPtr
             &&&> GBool.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GBool.FFI.fromVal && GdkPixbufPixbufClass.FFI.fromPtr true
          )
            loadSymbolic_
            (
              self
               & fg
               & successColor
               & warningColor
               & errorColor
               & GBool.null
               & []
            )
      in
        (retVal, wasSymbolic)
      end
    fun loadSymbolicForContext self context =
      let
        val wasSymbolic & retVal =
          (
            GtkIconInfoRecord.FFI.withPtr
             &&&> GtkStyleContextClass.FFI.withPtr
             &&&> GBool.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GBool.FFI.fromVal && GdkPixbufPixbufClass.FFI.fromPtr true
          )
            loadSymbolicForContext_
            (
              self
               & context
               & GBool.null
               & []
            )
      in
        (retVal, wasSymbolic)
      end
    fun setRawCoordinates self rawCoordinates = (GtkIconInfoRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRawCoordinates_ (self & rawCoordinates)
  end
