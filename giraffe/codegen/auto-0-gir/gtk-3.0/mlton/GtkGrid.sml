structure GtkGrid :>
  GTK_GRID
    where type 'a class = 'a GtkGridClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type position_type_t = GtkPositionType.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type baseline_position_t = GtkBaselinePosition.t =
  struct
    val getType_ = _import "gtk_grid_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_grid_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
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
              GtkGridClass.FFI.non_opt GtkGridClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.val_
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
              GtkGridClass.FFI.non_opt GtkGridClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p
               * GtkPositionType.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.val_
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
    val getBaselineRow_ = _import "gtk_grid_get_baseline_row" : GtkGridClass.FFI.non_opt GtkGridClass.FFI.p -> GInt.FFI.val_;
    val getChildAt_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_grid_get_child_at" :
              GtkGridClass.FFI.non_opt GtkGridClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getColumnHomogeneous_ = _import "gtk_grid_get_column_homogeneous" : GtkGridClass.FFI.non_opt GtkGridClass.FFI.p -> GBool.FFI.val_;
    val getColumnSpacing_ = _import "gtk_grid_get_column_spacing" : GtkGridClass.FFI.non_opt GtkGridClass.FFI.p -> GUInt.FFI.val_;
    val getRowBaselinePosition_ = fn x1 & x2 => (_import "gtk_grid_get_row_baseline_position" : GtkGridClass.FFI.non_opt GtkGridClass.FFI.p * GInt.FFI.val_ -> GtkBaselinePosition.FFI.val_;) (x1, x2)
    val getRowHomogeneous_ = _import "gtk_grid_get_row_homogeneous" : GtkGridClass.FFI.non_opt GtkGridClass.FFI.p -> GBool.FFI.val_;
    val getRowSpacing_ = _import "gtk_grid_get_row_spacing" : GtkGridClass.FFI.non_opt GtkGridClass.FFI.p -> GUInt.FFI.val_;
    val insertColumn_ = fn x1 & x2 => (_import "gtk_grid_insert_column" : GtkGridClass.FFI.non_opt GtkGridClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val insertNextTo_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_grid_insert_next_to" :
              GtkGridClass.FFI.non_opt GtkGridClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkPositionType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val insertRow_ = fn x1 & x2 => (_import "gtk_grid_insert_row" : GtkGridClass.FFI.non_opt GtkGridClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val removeColumn_ = fn x1 & x2 => (_import "gtk_grid_remove_column" : GtkGridClass.FFI.non_opt GtkGridClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val removeRow_ = fn x1 & x2 => (_import "gtk_grid_remove_row" : GtkGridClass.FFI.non_opt GtkGridClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setBaselineRow_ = fn x1 & x2 => (_import "gtk_grid_set_baseline_row" : GtkGridClass.FFI.non_opt GtkGridClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setColumnHomogeneous_ = fn x1 & x2 => (_import "gtk_grid_set_column_homogeneous" : GtkGridClass.FFI.non_opt GtkGridClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setColumnSpacing_ = fn x1 & x2 => (_import "gtk_grid_set_column_spacing" : GtkGridClass.FFI.non_opt GtkGridClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setRowBaselinePosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_grid_set_row_baseline_position" :
              GtkGridClass.FFI.non_opt GtkGridClass.FFI.p
               * GInt.FFI.val_
               * GtkBaselinePosition.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setRowHomogeneous_ = fn x1 & x2 => (_import "gtk_grid_set_row_homogeneous" : GtkGridClass.FFI.non_opt GtkGridClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRowSpacing_ = fn x1 & x2 => (_import "gtk_grid_set_row_spacing" : GtkGridClass.FFI.non_opt GtkGridClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkGridClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type position_type_t = GtkPositionType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type baseline_position_t = GtkBaselinePosition.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
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
        GtkGridClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
        GtkGridClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withOptPtr false
         &&&> GtkPositionType.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun getBaselineRow self = (GtkGridClass.FFI.withPtr false ---> GInt.FFI.fromVal) getBaselineRow_ self
    fun getChildAt self (left, top) =
      (
        GtkGridClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GtkWidgetClass.FFI.fromOptPtr false
      )
        getChildAt_
        (
          self
           & left
           & top
        )
    fun getColumnHomogeneous self = (GtkGridClass.FFI.withPtr false ---> GBool.FFI.fromVal) getColumnHomogeneous_ self
    fun getColumnSpacing self = (GtkGridClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getColumnSpacing_ self
    fun getRowBaselinePosition self row = (GtkGridClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> GtkBaselinePosition.FFI.fromVal) getRowBaselinePosition_ (self & row)
    fun getRowHomogeneous self = (GtkGridClass.FFI.withPtr false ---> GBool.FFI.fromVal) getRowHomogeneous_ self
    fun getRowSpacing self = (GtkGridClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getRowSpacing_ self
    fun insertColumn self position = (GtkGridClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) insertColumn_ (self & position)
    fun insertNextTo self (sibling, side) =
      (
        GtkGridClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GtkPositionType.FFI.withVal
         ---> I
      )
        insertNextTo_
        (
          self
           & sibling
           & side
        )
    fun insertRow self position = (GtkGridClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) insertRow_ (self & position)
    fun removeColumn self position = (GtkGridClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) removeColumn_ (self & position)
    fun removeRow self position = (GtkGridClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) removeRow_ (self & position)
    fun setBaselineRow self row = (GtkGridClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setBaselineRow_ (self & row)
    fun setColumnHomogeneous self homogeneous = (GtkGridClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setColumnHomogeneous_ (self & homogeneous)
    fun setColumnSpacing self spacing = (GtkGridClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setColumnSpacing_ (self & spacing)
    fun setRowBaselinePosition self (row, pos) =
      (
        GtkGridClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GtkBaselinePosition.FFI.withVal
         ---> I
      )
        setRowBaselinePosition_
        (
          self
           & row
           & pos
        )
    fun setRowHomogeneous self homogeneous = (GtkGridClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setRowHomogeneous_ (self & homogeneous)
    fun setRowSpacing self spacing = (GtkGridClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setRowSpacing_ (self & spacing)
    local
      open Property
    in
      val baselineRowProp =
        {
          get = fn x => get "baseline-row" int x,
          set = fn x => set "baseline-row" int x,
          new = fn x => new "baseline-row" int x
        }
      val columnHomogeneousProp =
        {
          get = fn x => get "column-homogeneous" boolean x,
          set = fn x => set "column-homogeneous" boolean x,
          new = fn x => new "column-homogeneous" boolean x
        }
      val columnSpacingProp =
        {
          get = fn x => get "column-spacing" int x,
          set = fn x => set "column-spacing" int x,
          new = fn x => new "column-spacing" int x
        }
      val rowHomogeneousProp =
        {
          get = fn x => get "row-homogeneous" boolean x,
          set = fn x => set "row-homogeneous" boolean x,
          new = fn x => new "row-homogeneous" boolean x
        }
      val rowSpacingProp =
        {
          get = fn x => get "row-spacing" int x,
          set = fn x => set "row-spacing" int x,
          new = fn x => new "row-spacing" int x
        }
    end
  end
