structure GdkKeymapKeyRecord :> GDK_KEYMAP_KEY_RECORD =
  struct
    structure Pointer = CPointer
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val cPtr = Pointer.PolyML.cVal : notnull p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val copy_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_keymap_key_copy")
          (cPtr --> cPtr)

      val free_ =
        call
          (load_sym libgiraffegdk "giraffe_gdk_keymap_key_free")
          (cPtr --> PolyMLFFI.cVoid)
    end

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
