structure GtkUIManagerClass :>
  GTK_U_I_MANAGER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a u_i_manager = unit
    type 'a class = 'a u_i_manager class
  end
