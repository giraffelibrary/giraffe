structure GioTaskClass :>
  GIO_TASK_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a task = unit
    type 'a class = 'a task class
  end
