<!DOCTYPE html>
<html>
<head>
<title>GSPSAT 2.0- Seguimiento de Embarcaciones </title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="<?php echo base_url(); ?>css/style.css" rel="stylesheet" media="screen">

<link href="<?php echo base_url(); ?>css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="<?php echo base_url(); ?>css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<link href="<?php echo base_url(); ?>css/propio.css" rel="stylesheet" media="screen">
<link href="<?php echo base_url(); ?>css/DT_bootstrap.css" rel="stylesheet" media="screen">

    <style>

    </style>

</head>

  <body >
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container-fluid">
                <a class="brand" href="<?php echo base_url(); ?>index.php/otros">GSPSAT 2.0 </a>
                <ul class="nav">
                  <li>
  <a href="javascript:zoominicio()">
                    <i class="icon-white icon-home"></i>

                  </a>
                  </li>

                    <li>
                        <a href="./">
                            <i class="icon-globe icon-white"></i> Administracion
                        </a>
                    </li>

                                        <li>
                        <a href="./">
                            <i class="icon-off icon-white"></i> Salir del sistema
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container-fluid" ng-controller="AlertsCtrl">
        <div class="row-fluid">
            <div class="span9">
                <div id="map"></div>


            </div>
            <div class="span3" id="divbarcos">
                <h4><a href="javascript:regresar()">Embarcaciones</a></h4>   
                <form class="form-horizontal" id="form_tracking" name="form_tracking">

                            <div class="span11" id="contenidoeps">

</div>

                            <div class="span12" id="divtracking">


</div>

<h4>Tracking Nave</h4>
            <ul id="myTabx" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">Por #</a></li>
              <li><a href="#profile" data-toggle="tab">Por Fecha</a></li>
              <li><a href="#nrodl" data-toggle="tab">Por # (DL)</a></li>
                            <li><a href="#fechadl" data-toggle="tab">Por Fecha (DL) </a></li>
            </ul>
            <div id="myTabContentx" class="tab-content">
              <div class="tab-pane fade in active" id="home">
                <fieldset>

<!-- Form Name -->


<!-- Text input-->
<label> Por # de posicionesx </label>
    <input id="nrotx" name="nrotx" type="text" placeholder="Ingrese #" class="input-small" value="10">

<!-- Button -->

</fieldset>
<input type="hidden" id="nrobarcos" name="nrobarcos">
    <input type="button" id="singlebutton"   class="btn btn-primary" value="Tracking ">
              </div>

                 <div class="tab-pane" id="profile">
  Del <div id="datetimepicker2" class="input-append"> 
  <input data-format="yyyy/MM/dd HH:mm:ss PP" type="text" id="calendar1" name="calendar1"></input>
    <span class="add-on">
      <i data-time-icon="icon-time" data-date-icon="icon-calendar">
      </i>
    </span>
  </div> <br>
  Al&nbsp; &nbsp; <div id="datetimepicker3" class="input-append"> 
    <input data-format="yyyy/MM/dd HH:mm:ss PP" type="text" id="calendar2" name="calendar2"></input>
    <span class="add-on">
      <i data-time-icon="icon-time" data-date-icon="icon-calendar">
      </i>
    </span>
  </div> <br>
    <input type="button" id="singlebutton1"   class="btn btn-primary" value="Tracking ">
</div>


              <div class="tab-pane " id="nrodl">
                <fieldset>

<!-- Form Name -->


<!-- Text input-->
<label> Por # de posiciones DL </label>
    <input id="nrotxdl" name="nrotxdl" type="text" placeholder="Ingrese #" class="input-small" value="10">

<!-- Button -->

</fieldset>
<input type="hidden" id="nrobarcosdl" name="nrobarcosdl">
    <input type="button" id="singlebuttond2"   class="btn btn-primary" value="Tracking ">
              </div>

                 <div class="tab-pane" id="fechadl">
  Del <div id="datetimepicker4" class="input-append"> 
  <input data-format="yyyy/MM/dd HH:mm:ss PP" type="text" id="calendar1dl" name="calendar1dl"></input>
    <span class="add-on">
      <i data-time-icon="icon-time" data-date-icon="icon-calendar">
      </i>
    </span>
  </div> <br>
  Al&nbsp; &nbsp; <div id="datetimepicker5" class="input-append"> 
    <input data-format="yyyy/MM/dd HH:mm:ss PP" type="text" id="calendar2dl" name="calendar2dl"></input>
    <span class="add-on">
      <i data-time-icon="icon-time" data-date-icon="icon-calendar">
      </i>
    </span>
  </div> <br>
    <input type="button" id="singlebutton3"   class="btn btn-primary" value="Tracking ">
</div>


            </div>
</form>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span9"> <!-- Inicio div abajo!-->


        <div class="row-fluid fondonegro">

        <ul id="controlToggle" class="inline">
            <li>
                            <ul  class="inline"> <li>    <label for="noneToggle">navigate</label> </li><li><input type="radio" name="type" value="none" id="noneToggle"
                       onclick="toggleControl(this);" checked="checked" /> </li>

            </li>
            <li>
              <ul  class="inline">     <li><label for="lineToggle">Calcular Distancia</label> <li>   <input type="radio" name="type" value="line" id="lineToggle" onclick="toggleControl(this);" /> </li></li>
               
            </li>
            <li>
             <ul  class="inline">     <li><label for="polygonToggle">Calcular area</label> </li>

                <li><input type="radio" name="type" value="polygon" id="polygonToggle" onclick="toggleControl(this);" /> 
                
                    <input type="hidden" value="" size="3" name="maxSegments" id="maxSegments" onchange="changeMaxSegments(this);" /></li>
            
            </li>
             

        </ul>
              </div>


            <div class=" row-fluid">
            <div class="span12 fondo" id="barcos">



      <table class="table" id="ra">
              <thead>
                <tr>
                  <th>EP</th>
                  <th>Fecha</th>
                  <th>Latitud</th>
                <th>Longitud</th>
                <th>Vel</th>
                  <th>Cur</th>
                  <th>Five</th>
                  <th>Puerto</th>

                </tr>
              </thead>
              <tbody id="ctabla">
 
              </tbody>
            </table> 
            <div id="content"></div>


            </div><!--/span-->
                <div id="page-selection"></div>


          </div><!--/row-->

