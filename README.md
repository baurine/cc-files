# CC Files

## How to use

```go
import (
	ccFiles "github.com/baurine/cc-files"
)

router := gin.Default()
endpoint.StaticFS("/clinic", ccFiles.Assets())
```

## How to gen assets

```
$ make all
```
