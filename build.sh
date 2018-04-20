#!/bin/bash

executable="lenses-cli"
output="./bin"
input="./cmd/lenses-cli"

# disable CGO
export CGO_ENABLED=0

# [-------Windows-------]
echo "Building windows binaries..."
# windows-x64
export GOOS=windows
export GOARCH=amd64
go build -o $output/$executable-windows-amd64.exe $input
# windows-x86
export GOOS=windows
export GOARCH=386
go build -o $output/$executable-windows-386.exe $input

# [---------Linux--------]
echo "Building linux binaries..."
# linux-x64
export GOOS=linux
export GOARCH=amd64
go build -o $output/$executable-linux-amd64 $input
# linux-x86
export GOOS=linux
export GOARCH=386
go build -o $output/$executable-linux-386 $input
# linux-arm64
export GOOS=linux
export GOARCH=arm64
go build -o $output/$executable-linux-arm64 $input
# linux-arm
export GOOS=linux
export GOARCH=arm
go build -o $output/$executable-linux-arm $input

# [---------OSX--------]
echo "Building darwin (osx) x64 binary..."
#darwin-x64
export GOOS=darwin
export GOARCH=amd64
go build -o $output/$executable-darwin-amd64 $input