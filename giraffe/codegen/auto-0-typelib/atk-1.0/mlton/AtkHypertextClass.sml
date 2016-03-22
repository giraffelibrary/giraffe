structure AtkHypertextClass :>
  ATK_HYPERTEXT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a hypertext = unit
    type 'a class = 'a hypertext class
  end
