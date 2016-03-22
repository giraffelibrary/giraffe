structure GtkRcStyleClass :>
  GTK_RC_STYLE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a rc_style = unit
    type 'a class = 'a rc_style class
  end