<div class="row-fluid">
                        <div class="span12 fondo" id="idsectores">

                            <div class="bs-docs-example" id="divtabs">


            <ul id="myTab" class=" titulotabs nav nav-tabs">
            </ul>

            <div id="myTabContent" class="tab-content">


          </div>
 </div>

        
            </div><!--/span-->

</div>
            </div> <!-- Fin de Div abajo !-->
                    <div class="span3">
                                 <ul id="myTabx" class="nav nav-tabs">
              <li class="active"><a href="#divpuertos" data-toggle="tab">Puertos</a></li>
              <li><a href="#divpuntos" data-toggle="tab">Puntos Referencia</a></li>

            </ul>
            <div id="myTabContentx" class="tab-content">
              <div class="tab-pane fade in active" id="divpuertos">
DIV PUERTOS

              </div>
                            <div class="tab-pane " id="divpuntos">
DIV PUNTOS

              </div>
            </div>









            </div>
        </div>

    </div>



<script src="<?php echo base_url(); ?>js/jquery.js"></script>
<script src="<?php echo base_url(); ?>js/jquery.dataTables.js"></script>
<script src="<?php echo base_url(); ?>js/jquery.validate.js"></script>

<script src="<?php echo base_url(); ?>js/DT_bootstrap.js"></script>
<script src="http://openlayers.org/api/OpenLayers.js"></script>
  <script src="<?php echo base_url(); ?>js/OpenLayers/Control/DynamicMeasure.js"></script>
<script src="<?php echo base_url(); ?>js/jquery.backstretch.min.js"></script>

    <script type="text/javascript">
            $(function () {
                $('#datetimepicker3').datetimepicker();
                          $('#datetimepicker4').datetimepicker();
                                    $('#datetimepicker5').datetimepicker();
            });
        </script>

    <script type="text/javascript">
        var map, layer;
        var lineLayer;
        var lon = -79.1198516666667;
        var lat = -12.0502566666667;
        var zoom = 2;
        var latmax=0;
        var latmin=0;
        var lonmax=0;
        var lonmin=0;
         var vectorLayer,vectorpuntos;
       // var points = [];
       //var points = [];
       var feat;
