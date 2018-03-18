structure GtkCellRendererSpin :>
  GTK_CELL_RENDERER_SPIN
    where type 'a class = 'a GtkCellRendererSpinClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class =
  struct
    val getType_ = _import "gtk_cell_renderer_spin_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_cell_renderer_spin_new" : unit -> GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p;
    type 'a class = 'a GtkCellRendererSpinClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCellRendererSpinClass.FFI.fromPtr false) new_ ()
    local
      open Property
    in
      val adjustmentProp =
        {
          get = fn x => get "adjustment" GtkAdjustmentClass.tOpt x,
          set = fn x => set "adjustment" GtkAdjustmentClass.tOpt x,
          new = fn x => new "adjustment" GtkAdjustmentClass.tOpt x
        }
      val climbRateProp =
        {
          get = fn x => get "climb-rate" double x,
          set = fn x => set "climb-rate" double x,
          new = fn x => new "climb-rate" double x
        }
      val digitsProp =
        {
          get = fn x => get "digits" uint x,
          set = fn x => set "digits" uint x,
          new = fn x => new "digits" uint x
        }
    end
  end
