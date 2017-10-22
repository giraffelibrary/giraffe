structure GdkSeatClass :>
  GDK_SEAT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a seat = unit
    type 'a class = 'a seat class
  end
