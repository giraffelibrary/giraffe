structure GtkFontSelectionDialog :>
  GTK_FONT_SELECTION_DIALOG
    where type 'a class = 'a GtkFontSelectionDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_font_selection_dialog_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_font_selection_dialog_new") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getCancelButton_ = call (getSymbol "gtk_font_selection_dialog_get_cancel_button") (GtkFontSelectionDialogClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getFontName_ = call (getSymbol "gtk_font_selection_dialog_get_font_name") (GtkFontSelectionDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFontSelection_ = call (getSymbol "gtk_font_selection_dialog_get_font_selection") (GtkFontSelectionDialogClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getOkButton_ = call (getSymbol "gtk_font_selection_dialog_get_ok_button") (GtkFontSelectionDialogClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getPreviewText_ = call (getSymbol "gtk_font_selection_dialog_get_preview_text") (GtkFontSelectionDialogClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setFontName_ = call (getSymbol "gtk_font_selection_dialog_set_font_name") (GtkFontSelectionDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val setPreviewText_ = call (getSymbol "gtk_font_selection_dialog_set_preview_text") (GtkFontSelectionDialogClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkFontSelectionDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new title = (Utf8.FFI.withPtr 0 ---> GtkFontSelectionDialogClass.FFI.fromPtr false) new_ title before Utf8.FFI.touchPtr title
    fun getCancelButton self = (GtkFontSelectionDialogClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getCancelButton_ self before GtkFontSelectionDialogClass.FFI.touchPtr self
    fun getFontName self = (GtkFontSelectionDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getFontName_ self
    fun getFontSelection self = (GtkFontSelectionDialogClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getFontSelection_ self before GtkFontSelectionDialogClass.FFI.touchPtr self
    fun getOkButton self = (GtkFontSelectionDialogClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getOkButton_ self before GtkFontSelectionDialogClass.FFI.touchPtr self
    fun getPreviewText self = (GtkFontSelectionDialogClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getPreviewText_ self before GtkFontSelectionDialogClass.FFI.touchPtr self
    fun setFontName self fontname = (GtkFontSelectionDialogClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) setFontName_ (self & fontname)
    fun setPreviewText self text = (GtkFontSelectionDialogClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setPreviewText_ (self & text)
  end
