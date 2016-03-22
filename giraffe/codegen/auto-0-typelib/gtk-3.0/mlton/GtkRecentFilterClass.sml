structure GtkRecentFilterClass :>
  GTK_RECENT_FILTER_CLASS
    where type C.notnull = GObjectInitiallyUnownedClass.C.notnull
    where type 'a C.p = 'a GObjectInitiallyUnownedClass.C.p =
  struct
    open GObjectInitiallyUnownedClass
    type 'a recent_filter = unit
    type 'a class = 'a recent_filter class
  end
