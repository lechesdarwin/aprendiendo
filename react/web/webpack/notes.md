# Webpack

# Corriendo ocmando y configuracion de web pack

cuando invocamos el comando <$:webpack > este por defecto busca el archivo webpack.config.js o tambien podemos indicarle otro
archivo diferente con <$:webpack --config ruteOfFileConfigWebPAck> claro que tiene que ser un .js
Podemos combinar con las configuracion de archivo con la linea de comando
podemos pasar un solo archivo ene el que esta el main de nuestra aplicaion y que tenga una sola salida

```js
module.exports={
//entry es un objeto asi que podemos pasarle varios keys estos key se mapean a name
entry:{
    index:"/rute/indexSomeName.jsx",
    home:"/rute/SomeHOme.jsx"
}
output:{
    path:"AquiVa/laCarpetaDeDesarrollo/dist,
    //filename se puede añadir una carpeta y este se hara un merge con path
    //si tenemos un solo entry global solo indicamos el nombre del archivo final
    //[name] se mapeara a los entry correspondinetes
    filename:"path/[name].js"
}
}
```
# los assets loaders son una funcionalidad de webpack que permite trasnspilar sintaxis de js no nativa como lo es jsx

Los loaders van a interoretar los tipos de archivos que ternemos
```js
//aqui va la seccion de los loaders
mudule:{
    // aqui van los loaders un array de loaders
    rules:[
    {
      //test es para indicarle cuando encuentr o archivo que haga math trabajalo
      test:RegexExpresion,
      //use es para que loader se encargara de trabajarlos
      use:[ "name-del-loader"]
    }
    ]
}
```
# plugins
Hasta el momento hemos visto como se injectan deirectamente los css dentro del navegador podemos crrear staticos e injectoarlos directamente en htlm que le corresponde
```js
const path = require('path')
const MiniCSSExtractPlugin = require('mini-css-extract-plugin')
const HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports = {
  entry: {
    home: path.resolve(__dirname,'src/js/index.js'),
  },
  mode: 'development',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'js/[name].js'
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [
          {
            loader: MiniCSSExtractPlugin.loader
          },
          'css-loader'
        ]
      }
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      title: 'Plugins'
    }),
    new MiniCSSExtractPlugin({
      filename: 'css/[name].css'
    })
  ]
}

```
Podemos indicar a webpack que se quede escuchando los cambios en nuestro archivos pero hay una mejor manera de hacer eso 
automatizando las recargas en el navegador tambien nesecitamos de webpack-dev-server ,instalaremos ese paquete
y en vez de <$:webpack >hacemos un <$:webpack-dev-server>
Aun se puede mejorar mucho mas webpack tiene algo como un hot reload 

Debemos añadir a los plugins una instancia nueva de HotModuleReplacementPlugin

+ primero requerimos webpack
    var webpack = require("webpack")
+ iniciamos una nueva instacia de hotReplace
    puglins:[new webpack.HotModuleReplacementPlugin()]

React , Angular y Vuejs ya tienen una integracion por defecro de hotreload
pero si nuestro codigo es artesanal , debemos indicar que funciones , metodos se llamaran para el hot reload
```js
    if(module.hot){
    module.hot.accept("leachivo a escuchar los cambios",callback que se encargara de actuar con el hotreload)
    }
```
Podemos personalizar aun mas nuestro dev server aladiendo
devServer: {
    hot:true
    open:true
    port:42323
}

# para trabajar con js moderno debemos añadir el loader de babel 
{test:/\.js$/,/*para excluir a la carpeta nodemodules y no se combierta en una carga grande*/exclude:/node_modules/,loader:"babel-loader"}
babel tiene un archivo de configuracion que este debe ir al mismo nivel que webpack.config.js es el .babelrc
