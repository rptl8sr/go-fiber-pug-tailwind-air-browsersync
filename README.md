# Auto-Reload App and Browser

#### Go, Fiber, Pug, TailwindCSS, Air, Browser-Sync
Use this template if you need to auto-reload a Go application with a web interface.


## How to use
1. Install Go 1.23 and Node 18
2. Install Air by running `go install github.com/air-verse/air@v1.61.1`
3. Install Go dependencies with `go mod download && go mod tidy && go mod verify`
4. Install Node dependencies with `cd front && npm i`
5. Run the application with `make watch`
6. Make changes in .pug or .go files.
7. See the changes in the browser at `http://localhost:3001`
8. Enjoy it (or not)

If you had the page `http://localhost:3001` open before starting the app, you may need to manually reload it. 
This is necessary to establish the initial websocket connection.