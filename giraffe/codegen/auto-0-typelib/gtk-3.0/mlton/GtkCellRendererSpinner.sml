structure GtkCellRendererSpinner :>
  GTK_CELL_RENDERER_SPINNER
    where type 'a class_t = 'a GtkCellRendererSpinnerClass.t
    where type iconsize_t = GtkIconSize.t =
  struct
    val getType_ = _import "gtk_cell_renderer_spinner_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_cell_renderer_spinner_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GtkCellRendererSpinnerClass.t
    type iconsize_t = GtkIconSize.t
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
