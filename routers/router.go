// @APIVersion 1.0.0
// @Title beego Test API
// @Description beego has a very cool tools to autogenerate documents for your API
// @Contact astaxie@gmail.com
// @TermsOfServiceUrl http://beego.me/
// @License Apache 2.0
// @LicenseUrl http://www.apache.org/licenses/LICENSE-2.0.html
package routers

import (
	"github.com/astaxie/beego"
	"github.com/planesticud/matricula_descuentos_crud/controllers"
)

func init() {
	ns := beego.NewNamespace("/v1",

		beego.NSNamespace("/descuento_matricula",
			beego.NSInclude(
				&controllers.DescuentoMatriculaController{},
			),
		),

		beego.NSNamespace("/tipo_descuento_matricula",
			beego.NSInclude(
				&controllers.TipoDescuentoMatriculaController{},
			),
		),
	)
	beego.AddNamespace(ns)
}
