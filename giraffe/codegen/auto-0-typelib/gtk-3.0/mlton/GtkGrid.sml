structure GtkGrid :>
  GTK_GRID
    where type 'a class = 'a GtkGridClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type position_type_t = GtkPositionType.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_grid_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_grid_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val attach_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_grid_attach" :
              GtkGridClass.FFI.notnull GtkGridClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val attachNextTo_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_grid_attach_next_to" :
              GtkGridClass.FFI.notnull GtkGridClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GtkPositionType.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getColumnHomogeneous_ = _import "gtk_grid_get_column_homogeneous" : GtkGridClass.FFI.notnull GtkGridClass.FFI.p -> GBool.FFI.val_;
    val getColumnSpacing_ = _import "gtk_grid_get_column_spacing" : GtkGridClass.FFI.notnull GtkGridClass.FFI.p -> GUInt32.FFI.val_;
    val getRowHomogeneous_ = _import "gtk_grid_get_row_homogeneous" : GtkGridClass.FFI.notnull GtkGridClass.FFI.p -> GBool.FFI.val_;
    val getRowSpacing_ = _import "gtk_grid_get_row_spacing" : GtkGridClass.FFI.notnull GtkGridClass.FFI.p -> GUInt32.FFI.val_;
    val insertColumn_ = fn x1 & x2 => (_import "gtk_grid_insert_column" : GtkGridClass.FFI.notnull GtkGridClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val insertNextTo_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_grid_insert_next_to" :
              GtkGridClass.FFI.notnull GtkGridClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GtkPositionType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val insertRow_ = fn x1 & x2 => (_import "gtk_grid_insert_row" : GtkGridClass.FFI.notnull GtkGridClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setColumnHomogeneous_ = fn x1 & x2 => (_import "gtk_grid_set_column_homogeneous" : GtkGridClass.FFI.notnull GtkGridClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setColumnSpacing_ = fn x1 & x2 => (_import "gtk_grid_set_column_spacing" : GtkGridClass.FFI.notnull GtkGridClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val setRowHomogeneous_ = fn x1 & x2 => (_import "gtk_grid_set_row_homogeneous" : GtkGridClass.FFI.notnull GtkGridClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRowSpacing_ = fn x1 & x2 => (_import "gtk_grid_set_row_spacing" : GtkGridClass.FFI.notnull GtkGridClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkGridClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type position_type_t = GtkPositionType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkGridClass.FFI.fromPtr false) new_ ()
    fun attach
      self
      (
        child,
        left,
        top,
        width,
        height
      ) =
      (
        GtkGridClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        attach_
        (
          self
           & child
           & left
           & top
           & width
           & height
        )
    fun attachNextTo
      self
      (
        child,
        sibling,
        side,
        width,
        height
      ) =
      (
        GtkGridClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkPositionType.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        attachNextTo_
        (
          self
           & child
           & sibling
           & side
           & width
           & height
        )
    fun getColumnHomogeneous self = (GtkGridClass.FFI.withPtr ---> GBool.FFI.fromVal) getColumnHomogeneous_ self
    fun getColumnSpacing self = (GtkGridClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getColumnSpacing_ self
    fun getRowHomogeneous self = (GtkGridClass.FFI.withPtr ---> GBool.FFI.fromVal) getRowHomogeneous_ self
    fun getRowSpacing self = (GtkGridClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getRowSpacing_ self
    fun insertColumn self position = (GtkGridClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) insertColumn_ (self & position)
    fun insertNextTo self (sibling, side) =
      (
        GtkGridClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkPositionType.FFI.withVal
         ---> I
      )
        insertNextTo_
        (
          self
           & sibling
           & side
        )
    fun insertRow self position = (GtkGridClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) insertRow_ (self & position)
    fun setColumnHomogeneous self homogeneous = (GtkGridClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setColumnHomogeneous_ (self & homogeneous)
    fun setColumnSpacing self spacing = (GtkGridClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setColumnSpacing_ (self & spacing)
    fun setRowHomogeneous self homogeneous = (GtkGridClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRowHomogeneous_ (self & homogeneous)
    fun setRowSpacing self spacing = (GtkGridClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setRowSpacing_ (self & spacing)
    local
      open Property
    in
      val columnHomogeneousProp =
        {
          get = fn x => get "column-homogeneous" boolean x,
          set = fn x => set "column-homogeneous" boolean x
        }
      val columnSpacingProp =
        {
          get = fn x => get "column-spacing" int x,
          set = fn x => set "column-spacing" int x
        }
      val rowHomogeneousProp =
        {
          get = fn x => get "row-homogeneous" boolean x,
          set = fn x => set "row-homogeneous" boolean x
        }
      val rowSpacingProp =
        {
          get = fn x => get "row-spacing" int x,
          set = fn x => set "row-spacing" int x
        }
    end
  end
