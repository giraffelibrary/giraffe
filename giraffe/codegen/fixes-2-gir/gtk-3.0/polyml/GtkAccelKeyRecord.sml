structure GtkAccelKeyRecord :> GTK_ACCEL_KEY_RECORD =
  struct
    structure Pointer = CPointer
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.p

    val cPtr = CPointer.PolyML.cVal : notnull p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val new_ =
        call
          (load_sym libgiraffegtk "giraffe_gtk_accel_key_new")
          (FFI.PolyML.cVoid --> cPtr)

      val copy_ =
        call
          (load_sym libgiraffegtk "giraffe_gtk_accel_key_copy")
          (cPtr --> cPtr)

      val free_ =
        call
          (load_sym libgiraffegtk "giraffe_gtk_accel_key_free")
          (cPtr --> FFI.PolyML.cVoid)
    end

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
