structure AtkDocumentClass :>
  ATK_DOCUMENT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a document = unit
    type 'a class = 'a document class
  end
