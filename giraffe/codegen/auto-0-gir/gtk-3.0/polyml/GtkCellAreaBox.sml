structure GtkCellAreaBox :>
  GTK_CELL_AREA_BOX
    where type 'a class = 'a GtkCellAreaBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_area_box_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_cell_area_box_new") (FFI.PolyML.cVoid --> GtkCellAreaClass.PolyML.cPtr)
      val getSpacing_ = call (load_sym libgtk "gtk_cell_area_box_get_spacing") (GtkCellAreaBoxClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val packEnd_ =
        call (load_sym libgtk "gtk_cell_area_box_pack_end")
          (
            GtkCellAreaBoxClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val packStart_ =
        call (load_sym libgtk "gtk_cell_area_box_pack_start")
          (
            GtkCellAreaBoxClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setSpacing_ = call (load_sym libgtk "gtk_cell_area_box_set_spacing") (GtkCellAreaBoxClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
    end
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
    fun getSpacing self = (GtkCellAreaBoxClass.C.withPtr ---> FFI.Int.C.fromVal) getSpacing_ self
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
    fun setSpacing self spacing = (GtkCellAreaBoxClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSpacing_ (self & spacing)
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
