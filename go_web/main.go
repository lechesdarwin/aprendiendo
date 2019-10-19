package main

//my mux
import (
	"html/template"
	"net/http"
	"database/sql"
	"github.com/gorilla/mux"
)

type myHandle func(http.ResponseWriter, *http.Request)
type myMux struct {
	route map[string]myHandle
}
func (this *myMux) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	fn := this.route[r.URL.Path]
	fn(w, r)
}
func (this *myMux) add(route string, fn myHandle) {
	this.route[route] = fn
}
func (this *myMux) addHandler(route string, fn http.Handler) {
	this.route[route] = fn.ServeHTTP
}

func main() {
	//mux := mux.NewRouter()
	//va := template.Must()
	//va.Execute
	//mux.HandleFunc("de", func(h) {
	})
	http.ListenAndServe("localhost:3000", mux)
}
