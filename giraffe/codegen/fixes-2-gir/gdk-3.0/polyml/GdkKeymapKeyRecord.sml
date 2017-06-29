structure GdkKeymapKeyRecord :> GDK_KEYMAP_KEY_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val cPtr = Pointer.PolyML.cVal : notnull p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val dup_ =
        call
          (getSymbol "giraffe_gdk_keymap_key_copy")
          (cPtr --> cPtr)

      val free_ =
        call
          (getSymbol "giraffe_gdk_keymap_key_free")
          (cPtr --> cVoid)
    end

    structure Record =
      BoxedRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val dup_ = dup_
        val take_ = ignore
        val free_ = free_
      )
    open Record
  end