var feats = [];
var measureControls;

        //Variable para determinar el tamaño de los popup
 AutoSizeAnchoredMinSize = OpenLayers.Class(OpenLayers.Popup.Anchored, {
            'autoSize': true, 
            'minSize': new OpenLayers.Size(300,200)
        });


     function init(){
//alert('holas');
        OpenLayers.ProxyHost="/proxy/?url=";

        mapa = new OpenLayers.Map('map', {
          projection:new OpenLayers.Projection("EPSG:4326"),
          maxExtent: new OpenLayers.Bounds(-91,-19,-69, -2),
          units:'nmi',
          controls:[
              new OpenLayers.Control.PanZoomBar(),
              new OpenLayers. Control. Navigation(),
              new OpenLayers.Control.LayerSwitcher({'ascending':false})
          ]
        });


            markers= new OpenLayers.Layer.Markers( "Barcos");
            markert= new OpenLayers.Layer.Markers( "Tracking" );


            layer = new OpenLayers.Layer.WMS( "OpenLayers WMS","http://vmap0.tiles.osgeo.org/wms/vmap0",  {layers: 'basic',srs:'EPSG:4326'}, {'displayInLayerSwitcher':true} );

            // map = new OpenLayers.Map( 'map');
            //layer = new OpenLayers.Layer.OSM( "Simple OSM Map");
            //map.OpenLayers.addLayer(routeLayer);

            nlayer  = new OpenLayers.Layer.WMS( "5 y 7 xmil", 
                               "http://www.geosupply.com.pe/cgi-bin/mapserv?map=/var/www/html/geosupply.com.pe/sisesatvp/mserver/sisesatmap_v2.map&sld=http://www.gsp.pe/sld/sisesat_v2.sld", {layers: 'fivemil_lin', isBaseLayer: "false", 
            transparent: "true"}, {'displayInLayerSwitcher':true});
            


             dlayer  = new OpenLayers.Layer.WMS( "10 Mixl", 
                                 "http://www.geosupply.com.pe/cgi-bin/mapserv?map=/var/www/html/geosupply.com.pe/sisesatvp/mserver/sisesatmap_v2.map&sld=http://www.gsp.pe/sld/sisesat_v2.sld", {layers: 'tenmil_linproduce', isBaseLayer: "false",transparent: "true"}, {'displayInLayerSwitcher':true});
            /*
            layerx = new OpenLayers.Layer.WMS( "SSS","http://nowcoast.noaa.gov/wms/com.esri.wms.Esrimap/obs?service=wms", {layers: 'OBS_MET_PRES,RAS_RIDGE_NEXRAD'}, {'displayInLayerSwitcher':true} );
            layerz = new OpenLayers.Layer.WMS( "SSS","http://cwcgom.aoml.noaa.gov/erddap/wms/miamiSST/request?service=WMS", {layers: 'Nations'}, {'displayInLayerSwitcher':true} );
            */
var puertos_style = {
    pointRadius: 5,
    fillColor: "#ffcc66",
    strokeColor : '#126182',
    strokeWidth: "0.4",
    strokeOpacity : "0.6",
    fillOpacity : "0.2",
    label : "${NOMBRE}",
    labelAlign: "lt",
    fontColor: "#9c51c9",
    fontSize: "10px",
    fontFamily: "Verdana"
    };
    var zreserva_style = {
    pointRadius: 5,
    fillColor: "#968c78",
    strokeColor : '#544e42',
    strokeWidth: "0.4",
    strokeOpacity : "0.6",
    fillOpacity : "0.2",
    label : "${nombre}",
    labelAlign: "lt",
    fontColor: "#8a8478",
    fontSize: "10px",
    fontFamily: "Verdana"
    };
var costa_style = {
    pointRadius: 5,
    fillColor: "#e1e88e",
    strokeColor : '#717541',
    strokeWidth: "0.4",
    strokeOpacity : "0.6",
    fillOpacity : "0.2",

    };
var restoperu_style = {
    pointRadius: 5,
    fillColor: "#e37962",
    strokeColor : '#9e503f',
    strokeWidth: "0.4",
    strokeOpacity : "0.6",
    fillOpacity : "0.2",

    };

var batpuntos_style = {
      label : "${ZCOORD}",
    labelAlign: "lt",
    fontColor: "#94908b",
    fontSize: "10px",
    fontFamily: "Verdana"
}
var mar_style = {
    fillColor : '#2f84d4',
    strokeColor : '#126182',
    strokeWidth: "0.4",
    strokeOpacity : "0.6",
    fillOpacity : "0.5"
    };

var fivemil_style = {
    
      fillColor : '#f20c1a',
      strokeColor : '#f20c1a',
      strokeWidth: "0.6",
      strokeOpacity : "0.6",
      fillOpacity : "0.2"
  };


    var GeoJSONLayer = new OpenLayers.Layer.Vector("MapaFondo", {
    isBaseLayer: true,
    strategies: [new OpenLayers.Strategy.Fixed()],
    protocol: new OpenLayers.Protocol.HTTP({
        url: "../level_pol_nst.json",
        format: new OpenLayers.Format.GeoJSON()
        }),
    styleMap :new OpenLayers.StyleMap(mar_style)
    });
    mapa.addLayers([GeoJSONLayer]);

var costa_js = new OpenLayers.Layer.Vector("costa", {
            strategies: [new OpenLayers.Strategy.Fixed()],
            protocol: new OpenLayers.Protocol.HTTP({
                      url: '../coast_pol.json',
                format: new OpenLayers.Format.GeoJSON()
            }),
            styleMap :new OpenLayers.StyleMap(costa_style)
,
            displayInLayerSwitcher:false,
        });

var restoperu_js = new OpenLayers.Layer.Vector("Resto Peru", {
            strategies: [new OpenLayers.Strategy.Fixed()],
            protocol: new OpenLayers.Protocol.HTTP({
                      url: '../restoperu_pol.json',
                format: new OpenLayers.Format.GeoJSON()
            }),
            styleMap :new OpenLayers.StyleMap(restoperu_style)
,
            displayInLayerSwitcher:false,
        });
var puertos_js = new OpenLayers.Layer.Vector("Puertos", {
            strategies: [new OpenLayers.Strategy.Fixed()],
            protocol: new OpenLayers.Protocol.HTTP({
                      url: '../puertofinal.json',
                format: new OpenLayers.Format.GeoJSON()
            }),
            styleMap :new OpenLayers.StyleMap(puertos_style)
,
            displayInLayerSwitcher:false,
        });
var zreserva_js = new OpenLayers.Layer.Vector("Zona Reservas", {
            strategies: [new OpenLayers.Strategy.Fixed()],
            protocol: new OpenLayers.Protocol.HTTP({
                      url: '../zonareserva.json',
                format: new OpenLayers.Format.GeoJSON()
            }),
            styleMap :new OpenLayers.StyleMap(zreserva_style)
,
            displayInLayerSwitcher:false,
        });

var fivemil_js = new OpenLayers.Layer.Vector("5 millas", {
            strategies: [new OpenLayers.Strategy.Fixed()],
            protocol: new OpenLayers.Protocol.HTTP({
                      url: '../fivemil_lin.json',
                format: new OpenLayers.Format.GeoJSON()
            }),
            displayInLayerSwitcher:false,
    styleMap :new OpenLayers.StyleMap(fivemil_style)
        });

var tenmil_js = new OpenLayers.Layer.Vector("10 millas", {
            strategies: [new OpenLayers.Strategy.Fixed()],
            protocol: new OpenLayers.Protocol.HTTP({
                      url: '../10millas.json',
                format: new OpenLayers.Format.GeoJSON()
            }),
            displayInLayerSwitcher:false,
    styleMap :new OpenLayers.StyleMap(fivemil_style)
        });

var costalinea = new OpenLayers.Layer.Vector("Linea Costax", {
            strategies: [new OpenLayers.Strategy.Fixed()],
            protocol: new OpenLayers.Protocol.HTTP({
                      url: '../coast_lin.json',
                format: new OpenLayers.Format.GeoJSON()
            }),
            displayInLayerSwitcher:false,

        });

var batlinea = new OpenLayers.Layer.Vector("batlinea", {
            strategies: [new OpenLayers.Strategy.Fixed()],
            protocol: new OpenLayers.Protocol.HTTP({
                      url: '../batimet_lin.json',
                format: new OpenLayers.Format.GeoJSON()
            })
        });
var batpuntos = new OpenLayers.Layer.Vector("batimetria", {
            strategies: [new OpenLayers.Strategy.Fixed()],
            protocol: new OpenLayers.Protocol.HTTP({
                      url: '../soundg_point_n3.json',
                format: new OpenLayers.Format.GeoJSON()
            }),
                styleMap :new OpenLayers.StyleMap(batpuntos_style)
        });

                lineLayer = new OpenLayers.Layer.Vector("Linea Tracking",{'displayInLayerSwitcher':false}); 

                var renderer = OpenLayers.Util.getParameters(window.location.href).renderer;
                renderer = (renderer) ? [renderer] : OpenLayers.Layer.Vector.prototype.renderers;


                 vectorLayer = new OpenLayers.Layer.Vector("Puntos Tracking", {
                                styleMap: new OpenLayers.StyleMap({'default':{
                                    strokeColor: "#00FF00",
                                    strokeOpacity: 1,
                                    strokeWidth: 1,
                                    fillColor: "#FF5500",
                                    fillOpacity: 0.2,
                                    pointRadius: 3,
                                    pointerEvents: "visiblePainted",
                                    // label with \n linebreaks
                                //    label : "name: ${name}\n\nage: ${age}",
                                       label : "${name}",  
                                    fontColor: "${favColor}",
                                    fontSize: "10px",
                                    fontFamily: "Courier New",
                                    //fontWeight: "bold",
                                    labelAlign: "${align}",
                                    labelXOffset: "${xOffset}",
                                    labelYOffset: "${yOffset}",
                                    labelOutlineColor: "white",
                                    labelOutlineWidth: 3
                                }}),
                                renderers: renderer,
                                displayInLayerSwitcher:false
                            });
                 vectorPuntos = new OpenLayers.Layer.Vector("Puntos Barcos", {
                                styleMap: new OpenLayers.StyleMap({'default':{
                                    strokeColor: "#00FF00",
                                    strokeOpacity: 1,
                                    strokeWidth: 1,
                                    fillColor: "#FF5500",
                                    fillOpacity: 0.2,
                                    pointRadius: 3,
                                    pointerEvents: "visiblePainted",
                                    // label with \n linebreaks
                                //    label : "name: ${name}\n\nage: ${age}",
                                       label : "${name}",  
                                    fontColor: "${favColor}",
                                    fontSize: "10px",
                                    fontFamily: "Courier New",
                                    //fontWeight: "bold",
                                    labelAlign: "${align}",
                                    labelXOffset: "${xOffset}",
                                    labelYOffset: "${yOffset}",
                                    labelOutlineColor: "white",
                                    labelOutlineWidth: 3
                                }}),
                                renderers: renderer,
                                displayInLayerSwitcher:false
                            });

                measureControls = {
                        //line: new OpenLayers.Control.DynamicMeasure(OpenLayers.Handler.Path),
                        line: new OpenLayers.Control.DynamicMeasure( OpenLayers.Handler.Path,  {persist: true, geodesic: true, displaySystem: 'english'}),
                        polygon: new OpenLayers.Control.DynamicMeasure(OpenLayers.Handler.Polygon,  {persist: true, geodesic: true, displaySystem: 'english'})
                    };
                    mapa.addControls([
                        measureControls.line,
                        measureControls.polygon,
                        new OpenLayers.Control.LayerSwitcher()
                    ]);
                                mapa.addControl(new OpenLayers.Control.MousePosition());

                //mapa.addControl(new OpenLayers.Control.ScaleLine({topOutUnits: 'nmi', topInUnits: 'm'}) ); 
            //    mapa.addLayers([layer,dlayer,nlayer,lineLayer,vectorLayer,vectorPuntos,markers,markert,vectorlyr]);
                                         batpuntos.setVisibility(false);

                             batlinea.setVisibility(false);
                            dlayer.setVisibility(false);
      nlayer.setVisibility(false);
 batpuntos.setVisibility(false);
  zreserva_js.setVisibility(false);
//                                mapa.addLayers([layer,dlayer,vectorlyr,batpuntos,costalinea,batlinea,nlayer,lineLayer,vectorLayer,vectorPuntos,markers,markert]);

mapa.addLayers([costa_js,zreserva_js,restoperu_js,batpuntos,batlinea,tenmil_js,fivemil_js,puertos_js,lineLayer,vectorLayer,vectorPuntos,markers,markert]);


mapa.events.register('zoomend', this, function (event) {
        var zLevel = mapa.getZoom();   

       // alert(zLevel);  
               if( zLevel >= 8 )
        {
                             batlinea.setVisibility(true);
                           //   zreserva_js.setVisibility(true);
        }
                if( zLevel < 8 )
        {
                             batlinea.setVisibility(false);
                          //    zreserva_js.setVisibility(false);
        }

 
               if( zLevel >= 5 )
        {
                           //  batlinea.setVisibility(true);
                              zreserva_js.setVisibility(true);
        }
                if( zLevel < 5 )
        {
                           //  batlinea.setVisibility(false);
                              zreserva_js.setVisibility(false);
        }


/*
        if( zLevel == 13 || zLevel == 14 ||   zLevel == 15  )
        {
            layer2.setVisibility(true);
        }
        if( zLevel == 16 || zLevel == 17 || zLevel == 18)
        {
            layer2.setVisibility(false);
            layer3.setVisibility(true);
        }
*/
    });

                mapa.setCenter(new OpenLayers.LonLat(lon, lat), zoom);

        } // Fin de Funcion Init


 /** FUnciones distancia */
