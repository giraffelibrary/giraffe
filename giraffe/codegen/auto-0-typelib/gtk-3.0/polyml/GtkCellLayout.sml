structure GtkCellLayout :>
  GTK_CELL_LAYOUT
    where type 'a class_t = 'a GtkCellLayoutClass.t
    where type 'a cell_area_class_t = 'a GtkCellAreaClass.t
    where type 'a cell_renderer_class_t = 'a GtkCellRendererClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_layout_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val addAttribute_ =
        call (load_sym libgtk "gtk_cell_layout_add_attribute")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val clear_ = call (load_sym libgtk "gtk_cell_layout_clear") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val clearAttributes_ = call (load_sym libgtk "gtk_cell_layout_clear_attributes") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getArea_ = call (load_sym libgtk "gtk_cell_layout_get_area") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val packEnd_ =
        call (load_sym libgtk "gtk_cell_layout_pack_end")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val packStart_ =
        call (load_sym libgtk "gtk_cell_layout_pack_start")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val reorder_ =
        call (load_sym libgtk "gtk_cell_layout_reorder")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
    end
    type 'a class_t = 'a GtkCellLayoutClass.t
    type 'a cell_area_class_t = 'a GtkCellAreaClass.t
    type 'a cell_renderer_class_t = 'a GtkCellRendererClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addAttribute self cell attribute column =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        addAttribute_
        (
          self
           & cell
           & attribute
           & column
        )
    fun clear self = (GObjectObjectClass.C.withPtr ---> I) clear_ self
    fun clearAttributes self cell = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) clearAttributes_ (self & cell)
    fun getArea self = (GObjectObjectClass.C.withPtr ---> GtkCellAreaClass.C.fromPtr false) getArea_ self
    fun packEnd self cell expand =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        packEnd_
        (
          self
           & cell
           & expand
        )
    fun packStart self cell expand =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        packStart_
        (
          self
           & cell
           & expand
        )
    fun reorder self cell position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        reorder_
        (
          self
           & cell
           & position
        )
  end
