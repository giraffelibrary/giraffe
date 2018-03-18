structure GtkCellRendererProgress :>
  GTK_CELL_RENDERER_PROGRESS
    where type 'a class = 'a GtkCellRendererProgressClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_cell_renderer_progress_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_cell_renderer_progress_new") (cVoid --> GtkCellRendererClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkCellRendererProgressClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type t = base class
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCellRendererProgressClass.FFI.fromPtr false) new_ ()
    local
      open Property
    in
      val invertedProp =
        {
          get = fn x => get "inverted" boolean x,
          set = fn x => set "inverted" boolean x,
          new = fn x => new "inverted" boolean x
        }
      val pulseProp =
        {
          get = fn x => get "pulse" int x,
          set = fn x => set "pulse" int x,
          new = fn x => new "pulse" int x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x,
          new = fn x => new "text" stringOpt x
        }
      val textXalignProp =
        {
          get = fn x => get "text-xalign" float x,
          set = fn x => set "text-xalign" float x,
          new = fn x => new "text-xalign" float x
        }
      val textYalignProp =
        {
          get = fn x => get "text-yalign" float x,
          set = fn x => set "text-yalign" float x,
          new = fn x => new "text-yalign" float x
        }
      val valueProp =
        {
          get = fn x => get "value" int x,
          set = fn x => set "value" int x,
          new = fn x => new "value" int x
        }
    end
  end
