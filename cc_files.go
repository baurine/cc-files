package ccFiles

import "net/http"

func Assets() http.FileSystem {
	return ccAssets
}
