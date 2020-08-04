structure GtkRequisition :>
  GTK_REQUISITION
    where type t = GtkRequisitionRecord.t =
  struct
    val getType_ = _import "gtk_requisition_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_requisition_new" : unit -> GtkRequisitionRecord.FFI.non_opt GtkRequisitionRecord.FFI.p;
    val copy_ = _import "gtk_requisition_copy" : GtkRequisitionRecord.FFI.non_opt GtkRequisitionRecord.FFI.p -> GtkRequisitionRecord.FFI.non_opt GtkRequisitionRecord.FFI.p;
    type t = GtkRequisitionRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkRequisitionRecord.FFI.fromPtr true) new_ ()
    fun copy self = (GtkRequisitionRecord.FFI.withPtr false ---> GtkRequisitionRecord.FFI.fromPtr true) copy_ self
  end
