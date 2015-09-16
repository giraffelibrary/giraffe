structure GtkCellRendererSpinner :>
  GTK_CELL_RENDERER_SPINNER
    where type 'a class_t = 'a GtkCellRendererSpinnerClass.t
    where type icon_size_t = GtkIconSize.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_renderer_spinner_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_cell_renderer_spinner_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GtkCellRendererSpinnerClass.t
    type icon_size_t = GtkIconSize.t
    type t = base class_t
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
