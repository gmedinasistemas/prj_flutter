//@file: pelicula_detalle_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_peliculas/src/models/pelicula_model.dart';

class PeliculaDetalle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Pelicula oModelPelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView( //es como una lista 
        //los slivers son widgets que escuchan los eventos del scroll
        slivers: <Widget>[  //sería como los children
          _createAppbar(oModelPelicula),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height:10.0),
                _posterTitulo(context,oModelPelicula),
                _descripcion(oModelPelicula),
                _descripcion(oModelPelicula),
                _descripcion(oModelPelicula),
              ]
            )
          ),
        ],
      ),
    );

  }// build

  Widget _createAppbar(Pelicula oPelicula){
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          oPelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          //con este me da error de carga la primera vez
          //image: NetworkImage(oPelicula.getBackgroundImg()),
          image: NetworkImage(oPelicula.getPosterImg()),
          placeholder: AssetImage("assets/img/loading.gif"),
          //fadeInDuration: Duration(microseconds: 150),
          fit: BoxFit.cover,
        ),
      ),      
    );
  }// _createAppbar

  Widget _posterTitulo(BuildContext context,Pelicula oPelicula){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
              image: NetworkImage(oPelicula.getPosterImg()),
              height: 150.0,
            ),
          ),
          SizedBox(width: 20.0,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(oPelicula.title, style: Theme.of(context).textTheme.title, overflow: TextOverflow.ellipsis,),
                Text(oPelicula.originalTitle,style: Theme.of(context).textTheme.subhead, overflow: TextOverflow.ellipsis,),
                Row(children: <Widget>[
                  Icon(Icons.star_border),
                  Text(oPelicula.voteAverage.toString(),style: Theme.of(context).textTheme.subhead,)
                ],)
              ],
            ),
          )
      ],)
    );
  }// _posterTitulo

  Widget _descripcion(Pelicula oPelicula){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(oPelicula.overview,textAlign: TextAlign.justify,),
    );
  }

}// PeliculaDetalle