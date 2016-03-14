structure CairoFontOptionsRecord :> CAIRO_FONT_OPTIONS_RECORD =
  struct
    structure Pointer = CPointer
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val new_ = _import "cairo_font_options_create" : unit -> notnull p;
    val copy_ = _import "cairo_font_options_copy" : notnull p -> notnull p;
    val free_ = _import "cairo_font_options_destroy" : notnull p -> unit;

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
