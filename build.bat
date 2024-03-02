set GOOS=js
set GOARCH=wasm
go build -o ./wasm/operation.wasm ./go/operation.go