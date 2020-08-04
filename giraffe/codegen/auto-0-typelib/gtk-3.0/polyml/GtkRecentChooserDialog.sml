structure GtkRecentChooserDialog :>
  GTK_RECENT_CHOOSER_DIALOG
    where type 'a class = 'a GtkRecentChooserDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a recent_chooser_class = 'a GtkRecentChooserClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_recent_chooser_dialog_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GtkRecentChooserDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a recent_chooser_class = 'a GtkRecentChooserClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asRecentChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkRecentChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
