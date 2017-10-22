structure GtkNotebookAccessible :>
  GTK_NOTEBOOK_ACCESSIBLE
    where type 'a class = 'a GtkNotebookAccessibleClass.class =
  struct
    val getType_ = _import "gtk_notebook_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkNotebookAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asSelection self = (GObjectObjectClass.FFI.withPtr ---> AtkSelectionClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
