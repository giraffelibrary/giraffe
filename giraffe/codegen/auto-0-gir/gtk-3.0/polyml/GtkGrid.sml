structure GtkGrid :>
  GTK_GRID
    where type 'a class = 'a GtkGridClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type position_type_t = GtkPositionType.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_grid_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_grid_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val attach_ =
        call (load_sym libgtk "gtk_grid_attach")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val attachNextTo_ =
        call (load_sym libgtk "gtk_grid_attach_next_to")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GtkPositionType.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val getColumnHomogeneous_ = call (load_sym libgtk "gtk_grid_get_column_homogeneous") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getColumnSpacing_ = call (load_sym libgtk "gtk_grid_get_column_spacing") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val getRowHomogeneous_ = call (load_sym libgtk "gtk_grid_get_row_homogeneous") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getRowSpacing_ = call (load_sym libgtk "gtk_grid_get_row_spacing") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val insertColumn_ = call (load_sym libgtk "gtk_grid_insert_column") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val insertNextTo_ =
        call (load_sym libgtk "gtk_grid_insert_next_to")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GtkPositionType.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val insertRow_ = call (load_sym libgtk "gtk_grid_insert_row") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setColumnHomogeneous_ = call (load_sym libgtk "gtk_grid_set_column_homogeneous") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setColumnSpacing_ = call (load_sym libgtk "gtk_grid_set_column_spacing") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
      val setRowHomogeneous_ = call (load_sym libgtk "gtk_grid_set_row_homogeneous") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setRowSpacing_ = call (load_sym libgtk "gtk_grid_set_row_spacing") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
    end
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
