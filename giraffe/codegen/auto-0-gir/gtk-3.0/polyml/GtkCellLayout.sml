structure GtkCellLayout :>
  GTK_CELL_LAYOUT
    where type 'a class = 'a GtkCellLayoutClass.class
    where type 'a cell_area_class = 'a GtkCellAreaClass.class
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_cell_layout_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val addAttribute_ =
        call (getSymbol "gtk_cell_layout_add_attribute")
          (
            GtkCellLayoutClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val clear_ = call (getSymbol "gtk_cell_layout_clear") (GtkCellLayoutClass.PolyML.cPtr --> cVoid)
      val clearAttributes_ = call (getSymbol "gtk_cell_layout_clear_attributes") (GtkCellLayoutClass.PolyML.cPtr &&> GtkCellRendererClass.PolyML.cPtr --> cVoid)
      val getArea_ = call (getSymbol "gtk_cell_layout_get_area") (GtkCellLayoutClass.PolyML.cPtr --> GtkCellAreaClass.PolyML.cOptPtr)
      val packEnd_ =
        call (getSymbol "gtk_cell_layout_pack_end")
          (
            GtkCellLayoutClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val packStart_ =
        call (getSymbol "gtk_cell_layout_pack_start")
          (
            GtkCellLayoutClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val reorder_ =
        call (getSymbol "gtk_cell_layout_reorder")
          (
            GtkCellLayoutClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GtkCellLayoutClass.class
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addAttribute
      self
      (
        cell,
        attribute,
        column
      ) =
      (
        GtkCellLayoutClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         ---> I
      )
        addAttribute_
        (
          self
           & cell
           & attribute
           & column
        )
    fun clear self = (GtkCellLayoutClass.FFI.withPtr false ---> I) clear_ self
    fun clearAttributes self cell = (GtkCellLayoutClass.FFI.withPtr false &&&> GtkCellRendererClass.FFI.withPtr false ---> I) clearAttributes_ (self & cell)
    fun getArea self = (GtkCellLayoutClass.FFI.withPtr false ---> GtkCellAreaClass.FFI.fromOptPtr false) getArea_ self
    fun packEnd self (cell, expand) =
      (
        GtkCellLayoutClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        packEnd_
        (
          self
           & cell
           & expand
        )
    fun packStart self (cell, expand) =
      (
        GtkCellLayoutClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        packStart_
        (
          self
           & cell
           & expand
        )
    fun reorder self (cell, position) =
      (
        GtkCellLayoutClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         ---> I
      )
        reorder_
        (
          self
           & cell
           & position
        )
  end
