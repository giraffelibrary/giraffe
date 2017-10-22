structure GtkEntryIconAccessibleClass :>
  GTK_ENTRY_ICON_ACCESSIBLE_CLASS
    where type C.notnull = AtkObjectClass.C.notnull
    where type 'a C.p = 'a AtkObjectClass.C.p =
  struct
    open AtkObjectClass
    type 'a entry_icon_accessible = unit
    type 'a class = 'a entry_icon_accessible class
  end
