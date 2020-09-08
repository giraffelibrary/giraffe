structure GtkGrid :>
  GTK_GRID
    where type 'a class = 'a GtkGridClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type position_type_t = GtkPositionType.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type baseline_position_t = GtkBaselinePosition.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_grid_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_grid_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val attach_ =
        call (getSymbol "gtk_grid_attach")
          (
            GtkGridClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val attachNextTo_ =
        call (getSymbol "gtk_grid_attach_next_to")
          (
            GtkGridClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> GtkPositionType.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val getBaselineRow_ = call (getSymbol "gtk_grid_get_baseline_row") (GtkGridClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getChildAt_ =
        call (getSymbol "gtk_grid_get_child_at")
          (
            GtkGridClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GtkWidgetClass.PolyML.cOptPtr
          )
      val getColumnHomogeneous_ = call (getSymbol "gtk_grid_get_column_homogeneous") (GtkGridClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getColumnSpacing_ = call (getSymbol "gtk_grid_get_column_spacing") (GtkGridClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getRowBaselinePosition_ = call (getSymbol "gtk_grid_get_row_baseline_position") (GtkGridClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GtkBaselinePosition.PolyML.cVal)
      val getRowHomogeneous_ = call (getSymbol "gtk_grid_get_row_homogeneous") (GtkGridClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRowSpacing_ = call (getSymbol "gtk_grid_get_row_spacing") (GtkGridClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val insertColumn_ = call (getSymbol "gtk_grid_insert_column") (GtkGridClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val insertNextTo_ =
        call (getSymbol "gtk_grid_insert_next_to")
          (
            GtkGridClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkPositionType.PolyML.cVal
             --> cVoid
          )
      val insertRow_ = call (getSymbol "gtk_grid_insert_row") (GtkGridClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val removeColumn_ = call (getSymbol "gtk_grid_remove_column") (GtkGridClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val removeRow_ = call (getSymbol "gtk_grid_remove_row") (GtkGridClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setBaselineRow_ = call (getSymbol "gtk_grid_set_baseline_row") (GtkGridClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setColumnHomogeneous_ = call (getSymbol "gtk_grid_set_column_homogeneous") (GtkGridClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setColumnSpacing_ = call (getSymbol "gtk_grid_set_column_spacing") (GtkGridClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val setRowBaselinePosition_ =
        call (getSymbol "gtk_grid_set_row_baseline_position")
          (
            GtkGridClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GtkBaselinePosition.PolyML.cVal
             --> cVoid
          )
      val setRowHomogeneous_ = call (getSymbol "gtk_grid_set_row_homogeneous") (GtkGridClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setRowSpacing_ = call (getSymbol "gtk_grid_set_row_spacing") (GtkGridClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
    end
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
      open ValueAccessor
    in
      val baselineRowProp =
        {
          name = "baseline-row",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val columnHomogeneousProp =
        {
          name = "column-homogeneous",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val columnSpacingProp =
        {
          name = "column-spacing",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val rowHomogeneousProp =
        {
          name = "row-homogeneous",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val rowSpacingProp =
        {
          name = "row-spacing",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
    end
  end
