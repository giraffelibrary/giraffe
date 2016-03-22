structure GtkCellLayout :>
  GTK_CELL_LAYOUT
    where type 'a class = 'a GtkCellLayoutClass.class
    where type 'a cell_area_class = 'a GtkCellAreaClass.class
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_layout_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val addAttribute_ =
        call (load_sym libgtk "gtk_cell_layout_add_attribute")
          (
            GtkCellLayoutClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val clear_ = call (load_sym libgtk "gtk_cell_layout_clear") (GtkCellLayoutClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val clearAttributes_ = call (load_sym libgtk "gtk_cell_layout_clear_attributes") (GtkCellLayoutClass.PolyML.cPtr &&> GtkCellRendererClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getArea_ = call (load_sym libgtk "gtk_cell_layout_get_area") (GtkCellLayoutClass.PolyML.cPtr --> GtkCellAreaClass.PolyML.cPtr)
      val packEnd_ =
        call (load_sym libgtk "gtk_cell_layout_pack_end")
          (
            GtkCellLayoutClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val packStart_ =
        call (load_sym libgtk "gtk_cell_layout_pack_start")
          (
            GtkCellLayoutClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val reorder_ =
        call (load_sym libgtk "gtk_cell_layout_reorder")
          (
            GtkCellLayoutClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
    end
    type 'a class = 'a GtkCellLayoutClass.class
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addAttribute self cell attribute column =
      (
        GtkCellLayoutClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        addAttribute_
        (
          self
           & cell
           & attribute
           & column
        )
    fun clear self = (GtkCellLayoutClass.C.withPtr ---> I) clear_ self
    fun clearAttributes self cell = (GtkCellLayoutClass.C.withPtr &&&> GtkCellRendererClass.C.withPtr ---> I) clearAttributes_ (self & cell)
    fun getArea self = (GtkCellLayoutClass.C.withPtr ---> GtkCellAreaClass.C.fromPtr false) getArea_ self
    fun packEnd self cell expand =
      (
        GtkCellLayoutClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
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
        GtkCellLayoutClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
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
        GtkCellLayoutClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        reorder_
        (
          self
           & cell
           & position
        )
  end
