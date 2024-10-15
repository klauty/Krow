include <roundedcube.scad>
module tecla(letra="X",sizeX=18,sizeY=18,sizeZ=4,){
    alturaColuna = 3.5;
    difference(){
        union(){
        difference() {
            difference() {
            translate([0,0,sizeZ/2]) roundedcube([sizeX,sizeY,sizeZ], true, 2, "z");
            
            linear_extrude(height=0.4, convexity=4)
                mirror([1,0,0])
                text(letra, 
                     size = 10,
                     font="Bitstream Vera Sans",
                     halign="center",
                     valign="center");
            }
            translate([0,0,sizeZ]) roundedcube([sizeX-1.2,sizeY-1.2,sizeZ], true, 2, "z");
        }
     translate([0,0,(sizeZ/2)+alturaColuna/2]) cube([5,4,alturaColuna], center=true);
    }
    union(){
        translate([0,0,4.5]){
            cube([1.25,4.5,5],center=true);
            cube([4.5,1.25,5],center=true);
        }
    }
    }       
}

module label(letra){
    linear_extrude(height=0.4, convexity=4)
                mirror([1,0,0])
                text(letra, 
                     size = 12,
                     font="Bitstream Vera Sans",
                     halign="center",
                     valign="center");
}

letras = ["Q","W","E","R","T"];
for (i=[0:len(letras)-1])
   translate([i*20,0,0]){
    //color("white")
    tecla(letras[i],sizeX=15.5,sizeY=15.5);
   // color("red")
    //label(letras[i]);
   }