structure GtkRendererCellAccessible :>
  GTK_RENDERER_CELL_ACCESSIBLE
    where type 'a class = 'a GtkRendererCellAccessibleClass.class
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class =
  struct
    val getType_ = _import "gtk_renderer_cell_accessible_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_renderer_cell_accessible_new" : GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p -> AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p;
    type 'a class = 'a GtkRendererCellAccessibleClass.class
    type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new renderer = (GtkCellRendererClass.FFI.withPtr ---> GtkRendererCellAccessibleClass.FFI.fromPtr true) new_ renderer
    local
      open Property
    in
      val rendererProp =
        {
          get = fn x => get "renderer" GtkCellRendererClass.tOpt x,
          new = fn x => new "renderer" GtkCellRendererClass.tOpt x
        }
    end
  end
