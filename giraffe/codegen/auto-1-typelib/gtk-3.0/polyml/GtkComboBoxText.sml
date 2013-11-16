structure GtkComboBoxText :>
  GTK_COMBO_BOX_TEXT
    where type 'a class_t = 'a GtkComboBoxTextClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a celleditableclass_t = 'a GtkCellEditableClass.t
    where type 'a celllayoutclass_t = 'a GtkCellLayoutClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_combo_box_text_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_combo_box_text_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newWithEntry_ = call (load_sym libgtk "gtk_combo_box_text_new_with_entry") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val append_ =
        call (load_sym libgtk "gtk_combo_box_text_append")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val appendText_ = call (load_sym libgtk "gtk_combo_box_text_append_text") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val getActiveText_ = call (load_sym libgtk "gtk_combo_box_text_get_active_text") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val insert_ =
        call (load_sym libgtk "gtk_combo_box_text_insert")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.String.PolyML.INOPTPTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val insertText_ =
        call (load_sym libgtk "gtk_combo_box_text_insert_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val prepend_ =
        call (load_sym libgtk "gtk_combo_box_text_prepend")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val prependText_ = call (load_sym libgtk "gtk_combo_box_text_prepend_text") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val remove_ = call (load_sym libgtk "gtk_combo_box_text_remove") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val removeAll_ = call (load_sym libgtk "gtk_combo_box_text_remove_all") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkComboBoxTextClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a celleditableclass_t = 'a GtkCellEditableClass.t
    type 'a celllayoutclass_t = 'a GtkCellLayoutClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.C.withPtr ---> GtkCellEditableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkComboBoxTextClass.C.fromPtr false) new_ ()
    fun newWithEntry () = (I ---> GtkComboBoxTextClass.C.fromPtr false) newWithEntry_ ()
    fun append self id text =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.String.C.withConstPtr
         ---> I
      )
        append_
        (
          self
           & id
           & text
        )
    fun appendText self text = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) appendText_ (self & text)
    fun getActiveText self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getActiveText_ self
    fun insert self position id text =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.String.C.withConstPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.String.C.withConstPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.String.C.withConstPtr
         ---> I
      )
        prepend_
        (
          self
           & id
           & text
        )
    fun prependText self text = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) prependText_ (self & text)
    fun remove self position = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) remove_ (self & position)
    fun removeAll self = (GObjectObjectClass.C.withPtr ---> I) removeAll_ self
  end
