structure GtkBorderRecord :> GTK_BORDER_RECORD =
  struct
    structure Pointer = CPointer
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val new_ = _import "gtk_border_new" : unit -> notnull p;
    val copy_ = _import "gtk_border_copy" : notnull p -> notnull p;
    val free_ = _import "gtk_border_free" : notnull p -> unit;
    val getType_ = _import "gtk_border_get_type" : unit -> GObjectType.C.val_;

    structure Record =
      BoxedNewRecord (
        type notnull = notnull
        type 'a p = 'a p
        val new_ = new_
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
