package main

import (
	"log"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/template/pug/v2"
)

const (
	assetsDir    = "./public/assets"
	templatesDir = "./templates"
	appPort      = ":3000"
)

func main() {
	engine := pug.New(templatesDir, ".pug")
	app := fiber.New(fiber.Config{Views: engine})

	app.Static("/assets", assetsDir)

	app.Get("/", func(c *fiber.Ctx) error {
		return c.Render("index", fiber.Map{
			"title": "Hello world",
		})
	})

	log.Fatal(app.Listen(appPort))
}
