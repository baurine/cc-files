package main

import (
	"log"
	"net/http"
	"os"

	"github.com/shurcooL/vfsgen"
)

func main() {
	buildTag := ""
	if len(os.Args) > 1 {
		buildTag = os.Args[1]
	}

	var fs http.FileSystem = http.Dir("speedscope/dist/release")
	err := vfsgen.Generate(fs, vfsgen.Options{
		BuildTags:    buildTag,
		PackageName:  "ssuiserver",
		VariableName: "SpeedscopeAssets",
	})
	if err != nil {
		log.Fatalln(err)
	}
}
