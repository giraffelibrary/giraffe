structure CairoFontOptionsRecord :> CAIRO_FONT_OPTIONS_RECORD =
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
          (load_sym libcairo "cairo_font_options_copy")
          (cPtr --> cPtr)

      val free_ =
        call
          (load_sym libcairo "cairo_font_options_destroy")
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