// allow testing of specific renderers via "?renderer=Canvas", etc
/*    var renderer = OpenLayers.Util.getParameters(window.location.href).renderer;
    if (renderer) {
        OpenLayers.Layer.Vector.prototype.renderers = [renderer];
    } */

// The map
    /*var map = new OpenLayers.Map({
        div: 'map',
        layers: [
            new OpenLayers.Layer.WMS('OpenLayers WMS',
            'http://vmap0.tiles.osgeo.org/wms/vmap0?', {layers: 'basic'})
        ]
    });
    map.setCenter(new OpenLayers.LonLat(0, 0), 3);
*/
// The measure controls

// functions used in the form to set the measure control.
    function toggleControl(element) {
        for (var key in measureControls) {
            if (element.value === key && element.checked) {
                measureControls[key].activate();
            } else {
                measureControls[key].deactivate();
            }
        }
    }
    function toggleShowSegments(element) {
        for (var key in measureControls) {
            var control = measureControls[key];
            if (element.checked) {
                // * set `layerSegmentsOptions` at control creation as a object
                //   or not defined to display length of segments.
                delete control.layerSegmentsOptions;
            } else {
                // * set `layerSegmentsOptions` at control creation to null to
                //   not display.
                control.layerSegmentsOptions = null;
            }
            if (control.active) {
                control.deactivate();
                control.activate();
            }
        }
    }
    function toggleShowPerimeter(element) {
        var control = measureControls.polygon;
        if (element.checked) {
            // * set `layerLengthOptions` as a object or undefined to display
            //   length of perimeter.
            delete control.layerLengthOptions;
        } else {
            // * set `layerLengthOptions` to null to not display.
            control.layerLengthOptions = null;
        }
        if (control.active) {
            control.deactivate();
            control.activate();
        }
    }
    function toggleShowHeading(element) {
        for (var key in measureControls) {
            var control = measureControls[key];
            if (element.checked) {
                // * set `layerHeadingOptions` as a object to display heading.
                control.layerHeadingOptions = {};
            } else {
                // * set `layerHeadingOptions` to null to not display.
                control.layerHeadingOptions = null;
            }
            if (control.active) {
                control.deactivate();
                control.activate();
            }
        }
    }
    function changeMaxSegments(element) {
        var maxSegments = element.value !== '' ?
                parseInt(element.value, 10) :
                null;
        for (var key in measureControls) {
            measureControls[key].maxSegments = maxSegments;
            measureControls[key].maxHeadings = maxSegments;
        }
    }

 /** Fin funciones distancia */

