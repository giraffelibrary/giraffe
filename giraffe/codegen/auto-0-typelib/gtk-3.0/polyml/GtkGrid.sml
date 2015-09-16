structure GtkGrid :>
  GTK_GRID
    where type 'a class_t = 'a GtkGridClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a orientable_class_t = 'a GtkOrientableClass.t
    where type position_type_t = GtkPositionType.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_grid_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_grid_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val attach_ =
        call (load_sym libgtk "gtk_grid_attach")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val attachNextTo_ =
        call (load_sym libgtk "gtk_grid_attach_next_to")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GtkPositionType.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val getColumnHomogeneous_ = call (load_sym libgtk "gtk_grid_get_column_homogeneous") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getColumnSpacing_ = call (load_sym libgtk "gtk_grid_get_column_spacing") (GObjectObjectClass.PolyML.PTR --> FFI.UInt32.PolyML.VAL)
      val getRowHomogeneous_ = call (load_sym libgtk "gtk_grid_get_row_homogeneous") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getRowSpacing_ = call (load_sym libgtk "gtk_grid_get_row_spacing") (GObjectObjectClass.PolyML.PTR --> FFI.UInt32.PolyML.VAL)
      val insertColumn_ = call (load_sym libgtk "gtk_grid_insert_column") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val insertNextTo_ =
        call (load_sym libgtk "gtk_grid_insert_next_to")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GtkPositionType.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val insertRow_ = call (load_sym libgtk "gtk_grid_insert_row") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setColumnHomogeneous_ = call (load_sym libgtk "gtk_grid_set_column_homogeneous") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setColumnSpacing_ = call (load_sym libgtk "gtk_grid_set_column_spacing") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val setRowHomogeneous_ = call (load_sym libgtk "gtk_grid_set_row_homogeneous") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setRowSpacing_ = call (load_sym libgtk "gtk_grid_set_row_spacing") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkGridClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a orientable_class_t = 'a GtkOrientableClass.t
    type position_type_t = GtkPositionType.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkGridClass.C.fromPtr false) new_ ()
    fun attach self child left top width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
    fun getColumnSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getColumnSpacing_ self
    fun getRowHomogeneous self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getRowHomogeneous_ self
    fun getRowSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getRowSpacing_ self
    fun insertColumn self position = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) insertColumn_ (self & position)
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
    fun insertRow self position = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) insertRow_ (self & position)
    fun setColumnHomogeneous self homogeneous = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setColumnHomogeneous_ (self & homogeneous)
    fun setColumnSpacing self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setColumnSpacing_ (self & spacing)
    fun setRowHomogeneous self homogeneous = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRowHomogeneous_ (self & homogeneous)
    fun setRowSpacing self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setRowSpacing_ (self & spacing)
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
