structure GtkNotebookPageAccessible :>
  GTK_NOTEBOOK_PAGE_ACCESSIBLE
    where type 'a class = 'a GtkNotebookPageAccessibleClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a notebook_accessible_class = 'a GtkNotebookAccessibleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_notebook_page_accessible_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_notebook_page_accessible_new") (GtkNotebookAccessibleClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> AtkObjectClass.PolyML.cPtr)
      val invalidate_ = call (getSymbol "gtk_notebook_page_accessible_invalidate") (GtkNotebookPageAccessibleClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkNotebookPageAccessibleClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a notebook_accessible_class = 'a GtkNotebookAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (notebook, child) = (GtkNotebookAccessibleClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GtkNotebookPageAccessibleClass.FFI.fromPtr true) new_ (notebook & child)
    fun invalidate self = (GtkNotebookPageAccessibleClass.FFI.withPtr ---> I) invalidate_ self
  end
