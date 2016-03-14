structure GtkSelectionDataRecord :> GTK_SELECTION_DATA_RECORD =
  struct
    structure Pointer = CPointer
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val copy_ = _import "gtk_selection_data_copy" : notnull p -> notnull p;
    val free_ = _import "gtk_selection_data_free" : notnull p -> unit;
    val getType_ = _import "gtk_selection_data_get_type" : unit -> GObjectType.C.val_;

    structure Record =
      BoxedRecord (
        type notnull = notnull
        type 'a p = 'a p
        val take_ = ignore
        val copy_ = copy_
        val free_ = free_
      )
    open Record

    structure Type =
      BoxedType (
        structure Record = Record
        type t = t
        val getType_ = getType_
      )
    open Type
  end
