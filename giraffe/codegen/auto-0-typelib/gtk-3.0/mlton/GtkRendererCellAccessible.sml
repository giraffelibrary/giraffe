structure GtkRendererCellAccessible :>
  GTK_RENDERER_CELL_ACCESSIBLE
    where type 'a class = 'a GtkRendererCellAccessibleClass.class
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class =
  struct
    val getType_ = _import "gtk_renderer_cell_accessible_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_renderer_cell_accessible_new" : GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p -> AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p;
    type 'a class = 'a GtkRendererCellAccessibleClass.class
    type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr false ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new renderer = (GtkCellRendererClass.FFI.withPtr false ---> GtkRendererCellAccessibleClass.FFI.fromPtr true) new_ renderer
    local
      open ValueAccessor
    in
      val rendererProp =
        {
          name = "renderer",
          gtype = fn () => C.gtype GtkCellRendererClass.tOpt (),
          get = fn x => fn () => C.get GtkCellRendererClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkCellRendererClass.tOpt x
        }
    end
  end
