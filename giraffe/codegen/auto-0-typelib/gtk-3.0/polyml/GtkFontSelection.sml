structure GtkFontSelection :>
  GTK_FONT_SELECTION
    where type 'a class = 'a GtkFontSelectionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_font_selection_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_font_selection_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getFace_ = call (getSymbol "gtk_font_selection_get_face") (GtkFontSelectionClass.PolyML.cPtr --> PangoFontFaceClass.PolyML.cPtr)
      val getFaceList_ = call (getSymbol "gtk_font_selection_get_face_list") (GtkFontSelectionClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getFamily_ = call (getSymbol "gtk_font_selection_get_family") (GtkFontSelectionClass.PolyML.cPtr --> PangoFontFamilyClass.PolyML.cPtr)
      val getFamilyList_ = call (getSymbol "gtk_font_selection_get_family_list") (GtkFontSelectionClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getFontName_ = call (getSymbol "gtk_font_selection_get_font_name") (GtkFontSelectionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPreviewEntry_ = call (getSymbol "gtk_font_selection_get_preview_entry") (GtkFontSelectionClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getPreviewText_ = call (getSymbol "gtk_font_selection_get_preview_text") (GtkFontSelectionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSize_ = call (getSymbol "gtk_font_selection_get_size") (GtkFontSelectionClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getSizeEntry_ = call (getSymbol "gtk_font_selection_get_size_entry") (GtkFontSelectionClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getSizeList_ = call (getSymbol "gtk_font_selection_get_size_list") (GtkFontSelectionClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val setFontName_ = call (getSymbol "gtk_font_selection_set_font_name") (GtkFontSelectionClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val setPreviewText_ = call (getSymbol "gtk_font_selection_set_preview_text") (GtkFontSelectionClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkFontSelectionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkFontSelectionClass.FFI.fromPtr false) new_ ()
    fun getFace self = (GtkFontSelectionClass.FFI.withPtr ---> PangoFontFaceClass.FFI.fromPtr false) getFace_ self
    fun getFaceList self = (GtkFontSelectionClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getFaceList_ self
    fun getFamily self = (GtkFontSelectionClass.FFI.withPtr ---> PangoFontFamilyClass.FFI.fromPtr false) getFamily_ self
    fun getFamilyList self = (GtkFontSelectionClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getFamilyList_ self
    fun getFontName self = (GtkFontSelectionClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getFontName_ self
    fun getPreviewEntry self = (GtkFontSelectionClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getPreviewEntry_ self
    fun getPreviewText self = (GtkFontSelectionClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getPreviewText_ self
    fun getSize self = (GtkFontSelectionClass.FFI.withPtr ---> GInt32.FFI.fromVal) getSize_ self
    fun getSizeEntry self = (GtkFontSelectionClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getSizeEntry_ self
    fun getSizeList self = (GtkFontSelectionClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getSizeList_ self
    fun setFontName self fontname = (GtkFontSelectionClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) setFontName_ (self & fontname)
    fun setPreviewText self text = (GtkFontSelectionClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setPreviewText_ (self & text)
    local
      open Property
    in
      val fontNameProp =
        {
          get = fn x => get "font-name" stringOpt x,
          set = fn x => set "font-name" stringOpt x,
          new = fn x => new "font-name" stringOpt x
        }
      val previewTextProp =
        {
          get = fn x => get "preview-text" stringOpt x,
          set = fn x => set "preview-text" stringOpt x,
          new = fn x => new "preview-text" stringOpt x
        }
    end
  end
