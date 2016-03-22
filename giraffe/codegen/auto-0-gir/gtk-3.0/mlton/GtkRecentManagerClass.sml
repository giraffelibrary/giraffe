structure GtkRecentManagerClass :>
  GTK_RECENT_MANAGER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a recent_manager = unit
    type 'a class = 'a recent_manager class
  end
