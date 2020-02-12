var webpack = require("webpack");

module.exports = {
    entry:"el apth del archicvo dew entrada",
    output:{
        path:"rutadondeira la salida si no existe lo crea",
        filename:"salidadela rchivo empaquetado",
        sourceMapFilename:"elnombredelasalidadelarchivopdemappodemosmaperarlosisonvarios"
    },
    //agregamos esto por que nos ayudara mas adelante a depurar nuestra aplicacion con los archivo originales de la app
    devtool: '#source-map",
    module: {
        //aqui debe ir los modulos es como un puente de como cuando webpack esta tratando los archivos
        rules:[
            {
                test:"/\.js$/",
                exclude:/(node_modules)/,
                loader:["babel-loader"],
                query:{
                    presets:["env","stage-0","react"]
                },
                //agragando soporte para css
            },
            {
                test: /\.css$/,
                use: ['style-loader','css-loader',{
                    loader: 'postcss-loader',options:{
                        plugins:()=> [require("autoprefixer")]
                    }
                }]
            }
        ]
    },
    //optimizando nuestro paquete
    //podemos instalar webpack como depedencia de desarrollo asi ya no se creara menos codigo
    //podemos tambien eliminar espacios en blanco y cambiar las varibles largas por solo lettras con el siguiene ccodigo pero debemos requerir webpack primeramente
    plugins: [
        new webpack.optimize.UglifyJsPlugin({
            sourceMap: true, //para que cre4e los mapas para ayudarnos con la depuracion
            warnings: false,
            mangle: true //para remplazar los nombre s de varibles largos por letras
        })
    ]
}
