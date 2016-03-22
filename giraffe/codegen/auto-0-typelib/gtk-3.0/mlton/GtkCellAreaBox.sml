structure GtkCellAreaBox :>
  GTK_CELL_AREA_BOX
    where type 'a class = 'a GtkCellAreaBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class =
  struct
    val getType_ = _import "gtk_cell_area_box_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_cell_area_box_new" : unit -> GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p;
    val getSpacing_ = _import "gtk_cell_area_box_get_spacing" : GtkCellAreaBoxClass.C.notnull GtkCellAreaBoxClass.C.p -> FFI.Int32.C.val_;
    val packEnd_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_cell_area_box_pack_end" :
              GtkCellAreaBoxClass.C.notnull GtkCellAreaBoxClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val packStart_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_cell_area_box_pack_start" :
              GtkCellAreaBoxClass.C.notnull GtkCellAreaBoxClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setSpacing_ = fn x1 & x2 => (_import "gtk_cell_area_box_set_spacing" : GtkCellAreaBoxClass.C.notnull GtkCellAreaBoxClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkCellAreaBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCellAreaBoxClass.C.fromPtr false) new_ ()
    fun getSpacing self = (GtkCellAreaBoxClass.C.withPtr ---> FFI.Int32.C.fromVal) getSpacing_ self
    fun packEnd self renderer expand align fixed =
      (
        GtkCellAreaBoxClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        packEnd_
        (
          self
           & renderer
           & expand
           & align
           & fixed
        )
    fun packStart self renderer expand align fixed =
      (
        GtkCellAreaBoxClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        packStart_
        (
          self
           & renderer
           & expand
           & align
           & fixed
        )
    fun setSpacing self spacing = (GtkCellAreaBoxClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSpacing_ (self & spacing)
    local
      open Property
    in
      val spacingProp =
        {
          get = fn x => get "spacing" int x,
          set = fn x => set "spacing" int x
        }
    end
  end
