structure VtePtyClass :>
  VTE_PTY_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a pty = unit
    type 'a class = 'a pty class
  end
