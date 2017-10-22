structure GioNotificationClass :>
  GIO_NOTIFICATION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a notification = unit
    type 'a class = 'a notification class
  end
