structure GtkFontSelection :>
  GTK_FONT_SELECTION
    where type 'a class = 'a GtkFontSelectionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_font_selection_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_font_selection_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getFace_ = _import "gtk_font_selection_get_face" : GtkFontSelectionClass.FFI.notnull GtkFontSelectionClass.FFI.p -> PangoFontFaceClass.FFI.notnull PangoFontFaceClass.FFI.p;
    val getFaceList_ = _import "gtk_font_selection_get_face_list" : GtkFontSelectionClass.FFI.notnull GtkFontSelectionClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getFamily_ = _import "gtk_font_selection_get_family" : GtkFontSelectionClass.FFI.notnull GtkFontSelectionClass.FFI.p -> PangoFontFamilyClass.FFI.notnull PangoFontFamilyClass.FFI.p;
    val getFamilyList_ = _import "gtk_font_selection_get_family_list" : GtkFontSelectionClass.FFI.notnull GtkFontSelectionClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getFontName_ = _import "gtk_font_selection_get_font_name" : GtkFontSelectionClass.FFI.notnull GtkFontSelectionClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getPreviewEntry_ = _import "gtk_font_selection_get_preview_entry" : GtkFontSelectionClass.FFI.notnull GtkFontSelectionClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getPreviewText_ = _import "gtk_font_selection_get_preview_text" : GtkFontSelectionClass.FFI.notnull GtkFontSelectionClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getSize_ = _import "gtk_font_selection_get_size" : GtkFontSelectionClass.FFI.notnull GtkFontSelectionClass.FFI.p -> GInt32.FFI.val_;
    val getSizeEntry_ = _import "gtk_font_selection_get_size_entry" : GtkFontSelectionClass.FFI.notnull GtkFontSelectionClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getSizeList_ = _import "gtk_font_selection_get_size_list" : GtkFontSelectionClass.FFI.notnull GtkFontSelectionClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val setFontName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_font_selection_set_font_name" :
              GtkFontSelectionClass.FFI.notnull GtkFontSelectionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setPreviewText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_font_selection_set_preview_text" :
              GtkFontSelectionClass.FFI.notnull GtkFontSelectionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
