structure GtkCellAreaBox :>
  GTK_CELL_AREA_BOX
    where type 'a class_t = 'a GtkCellAreaBoxClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a cell_layout_class_t = 'a GtkCellLayoutClass.t
    where type 'a orientable_class_t = 'a GtkOrientableClass.t
    where type 'a cell_renderer_class_t = 'a GtkCellRendererClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_area_box_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_cell_area_box_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getSpacing_ = call (load_sym libgtk "gtk_cell_area_box_get_spacing") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val packEnd_ =
        call (load_sym libgtk "gtk_cell_area_box_pack_end")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val packStart_ =
        call (load_sym libgtk "gtk_cell_area_box_pack_start")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setSpacing_ = call (load_sym libgtk "gtk_cell_area_box_set_spacing") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkCellAreaBoxClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a cell_layout_class_t = 'a GtkCellLayoutClass.t
    type 'a orientable_class_t = 'a GtkOrientableClass.t
    type 'a cell_renderer_class_t = 'a GtkCellRendererClass.t
    type t = base class_t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCellAreaBoxClass.C.fromPtr false) new_ ()
    fun getSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getSpacing_ self
    fun packEnd self renderer expand align fixed =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
    fun setSpacing self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSpacing_ (self & spacing)
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
