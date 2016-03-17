structure GtkRequisition :>
  GTK_REQUISITION
    where type t = GtkRequisitionRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_requisition_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_requisition_new") (FFI.PolyML.cVoid --> GtkRequisitionRecord.PolyML.cPtr)
      val copy_ = call (load_sym libgtk "gtk_requisition_copy") (GtkRequisitionRecord.PolyML.cPtr --> GtkRequisitionRecord.PolyML.cPtr)
    end
    type t = GtkRequisitionRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkRequisitionRecord.C.fromPtr true) new_ ()
    fun copy self = (GtkRequisitionRecord.C.withPtr ---> GtkRequisitionRecord.C.fromPtr true) copy_ self
  end
