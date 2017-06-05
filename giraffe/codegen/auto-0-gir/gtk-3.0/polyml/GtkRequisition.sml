structure GtkRequisition :>
  GTK_REQUISITION
    where type t = GtkRequisitionRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_requisition_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_requisition_new") (PolyMLFFI.cVoid --> GtkRequisitionRecord.PolyML.cPtr)
      val copy_ = call (load_sym libgtk "gtk_requisition_copy") (GtkRequisitionRecord.PolyML.cPtr --> GtkRequisitionRecord.PolyML.cPtr)
    end
    type t = GtkRequisitionRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkRequisitionRecord.FFI.fromPtr true) new_ ()
    fun copy self = (GtkRequisitionRecord.FFI.withPtr ---> GtkRequisitionRecord.FFI.fromPtr true) copy_ self
  end
