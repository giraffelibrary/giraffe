structure GtkAccelKeyRecord :> GTK_ACCEL_KEY_RECORD =
  struct
    structure Pointer = CPointer
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.p

    val new_ = _import "giraffe_gtk_accel_key_new" : unit -> notnull p;
    val copy_ = _import "giraffe_gtk_accel_key_copy" : notnull p -> notnull p;
    val free_ = _import "giraffe_gtk_accel_key_free" : notnull p -> unit;

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
