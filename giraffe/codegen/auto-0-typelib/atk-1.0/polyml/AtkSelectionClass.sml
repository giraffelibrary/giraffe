structure AtkSelectionClass :>
  ATK_SELECTION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a selection = unit
    type 'a class = 'a selection class
  end
