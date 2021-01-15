package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type AlterTableSolicitudDescuento_20210115_105332 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &AlterTableSolicitudDescuento_20210115_105332{}
	m.Created = "20210115_105332"

	migration.Register("AlterTableSolicitudDescuento_20210115_105332", m)
}

// Run the migrations
func (m *AlterTableSolicitudDescuento_20210115_105332) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	file, err := ioutil.ReadFile("../scripts/20210115_105332_alter_table_solicitud_descuento.up.sql")

	if err != nil {
		// handle error
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";\n")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
		// do whatever you need with result and error
	}
}

// Reverse the migrations
func (m *AlterTableSolicitudDescuento_20210115_105332) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	file, err := ioutil.ReadFile("../scripts/20210115_105332_alter_table_solicitud_descuento.down.sql")

	if err != nil {
		// handle error
		fmt.Println(err)
	}

	requests := strings.Split(string(file), ";\n")

	for _, request := range requests {
		fmt.Println(request)
		m.SQL(request)
		// do whatever you need with result and error
	}
}