function agregarMarcador(codigonave,fecha,nombre,longitud,latitud,velocidad,curso,mensajeHtml,closeBox,overflow)
{
//alert(mensajeHtml);
var ssss;

 ll = new OpenLayers.LonLat(longitud,latitud); // Coordenadas
 var popupClass = AutoSizeAnchoredMinSize; // Ancho del Popup
 var popupContentHTML = mensajeHtml; // Caracteristicas del mensaje

 var feature = new OpenLayers.Feature(markers, ll); 
     feature.closeBox = closeBox;
     feature.popupClass = popupClass;
     feature.data.popupContentHTML = popupContentHTML;
     feature.data.overflow = (overflow) ? "auto" : "hidden";
    
    //var marker = feature.createMarker();
var size = new OpenLayers.Size(21,25);
var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
//var icon = new OpenLayers.Icon('http://www.openlayers.org/dev/img/marker.png', size, offset);
var vel ='';
    if (velocidad>=0 && velocidad<=2) {
      vel="r_";
  }
    if (velocidad>2 && velocidad<=6) {
      vel="a_";
  }
      if (velocidad>6 ) {
      vel="";
  }
var giro="0";
    if (curso>=0 && curso<22.5) {
      giro="0";
  }
   if (curso>=22.5 && curso<67.5) {
          giro="45";
     }
   if (curso>=67.5 && curso<112.5) {
          giro="90";
   }
   if (curso>=112.5 && curso<157.5) {
          giro="135";
   }
   if (curso>=157.5 && curso<202.5) {
          giro="180";
   }
   if (curso>=202.5 && curso<247.5) {
          giro="225";
   }
   if (curso>=247.5 && curso<292.5) {
          giro="270";
   }
   if (curso>=297.5 && curso<337.5) {
          giro="315";
   }
   if (curso>=337.5 ) {
          giro="0";
   }


var icon = new OpenLayers.Icon('http://hostingperu.net/satmarino/img/bote_'+vel+giro+'.png', size, offset);


nombre=nombre;
icon.imageDiv.title = nombre;
marker=new OpenLayers.Marker(new OpenLayers.LonLat(longitud,latitud),icon)

    var markerClickxxx = function (evt) {
    if (this.popup == null) 
 {
        this.popup = this.createPopup(this.closeBox);
        mapa.addPopup(this.popup);
        this.popup.show();
    } else {
        this.popup.toggle();
    }
  currentPopup = this.popup;
  OpenLayers.Event.stop(evt);
    };

            var markerClick = function (evt) {
clickMarker(nombre,longitud,latitud,mensajeHtml)
    };
this.id=codigonave;

marker.events.register("mousedown", feature, markerClick);
marker.events.register("touchstart", feature, markerClick);
markers.addMarker(marker);
//alert(this.id);
}

