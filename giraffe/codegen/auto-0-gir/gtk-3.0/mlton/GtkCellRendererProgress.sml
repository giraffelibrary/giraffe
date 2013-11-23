structure GtkCellRendererProgress :>
  GTK_CELL_RENDERER_PROGRESS
    where type 'a class_t = 'a GtkCellRendererProgressClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t =
  struct
    val getType_ = _import "gtk_cell_renderer_progress_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_cell_renderer_progress_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GtkCellRendererProgressClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCellRendererProgressClass.C.fromPtr false) new_ ()
    local
      open Property
    in
      val invertedProp =
        {
          get = fn x => get "inverted" boolean x,
          set = fn x => set "inverted" boolean x
        }
      val pulseProp =
        {
          get = fn x => get "pulse" int x,
          set = fn x => set "pulse" int x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x
        }
      val textXalignProp =
        {
          get = fn x => get "text-xalign" float x,
          set = fn x => set "text-xalign" float x
        }
      val textYalignProp =
        {
          get = fn x => get "text-yalign" float x,
          set = fn x => set "text-yalign" float x
        }
      val valueProp =
        {
          get = fn x => get "value" int x,
          set = fn x => set "value" int x
        }
    end
  end
