structure GtkNotebookPageAccessible :>
  GTK_NOTEBOOK_PAGE_ACCESSIBLE
    where type 'a class = 'a GtkNotebookPageAccessibleClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a notebook_accessible_class = 'a GtkNotebookAccessibleClass.class =
  struct
    val getType_ = _import "gtk_notebook_page_accessible_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "gtk_notebook_page_accessible_new" : GtkNotebookAccessibleClass.FFI.non_opt GtkNotebookAccessibleClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p;) (x1, x2)
    val invalidate_ = _import "gtk_notebook_page_accessible_invalidate" : GtkNotebookPageAccessibleClass.FFI.non_opt GtkNotebookPageAccessibleClass.FFI.p -> unit;
    type 'a class = 'a GtkNotebookPageAccessibleClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a notebook_accessible_class = 'a GtkNotebookAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (notebook, child) = (GtkNotebookAccessibleClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GtkNotebookPageAccessibleClass.FFI.fromPtr true) new_ (notebook & child)
    fun invalidate self = (GtkNotebookPageAccessibleClass.FFI.withPtr ---> I) invalidate_ self
  end
