# Speedscope Files

## How to use

```go
import (
	speedscopeFiles "github.com/baurine/speedscope-files"
)

router := gin.Default()
endpoint.StaticFS("/speedscope", speedscopeFiles.Assets())
```

## How to gen assets

```
$ make all
```
