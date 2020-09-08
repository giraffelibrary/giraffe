structure GtkCellRendererSpinner :>
  GTK_CELL_RENDERER_SPINNER
    where type 'a class = 'a GtkCellRendererSpinnerClass.class
    where type icon_size_t = GtkIconSize.t =
  struct
    val getType_ = _import "gtk_cell_renderer_spinner_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_cell_renderer_spinner_new" : unit -> GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p;
    type 'a class = 'a GtkCellRendererSpinnerClass.class
    type icon_size_t = GtkIconSize.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCellRendererSpinnerClass.FFI.fromPtr false) new_ ()
    local
      open ValueAccessor
    in
      val activeProp =
        {
          name = "active",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val pulseProp =
        {
          name = "pulse",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val sizeProp =
        {
          name = "size",
          gtype = fn () => C.gtype GtkIconSize.t (),
          get = fn x => fn () => C.get GtkIconSize.t x,
          set = fn x => C.set GtkIconSize.t x,
          init = fn x => C.set GtkIconSize.t x
        }
    end
  end
