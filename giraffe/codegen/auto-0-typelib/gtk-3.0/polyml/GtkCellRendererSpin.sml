structure GtkCellRendererSpin :>
  GTK_CELL_RENDERER_SPIN
    where type 'a class_t = 'a GtkCellRendererSpinClass.t
    where type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_renderer_spin_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_cell_renderer_spin_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GtkCellRendererSpinClass.t
    type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
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