function agregarMarcadort(codigonave,fecha,nombre,longitud,latitud,velocidad,curso,mensajeHtml,closeBox,overflow)
{




 ll = new OpenLayers.LonLat(longitud,latitud); // Coordenadas
 var popupClass = AutoSizeAnchoredMinSize; // Ancho del Popup
 var popupContentHTML = mensajeHtml; // Caracteristicas del mensaje

 var feature = new OpenLayers.Feature(markers, ll); 
     feature.closeBox = closeBox;
     feature.popupClass = popupClass;
     feature.data.popupContentHTML = popupContentHTML;
     feature.data.overflow = (overflow) ? "auto" : "hidden";
    
    //var marker = feature.createMarker();
var size = new OpenLayers.Size(21,25);
var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
//var icon = new OpenLayers.Icon('http://www.openlayers.org/dev/img/marker.png', size, offset);
var vel ='';
    if (velocidad>=0 && velocidad<=2) {
      vel="r_";
  }
    if (velocidad>2 && velocidad<=6) {
      vel="a_";
  }
      if (velocidad>6 ) {
      vel="";
  }
var giro="0";
    if (curso>=0 && curso<22.5) {
      giro="0";
  }
   if (curso>=22.5 && curso<67.5) {
          giro="45";
     }
   if (curso>=67.5 && curso<112.5) {
          giro="90";
   }
   if (curso>=112.5 && curso<157.5) {
          giro="135";
   }
   if (curso>=157.5 && curso<202.5) {
          giro="180";
   }
   if (curso>=202.5 && curso<247.5) {
          giro="225";
   }
   if (curso>=247.5 && curso<292.5) {
          giro="270";
   }
   if (curso>=297.5 && curso<337.5) {
          giro="315";
   }
   if (curso>=337.5 ) {
          giro="0";
   }


var icon = new OpenLayers.Icon('http://hostingperu.net/satmarino/img/bote_'+vel+giro+'.png', size, offset);

nombre=nombre;
icon.imageDiv.title = nombre;



marker=new OpenLayers.Marker(new OpenLayers.LonLat(longitud,latitud),icon)


    var markerClickxx = function (evt) {
    if (this.popup == null) 
 {
        this.popup = this.createPopup(this.closeBox);
        mapa.addPopup(this.popup);
        this.popup.show();
    } else {
        this.popup.toggle();
    }
  currentPopup = this.popup;
  OpenLayers.Event.stop(evt);
    };
    
            var markerClick = function (evt) {
clickMarker(nombre,longitud,latitud,mensajeHtml)
    };
this.id=codigonave;

    marker.events.register("mousedown", feature, markerClick);
marker.events.register("touchstart", feature, markerClick);
    //marker.events.register("click", feature, markerClick);

 markert.addMarker(marker);

//map.addLayer(linesLayer);

}



      function clickMarker(id,lon,lat,html) 
       {
     //   alert(1);
        jQuery(".olPopup").remove();
        marklonLat = new OpenLayers.LonLat(lon,lat)
          .transform(
            new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
            mapa.getProjectionObject() // to Spherical Mercator Projection
        );

        var size = new OpenLayers.Size(200,200);
       // html='ssss';
        id=0;
         popup = new OpenLayers.Popup('sss',marklonLat,size,html,true,null, {keepInMap: true });

         mapa.addPopup(popup);
    }

      function clickZoom(id,lon,lat,html) 
       {
 
    /*       var lon = -79.1198516666667;
        var lat = -12.0502566666667;
        var zoom = 4;
     
        lonmaximo -69
        lonminimo -91
        latmaximo  -2
        latminimo -19
*/
        var latmax=lat+0.082;
var latmin=lat-0.098;
var lonmax=lon+0.18;
var lonmin=lon-0.20;

var bbox = new OpenLayers.Bounds(lonmin,latmax,lonmax,latmin).transform(mapa.displayProjection, mapa.projection);
mapa.zoomToExtent(bbox);
mapa.zoomTo(mapa.getZoomForExtent(bbox)); 


    }

   
    </script>
<script type="text/javascript">

function jalar_data() {
var nrox=0;
var lista_eps='';
var grillaxx;
        $.getJSON('gestionunidades/ultimatx/', function(data) {
//  var markers = new OpenLayers.Layer.Markers( "Markers" );
// mapa.addLayer(markers)
            var points = [];
                    var pos=0;
           $.each(data.ultimatx, function(k,item){

                                  points.push(new OpenLayers.Geometry.Point(item.ddlong,item.ddlat));

            nrox++;
 var htmlStr='<div> '+item.nombrenave+'</br> Fecha:'+item.fecha+
 '</br> Latitud:'+item.ddlat+'</br> Longitud:'+item.ddlong+'<br>Velocidad:'+item.speed+'<br> Curso:'+item.course+' </div>';

//lista_eps=lista_eps+'<div class="unidades"><input type="checkbox" name="cn'+k+'" id="cn'+k+'" value="'+item.codigonave+'" class="sel"> <a href="javascript:clickMarker('+item.codigonave+','+item.ddlong+','+item.ddlat+')">'+item.nombrenave+'<a></div>';
//lista_eps=lista_eps+'<div class="unidades"><input type="checkbox" name="cn'+k+'" id="cn'+k+'" value="'+item.codigonave+'" class="sel"> <a href="javascript:clickMarker('+item.codigonave+','+item.ddlong+','+item.ddlat+',1)">'+item.nombrenave+'<a></div>';
lista_eps=lista_eps+"<div class=\"unidades\"><input type=\"checkbox\" name=\"cn"+k+"\" id=\"cn"+k+"\" value=\""+item.codigonave+"\" class=\"sel\"><a href=\"javascript:clickMarker("+item.codigonave+","+item.ddlong+","+item.ddlat+",'"+htmlStr+"')\"> "+item.nombrenave+"</a> <a href=\"javascript:clickZoom("+item.codigonave+","+item.ddlong+","+item.ddlat+",'"+htmlStr+"')\">  <i class=\"icon-black icon-zoom-in\"></i> </a> </div>";

/*punto=crea_marca(item.latitud,item.longitud,item.nombremobil);
markers.addMarker(punto);*/
var nom=item.nombrenave;
agregarMarcador(item.codigonave,item.fecha,item.nombrenave,item.ddlong,item.ddlat,item.speed,item.course,htmlStr,true);
     var labelOffsetPoint = new OpenLayers.Geometry.Point(item.ddlong,item.ddlat);
                var labelOffsetFeature = new OpenLayers.Feature.Vector(labelOffsetPoint);
                labelOffsetFeature.attributes = {
                    name: nom,
                    age: 22,
                    favColor: 'red',
                    align: "cm",
                    // positive value moves the label to the right
                    xOffset: 10,
                    // negative value moves the label down
                    yOffset: 0
                };


                
            //    map.addLayer(vectorLayer);
               // vectorLayer.drawFeature(multiFeature);
             //   map.setCenter(new OpenLayers.LonLat(-109.370078125, 43.39484375), 4);
                vectorPuntos.addFeatures([labelOffsetFeature]);

  grillaxx = grillaxx+'<tr> \
   <td>'+ item.nombrenave+' </td> \
      <td>'+ item.fecha+' </td> \
<td>'+ item.latgrad+' '+item.latmin +' '+item.latsec+'</td> \
<td>'+ item.longgrad+' '+item.longmin +' '+item.longsec+'</td> \
<td>'+ item.speed+' </td> \
<td>'+ item.course+' </td> \
<td>'+ item.fm+' </td> \
<td>'+ item.nombrezona+' </td></tr>  ';


            }); // Fin de Each
//alert(nrox);
     $('#nrobarcos').val(nrox)

     $('#contenidoeps').html( lista_eps)





 $('#ctabla').html(grillaxx );
           $('#ra').dataTable( {
              "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
              "sPaginationType": "bootstrap",
              "oLanguage": {
                "sLengthMenu": "_MENU_ registros por pagina"
              }
            } );



        }) // Fin de JSON


      } // Fin de Funcion Jalar Data

