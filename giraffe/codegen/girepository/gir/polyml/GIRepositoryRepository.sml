structure GIRepositoryRepository :>
  G_I_REPOSITORY_REPOSITORY
    where type 'a class_t = 'a GIRepositoryRepositoryClass.t
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type loadflags_t = GIRepositoryRepositoryLoadFlags.flags
    where type typelibtype_t = GIRepositoryTypelibType.t =
  struct
    type 'a class_t = 'a GIRepositoryRepositoryClass.t
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type loadflags_t = GIRepositoryRepositoryLoadFlags.flags
    type typelibtype_t = GIRepositoryTypelibType.t


    fun lookupTypelib repository namespace_ =
      let
        val ref {loaded, ...} & _ =
          GIRepositoryRepositoryClass.Obj.unpack repository
      in
        case ListDict.lookup loaded namespace_ of
          SOME typelib => typelib
        | NONE         => raise Fail "namespace not loaded"
      end

    fun lookupNamespace repository namespace_ =
      #namespace (! (lookupTypelib repository namespace_))

    fun errMsg name version oldVersion =
      String.concat [
        "Attempting to load namespace '", name,
        "', version '", version, "', but version '", oldVersion,
        "' is already loaded"
    ]


    fun getDefault () =
      GIRepositoryRepositoryClass.Obj.pack
        (ref {path = ListDict.empty, loaded = ListDict.empty} & ())

    fun prependSearchPath repository directory =
      let
        val () =
          if OS.FileSys.isDir directory
          then ()
          else
            raise
              Fail (concat ["directory \"", String.toString directory, "\" not valid"])

        val repodata & _ = GIRepositoryRepositoryClass.Obj.unpack repository
        val ref {path, loaded} = repodata
        val path' = ListDict.insert I #1 ((directory, ()), path)
      in
        repodata := {path = path', loaded = loaded}
      end

    fun loadTypelib repository typelib _ =
      let
        val repodata & _ = GIRepositoryRepositoryClass.Obj.unpack repository
        val ref {path, loaded} = repodata

        val ref {namespace = {name, version, ...}, ...} = typelib

        fun check (_, ref {namespace = {version = oldVersion, ...}, ...}) =
          if version = oldVersion
          then typelib
          else raise Fail (errMsg name version oldVersion)

        val loaded' = ListDict.insert I check ((name, typelib), loaded)
      in
        repodata := {path = path, loaded = loaded'};
        name
      end

    fun fileNotFoundMsg file =
      String.concat ["file \"", String.toString file, "\" not found on path"]

    fun fileIsDirMsg file =
      String.concat ["file \"", String.toString file, "\" is a directory"]

    fun fileNotReadableMsg file =
      String.concat ["file \"", String.toString file, "\" is not readable"]

    fun failedToParseXMLFileMsg file =
      String.concat ["failed to parse XML file \"", String.toString file, "\""]

    fun inclNotLoaded name =
      String.concat ["included namespace \"", String.toString name, "\" is not loaded"]

    fun multipleInclMsg name =
      String.concat ["namespace \"", String.toString name, "\" included more than once"]

    fun inclVerNotLoadedVerMsg namespace {name, version} loadedVersion =
      String.concat [
        "namespace \"", String.toString namespace,
        "\" requires namespace \"", String.toString name,
        "\" at version ", version, " but version ", loadedVersion, " is already loaded"
      ]

    fun findFile path file =
      let
        val dirs = List.map #1 (ListDict.toList path)

        fun check dirs =
          case dirs of
            dir :: dirs' => (
              OS.FileSys.fullPath (OS.Path.joinDirFile {dir = dir, file = file})
                handle
                  OS.SysErr _ => check dirs'
            )
          | []           => raise Fail (fileNotFoundMsg file)
      in
        check dirs
      end

    fun require repository namespace_ version _ =
      let
        val repodata & _ = GIRepositoryRepositoryClass.Obj.unpack repository
        val ref {path, loaded} = repodata

        fun makeTypelib () =
          let
            val file = String.concat [namespace_, "-", version, ".gir"]

            (* Find GIR file *)
            val fullFile = findFile path file

            (* Validate `fullFile`; note: `fullFile` exists on the file system *)
            val () =
              if OS.FileSys.isDir fullFile
              then raise Fail (fileIsDirMsg fullFile)
              else
                if OS.FileSys.access (fullFile, [OS.FileSys.A_READ])
                then ()
                else raise Fail (fileNotReadableMsg fullFile)

            (* Parse XML *)
            val tree =
              XML.parsefile fullFile
                handle
                  XML.XML _ => raise Fail (failedToParseXMLFileMsg fullFile)

            (* Parse GIR XML *)
            val repository as {includes, ...} = GirXmlParser.parseTree tree

            (* Create type dictionary for included namespaces, checking that
             * included namespaces are already loaded at the required version
             * and that a namespace is not included more than once
             *)
            fun addLoadedElemDict (incl as {name, version}, elemDicts) =
              case ListDict.lookup loaded name of
                SOME (ref {namespace, elemDict, ...}) => (
                  if #version namespace <> version
                  then
                    raise Fail (inclVerNotLoadedVerMsg namespace_ incl (#version namespace))
                  else
                    ListDict.insert I (fn _ => raise Fail (multipleInclMsg name))
                      ((name, elemDict), elemDicts)
                )
              | NONE                                  => raise Fail (inclNotLoaded name)

            val elemDicts = foldl addLoadedElemDict ListDict.empty includes

            (* Parse GIR abstract syntax *)
            val {data = repodata, ...} =
              GirTranslator.translate elemDicts repository
          in
            repodata
          end

        exception Unchanged of Info.repodata

        fun check (_, oldTypelib as ref {namespace = {version = oldVersion, ...}, ...}) =
          if version = oldVersion
          then raise (Unchanged oldTypelib)
          else raise Fail (errMsg namespace_ version oldVersion)

        val (typelib, loaded') =
          ListDict.insertMap (D o makeTypelib) check ((namespace_, ()), loaded)
            handle
              Unchanged typelib => (typelib, loaded)
      in
        repodata := {path = path, loaded = loaded'};
        typelib
      end

    fun getDependencies repository namespace_ =
      let
        val ref {includes, ...} = lookupTypelib repository namespace_
        fun fmt {name, version} = String.concat [name, "-", version]
      in
        case includes of
          [] => NONE
        | _  => SOME (map fmt includes)
      end

    fun getNInfos repository namespace_ =
      Vector.length (#infos (lookupNamespace repository namespace_))

    fun getInfo repository namespace_ index =
      GIRepositoryBaseInfoClass.Obj.pack
        (Vector.sub (#infos (lookupNamespace repository namespace_), index) & ())

    fun getSharedLibrary repository namespace_ =
      #sharedLib (lookupNamespace repository namespace_)

    fun getCPrefix repository namespace_ =
      #cPrefix (lookupNamespace repository namespace_)
  end
