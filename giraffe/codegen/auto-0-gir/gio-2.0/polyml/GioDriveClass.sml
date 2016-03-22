structure GioDriveClass :>
  GIO_DRIVE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a drive = unit
    type 'a class = 'a drive class
  end