function jalar_puertos() {
  alert('xxx');
var nrox=0;
var lista_puertos='';

        $.getJSON('puertos/listar/', function(data) {
//  var markers = new OpenLayers.Layer.Markers( "Markers" );
// mapa.addLayer(markers)
            var points = [];
                    var pos=0;
           $.each(data, function(k,item){


            nrox++;

lista_puertos=lista_puertos+"<div class=\"unidades\"><a href=\"javascript:clickMarker("+item.codigonave+","+item.ddlong+","+item.ddlat+",'"+htmlStr+"')\"> "+item.nombre+"</a> <a href=\"javascript:clickZoom("+item.codigonave+","+item.ddlong+","+item.ddlat+",'"+htmlStr+"')\">  <i class=\"icon-black icon-zoom-in\"></i> </a> </div>";

            }); // Fin de Each


     $('#divpuertos').html( lista_eps)





        }) // Fin de JSON


      } // Fin de Funcion Jalar Puertos

function track(jso) { // Inicio de funcion track
    markert.clearMarkers();

    var grillaxx;
    var nrox=0;
    var lista_eps='';



    var json = $.parseJSON(jso);
     //  var markers = new OpenLayers.Layer.Markers( "Markersx" );
     // mapa.addLayer(markers);
    lineLayer.removeAllFeatures();
    vectorLayer.removeAllFeatures();
    //vectorPuntos.removeAllFeatures();
     $('#myTab').html('');
     var nep=0;
    $.each(json.ultimatx, function(k,item){
    var titutab;
    var points = [];

        nrox++;
        var pos=0;
        var nnave='';
        var grillat='';
                $.each(item, function(kx,itemx){

                    if(latmax==0) {latmax=itemx.ddlat} else { 
                        if(latmax<itemx.ddlat)
                        {
                            latmax=itemx.ddlat;
                       }
                    }

                    if(latmin==0) {latmin=itemx.ddlat} else { 
                        if(latmin>itemx.ddlat)
                        {
                            latmin=itemx.ddlat;
                        }
                    }

                    if(lonmax==0) {lonmax=itemx.ddlong} else { 
                        if(lonmax<itemx.ddlong)
                        {
                            lonmax=itemx.ddlong;
                       }
                    }

                    if(lonmin==0) {lonmin=itemx.ddlong} else { 
                        if(lonmin>itemx.ddlong)
                        {
                            lonmin=itemx.ddlong;
                       }
                    }

                      points.push(new OpenLayers.Geometry.Point(itemx.ddlong,itemx.ddlat));
                lista_eps=lista_eps+'<div class="unidades"><input type="checkbox" name="cn'+k+'" id="cn'+k+'" value="'+itemx.codigonave+'" class="sel">'+itemx.nombrenave+'</div>';
                 // var htmlStr='<div style="height: 170px; width: 300px; border: 1px  solid black;"> '+itemx.nombrenave+
                 // '</br> Latitud:'+itemx.ddlat+'</br> Longitud:'+itemx.ddlong+'<br>Velocidad:'+itemx.speed+'<br> Curso:'+itemx.course+' </div>';
     var htmlStr='<div> '+itemx.nombrenave+'</br> Fecha:'+itemx.fecha+
     '</br> Latitud:'+itemx.ddlat+'</br> Longitud:'+itemx.ddlong+'<br>Velocidad:'+itemx.speed+'<br> Curso:'+itemx.course+' </div>';

    //            agregarMarcadort(itemx.nombrenave,itemx.ddlong,itemx.ddlat,itemx.speed,itemx.course,htmlStr,true);
                agregarMarcadort(itemx.codigonave,itemx.fecha,itemx.nombrenave,itemx.ddlong,itemx.ddlat,itemx.speed,itemx.course,htmlStr,true);


    nnave=itemx.nombrenave;
     var labelOffsetPoint = new OpenLayers.Geometry.Point(itemx.ddlong,itemx.ddlat);
                var labelOffsetFeature = new OpenLayers.Feature.Vector(labelOffsetPoint);
                labelOffsetFeature.attributes = {
                    name: pos,
                    age: 22,
                    favColor: 'red',
                    align: "cm",
                    // positive value moves the label to the right
                    xOffset: 10,
                    // negative value moves the label down
                    yOffset: 0
                };


                
            //    map.addLayer(vectorLayer);
               // vectorLayer.drawFeature(multiFeature);
             //   map.setCenter(new OpenLayers.LonLat(-109.370078125, 43.39484375), 4);
                vectorLayer.addFeatures([labelOffsetFeature]);
  grillat = grillat+'<tr> \
   <td>'+ nnave+' </td> \
      <td>'+ itemx.fecha+' </td> \
<td>'+ itemx.latgrad+' '+itemx.latmin +' '+itemx.latsec+'</td> \
<td>'+ itemx.longgrad+' '+itemx.longmin +' '+itemx.longsec+'</td> \
<td>'+ itemx.speed+' </td> \
<td>'+ itemx.course+' </td> \
<td>'+ itemx.fm+' </td> \
<td>'+ itemx.nombrezona+' </td> \
        <td class="editarv" id_f="'+itemx.codigonave+'"  > </td>\
        <td class="editarv" id_fx="'+itemx.codigonave+'"  > </td></tr>  ';








                pos++;

            }) // Final each interno 
       // alert(lonmin+' '+latmax+' '+lonmax+' '+latmin);


titutab='<li class=""><a href="#tab'+nep+'" data-toggle="tab">'+nnave+'</a></li>';
var cuerpodiv=' <div class="tab-pane fade" id="tab'+nep+'">\
                          <div class="span12 ">\
     <table class="table" >\
              <thead>\
                <tr>\
                  <th>EP</th>\
                  <th>Fecha Gps</th>\
                  <th>Latitud</th>\
                  <th>Longitud</th>\
                  <th>Velocidad</th>\
                  <th>Curso</th>\
                                    <th>Zona</th>\
                  <th>Puerto</th>\
                </tr>\
              </thead>\
              <tbody id="tabla'+nep+'">\
              </tbody>\
            </table>   \
                               </div>\
              </div> ';

 $('#myTab').append(titutab );
 $('#myTabContent').append(cuerpodiv);


 $('#tabla'+nep).html(grillat );


    var col=color(1,5);
    var sk='#0000ff';
    switch (col) { 
    case 1: sk='#000000';      break; 
    case 2: sk='#0000ff';      break; 
    case 3: sk='#8fff00';      break; 
    case 4: sk='#ff3d00';      break; 
    case 5: sk='#2d148f';      break; 



     }


nep++;

    var line = new OpenLayers.Geometry.LineString(points);
    var style = { 
      strokeColor: sk, 
      strokeOpacity: 0.3,
      strokeWidth: 2,
      label:nnave
    };
    var lineFeature;




    lineFeature = new OpenLayers.Feature.Vector(line, null, style);
    lineLayer.addFeatures([lineFeature]);

    })

} // Inicio de funcion track

