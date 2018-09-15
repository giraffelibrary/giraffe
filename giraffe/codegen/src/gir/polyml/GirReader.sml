structure GirReader :>
  GIR_READER
    where type gir_abstract_syntax_tree = GirAbstractSyntaxTree.t =
  struct
    type gir_abstract_syntax_tree = GirAbstractSyntaxTree.t

    fun fileNotFoundMsg file =
      String.concat ["file \"", String.toString file, "\" not found on path"]

    fun fileIsDirMsg file =
      String.concat ["file \"", String.toString file, "\" is a directory"]

    fun fileNotReadableMsg file =
      String.concat ["file \"", String.toString file, "\" is not readable"]

    fun failedToParseXMLFileMsg file =
      String.concat ["failed to parse XML file \"", String.toString file, "\""]

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

    fun readRepo path (namespace, version) =
      let
        val file = String.concat [namespace, "-", version, ".gir"]

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
        val xmlTree =
          XML.parsefile fullFile
            handle
              XML.XML _ => raise Fail (failedToParseXMLFileMsg fullFile)

        (* Parse GIR XML *)
        val girAST = GirXmlParser.parseTree xmlTree
      in
        girAST
      end
  end
