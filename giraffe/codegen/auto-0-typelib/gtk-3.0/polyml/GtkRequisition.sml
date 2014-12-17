structure GtkRequisition :>
  GTK_REQUISITION
    where type record_t = GtkRequisitionRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_requisition_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_requisition_new") (FFI.PolyML.VOID --> GtkRequisitionRecord.PolyML.PTR)
      val copy_ = call (load_sym libgtk "gtk_requisition_copy") (GtkRequisitionRecord.PolyML.PTR --> GtkRequisitionRecord.PolyML.PTR)
    end
    type record_t = GtkRequisitionRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkRequisitionRecord.C.fromPtr true) new_ ()
    fun copy self = (GtkRequisitionRecord.C.withPtr ---> GtkRequisitionRecord.C.fromPtr true) copy_ self
  end
