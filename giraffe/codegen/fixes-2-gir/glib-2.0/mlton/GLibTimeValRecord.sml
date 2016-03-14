structure GLibTimeValRecord :> G_LIB_TIME_VAL_RECORD =
  struct
    structure Pointer = CPointer
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val new_ = _import "giraffe_g_time_val_new" : unit -> notnull p;
    val copy_ = _import "giraffe_g_time_val_copy" : notnull p -> notnull p;
    val free_ = _import "giraffe_g_time_val_free" : notnull p -> unit;

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
  end
