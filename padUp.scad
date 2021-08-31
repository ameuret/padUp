include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <BOSL/math.scad>
use <BOSL/shapes.scad>
use <BOSL/masks.scad>
use <BOSL/metric_screws.scad>
use <BOSL/threading.scad>;

$fn=0;
$fa=1;
$fs=0.1;

epsilon = 0.1;
e = epsilon;

s = 90;
iPadSliceH = 65.36;

// A1458
module iPadBodyMask(){
  left(iPadSliceH)linear_extrude(height=185.8) import("iPad4thOutline.svg");
}

module iPad(){
  yrot(90){
    iPadBodyMask();
    #  left(11.3) xrot(90) back(92.9)cyl(d=10.8, h=20);
  }
}

module padUp(){
  difference(){
    skew_xy(ya=10)top_half() scale([0.9,1,1.5])    sphere(d=s);
    fwd(35)up(5)xrot(-20)left(92.9)yrot(90)iPadBodyMask();
    fwd(35)up(5)xrot(-10)left(92.9)yrot(90)iPadBodyMask();
    back(s/3.2)up(42)xrot(75)skew_xy(ya=0) scale([1.8,1,1.5])    sphere(d=s);
    back(s/4)scale([1.5, 2, 1])cyl(d=50, h=100);
   // fwd(38) down(15)xrot(75) scale([1, 0.75, 1])tube(d=130, h=50, wall=20);
    fwd(42) down(25)xrot(75) tube(d=120, h=50, wall=20);
    fwd(36) prismoid(size1=[4,13], size2=[0,13], h=4);
    zrot(30)fwd(36) prismoid(size1=[4,13], size2=[0,13], h=4);
    zrot(-30)fwd(36) prismoid(size1=[4,13], size2=[0,13], h=4);
  }
  //fwd(35)up(5)xrot(-20)left(92.9)color("darkgray")iPad();
}

//iPad();
padUp();
//color("Teal")cap();
//hole();
