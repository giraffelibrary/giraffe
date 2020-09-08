structure GtkCellRendererProgress :>
  GTK_CELL_RENDERER_PROGRESS
    where type 'a class = 'a GtkCellRendererProgressClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class =
  struct
    val getType_ = _import "gtk_cell_renderer_progress_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_cell_renderer_progress_new" : unit -> GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p;
    type 'a class = 'a GtkCellRendererProgressClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type t = base class
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCellRendererProgressClass.FFI.fromPtr false) new_ ()
    local
      open ValueAccessor
    in
      val invertedProp =
        {
          name = "inverted",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val pulseProp =
        {
          name = "pulse",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val textProp =
        {
          name = "text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val textXalignProp =
        {
          name = "text-xalign",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
      val textYalignProp =
        {
          name = "text-yalign",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
      val valueProp =
        {
          name = "value",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
    end
  end
