structure GtkCellRendererPixbuf :>
  GTK_CELL_RENDERER_PIXBUF
    where type 'a class = 'a GtkCellRendererPixbufClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_cell_renderer_pixbuf_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_cell_renderer_pixbuf_new") (cVoid --> GtkCellRendererClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkCellRendererPixbufClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCellRendererPixbufClass.FFI.fromPtr false) new_ ()
    local
      open Property
    in
      val followStateProp =
        {
          get = fn x => get "follow-state" boolean x,
          set = fn x => set "follow-state" boolean x
        }
      val giconProp =
        {
          get = fn x => get "gicon" GioIconClass.tOpt x,
          set = fn x => set "gicon" GioIconClass.tOpt x
        }
      val iconNameProp =
        {
          get = fn x => get "icon-name" stringOpt x,
          set = fn x => set "icon-name" stringOpt x
        }
      val pixbufProp =
        {
          get = fn x => get "pixbuf" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "pixbuf" GdkPixbufPixbufClass.tOpt x
        }
      val pixbufExpanderClosedProp =
        {
          get = fn x => get "pixbuf-expander-closed" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "pixbuf-expander-closed" GdkPixbufPixbufClass.tOpt x
        }
      val pixbufExpanderOpenProp =
        {
          get = fn x => get "pixbuf-expander-open" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "pixbuf-expander-open" GdkPixbufPixbufClass.tOpt x
        }
      val stockDetailProp =
        {
          get = fn x => get "stock-detail" stringOpt x,
          set = fn x => set "stock-detail" stringOpt x
        }
      val stockIdProp =
        {
          get = fn x => get "stock-id" stringOpt x,
          set = fn x => set "stock-id" stringOpt x
        }
      val stockSizeProp =
        {
          get = fn x => get "stock-size" uint x,
          set = fn x => set "stock-size" uint x
        }
    end
  end
