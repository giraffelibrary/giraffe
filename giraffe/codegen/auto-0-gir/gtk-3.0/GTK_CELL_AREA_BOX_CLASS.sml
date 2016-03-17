signature GTK_CELL_AREA_BOX_CLASS =
  sig
    type 'a cell_area_box
    type 'a cell_area_class
    type 'a class = 'a cell_area_box cell_area_class
    type t = base class
    val toBase : 'a class -> base class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a class
        val fromOptPtr :
          bool
           -> unit p
           -> 'a class option
      end
  end
