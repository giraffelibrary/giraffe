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

    fun checkVer ((name, ver1), ver2) =
      if ver1 = ver2
      then raise Fail (errMsgVerExists name ver2)
      else raise Fail (errMsgVerConflict name ver1 ver2)

    fun insertTypelibVer ((name, ver), vers) =
      ListDict.inserti checkVer ((name, ver), vers)

    fun extendTypelibVers extraVers vers = foldl insertTypelibVer vers extraVers


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
      case NamespaceVersionMap.lookup loaded (name, version) of
        SOME typelib => typelib
      | NONE         => raise Fail (errMsgNamespaceVerNotLoaded name version)

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
        (ref {path = ListDict.empty, loaded = NamespaceVersionMap.empty} & ())

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
        val path' = ListDict.insert #1 ((directory, ()), path)
      in
        repodata := {path = path', loaded = loaded}
      end

    fun loadTypelib repository typelib _ =
      let
        val repodata & _ = GIRepositoryRepositoryClass.Obj.unpack repository
        val ref {path, loaded} = repodata

        val ref {namespace = {name, version, ...}, ...} = typelib

        val loaded' =
          NamespaceVersionMap.insert #1 (((name, version), typelib), loaded)
      in
        repodata := {path = path, loaded = loaded'};
        name
      end

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

    fun genTypelib (loaded, path, namespace_, version)
      : Info.typelibdata * string ListDict.t =
      let
        (* Read GIR file *)
        val gir as {includes, ...} =
          GirReader.readRepo path (namespace_, version)

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
            val path'1 = ListDict.insert errorCycle ((name, version), path)

            val ref {elemDict, includes, ...} =
              lookupTypelibDict loaded name version

            val dict'1 = addIncludes path'1 (includes, dict)
            val new = {
              version  = version,
              path     = path,
              elemDict = elemDict
            }
          in
            ListDict.insert checkIncludedVersion ((name, new), dict'1)
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
          ListDict.insert
            (fn _ => raise Fail "typelib dependency contains itself")
            ((namespace_, version), dependencies)

        (* Parse GIR abstract syntax *)
        val {data = typelib, ...} =
          GirTranslator.translate dependencies elemDicts gir
      in
        (typelib, versions)
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
            ((true, (typelib, versions)), typelib)
          end

        fun keepTypelib ((), oldTypelib as ref {dependencies, ...}) =
          let
            val versions =
              ListDict.insert
                (fn _ => raise Fail "typelib dependency contains itself")
                ((namespace_, version), dependencies)
          in
            ((false, (oldTypelib, versions)), oldTypelib)
          end
      in
        let
          val ((isNew, (typelib, versions)), loaded') =
            NamespaceVersionMap.insertFoldMap
              makeTypelib
              keepTypelib
              (((namespace_, version), ()), loaded)
        in
          if isNew
          then repodata := {path = path, loaded = loaded'}
          else ();
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
