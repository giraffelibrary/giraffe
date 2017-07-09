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
      val getType_ = call (getSymbol "gtk_cell_area_box_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_cell_area_box_new") (cVoid --> GtkCellAreaClass.PolyML.cPtr)
      val getSpacing_ = call (getSymbol "gtk_cell_area_box_get_spacing") (GtkCellAreaBoxClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val packEnd_ =
        call (getSymbol "gtk_cell_area_box_pack_end")
          (
            GtkCellAreaBoxClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val packStart_ =
        call (getSymbol "gtk_cell_area_box_pack_start")
          (
            GtkCellAreaBoxClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setSpacing_ = call (getSymbol "gtk_cell_area_box_set_spacing") (GtkCellAreaBoxClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
    end
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
    fun packEnd self renderer expand align fixed =
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
    fun packStart self renderer expand align fixed =
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
          set = fn x => set "spacing" int x
        }
    end
  end
