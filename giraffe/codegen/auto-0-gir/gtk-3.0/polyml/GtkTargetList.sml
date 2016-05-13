structure GtkTargetList :>
  GTK_TARGET_LIST
    where type t = GtkTargetListRecord.t
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_target_list_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val add_ =
        call (load_sym libgtk "gtk_target_list_add")
          (
            GtkTargetListRecord.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val addImageTargets_ =
        call (load_sym libgtk "gtk_target_list_add_image_targets")
          (
            GtkTargetListRecord.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val addRichTextTargets_ =
        call (load_sym libgtk "gtk_target_list_add_rich_text_targets")
          (
            GtkTargetListRecord.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> GtkTextBufferClass.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val addTextTargets_ = call (load_sym libgtk "gtk_target_list_add_text_targets") (GtkTargetListRecord.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val addUriTargets_ = call (load_sym libgtk "gtk_target_list_add_uri_targets") (GtkTargetListRecord.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val remove_ = call (load_sym libgtk "gtk_target_list_remove") (GtkTargetListRecord.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type t = GtkTargetListRecord.t
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun add self target flags info =
      (
        GtkTargetListRecord.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
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
         &&&> FFI.UInt.C.withVal
         &&&> FFI.Bool.C.withVal
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
         &&&> FFI.UInt.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> GtkTextBufferClass.C.withPtr
         ---> I
      )
        addRichTextTargets_
        (
          self
           & info
           & deserializable
           & buffer
        )
    fun addTextTargets self info = (GtkTargetListRecord.C.withPtr &&&> FFI.UInt.C.withVal ---> I) addTextTargets_ (self & info)
    fun addUriTargets self info = (GtkTargetListRecord.C.withPtr &&&> FFI.UInt.C.withVal ---> I) addUriTargets_ (self & info)
    fun remove self target = (GtkTargetListRecord.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> I) remove_ (self & target)
  end
