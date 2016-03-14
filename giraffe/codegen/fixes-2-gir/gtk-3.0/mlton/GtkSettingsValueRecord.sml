structure GtkSettingsValueRecord :> GTK_SETTINGS_VALUE_RECORD =
  struct
    structure Pointer = CPointer
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val new_ = _import "giraffe_gtk_settings_value_new" : unit -> notnull p;
    val copy_ = _import "giraffe_gtk_settings_value_copy" : notnull p -> notnull p;
    val free_ = _import "giraffe_gtk_settings_value_free" : notnull p -> unit;

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
