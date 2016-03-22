structure AtkTextClass :>
  ATK_TEXT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a text = unit
    type 'a class = 'a text class
  end
