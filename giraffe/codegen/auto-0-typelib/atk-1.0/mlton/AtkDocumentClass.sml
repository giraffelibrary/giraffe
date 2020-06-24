structure AtkDocumentClass :>
  ATK_DOCUMENT_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a document = unit
    type 'a class = 'a document class
  end
