structure GtkNotebookPageAccessibleClass :>
  GTK_NOTEBOOK_PAGE_ACCESSIBLE_CLASS
    where type C.notnull = AtkObjectClass.C.notnull
    where type 'a C.p = 'a AtkObjectClass.C.p =
  struct
    open AtkObjectClass
    type 'a notebook_page_accessible = unit
    type 'a class = 'a notebook_page_accessible class
  end
