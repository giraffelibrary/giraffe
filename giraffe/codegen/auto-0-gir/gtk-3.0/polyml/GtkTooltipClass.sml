structure GtkTooltipClass :>
  GTK_TOOLTIP_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tooltip = unit
    type 'a class = 'a tooltip class
  end
