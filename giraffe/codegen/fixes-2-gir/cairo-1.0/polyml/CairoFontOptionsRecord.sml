structure CairoFontOptionsRecord :> CAIRO_FONT_OPTIONS_RECORD =
  struct
    structure Pointer = CPointer
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val cPtr = Pointer.PolyML.cVal : notnull p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val new_ =
        call
          (load_sym libcairo "cairo_font_options_create")
          (FFI.PolyML.cVoid --> cPtr)

      val copy_ =
        call
          (load_sym libcairo "cairo_font_options_copy")
          (cPtr --> cPtr)

      val free_ =
        call
          (load_sym libcairo "cairo_font_options_destroy")
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
