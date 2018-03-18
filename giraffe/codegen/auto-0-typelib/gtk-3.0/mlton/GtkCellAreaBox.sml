structure GtkCellAreaBox :>
  GTK_CELL_AREA_BOX
    where type 'a class = 'a GtkCellAreaBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class =
  struct
    val getType_ = _import "gtk_cell_area_box_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_cell_area_box_new" : unit -> GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p;
    val getSpacing_ = _import "gtk_cell_area_box_get_spacing" : GtkCellAreaBoxClass.FFI.notnull GtkCellAreaBoxClass.FFI.p -> GInt32.FFI.val_;
    val packEnd_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_cell_area_box_pack_end" :
              GtkCellAreaBoxClass.FFI.notnull GtkCellAreaBoxClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               * GBool.FFI.val_
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
              GtkCellAreaBoxClass.FFI.notnull GtkCellAreaBoxClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setSpacing_ = fn x1 & x2 => (_import "gtk_cell_area_box_set_spacing" : GtkCellAreaBoxClass.FFI.notnull GtkCellAreaBoxClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkCellAreaBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCellAreaBoxClass.FFI.fromPtr false) new_ ()
    fun getSpacing self = (GtkCellAreaBoxClass.FFI.withPtr ---> GInt32.FFI.fromVal) getSpacing_ self
    fun packEnd
      self
      (
        renderer,
        expand,
        align,
        fixed
      ) =
      (
        GtkCellAreaBoxClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
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
    fun packStart
      self
      (
        renderer,
        expand,
        align,
        fixed
      ) =
      (
        GtkCellAreaBoxClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
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
    fun setSpacing self spacing = (GtkCellAreaBoxClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setSpacing_ (self & spacing)
    local
      open Property
    in
      val spacingProp =
        {
          get = fn x => get "spacing" int x,
          set = fn x => set "spacing" int x,
          new = fn x => new "spacing" int x
        }
    end
  end
