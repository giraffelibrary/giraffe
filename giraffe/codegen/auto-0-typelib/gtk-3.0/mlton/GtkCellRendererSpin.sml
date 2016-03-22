structure GtkCellRendererSpin :>
  GTK_CELL_RENDERER_SPIN
    where type 'a class = 'a GtkCellRendererSpinClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class =
  struct
    val getType_ = _import "gtk_cell_renderer_spin_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_cell_renderer_spin_new" : unit -> GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p;
    type 'a class = 'a GtkCellRendererSpinClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCellRendererSpinClass.C.fromPtr false) new_ ()
    local
      open Property
    in
      val adjustmentProp =
        {
          get = fn x => get "adjustment" GtkAdjustmentClass.tOpt x,
          set = fn x => set "adjustment" GtkAdjustmentClass.tOpt x
        }
      val climbRateProp =
        {
          get = fn x => get "climb-rate" double x,
          set = fn x => set "climb-rate" double x
        }
      val digitsProp =
        {
          get = fn x => get "digits" uint x,
          set = fn x => set "digits" uint x
        }
    end
  end
