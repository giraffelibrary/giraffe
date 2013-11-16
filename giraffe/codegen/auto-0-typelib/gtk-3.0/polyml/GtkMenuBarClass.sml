structure GtkMenuBarClass :>
  GTK_MENU_BAR_CLASS
    where type 'a menushellclass_t = 'a GtkMenuShellClass.t
    where type C.notnull = GtkMenuShellClass.C.notnull
    where type 'a C.p = 'a GtkMenuShellClass.C.p =
  struct
    type 'a menubar = unit
    type 'a menushellclass_t = 'a GtkMenuShellClass.t
    type 'a t = 'a menubar menushellclass_t
    fun toBase obj = obj
    val t = GtkMenuShellClass.t
    val tOpt = GtkMenuShellClass.tOpt
    structure C = GtkMenuShellClass.C
  end
