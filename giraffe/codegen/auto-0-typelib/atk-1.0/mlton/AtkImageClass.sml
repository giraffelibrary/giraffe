structure AtkImageClass :>
  ATK_IMAGE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a image = unit
    type 'a class = 'a image class
  end