function color(inferior,superior){ 
    numPosibilidades = superior - inferior 
    aleat = Math.random() * numPosibilidades 
    aleat = Math.round(aleat) 
    return parseInt(inferior) + aleat 
} 

function regresar() {
      $('#barcos').fadeIn('fast');
            $('#divtabs').fadeOut('fast');

      markers.setVisibility(true);
      vectorPuntos.setVisibility(true);

            markert.setVisibility(false);
      vectorLayer.setVisibility(false);
 lineLayer.setVisibility(false);
}

function zoominicio() {
//alert('holas');
        var lon = -79.1198516666667;
        var lat = -12.0502566666667;
        var zoom = 4;
  /*      
        lonmaximo -69
        lonminimo -91
        latmaximo  -2
        latminimo -19
*/
        var latmax=-5;
var latmin=-19;
var lonmax=-69;
var lonmin=-91;

var bbox = new OpenLayers.Bounds(lonmin,latmax,lonmax,latmin).transform(mapa.displayProjection, mapa.projection);
mapa.zoomToExtent(bbox);
mapa.zoomTo(mapa.getZoomForExtent(bbox)); 

}

/**** TRACKING POR NUMERO DE PUNTOS *****/

$("#singlebutton").on("click", function() { 
       $('#barcos').fadeOut('fast');
                   $('#divtabs').fadeIn('fast');

      markers.setVisibility(false);
      vectorPuntos.setVisibility(false);
            markert.setVisibility(true);
      vectorLayer.setVisibility(true);
 lineLayer.setVisibility(true);

      $.ajax({
             type: "POST",
                    url: "gestionunidades/trackingnave/1",
                    data: $("#form_tracking").serialize(),
                    success: function(data){
                            latmax=0;
                            latmin=0;
                            lonmax=0;
                            lonmin=0;
                            track(data);
                            var bbox = new OpenLayers.Bounds(lonmin,latmax,lonmax,latmin).transform(mapa.displayProjection, mapa.projection);
                            mapa.zoomToExtent(bbox);
                            mapa.zoomTo(mapa.getZoomForExtent(bbox));
                             },
                    error: function(){
                                  alert("failure");
                        }
      })
})

$("#singlebutton1").on("click", function() { 
       $('#barcos').fadeOut('fast');
                   $('#divtabs').fadeIn('fast');

      markers.setVisibility(false);
      vectorPuntos.setVisibility(false);
            markert.setVisibility(true);
      vectorLayer.setVisibility(true);
 lineLayer.setVisibility(true);

      $.ajax({
             type: "POST",
                    url: "gestionunidades/trackingnave/2",
                    data: $("#form_tracking").serialize(),
                    success: function(data){
                            latmax=0;
                            latmin=0;
                            lonmax=0;
                            lonmin=0;
                            track(data);
                            var bbox = new OpenLayers.Bounds(lonmin,latmax,lonmax,latmin).transform(mapa.displayProjection, mapa.projection);
                            mapa.zoomToExtent(bbox);
                            mapa.zoomTo(mapa.getZoomForExtent(bbox));
                             },
                    error: function(){
                                  alert("failure");
                        }
      })
})

</script>



    <script type="text/javascript">
$(document).ready(function(){
init();
jalar_data();
alert('1');
jalar_puertos();


})

  </script>

<?php $this->load->view('html5/scripts'); ?> 