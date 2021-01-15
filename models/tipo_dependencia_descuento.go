package models

import (
	"errors"
	"fmt"
	"reflect"
	"strings"
	"time"

	"github.com/astaxie/beego/orm"
	"github.com/udistrital/utils_oas/time_bogota"
)

type TipoDependenciaDescuento struct {
	Id                  int            `orm:"column(id);pk;auto"`
	TipoDescuentoId     *TipoDescuento `orm:"column(tipo_descuento_id);rel(fk)"`
	TipoDependenciaId   int            `orm:"column(tipo_dependencia_id)"`
	PorcentajeDescuento float64        `orm:"column(porcentaje_descuento)"`
	Vigencia            string         `orm:"column(vigencia);null"`
	FechaInicio         time.Time      `orm:"column(fecha_inicio);type(timestamp without time zone)"`
	FechaFin            time.Time      `orm:"column(fecha_fin);type(timestamp without time zone);null"`
	Activo              bool           `orm:"column(activo)"`
	FechaCreacion       string         `orm:"column(fecha_creacion);type(timestamp without time zone)"`
	FechaModificacion   string         `orm:"column(fecha_modificacion);type(timestamp without time zone)"`
}

func (t *TipoDependenciaDescuento) TableName() string {
	return "tipo_dependencia_descuento"
}

func init() {
	orm.RegisterModel(new(TipoDependenciaDescuento))
}

// AddTipoDependenciaDescuento insert a new TipoDependenciaDescuento into database and returns
// last inserted Id on success.
func AddTipoDependenciaDescuento(m *TipoDependenciaDescuento) (id int64, err error) {
	m.FechaCreacion = time_bogota.TiempoBogotaFormato()
	m.FechaModificacion = time_bogota.TiempoBogotaFormato()
	o := orm.NewOrm()
	id, err = o.Insert(m)
	return
}

// GetTipoDependenciaDescuentoById retrieves TipoDependenciaDescuento by Id. Returns error if
// Id doesn't exist
func GetTipoDependenciaDescuentoById(id int) (v *TipoDependenciaDescuento, err error) {
	o := orm.NewOrm()
	v = &TipoDependenciaDescuento{Id: id}
	if err = o.Read(v); err == nil {
		return v, nil
	}
	return nil, err
}

// GetAllTipoDependenciaDescuento retrieves all TipoDependenciaDescuento matches certain condition. Returns empty list if
// no records exist
func GetAllTipoDependenciaDescuento(query map[string]string, fields []string, sortby []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(TipoDependenciaDescuento))
	// query k=v
	for k, v := range query {
		// rewrite dot-notation to Object__Attribute
		k = strings.Replace(k, ".", "__", -1)
		if strings.Contains(k, "isnull") {
			qs = qs.Filter(k, (v == "true" || v == "1"))
		} else {
			qs = qs.Filter(k, v)
		}
	}
	// order by:
	var sortFields []string
	if len(sortby) != 0 {
		if len(sortby) == len(order) {
			// 1) for each sort field, there is an associated order
			for i, v := range sortby {
				orderby := ""
				if order[i] == "desc" {
					orderby = "-" + v
				} else if order[i] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
			qs = qs.OrderBy(sortFields...)
		} else if len(sortby) != len(order) && len(order) == 1 {
			// 2) there is exactly one order, all the sorted fields will be sorted by this order
			for _, v := range sortby {
				orderby := ""
				if order[0] == "desc" {
					orderby = "-" + v
				} else if order[0] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
		} else if len(sortby) != len(order) && len(order) != 1 {
			return nil, errors.New("Error: 'sortby', 'order' sizes mismatch or 'order' size is not 1")
		}
	} else {
		if len(order) != 0 {
			return nil, errors.New("Error: unused 'order' fields")
		}
	}

	var l []TipoDependenciaDescuento
	qs = qs.OrderBy(sortFields...)
	if _, err = qs.Limit(limit, offset).All(&l, fields...); err == nil {
		if len(fields) == 0 {
			for _, v := range l {
				ml = append(ml, v)
			}
		} else {
			// trim unused fields
			for _, v := range l {
				m := make(map[string]interface{})
				val := reflect.ValueOf(v)
				for _, fname := range fields {
					m[fname] = val.FieldByName(fname).Interface()
				}
				ml = append(ml, m)
			}
		}
		return ml, nil
	}
	return nil, err
}

// UpdateTipoDependenciaDescuento updates TipoDependenciaDescuento by Id and returns error if
// the record to be updated doesn't exist
func UpdateTipoDependenciaDescuentoById(m *TipoDependenciaDescuento) (err error) {
	o := orm.NewOrm()
	v := TipoDependenciaDescuento{Id: m.Id}
	m.FechaModificacion = time_bogota.TiempoBogotaFormato()
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Update(m, "TipoDescuentoId", "TipoDependenciaId", "PorcentajeDescuento", "Vigencia", "FechaInicio", "FechaFin", "Activo", "FechaModificacion"); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}

// DeleteTipoDependenciaDescuento deletes TipoDependenciaDescuento by Id and returns error if
// the record to be deleted doesn't exist
func DeleteTipoDependenciaDescuento(id int) (err error) {
	o := orm.NewOrm()
	v := TipoDependenciaDescuento{Id: id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Delete(&TipoDependenciaDescuento{Id: id}); err == nil {
			fmt.Println("Number of records deleted in database:", num)
		}
	}
	return
}
