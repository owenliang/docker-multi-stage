package main

import (
	"fmt"
	"github.com/robfig/cron/v3"
)

func main() {
	cron := cron.New()
	cron.AddFunc("* * * * *", func() {
		fmt.Println("running...")
	})
	cron.Run()
}
