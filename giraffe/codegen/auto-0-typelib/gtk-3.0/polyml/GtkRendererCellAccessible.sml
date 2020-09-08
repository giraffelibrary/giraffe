structure GtkRendererCellAccessible :>
  GTK_RENDERER_CELL_ACCESSIBLE
    where type 'a class = 'a GtkRendererCellAccessibleClass.class
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_renderer_cell_accessible_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_renderer_cell_accessible_new") (GtkCellRendererClass.PolyML.cPtr --> AtkObjectClass.PolyML.cPtr)
    end
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
