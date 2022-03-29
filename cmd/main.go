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

	var fs http.FileSystem = http.Dir("cc/dist")
	err := vfsgen.Generate(fs, vfsgen.Options{
		BuildTags:    buildTag,
		PackageName:  "ccFiles",
		VariableName: "ccAssets",
		Filename:     "cc_assets_vfsdata.go",
	})
	if err != nil {
		log.Fatalln(err)
	}
}
