include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <BOSL/math.scad>
use <BOSL/shapes.scad>
use <BOSL/masks.scad>
use <BOSL/metric_screws.scad>
use <BOSL/threading.scad>;

$fn=0;
$fa=1;
$fs=0.5;

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
      left(11.3) xrot(90) back(92.9)cyl(d=10.8, h=20);
  }
}

module padUp(){
  difference(){
    skew_xy(ya=30)top_half(s=150) scale([0.9,1.4,1.5])    sphere(d=s);
    fwd(49)up(5)xrot(-30)left(92.9)yrot(90)iPadBodyMask();
    fwd(49)up(5)xrot(-20)left(92.9)yrot(90)iPadBodyMask();
    back(18)up(42)xrot(75)skew_xy(ya=0) scale([1.8,1,1.5])    sphere(d=s);
    back(16)scale([1.5, 2, 1])cyl(d=50, h=100);
    fwd(48) down(15)xrot(75) scale([1, 0.75, 1])tube(d=140, h=50, wall=30);
    fwd(44) prismoid(size1=[4,13], size2=[0,13], h=4);
    zrot(30)fwd(44) prismoid(size1=[4,13], size2=[0,13], h=4);
    zrot(-30)fwd(44) prismoid(size1=[4,13], size2=[0,13], h=4);
    back(30)cuboid([90, 20, 20]);
  }
  //fwd(35)up(5)xrot(-20)left(92.9)color("darkgray")iPad();
}

//iPad();
padUp();
//color("Teal")cap();
//hole();
