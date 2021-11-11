package speedscopeFiles

import "net/http"

func Assets() http.FileSystem {
	return speedscopeAssets
}
