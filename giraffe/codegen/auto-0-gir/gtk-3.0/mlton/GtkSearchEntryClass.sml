structure GtkSearchEntryClass :>
  GTK_SEARCH_ENTRY_CLASS
    where type 'a entry_class = 'a GtkEntryClass.class
    where type C.notnull = GtkEntryClass.C.notnull
    where type 'a C.p = 'a GtkEntryClass.C.p =
  struct
    type 'a entry_class = 'a GtkEntryClass.class
    open GtkEntryClass
    type 'a search_entry = unit
    type 'a class = 'a search_entry class
  end
