structure GIRepositoryRepository :>
  G_I_REPOSITORY_REPOSITORY
    where type 'a class = 'a GIRepositoryRepositoryClass.class
    where type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    where type loadflags_t = GIRepositoryRepositoryLoadFlags.flags
    where type typelibtype_t = GIRepositoryTypelibType.t =
  struct
    type 'a class = 'a GIRepositoryRepositoryClass.class
    type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    type loadflags_t = GIRepositoryRepositoryLoadFlags.flags
    type typelibtype_t = GIRepositoryTypelibType.t
    type typelibvers_t = string ListDict.t


    fun errMsgVerExists name ver =
      String.concat [
        "namespace ", name, " version ", ver, " already present"
      ]

    fun errMsgVerConflict name ver1 ver2 =
      String.concat [
        "namespace ", name, " version ", ver1,
        " conflicts with version ", ver2, " that is already present"
      ]

    fun checkVer name (ver1, ver2) =
      if ver1 = ver2
      then raise Fail (errMsgVerExists name ver2)
      else raise Fail (errMsgVerConflict name ver1 ver2)

    fun insertTypelibVer ((name, ver), vers) =
      ListDict.insert I (checkVer name) ((name, ver), vers)

    fun extendTypelibVers extraVers vers = foldl insertTypelibVer vers extraVers


    fun errMsgNamespaceNotLoaded name =
      String.concat ["namespace '", name, "' not loaded"]

    fun errMsgNamespaceVerNotLoaded name version =
      String.concat
        ["namespace '", name, "', version '", version, "' not loaded"]

    fun errMsgNamespaceNotInVers name  =
      String.concat [
        "typelib versions do not include namespace '",
        name,
        "'"
      ]

    fun lookupTypelibDict loaded name version =
      case ListDict.lookup loaded name of
        SOME loadedVersions => (
          case ListDict.lookup loadedVersions version of
            SOME typelib => typelib
          | NONE         =>
              raise Fail (errMsgNamespaceVerNotLoaded name version)
        )
      | NONE                => raise Fail (errMsgNamespaceNotLoaded name)

    fun lookupTypelib repository versions name =
      let
        val version =
          case ListDict.lookup versions name of
            SOME version => version
          | NONE         => raise Fail (errMsgNamespaceNotInVers name)

        val ref {loaded, ...} & _ =
          GIRepositoryRepositoryClass.Obj.unpack repository
      in
        lookupTypelibDict loaded name version
      end

    fun lookupNamespace repository versions name =
      #namespace (! (lookupTypelib repository versions name))


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

        fun create typelib = ListDict.singleton (version, typelib)
        fun update (typelib, versionDict) =
          ListDict.insert I #1 ((version, typelib), versionDict)

        val loaded' = ListDict.insert create update ((name, typelib), loaded)
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

    fun fmtInclude (name, version) = String.concat [name, "-", version]

    fun errMsgInclVerConlift name (version1, path1) (version2, path2) =
      String.concat [
        "different versions of namespace '", name, "' included",
        "; version ", version1, " is included by the path: ",
        String.concatWith ", " (map fmtInclude (ListDict.toList path1)),
        "; version ", version2, " is included by the path: ",
        String.concatWith ", " (map fmtInclude (ListDict.toList path2))
      ]

    fun errMsgInclCycle name path =
      String.concat [
        "namespace '", name, "' includes itself",
        "; it is included by the path: ",
        String.concatWith ", " (map fmtInclude (ListDict.toList path)),
        "in which it has already been included"
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

    fun genTypelib (loaded, path, namespace_, version)
      : Info.repodata * string ListDict.t =
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
         * included namespaces are already loaded at the required version and
         * that, if a namespace is already included, it is the same version
         * that was already included.
         *
         * For each included elemDict, we store
         *   - the version, to check subsequent inclusion of a different version
         *   - the include path, for error reporting and cycle detection
         *
         * In practice, a cycle should not occur because a cycle would prevent
         * all namespaces in the cycle from being loaded due to a missing
         * dependency.  Therefore a missing dependency error would be reported.
         * It is possible to avoid traversal of the include hierarchy by
         * including each element of the `dependencies` field of each included
         * namespace.  The include hierarchy is traversed to provide better
         * error messages, in particular include paths to conflicting versions.
         * This requires cycle detection for the namespace because the include
         * hierarchy is traversed before the translation occurs. *)

        exception Unchanged
        exception Cycle
        exception Included of string * string ListDict.t

        fun checkIncludedVersion (new, {version, path, ...}) =
          if #version new = version
          then raise Unchanged
          else raise Included (version, path)

        fun errorCycle _ = raise Cycle

        fun addInclude path ({name, version}, dict) =
          let
            val path'1 = ListDict.insert I errorCycle ((name, version), path)

            val ref {elemDict, includes, ...} =
              lookupTypelibDict loaded name version

            val dict'1 = addIncludes path'1 (includes, dict)
            val new = {
              version  = version,
              path     = path,
              elemDict = elemDict
            }
          in
            ListDict.insert I checkIncludedVersion ((name, new), dict'1)
              handle
                Unchanged         => dict'1
              | Included included =>
                  raise Fail (errMsgInclVerConlift name included (version, path))
          end
            handle
              Cycle =>
                raise Fail (errMsgInclCycle name path)

        and addIncludes path (includes, dict) =
          foldl (addInclude path) dict includes

        val path'0 = ListDict.singleton (namespace_, version)
        val includeInfo = addIncludes path'0 (includes, ListDict.empty)

        val elemDicts = ListDict.map #elemDict includeInfo

        val dependencies = ListDict.map #version includeInfo
        val versions =
          ListDict.insert I
            (fn _ => raise Fail "typelib dependency contains itself")
            ((namespace_, version), dependencies)

        (* Parse GIR abstract syntax *)
        val {data = repodata, ...} =
          GirTranslator.translate dependencies elemDicts repository
      in
        (repodata, versions)
      end

    fun require repository (namespace_, version, _) =
      let
        val repodata & _ = GIRepositoryRepositoryClass.Obj.unpack repository
        val ref {path, loaded} = repodata

        fun makeTypelib () =
          let
            val (typelib, versions) =
              genTypelib (loaded, path, namespace_, version)
          in
            ((typelib, versions), typelib)
          end

        exception Unchanged of Info.repodata
        fun keepTypelib ((), oldTypelib) = raise (Unchanged oldTypelib)

        fun create () =
          let
            val (typelib, versions) =
              genTypelib (loaded, path, namespace_, version)
          in
            ((typelib, versions), ListDict.singleton (version, typelib))
          end

        fun update ((), versionDict) =
          ListDict.insertMap
            makeTypelib
            keepTypelib
            ((version, ()), versionDict)
      in
        let
          val ((typelib, versions), loaded') =
            ListDict.insertMap create update ((namespace_, ()), loaded)
        in
          repodata := {path = path, loaded = loaded'};
          (typelib, versions)
        end
          handle
            Unchanged (typelib as ref {dependencies, ...}) =>
              let
                val versions =
                  ListDict.insert I
                    (fn _ => raise Fail "typelib dependency contains itself")
                    ((namespace_, version), dependencies)
              in
                (typelib, versions)
              end
      end

    fun getDependencies repository versions namespace_ =
      let
        val ref {dependencies, ...} = lookupTypelib repository versions namespace_
        fun fmt (name, version) = String.concat [name, "-", version]
      in
        case ListDict.toList dependencies of
          []   => NONE
        | deps => SOME (map fmt deps)
      end

    fun getPackages repository versions namespace_ =
      #packages (! (lookupTypelib repository versions namespace_))

    fun getNInfos repository versions namespace_ =
      let
        val {infos, ...} = lookupNamespace repository versions namespace_
      in
        LargeInt.fromInt (Vector.length infos)
      end

    fun getInfo repository versions namespace_ index =
      let
        val {infos, ...} = lookupNamespace repository versions namespace_
      in
        GIRepositoryBaseInfoClass.Obj.pack
          (Vector.sub (infos, LargeInt.toInt index) & ())
      end

    fun getSharedLibrary repository versions namespace_ =
      #sharedLib (lookupNamespace repository versions namespace_)

    fun getVersion repository versions namespace_ =
      #version (lookupNamespace repository versions namespace_)

    fun getCPrefix repository versions namespace_ =
      #cPrefix (lookupNamespace repository versions namespace_)
  end
