structure GtkGrid :>
  GTK_GRID
    where type 'a class = 'a GtkGridClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type position_type_t = GtkPositionType.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_grid_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_grid_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkPositionType.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
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
    val getColumnHomogeneous_ = _import "gtk_grid_get_column_homogeneous" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getColumnSpacing_ = _import "gtk_grid_get_column_spacing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt.C.val_;
    val getRowHomogeneous_ = _import "gtk_grid_get_row_homogeneous" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getRowSpacing_ = _import "gtk_grid_get_row_spacing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt.C.val_;
    val insertColumn_ = fn x1 & x2 => (_import "gtk_grid_insert_column" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val insertNextTo_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_grid_insert_next_to" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkPositionType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val insertRow_ = fn x1 & x2 => (_import "gtk_grid_insert_row" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setColumnHomogeneous_ = fn x1 & x2 => (_import "gtk_grid_set_column_homogeneous" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setColumnSpacing_ = fn x1 & x2 => (_import "gtk_grid_set_column_spacing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val setRowHomogeneous_ = fn x1 & x2 => (_import "gtk_grid_set_row_homogeneous" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setRowSpacing_ = fn x1 & x2 => (_import "gtk_grid_set_row_spacing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkGridClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type position_type_t = GtkPositionType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkGridClass.C.fromPtr false) new_ ()
    fun attach self child left top width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
    fun attachNextTo self child sibling side width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkPositionType.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
    fun getColumnHomogeneous self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getColumnHomogeneous_ self
    fun getColumnSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.UInt.C.fromVal) getColumnSpacing_ self
    fun getRowHomogeneous self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getRowHomogeneous_ self
    fun getRowSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.UInt.C.fromVal) getRowSpacing_ self
    fun insertColumn self position = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) insertColumn_ (self & position)
    fun insertNextTo self sibling side =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkPositionType.C.withVal
         ---> I
      )
        insertNextTo_
        (
          self
           & sibling
           & side
        )
    fun insertRow self position = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) insertRow_ (self & position)
    fun setColumnHomogeneous self homogeneous = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setColumnHomogeneous_ (self & homogeneous)
    fun setColumnSpacing self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) setColumnSpacing_ (self & spacing)
    fun setRowHomogeneous self homogeneous = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRowHomogeneous_ (self & homogeneous)
    fun setRowSpacing self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) setRowSpacing_ (self & spacing)
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
