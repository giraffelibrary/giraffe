structure GtkRequisition :>
  GTK_REQUISITION
    where type t = GtkRequisitionRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_requisition_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_requisition_new") (cVoid --> GtkRequisitionRecord.PolyML.cPtr)
      val copy_ = call (getSymbol "gtk_requisition_copy") (GtkRequisitionRecord.PolyML.cPtr --> GtkRequisitionRecord.PolyML.cPtr)
    end
    type t = GtkRequisitionRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkRequisitionRecord.FFI.fromPtr true) new_ ()
    fun copy self = (GtkRequisitionRecord.FFI.withPtr ---> GtkRequisitionRecord.FFI.fromPtr true) copy_ self
  end
