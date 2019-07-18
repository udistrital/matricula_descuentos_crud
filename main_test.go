package main

import (
	"testing"

	"github.com/astaxie/beego"
)

// test something real here
func TestDev(t *testing.T) {
	beego.BConfig.RunMode = "dev"
	test()
}

// test something real here
// aaaa
func TestNonDev(t *testing.T) {
	beego.BConfig.RunMode = "prod"
	test()
}
