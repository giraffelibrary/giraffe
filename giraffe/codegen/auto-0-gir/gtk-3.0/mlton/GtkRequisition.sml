structure GtkRequisition :>
  GTK_REQUISITION
    where type t = GtkRequisitionRecord.t =
  struct
    val getType_ = _import "gtk_requisition_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_requisition_new" : unit -> GtkRequisitionRecord.C.notnull GtkRequisitionRecord.C.p;
    val copy_ = _import "gtk_requisition_copy" : GtkRequisitionRecord.C.notnull GtkRequisitionRecord.C.p -> GtkRequisitionRecord.C.notnull GtkRequisitionRecord.C.p;
    type t = GtkRequisitionRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkRequisitionRecord.C.fromPtr true) new_ ()
    fun copy self = (GtkRequisitionRecord.C.withPtr ---> GtkRequisitionRecord.C.fromPtr true) copy_ self
  end
