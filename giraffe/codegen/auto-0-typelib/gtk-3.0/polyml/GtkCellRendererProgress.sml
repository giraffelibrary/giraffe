structure GtkCellRendererProgress :>
  GTK_CELL_RENDERER_PROGRESS
    where type 'a class_t = 'a GtkCellRendererProgressClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_renderer_progress_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_cell_renderer_progress_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GtkCellRendererProgressClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    type t = base class_t
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
