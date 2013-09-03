structure GtkTargetList :>
  GTK_TARGET_LIST
    where type record_t = GtkTargetListRecord.t
    where type 'a textbufferclass_t = 'a GtkTextBufferClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_target_list_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val add_ =
        call (load_sym libgtk "gtk_target_list_add")
          (
            GtkTargetListRecord.PolyML.PTR
             &&> GdkAtomRecord.PolyML.PTR
             &&> FFI.PolyML.UInt32.VAL
             &&> FFI.PolyML.UInt32.VAL
             --> FFI.PolyML.VOID
          )
      val addImageTargets_ =
        call (load_sym libgtk "gtk_target_list_add_image_targets")
          (
            GtkTargetListRecord.PolyML.PTR
             &&> FFI.PolyML.UInt32.VAL
             &&> FFI.PolyML.Bool.VAL
             --> FFI.PolyML.VOID
          )
      val addRichTextTargets_ =
        call (load_sym libgtk "gtk_target_list_add_rich_text_targets")
          (
            GtkTargetListRecord.PolyML.PTR
             &&> FFI.PolyML.UInt32.VAL
             &&> FFI.PolyML.Bool.VAL
             &&> GObjectObjectClass.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val addTextTargets_ = call (load_sym libgtk "gtk_target_list_add_text_targets") (GtkTargetListRecord.PolyML.PTR &&> FFI.PolyML.UInt32.VAL --> FFI.PolyML.VOID)
      val addUriTargets_ = call (load_sym libgtk "gtk_target_list_add_uri_targets") (GtkTargetListRecord.PolyML.PTR &&> FFI.PolyML.UInt32.VAL --> FFI.PolyML.VOID)
      val remove_ = call (load_sym libgtk "gtk_target_list_remove") (GtkTargetListRecord.PolyML.PTR &&> GdkAtomRecord.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type record_t = GtkTargetListRecord.t
    type 'a textbufferclass_t = 'a GtkTextBufferClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun add self target flags info =
      (
        GtkTargetListRecord.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
         ---> I
      )
        add_
        (
          self
           & target
           & flags
           & info
        )
    fun addImageTargets self info writable =
      (
        GtkTargetListRecord.C.withPtr
         &&&> FFI.UInt32.withVal
         &&&> FFI.Bool.withVal
         ---> I
      )
        addImageTargets_
        (
          self
           & info
           & writable
        )
    fun addRichTextTargets self info deserializable buffer =
      (
        GtkTargetListRecord.C.withPtr
         &&&> FFI.UInt32.withVal
         &&&> FFI.Bool.withVal
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        addRichTextTargets_
        (
          self
           & info
           & deserializable
           & buffer
        )
    fun addTextTargets self info = (GtkTargetListRecord.C.withPtr &&&> FFI.UInt32.withVal ---> I) addTextTargets_ (self & info)
    fun addUriTargets self info = (GtkTargetListRecord.C.withPtr &&&> FFI.UInt32.withVal ---> I) addUriTargets_ (self & info)
    fun remove self target = (GtkTargetListRecord.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> I) remove_ (self & target)
  end
