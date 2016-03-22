structure GtkAdjustmentClass :>
  GTK_ADJUSTMENT_CLASS
    where type C.notnull = GObjectInitiallyUnownedClass.C.notnull
    where type 'a C.p = 'a GObjectInitiallyUnownedClass.C.p =
  struct
    open GObjectInitiallyUnownedClass
    type 'a adjustment = unit
    type 'a class = 'a adjustment class
  end
