structure GtkToolShellClass :>
  GTK_TOOL_SHELL_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tool_shell = unit
    type 'a class = 'a tool_shell class
  end
