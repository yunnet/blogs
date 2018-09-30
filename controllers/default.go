package controllers

import (
	"github.com/astaxie/beego"
	"github.com/yunnet/blogs/models"
	"github.com/astaxie/session"
	"strconv"
	"fmt"
)

type MainController struct {
	beego.Controller
}

//然后在init函数中初始化
func init() {
	globalSessions, _ = session.NewManager("memory", "gosessionid", 3600)
	go globalSessions.GC()
}

var welcome = `
# Golang 技术博客

`

func (this *MainController) Get() {
	this.Ctx.Request.ParseForm()
	//id, _ := strconv.Atoi(this.Ctx.Request.Form.Get(":id"))
	id, _ := strconv.Atoi(this.Ctx.Input.Param(":id"))
	if id == 0 {
		id = 1
	}

	fmt.Println("id = " + strconv.Itoa(id))
	blogInfo := models.GetBlogInfoById(id)
	this.Data["BlogInfo"] = blogInfo
	bloglist := models.GetAllBlogList()
	pm := make([]map[string]interface{}, len(bloglist))
	for k, pk := range bloglist {
		m := make(map[string]interface{}, 2)
		m["Blog"] = pk
		if this.Ctx.Request.Form.Get(":title") == pk.Title {
			m["Cru"] = true
		} else {
			m["Cru"] = false
		}
		pm[k] = m
	}
	this.Data["BlogList"] = pm
	if blogInfo.Id == 0 {
		this.Data["Content"] = welcome
	} else {
		this.Data["Content"] = blogInfo.Content
	}

	this.Data["Username"] = ""
	sess := globalSessions.SessionStart(this.Ctx.ResponseWriter, this.Ctx.Request)
	username := sess.Get("uname")
	if username != nil {
		this.Data["Username"] = username
	}

	this.TplName = "index.tpl"
}
