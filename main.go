package main

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/lib/pq"
	_ "github.com/udistrital/matricula_descuentos_crud/routers"
)

func init() {
	orm.RegisterDataBase("default", "postgres", "postgres://postgres:password@127.0.0.1/CVirtual2?sslmode=disable&search_path=descuentos")
}

func main() {
	if beego.BConfig.RunMode == "dev" {
		beego.BConfig.WebConfig.DirectoryIndex = true
		beego.BConfig.WebConfig.StaticDir["/swagger"] = "swagger"
	}
	beego.Run()
}
