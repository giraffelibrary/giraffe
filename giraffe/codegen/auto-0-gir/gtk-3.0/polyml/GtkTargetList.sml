structure GtkTargetList :>
  GTK_TARGET_LIST
    where type t = GtkTargetListRecord.t
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_target_list_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val add_ =
        call (getSymbol "gtk_target_list_add")
          (
            GtkTargetListRecord.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             --> cVoid
          )
      val addImageTargets_ =
        call (getSymbol "gtk_target_list_add_image_targets")
          (
            GtkTargetListRecord.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val addRichTextTargets_ =
        call (getSymbol "gtk_target_list_add_rich_text_targets")
          (
            GtkTargetListRecord.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GtkTextBufferClass.PolyML.cPtr
             --> cVoid
          )
      val addTextTargets_ = call (getSymbol "gtk_target_list_add_text_targets") (GtkTargetListRecord.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val addUriTargets_ = call (getSymbol "gtk_target_list_add_uri_targets") (GtkTargetListRecord.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val remove_ = call (getSymbol "gtk_target_list_remove") (GtkTargetListRecord.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> cVoid)
    end
    type t = GtkTargetListRecord.t
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun add
      self
      (
        target,
        flags,
        info
      ) =
      (
        GtkTargetListRecord.FFI.withPtr
         &&&> GdkAtomRecord.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         ---> I
      )
        add_
        (
          self
           & target
           & flags
           & info
        )
    fun addImageTargets self (info, writable) =
      (
        GtkTargetListRecord.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        addImageTargets_
        (
          self
           & info
           & writable
        )
    fun addRichTextTargets
      self
      (
        info,
        deserializable,
        buffer
      ) =
      (
        GtkTargetListRecord.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GtkTextBufferClass.FFI.withPtr
         ---> I
      )
        addRichTextTargets_
        (
          self
           & info
           & deserializable
           & buffer
        )
    fun addTextTargets self info = (GtkTargetListRecord.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) addTextTargets_ (self & info)
    fun addUriTargets self info = (GtkTargetListRecord.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) addUriTargets_ (self & info)
    fun remove self target = (GtkTargetListRecord.FFI.withPtr &&&> GdkAtomRecord.FFI.withPtr ---> I) remove_ (self & target)
  end
