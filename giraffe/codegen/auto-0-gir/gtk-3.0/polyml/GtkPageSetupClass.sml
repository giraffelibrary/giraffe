structure GtkPageSetupClass :>
  GTK_PAGE_SETUP_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a page_setup = unit
    type 'a class = 'a page_setup class
  end
