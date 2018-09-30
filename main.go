package main

import (
	"github.com/yunnet/blogs/controllers"
	"github.com/yunnet/blogs/controllers/admin"

	"github.com/astaxie/beego"
)

func main() {

	beego.Router("/", &controllers.MainController{})
	beego.Router("/reg", &controllers.RegController{})
	beego.Router("/login", &controllers.LoginController{})
	beego.Router("/:id([0-9]+)", &controllers.MainController{})
	beego.Router("/admin/index", &admin.IndexController{})
	beego.Router("/admin/login", &admin.LoginController{})
	beego.Router("/admin/addblog", &admin.AddBlogController{})
	beego.Router("/admin/editblog/:id([0-9]+)", &admin.EditBlogController{})
	beego.Router("/admin/delblog/:id([0-9]+)", &admin.DelBlogController{})
	beego.Run()
}
