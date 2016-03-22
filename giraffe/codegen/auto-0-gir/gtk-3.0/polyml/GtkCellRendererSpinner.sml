structure GtkCellRendererSpinner :>
  GTK_CELL_RENDERER_SPINNER
    where type 'a class = 'a GtkCellRendererSpinnerClass.class
    where type icon_size_t = GtkIconSize.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_renderer_spinner_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_cell_renderer_spinner_new") (FFI.PolyML.cVoid --> GtkCellRendererClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkCellRendererSpinnerClass.class
    type icon_size_t = GtkIconSize.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCellRendererSpinnerClass.C.fromPtr false) new_ ()
    local
      open Property
    in
      val activeProp =
        {
          get = fn x => get "active" boolean x,
          set = fn x => set "active" boolean x
        }
      val pulseProp =
        {
          get = fn x => get "pulse" uint x,
          set = fn x => set "pulse" uint x
        }
      val sizeProp =
        {
          get = fn x => get "size" GtkIconSize.t x,
          set = fn x => set "size" GtkIconSize.t x
        }
    end
  end
