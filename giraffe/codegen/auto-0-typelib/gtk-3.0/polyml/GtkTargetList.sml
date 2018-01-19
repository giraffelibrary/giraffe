structure GtkTargetList :>
  GTK_TARGET_LIST
    where type t = GtkTargetListRecord.t
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class
    where type target_entry_t = GtkTargetEntryRecord.t =
  struct
    structure GtkTargetEntryRecordCVectorNType =
      CValueCVectorNType(
        structure CElemType = GtkTargetEntryRecord.C.ValueType
        structure ElemSequence = CValueVectorSequence(GtkTargetEntryRecord.C.ValueType)
      )
    structure GtkTargetEntryRecordCVectorN = CVectorN(GtkTargetEntryRecordCVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_target_list_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_target_list_new") (GtkTargetEntryRecordCVectorN.PolyML.cInOptPtr &&> GUInt32.PolyML.cVal --> GtkTargetListRecord.PolyML.cPtr)
      val add_ =
        call (getSymbol "gtk_target_list_add")
          (
            GtkTargetListRecord.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val addImageTargets_ =
        call (getSymbol "gtk_target_list_add_image_targets")
          (
            GtkTargetListRecord.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val addRichTextTargets_ =
        call (getSymbol "gtk_target_list_add_rich_text_targets")
          (
            GtkTargetListRecord.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GtkTextBufferClass.PolyML.cPtr
             --> cVoid
          )
      val addTable_ =
        call (getSymbol "gtk_target_list_add_table")
          (
            GtkTargetListRecord.PolyML.cPtr
             &&> GtkTargetEntryRecordCVectorN.PolyML.cInPtr
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val addTextTargets_ = call (getSymbol "gtk_target_list_add_text_targets") (GtkTargetListRecord.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val addUriTargets_ = call (getSymbol "gtk_target_list_add_uri_targets") (GtkTargetListRecord.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val find_ =
        call (getSymbol "gtk_target_list_find")
          (
            GtkTargetListRecord.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> GUInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val remove_ = call (getSymbol "gtk_target_list_remove") (GtkTargetListRecord.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> cVoid)
    end
    type t = GtkTargetListRecord.t
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    type target_entry_t = GtkTargetEntryRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new targets =
      let
        val ntargets =
          case targets of
            SOME targets => LargeInt.fromInt (GtkTargetEntryRecordCVectorN.length targets)
          | NONE => GUInt32.null
        val retVal = (GtkTargetEntryRecordCVectorN.FFI.withOptPtr &&&> GUInt32.FFI.withVal ---> GtkTargetListRecord.FFI.fromPtr true) new_ (targets & ntargets)
      in
        retVal
      end
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
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
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
         &&&> GUInt32.FFI.withVal
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
         &&&> GUInt32.FFI.withVal
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
    fun addTable self targets =
      let
        val ntargets = LargeInt.fromInt (GtkTargetEntryRecordCVectorN.length targets)
        val () =
          (
            GtkTargetListRecord.FFI.withPtr
             &&&> GtkTargetEntryRecordCVectorN.FFI.withPtr
             &&&> GUInt32.FFI.withVal
             ---> I
          )
            addTable_
            (
              self
               & targets
               & ntargets
            )
      in
        ()
      end
    fun addTextTargets self info = (GtkTargetListRecord.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) addTextTargets_ (self & info)
    fun addUriTargets self info = (GtkTargetListRecord.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) addUriTargets_ (self & info)
    fun find self target =
      let
        val info & retVal =
          (
            GtkTargetListRecord.FFI.withPtr
             &&&> GdkAtomRecord.FFI.withPtr
             &&&> GUInt32.FFI.withRefVal
             ---> GUInt32.FFI.fromVal && GBool.FFI.fromVal
          )
            find_
            (
              self
               & target
               & GUInt32.null
            )
      in
        if retVal then SOME info else NONE
      end
    fun remove self target = (GtkTargetListRecord.FFI.withPtr &&&> GdkAtomRecord.FFI.withPtr ---> I) remove_ (self & target)
  end
