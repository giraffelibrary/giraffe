structure GtkComboBoxText :>
  GTK_COMBO_BOX_TEXT
    where type 'a class = 'a GtkComboBoxTextClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_editable_class = 'a GtkCellEditableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_combo_box_text_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_combo_box_text_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithEntry_ = call (getSymbol "gtk_combo_box_text_new_with_entry") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val append_ =
        call (getSymbol "gtk_combo_box_text_append")
          (
            GtkComboBoxTextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val appendText_ = call (getSymbol "gtk_combo_box_text_append_text") (GtkComboBoxTextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val getActiveText_ = call (getSymbol "gtk_combo_box_text_get_active_text") (GtkComboBoxTextClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val insert_ =
        call (getSymbol "gtk_combo_box_text_insert")
          (
            GtkComboBoxTextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val insertText_ =
        call (getSymbol "gtk_combo_box_text_insert_text")
          (
            GtkComboBoxTextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val prepend_ =
        call (getSymbol "gtk_combo_box_text_prepend")
          (
            GtkComboBoxTextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val prependText_ = call (getSymbol "gtk_combo_box_text_prepend_text") (GtkComboBoxTextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val remove_ = call (getSymbol "gtk_combo_box_text_remove") (GtkComboBoxTextClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val removeAll_ = call (getSymbol "gtk_combo_box_text_remove_all") (GtkComboBoxTextClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkComboBoxTextClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_editable_class = 'a GtkCellEditableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.FFI.withPtr ---> GtkCellEditableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkComboBoxTextClass.FFI.fromPtr false) new_ ()
    fun newWithEntry () = (I ---> GtkComboBoxTextClass.FFI.fromPtr false) newWithEntry_ ()
    fun append self id text =
      (
        GtkComboBoxTextClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        append_
        (
          self
           & id
           & text
        )
    fun appendText self text = (GtkComboBoxTextClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) appendText_ (self & text)
    fun getActiveText self = (GtkComboBoxTextClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getActiveText_ self
    fun insert self position id text =
      (
        GtkComboBoxTextClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        insert_
        (
          self
           & position
           & id
           & text
        )
    fun insertText self position text =
      (
        GtkComboBoxTextClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        insertText_
        (
          self
           & position
           & text
        )
    fun prepend self id text =
      (
        GtkComboBoxTextClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        prepend_
        (
          self
           & id
           & text
        )
    fun prependText self text = (GtkComboBoxTextClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) prependText_ (self & text)
    fun remove self position = (GtkComboBoxTextClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) remove_ (self & position)
    fun removeAll self = (GtkComboBoxTextClass.FFI.withPtr ---> I) removeAll_ self
  end
