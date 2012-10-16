structure GtkFontSelectionDialog :>
  GTK_FONT_SELECTION_DIALOG
    where type 'a class_t = 'a GtkFontSelectionDialogClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    val getType_ = _import "gtk_font_selection_dialog_get_type" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a GtkFontSelectionDialogClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
