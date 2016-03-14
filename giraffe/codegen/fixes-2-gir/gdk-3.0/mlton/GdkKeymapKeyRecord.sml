structure GdkKeymapKeyRecord :> GDK_KEYMAP_KEY_RECORD =
  struct
    structure Pointer = CPointer
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val copy_ = _import "giraffe_gdk_keymap_key_copy" : notnull p -> notnull p;
    val free_ = _import "giraffe_gdk_keymap_key_free" : notnull p -> unit;

    structure Record =
      BoxedRecord (
        type notnull = notnull
        type 'a p = 'a p
        val take_ = ignore
        val copy_ = copy_
        val free_ = free_
      )
    open Record
  end
