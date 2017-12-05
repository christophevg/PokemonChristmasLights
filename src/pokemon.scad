$fn = 250;

// some defaults for the additional mount
mount_height         = 5.5;
mount_outer_diameter = 13;
mount_inner_diameter = mount_outer_diameter - 2;
mount_depth          = 30;

// generic module adding the mount given object specific parameters
// src         the original STL file
// rotation    of the mount to match pose
// translation of the mount to match position/height
// height      of the mount
// depth       inside the object for the LED and fixation
module lamp(src, rotation, translation, height, depth) {
  difference() {
    union() {
      // original bulbasaur object
      import(src);
      // add a mounting spot for the hook
      translate(translation) {
        rotate(rotation) {
          cylinder(height, d=mount_outer_diameter);
        }
      }
    }
    // inner space for LED
    translate(translation) {
      rotate(rotation) {
        translate([0,0,-depth+1]) {
          cylinder(h=height+depth, d=mount_inner_diameter);
        }
      }
    }
  }
}

// modules for each of the pokemons, with their specific parameters
module bulbasaur() {
  lamp(
    src         = "../lib/bulbasaur_starter_1gen_flowalistik.stl",
    rotation    = [-30,  0,  0 ],
    translation = [  7, 15, 30 ],
    height      = mount_height,
    depth       = mount_depth
  );
}

module pikachu() {
  lamp(
    src         = "../lib/pikachu_1gen_flowalistik.stl",
    rotation    = [  0,  0,  0 ],
    translation = [  7,  2, 43 ],
    height      = mount_height + 3,
    depth       = mount_depth
  );
}

module totodile() {
  lamp(
    src         = "../lib/totodile_starter_2gen_flowalistik_2.stl",
    rotation    = [  0,   0,    0   ],
    translation = [ 10.3,-0.5, 44.5 ],
    height      = mount_height + 2.5,
    depth       = mount_depth + 2.5
  );
}

module squirtle() {
  lamp(
    src         = "../lib/squirtle_starter_1gen_flowalistik.stl",
    rotation    = [ 25,      0,    0   ],
    translation = [  7.75, -11.5, 44.5 ],
    height      = mount_height + 2.5,
    depth       = mount_depth + 2.5
  );
}

module all() {
  translate([-50, 0, 0]) { bulbasaur(); }
  translate([-10, 0, 0]) { pikachu();   }
  translate([+30, 0, 0]) { totodile();  }
  translate([+75, 0, 0]) { squirtle();  }
}

// modules to render the different pokemons
// render() is needed because without it the differences causes the base file
// not to be rendered

// render() { bulbasaur(); }
// render() { pikachu();   }
// render() { totodile();  }
// render() { squirtle();  }
render() { all();       }

