structure GIRepositoryBaseInfo :>
  G_I_REPOSITORY_BASE_INFO
    where type 'a class_t = 'a GIRepositoryBaseInfoClass.t
    where type typelibtype_t = GIRepositoryTypelibType.t =
  struct
    type 'a class_t = 'a GIRepositoryBaseInfoClass.t
    type typelibtype_t = GIRepositoryTypelibType.t


    fun getName info =
      let
        val Info.BASE (ref {name, ...}) & _ =
          GIRepositoryBaseInfoClass.Obj.unpack info
      in
        name
      end

    fun getNamespace info =
      let
        val Info.BASE (ref {typelib = ref {namespace, ...}, ...}) & _ =
          GIRepositoryBaseInfoClass.Obj.unpack info
      in
        #name namespace
      end

    fun isDeprecated info =
      let
        val Info.BASE (ref {deprecated, ...}) & _ =
          GIRepositoryBaseInfoClass.Obj.unpack info
      in
        deprecated
      end

    fun getAttribute info =
      let
        val Info.BASE (ref {attributes, ...}) & _ =
          GIRepositoryBaseInfoClass.Obj.unpack info
      in
        ListDict.lookup attributes
      end

    fun getContainer info =
      let
        val Info.BASE (ref {container, ...}) & _ =
          GIRepositoryBaseInfoClass.Obj.unpack info
      in
        case container of
          SOME baseData => SOME (GIRepositoryBaseInfoClass.Obj.pack (baseData & ()))
        | NONE          => NONE
      end

    fun getTypelib info =
      let
        val Info.BASE (ref {typelib, ...}) & _ =
          GIRepositoryBaseInfoClass.Obj.unpack info
      in
        typelib
      end

    fun equal info1 info2 =
      let
        val baseData1 & _ = GIRepositoryBaseInfoClass.Obj.unpack info1
        val baseData2 & _ = GIRepositoryBaseInfoClass.Obj.unpack info2
      in
        baseData1 = baseData2
      end
  end
