structure GtkCellAreaBox :>
  GTK_CELL_AREA_BOX
    where type 'a class_t = 'a GtkCellAreaBoxClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a celllayoutclass_t = 'a GtkCellLayoutClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t
    where type 'a cellrendererclass_t = 'a GtkCellRendererClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_area_box_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_cell_area_box_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getSpacing_ = call (load_sym libgtk "gtk_cell_area_box_get_spacing") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val packEnd_ =
        call (load_sym libgtk "gtk_cell_area_box_pack_end")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val packStart_ =
        call (load_sym libgtk "gtk_cell_area_box_pack_start")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setSpacing_ = call (load_sym libgtk "gtk_cell_area_box_set_spacing") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkCellAreaBoxClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a celllayoutclass_t = 'a GtkCellLayoutClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    type 'a cellrendererclass_t = 'a GtkCellRendererClass.t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCellAreaBoxClass.C.fromPtr false) new_ ()
    fun getSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getSpacing_ self
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
    fun setSpacing self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSpacing_ (self & spacing)
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
