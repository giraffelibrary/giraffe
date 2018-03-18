structure GtkCellRendererSpinner :>
  GTK_CELL_RENDERER_SPINNER
    where type 'a class = 'a GtkCellRendererSpinnerClass.class
    where type icon_size_t = GtkIconSize.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_cell_renderer_spinner_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_cell_renderer_spinner_new") (cVoid --> GtkCellRendererClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkCellRendererSpinnerClass.class
    type icon_size_t = GtkIconSize.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCellRendererSpinnerClass.FFI.fromPtr false) new_ ()
    local
      open Property
    in
      val activeProp =
        {
          get = fn x => get "active" boolean x,
          set = fn x => set "active" boolean x,
          new = fn x => new "active" boolean x
        }
      val pulseProp =
        {
          get = fn x => get "pulse" uint x,
          set = fn x => set "pulse" uint x,
          new = fn x => new "pulse" uint x
        }
      val sizeProp =
        {
          get = fn x => get "size" GtkIconSize.t x,
          set = fn x => set "size" GtkIconSize.t x,
          new = fn x => new "size" GtkIconSize.t x
        }
    end
  end
