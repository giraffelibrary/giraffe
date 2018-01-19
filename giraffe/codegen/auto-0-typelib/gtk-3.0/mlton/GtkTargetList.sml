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
    val getType_ = _import "gtk_target_list_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_target_list_new" :
              GtkTargetEntryRecordCVectorN.MLton.p1
               * unit GtkTargetEntryRecordCVectorN.MLton.p2
               * GUInt32.FFI.val_
               -> GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val add_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_target_list_add" :
              GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p
               * GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addImageTargets_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_target_list_add_image_targets" :
              GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p
               * GUInt32.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addRichTextTargets_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_target_list_add_rich_text_targets" :
              GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p
               * GUInt32.FFI.val_
               * GBool.FFI.val_
               * GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addTable_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_target_list_add_table" :
              GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p
               * GtkTargetEntryRecordCVectorN.MLton.p1
               * GtkTargetEntryRecordCVectorN.FFI.notnull GtkTargetEntryRecordCVectorN.MLton.p2
               * GUInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addTextTargets_ = fn x1 & x2 => (_import "gtk_target_list_add_text_targets" : GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val addUriTargets_ = fn x1 & x2 => (_import "gtk_target_list_add_uri_targets" : GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val find_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_target_list_find" :
              GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p
               * GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p
               * GUInt32.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "gtk_target_list_remove" : GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p * GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p -> unit;) (x1, x2)
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
