structure GtkFontSelectionDialog :>
  GTK_FONT_SELECTION_DIALOG
    where type 'a class = 'a GtkFontSelectionDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_font_selection_dialog_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_font_selection_dialog_new" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getCancelButton_ = _import "gtk_font_selection_dialog_get_cancel_button" : GtkFontSelectionDialogClass.FFI.non_opt GtkFontSelectionDialogClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getFontName_ = _import "gtk_font_selection_dialog_get_font_name" : GtkFontSelectionDialogClass.FFI.non_opt GtkFontSelectionDialogClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getFontSelection_ = _import "gtk_font_selection_dialog_get_font_selection" : GtkFontSelectionDialogClass.FFI.non_opt GtkFontSelectionDialogClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getOkButton_ = _import "gtk_font_selection_dialog_get_ok_button" : GtkFontSelectionDialogClass.FFI.non_opt GtkFontSelectionDialogClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getPreviewText_ = _import "gtk_font_selection_dialog_get_preview_text" : GtkFontSelectionDialogClass.FFI.non_opt GtkFontSelectionDialogClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val setFontName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_font_selection_dialog_set_font_name" :
              GtkFontSelectionDialogClass.FFI.non_opt GtkFontSelectionDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
            _import "mlton_gtk_font_selection_dialog_set_preview_text" :
              GtkFontSelectionDialogClass.FFI.non_opt GtkFontSelectionDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
